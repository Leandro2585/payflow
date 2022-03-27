import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/application/controllers/index.dart';
import 'package:payflow/application/validators/create_ticket_validator.dart';
import 'package:payflow/ui/styles/index.dart';
import 'package:payflow/ui/widgets/index.dart';
import 'package:payflow/ui/widgets/input_text.dart';

class CreateTicketScreen extends StatefulWidget {
  final String? barcode;
  const CreateTicketScreen({Key? key, this.barcode}) : super(key: key);

  @override
  _CreateTicketScreenState createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState extends State<CreateTicketScreen> {
  final CreateTicketValidator validator = CreateTicketValidator();
  final CreateTicketController controller = CreateTicketController();
  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: 'R\$',
    decimalSeparator: ',',
  );
  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: const BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 93),
                child: Text(
                  'Preencha os dados do boleto',
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              Form(
                child: Column(
                  children: [
                    InputText(
                      label: 'Descrição do boleto',
                      icon: Icons.description_outlined,
                      validator: validator.validateDescription,
                      onChanged: (value) {},
                    ),
                    InputText(
                      label: 'Vencimento',
                      controller: dueDateInputTextController,
                      icon: FontAwesomeIcons.timesCircle,
                      validator: validator.validateDueDate,
                      onChanged: (value) {},
                    ),
                    InputText(
                      label: 'Valor',
                      controller: moneyInputTextController,
                      icon: FontAwesomeIcons.wallet,
                      validator: (_) => validator
                          .validatePrice(moneyInputTextController.numberValue),
                      onChanged: (value) {},
                    ),
                    InputText(
                      label: 'Código do boleto',
                      controller: barcodeInputTextController,
                      icon: FontAwesomeIcons.barcode,
                      validator: validator.validateBarcode,
                      onChanged: (value) {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SeveralLabelButtons(
        primaryLabel: 'Cancelar',
        primaryHandle: () {
          Navigator.pop(context);
        },
        secondaryLabel: 'Cadastrar',
        secondaryHandle: controller.registerTicket,
        enableSecondaryColor: true,
      ),
    );
  }
}
