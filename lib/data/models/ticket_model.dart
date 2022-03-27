import 'dart:convert' show json;

class TicketModel {
  final String? description;
  final String? dueDate;
  final double? value;
  final String? barcode;
  TicketModel({
    this.description,
    this.dueDate,
    this.value,
    this.barcode,
  });

  TicketModel copyWith({
    String? description,
    String? dueDate,
    double? value,
    String? barcode,
  }) {
    return TicketModel(
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      value: value ?? this.value,
      barcode: barcode ?? this.barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'dueDate': dueDate,
      'value': value,
      'barcode': barcode,
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      description: map['name'],
      dueDate: map['dueDate'],
      value: map['value'],
      barcode: map['barcode'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketModel.fromJson(String source) =>
      TicketModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TicketModel(description: $description, dueDate: $dueDate, value: $value, barcode: $barcode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TicketModel &&
        other.description == description &&
        other.dueDate == dueDate &&
        other.value == value &&
        other.barcode == barcode;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        dueDate.hashCode ^
        value.hashCode ^
        barcode.hashCode;
  }
}
