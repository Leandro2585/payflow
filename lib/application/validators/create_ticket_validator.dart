class CreateTicketValidator {
  String? validateDescription(String? value) =>
      value?.isEmpty ?? true ? 'A descrição não pode ser vazio' : null;
  String? validateDueDate(String? value) =>
      value?.isEmpty ?? true ? 'A data de vencimento não pode ser vazia' : null;
  String? validatePrice(double value) =>
      value == 0 ? 'Insira um valor maior que R\$ 0,00' : null;
  String? validateBarcode(String? value) =>
      value?.isEmpty ?? true ? 'O código do boleto não pode ser vazio' : null;
}
