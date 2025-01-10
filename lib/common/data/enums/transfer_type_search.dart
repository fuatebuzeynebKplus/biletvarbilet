import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum TransferSearchType {
  oneWay(0, 'Oneway'),
  roundTrip(1, 'Roundtrip'),
  multiPoint(2, 'Multiple point');

  final int value;
  final String description;

  const TransferSearchType(this.value, this.description);

  String toString() => description;

  static TransferSearchType fromString(int value) {
    switch (value) {
      case 0:
        return oneWay;
      case 1:
        return roundTrip;
      case 2:
        return multiPoint;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
