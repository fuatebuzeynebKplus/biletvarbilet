import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum AirSearchType {
  oneway(0, 'Oneway'),
  roundtrip(1, 'Roundtrip'),
  multiple(2, 'Multiple');

  final int value;
  final String description;

  const AirSearchType(this.value, this.description);

  String toString() => description;

  static AirSearchType fromJson(int value) {
    switch (value) {
      case 0:
        return oneway;
      case 1:
        return roundtrip;
      case 2:
        return multiple;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
