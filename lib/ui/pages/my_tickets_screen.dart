import 'package:flutter/material.dart';
import 'package:payflow/application/controllers/index.dart';
import 'package:payflow/data/models/index.dart';
import 'package:payflow/ui/styles/index.dart';
import 'package:payflow/ui/widgets/ticket_info_widget.dart';
import 'package:payflow/ui/widgets/ticket_list_widget.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({Key? key}) : super(key: key);

  @override
  _MyTicketsScreenState createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  final ticketListController = TicketListController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                color: AppColors.primary,
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<TicketModel>>(
                  valueListenable: ticketListController.ticketsNotifier,
                  builder: (_, tickets, __) =>
                      TicketInfoWidget(size: tickets.length),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: Row(
              children: [
                Text(
                  'Meus boletos',
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
      ),
    );
  }
}
