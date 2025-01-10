import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum FeeType {
  unknown(0, 'Unknown'),
  free(1, 'Free'),
  paid(2, 'Paid');

  final int value;
  final String description;

  const FeeType(this.value, this.description);

  String toString() => description;

  static FeeType fromString(int value) {
    switch (value) {
      case 0:
        return unknown;
      case 1:
        return free;
      case 2:
        return paid;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
