import 'package:flutter/cupertino.dart';
import 'package:payflow/data/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TicketListController {
  final ticketsNotifier = ValueNotifier<List<TicketModel>>(<TicketModel>[]);
  List<TicketModel> get tickets => ticketsNotifier.value;
  set tickets(List<TicketModel> value) => ticketsNotifier.value = value;

  TicketListController() {
    getTickets();
  }

  Future<void> getTickets() async {
    try {
      final instance = await SharedPreferences.getInstance();
      final response = instance.getStringList('tickets') ?? <String>[];
      tickets = response.map((e) => TicketModel.fromJson(e)).toList();
    } catch (e) {
      tickets = <TicketModel>[];
    }
  }
}
