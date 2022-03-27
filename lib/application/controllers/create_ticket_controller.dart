import 'package:flutter/cupertino.dart';
import 'package:payflow/data/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateTicketController {
  final formKey = GlobalKey<FormState>();
  TicketModel ticketModel = TicketModel();

  Future<void> registerTicket() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return saveTicket();
    }
  }

  Future<void> saveTicket() async {
    final instance = await SharedPreferences.getInstance();
    final tickets = instance.getStringList('tickets') ?? <String>[];
    tickets.add(ticketModel.toJson());
    await instance.setStringList('tickets', tickets);
    return;
  }

  void onChange({
    String? description,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    ticketModel = ticketModel.copyWith(
      description: description,
      dueDate: dueDate,
      value: value,
      barcode: barcode,
    );
  }
}
