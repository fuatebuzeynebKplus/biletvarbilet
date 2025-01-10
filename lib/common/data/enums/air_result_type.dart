import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum AirResultType {
  all(0, 'All'),
  separated(1, 'Separated'),
  combined(2, 'Combined (Package)');

  final int value;
  final String description;

  const AirResultType(this.value, this.description);

  String toString() => description;

  static AirResultType fromJson(int value) {
    switch (value) {
      case 0:
        return all;
      case 1:
        return separated;
      case 2:
        return combined;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
