import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:payflow/data/services/index.dart';

class ReadBarcodeController {
  final statusNotifier =
      ValueNotifier<BarcodeScannerStatusService>(BarcodeScannerStatusService());
  BarcodeScannerStatusService get status => statusNotifier.value;
  set status(BarcodeScannerStatusService status) =>
      statusNotifier.value = status;

  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  void getAvailableCameras() async {
    try {
      final response = await availableCameras();
      final camera = response.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.back,
      );
      final cameraController = CameraController(
        camera,
        ResolutionPreset.max,
        enableAudio: false,
      );
      await cameraController.initialize();
      status = BarcodeScannerStatusService.available(cameraController);
      scanWithCamera();
      listenCamera();
    } catch (e) {
      status = BarcodeScannerStatusService.error(e.toString());
    }
  }

  void listenCamera() {
    if (status.cameraController!.value.isStreamingImages == false) {
      status.cameraController!.startImageStream((cameraImage) async {
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
          await Future.delayed(const Duration(seconds: 3));
          await readBarcodeScanner(inputImageCamera);
        } catch (e) {
          print(e);
        }
      });
    }
  }

  void scanWithCamera() {
    Future.delayed(const Duration(seconds: 10)).then((value) {
      if (status.cameraController != null) {
        if (status.cameraController!.value.isStreamingImages) {
          status.cameraController!.stopImageStream();
        }
      }
      status =
          BarcodeScannerStatusService.error('Timeout na leitura do boleto');
    });
    listenCamera();
  }

  Future<void> readBarcodeScanner(InputImage inputImage) async {
    try {
      if (status.cameraController != null) {
        if (status.cameraController!.value.isStreamingImages) {
          status.cameraController!.stopImageStream();
        }
        final barcodes = await barcodeScanner.processImage(inputImage);
        String? barcode;
        for (Barcode code in barcodes) {
          barcode = code.value.displayValue;
        }
        if (barcode != null && status.barcode.isEmpty) {
          status = BarcodeScannerStatusService.barcode(barcode);
          status.cameraController!.dispose();
        } else {
          getAvailableCameras();
        }
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
      status.cameraController!.dispose();
    }
  }
}
