import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:payflow/app/themes/index.dart';
import 'package:payflow/app/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:payflow/app/widgets/index.dart';

class BarCodeScannerScreen extends StatefulWidget {
  BarCodeScannerScreen({Key? key}) : super(key: key);

  @override
  _BarCodeScannerScreenState createState() => _BarCodeScannerScreenState();
}

class _BarCodeScannerScreenState extends State<BarCodeScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      primaryLabel: 'Escanear novamente',
      primaryOnPressed: () {},
      secondaryLabel: 'Digitar código',
      secondaryOnPressed: () {},
      title: 'Não foi possível identificar um código de barras',
      subtitle: 'Tente escanear novamente ou digite o código do seu boleto',
    );

    return SafeArea(
      top: true,
      left: true,
      bottom: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Escaneie o código de barra do boleto',
              style: TextStyles.buttonBackground,
            ),
            centerTitle: true,
            leading: BackButton(
              color: AppColors.background,
            ),
          ),
          body: Column(
            children: [
              Expanded(child: Container(color: Colors.black.withOpacity(0.6))),
              Expanded(child: Container(color: Colors.transparent)),
              Expanded(child: Container(color: Colors.black.withOpacity(0.6))),
            ],
          ),
          bottomNavigationBar: SetLabelButtons(
            primaryLabel: 'Inserir código do boleto',
            primaryOnPressed: () {},
            secondaryLabel: 'Adicionar da galeria',
            secondaryOnPressed: () {},
          ),
        ),
      ),
    );
  }
}
