class BarcodeScannerStatusService {
  final bool isCameraAvailable;
  final String error;
  final String barcode;
  final bool stopScanner;

  BarcodeScannerStatusService({
    this.isCameraAvailable = false,
    this.barcode = '',
    this.error = '',
    this.stopScanner = false,
  });

  factory BarcodeScannerStatusService.available() =>
      BarcodeScannerStatusService(isCameraAvailable: true, stopScanner: false);

  factory BarcodeScannerStatusService.error(String message) =>
      BarcodeScannerStatusService(error: message, stopScanner: true);

  factory BarcodeScannerStatusService.barcode(String barcode) =>
      BarcodeScannerStatusService(barcode: barcode, stopScanner: true);

  bool get showCamera => isCameraAvailable && error.isEmpty;
  bool get hasError => error.isNotEmpty;
  bool get hasBarcode => barcode.isNotEmpty;
}
