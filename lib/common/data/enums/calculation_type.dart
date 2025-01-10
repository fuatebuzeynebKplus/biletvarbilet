import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum CalculationType {
  percent(0, 'Percent'),
  amount(1, 'Amount');

  final int value;
  final String description;

  const CalculationType(this.value, this.description);

  String toString() => description;

  static CalculationType fromString(int value) {
    switch (value) {
      case 0:
        return percent;
      case 1:
        return amount;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
