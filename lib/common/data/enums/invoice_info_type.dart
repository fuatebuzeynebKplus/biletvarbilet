import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum InvoiceInfoType {
  personal(0, 'Personal'),
  corporate(1, 'Corporate');

  final int value;
  final String description;

  const InvoiceInfoType(this.value, this.description);

  String toString() => description;

  static InvoiceInfoType fromString(String name) {
    switch (name) {
      case 'Personal':
        return personal;
      case 'Corporate':
        return corporate;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}