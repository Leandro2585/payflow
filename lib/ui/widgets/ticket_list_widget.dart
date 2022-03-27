import 'package:flutter/cupertino.dart';
import 'package:payflow/application/controllers/index.dart';
import 'package:payflow/data/models/index.dart';
import 'package:payflow/ui/widgets/index.dart';

class TicketListWidget extends StatefulWidget {
  const TicketListWidget({Key? key}) : super(key: key);

  @override
  _TicketListWidgetState createState() => _TicketListWidgetState();
}

class _TicketListWidgetState extends State<TicketListWidget> {
  final ticketListController = TicketListController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<TicketModel>>(
      valueListenable: ticketListController.ticketsNotifier,
      builder: (_, tickets, __) => Column(
        children: ticketListController.tickets
            .map((e) => TicketTileWidget(data: e))
            .toList(),
      ),
    );
  }
}
