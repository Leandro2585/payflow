import 'package:flutter/material.dart';
import 'package:payflow/ui/widgets/index.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({Key? key}) : super(key: key);

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return BottomSheetWidget(
      title: 'Não foi possível identificar o código de barras',
      subtitle: 'Tente escanear novamente ou digite o código do seu boleto',
      primaryLabel: 'Escanear novamente',
      primaryHandle: () {},
      secondaryLabel: 'Digitar código',
      secondaryHandle: () {},
    );
    // return SafeArea(
    //   top: true,
    //   left: true,
    //   bottom: true,
    //   right: true,
    //   child: RotatedBox(
    //     quarterTurns: 1,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         centerTitle: true,
    //         backgroundColor: Colors.black,
    //         title: Text(
    //           'Escaneie o código de barras do boleto',
    //           style: TextStyles.buttonBackground,
    //         ),
    //         leading: const BackButton(color: AppColors.background),
    //       ),
    //       body: Column(
    //         children: [
    //           Expanded(
    //             child: Container(color: Colors.black.withOpacity(0.8)),
    //           ),
    //           Expanded(
    //             flex: 2,
    //             child: Container(color: Colors.transparent),
    //           ),
    //           Expanded(
    //             child: Container(color: Colors.black.withOpacity(0.8)),
    //           ),
    //         ],
    //       ),
    //       bottomNavigationBar: SeveralLabelButtons(
    //         primaryLabel: 'Inserir código do boleto',
    //         primaryHandle: () {},
    //         secondaryLabel: 'Adicionar da galeria',
    //         secondaryHandle: () {},
    //       ),
    //     ),
    //   ),
    // );
  }
}
