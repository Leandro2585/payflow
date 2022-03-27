import 'package:flutter/material.dart';
import 'package:payflow/ui/styles/index.dart';
import 'package:payflow/application/controllers/index.dart';
import 'package:payflow/ui/widgets/ticket_list_widget.dart';

class ExtractScreen extends StatefulWidget {
  const ExtractScreen({Key? key}) : super(key: key);

  @override
  _ExtractScreenState createState() => _ExtractScreenState();
}

class _ExtractScreenState extends State<ExtractScreen> {
  final ticketListController = TicketListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Row(
            children: [
              Text(
                'Meus extratos',
                style: TextStyles.titleBoldHeading,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Divider(thickness: 1, height: 1, color: AppColors.stroke),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: TicketListWidget(ticketListController: ticketListController),
        ),
      ],
    );
  }
}
