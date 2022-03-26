import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payflow/data/services/index.dart';

class ReadBarcodeController {
  final statusNotifier =
      ValueNotifier<BarcodeScannerStatusService>(BarcodeScannerStatusService());
  BarcodeScannerStatusService get status => statusNotifier.value;
  set status(BarcodeScannerStatusService status) =>
      statusNotifier.value = status;

  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();
  CameraController? cameraController;

  void getAvailableCameras() async {
    try {
      final response = await availableCameras();
      final camera = response.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.back,
      );
      cameraController = CameraController(
        camera,
        ResolutionPreset.max,
        enableAudio: false,
      );
      await cameraController!.initialize();

      scanWithCamera();
      listenCamera();
    } catch (e) {
      status = BarcodeScannerStatusService.error(e.toString());
    }
  }

  void listenCamera() {
    if (cameraController!.value.isStreamingImages == false) {
      cameraController!.startImageStream((cameraImage) async {
        if (status.stopScanner == false) {
          try {
            final WriteBuffer allBytes = WriteBuffer();
            for (Plane plane in cameraImage.planes) {
              allBytes.putUint8List(plane.bytes);
            }
            final bytes = allBytes.done().buffer.asUint8List();
            final Size imageSize = Size(
              cameraImage.width.toDouble(),
              cameraImage.height.toDouble(),
            );
            const InputImageRotation imageRotation =
                InputImageRotation.Rotation_0deg;
            final InputImageFormat inputImageFormat =
                InputImageFormatMethods.fromRawValue(cameraImage.format.raw) ??
                    InputImageFormat.NV21;
            final planeData = cameraImage.planes.map(
              (Plane plane) {
                return InputImagePlaneMetadata(
                  bytesPerRow: plane.bytesPerRow,
                  width: plane.width,
                  height: plane.height,
                );
              },
            ).toList();
            final inputImageData = InputImageData(
              size: imageSize,
              imageRotation: imageRotation,
              inputImageFormat: inputImageFormat,
              planeData: planeData,
            );
            final inputImageCamera = InputImage.fromBytes(
              bytes: bytes,
              inputImageData: inputImageData,
            );
            readBarcodeScanner(inputImageCamera);
          } catch (e) {
            print(e);
          }
        }
      });
    }
  }

  void scanWithCamera() {
    status = BarcodeScannerStatusService.available();
    Future.delayed(const Duration(seconds: 10)).then((value) {
      if (status.hasBarcode == false) {
        status =
            BarcodeScannerStatusService.error('Timeout na leitura do boleto');
      }
    });
  }

  void scanWithImagePicker() async {
    final response = await ImagePicker().getImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    readBarcodeScanner(inputImage);
  }

  Future<void> readBarcodeScanner(InputImage inputImage) async {
    try {
      final barcodes = await barcodeScanner.processImage(inputImage);
      String? barcode;
      for (Barcode code in barcodes) {
        barcode = code.value.displayValue;
      }
      if (barcode != null && status.barcode.isEmpty) {
        status = BarcodeScannerStatusService.barcode(barcode);
        cameraController!.dispose();
        await barcodeScanner.close();
      }
      return;
    } catch (e) {
      print('ERRO DE LEITURA $e');
    }
  }

  void dispose() {
    statusNotifier.dispose();
    barcodeScanner.close();
    if (status.showCamera) {
      cameraController!.dispose();
    }
  }
}
