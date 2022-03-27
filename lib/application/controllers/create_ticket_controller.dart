import 'package:flutter/cupertino.dart';

class CreateTicketController {
  final formKey = GlobalKey<FormState>();

  void registerTicket() {
    final form = formKey.currentState;
    if (form!.validate()) {}
  }

  void onChange(
      {String? description, String? dueDate, double? value, String? barcode}) {}
}
