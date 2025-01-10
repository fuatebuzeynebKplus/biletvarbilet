import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum GenderType {
  female(0, 'Female'),
  male(1, 'Male'),
  unknown(2, 'Unknown');

  final int value;
  final String description;

  const GenderType(this.value, this.description);

  String toString() => description;

  static GenderType fromString(int value) {
    switch (value) {
      case 0:
        return female;
      case 1:
        return male;
      case 2:
        return unknown;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
