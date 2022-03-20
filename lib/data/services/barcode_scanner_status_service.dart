import 'package:camera/camera.dart';

class BarcodeScannerStatusService {
  final bool isCameraAvailable;
  final String error;
  final String barcode;
  CameraController? cameraController;

  BarcodeScannerStatusService({
    this.isCameraAvailable = false,
    this.cameraController,
    this.barcode = '',
    this.error = '',
  });

  factory BarcodeScannerStatusService.available(CameraController controller) =>
      BarcodeScannerStatusService(
        isCameraAvailable: true,
        cameraController: controller,
      );

  factory BarcodeScannerStatusService.error(String message) =>
      BarcodeScannerStatusService(error: message);

  factory BarcodeScannerStatusService.barcode(String barcode) =>
      BarcodeScannerStatusService(barcode: barcode);

  bool get showCamera => isCameraAvailable && error.isEmpty;
  bool get hasError => error.isNotEmpty;
  bool get hasBarcode => barcode.isNotEmpty;
}
