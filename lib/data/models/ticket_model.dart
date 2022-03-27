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

  TicketModel merge(TicketModel model) {
    return TicketModel(
      description: model.description ?? description,
      dueDate: model.dueDate ?? dueDate,
      value: model.value ?? value,
      barcode: model.barcode ?? barcode,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'description': description?.toMap(),
      'dueDate': dueDate?.toMap(),
      'value': value?.toMap(),
      'barcode': barcode?.toMap(),
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TicketModel(
      description: String?.fromMap(map['description']),
      dueDate: String?.fromMap(map['dueDate']),
      value: double?.fromMap(map['value']),
      barcode: String?.fromMap(map['barcode']),
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
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TicketModel &&
        o.description == description &&
        o.dueDate == dueDate &&
        o.value == value &&
        o.barcode == barcode;
  }

  @override
  int get hashCode {
    return description.hashCode ^
        dueDate.hashCode ^
        value.hashCode ^
        barcode.hashCode;
  }
}
