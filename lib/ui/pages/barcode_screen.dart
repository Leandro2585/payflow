import 'package:flutter/material.dart';
import 'package:payflow/application/controllers/index.dart';
import 'package:payflow/data/services/barcode_scanner_status_service.dart';
import 'package:payflow/ui/styles/index.dart';
import 'package:payflow/ui/widgets/index.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({Key? key}) : super(key: key);

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  final readBarcodeController = ReadBarcodeController();

  @override
  void initState() {
    readBarcodeController.getAvailableCameras();
    super.initState();
  }

  @override
  void dispose() {
    readBarcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      bottom: true,
      right: true,
      child: Stack(children: [
        ValueListenableBuilder<BarcodeScannerStatusService>(
          valueListenable: readBarcodeController.statusNotifier,
          builder: (_, status, __) {
            if (status.hasError) {
              return BottomSheetWidget(
                title: 'Não foi possível identificar o código de barras',
                subtitle:
                    'Tente escanear novamente ou digite o código do seu boleto',
                primaryLabel: 'Escanear novamente',
                primaryHandle: readBarcodeController.scanWithCamera,
                secondaryLabel: 'Digitar código',
                secondaryHandle: () {},
              );
            } else if (status.showCamera) {
              return Container(
                child: readBarcodeController.cameraController!.buildPreview(),
              );
            } else {
              return Container();
            }
          },
        ),
        RotatedBox(
          quarterTurns: 1,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Text(
                'Escaneie o código de barras do boleto',
                style: TextStyles.buttonBackground,
              ),
              leading: const BackButton(color: AppColors.background),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(color: Colors.black.withOpacity(0.8)),
                ),
                Expanded(
                  flex: 2,
                  child: Container(color: Colors.transparent),
                ),
                Expanded(
                  child: Container(color: Colors.black.withOpacity(0.8)),
                ),
              ],
            ),
            bottomNavigationBar: SeveralLabelButtons(
              primaryLabel: 'Inserir código do boleto',
              primaryHandle: () {
                Navigator.pushReplacementNamed(context, '/insert_ticket');
              },
              secondaryLabel: 'Adicionar da galeria',
              secondaryHandle: () {},
            ),
          ),
        ),
      ]),
    );
  }
}
