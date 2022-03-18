import 'package:flutter/material.dart';
import 'package:payflow/ui/styles/index.dart';
import 'package:payflow/ui/widgets/index.dart';

class BarcodeScannerScreen extends StatefulWidget {
  const BarcodeScannerScreen({Key? key}) : super(key: key);

  @override
  _BarcodeScannerScreenState createState() => _BarcodeScannerScreenState();
}

class _BarcodeScannerScreenState extends State<BarcodeScannerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            child: Container(color: Colors.black),
          ),
          Expanded(
            flex: 2,
            child: Container(color: Colors.transparent),
          ),
          Expanded(
            child: Container(color: Colors.black),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 56,
        child: Row(
          children: [
            Expanded(
              child: LabelButton(
                label: 'Inserir código do boleto',
                handle: () {},
              ),
            ),
            const DividerVertical(),
            Expanded(
              child: LabelButton(
                label: 'Adicionar da galeria',
                handle: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
