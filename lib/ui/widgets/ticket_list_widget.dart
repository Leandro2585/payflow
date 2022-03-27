import 'package:flutter/cupertino.dart';
import 'package:payflow/application/controllers/index.dart';
import 'package:payflow/data/models/index.dart';
import 'package:payflow/ui/widgets/index.dart';

class TicketListWidget extends StatefulWidget {
  TicketListController ticketListController = TicketListController();
  TicketListWidget({
    Key? key,
    required this.ticketListController,
  }) : super(key: key);

  @override
  _TicketListWidgetState createState() => _TicketListWidgetState();
}

class _TicketListWidgetState extends State<TicketListWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<TicketModel>>(
      valueListenable: widget.ticketListController.ticketsNotifier,
      builder: (_, tickets, __) => Column(
        children: widget.ticketListController.tickets
            .map((e) => TicketTileWidget(data: e))
            .toList(),
      ),
    );
  }
}
