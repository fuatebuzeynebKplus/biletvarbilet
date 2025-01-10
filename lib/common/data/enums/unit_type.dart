import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum UnitType {
  meter(0, 'Meter'),
  kilometer(1, 'Kilometer'),
  mile(2, 'Mile'),
  count(3, 'Count'),
  hour(4, 'Hour'),
  day(5, 'Day'),
  month(6, 'Month'),
  year(7, 'Year');

  final int value;
  final String description;

  const UnitType(this.value, this.description);

  @override
  String toString() => description;

  static UnitType fromString(String name) {
    switch (name) {
      case 'Meter':
        return meter;
      case 'Kilometer':
        return kilometer;
      case 'Mile':
        return mile;
      case 'Count':
        return count;
      case 'Hour':
        return hour;
      case 'Day':
        return day;
      case 'Month':
        return month;
      case 'Year':
        return year;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}