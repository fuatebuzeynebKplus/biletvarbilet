import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum TourSearchType {
  all(0, 'All'),
  byCountry(1, 'By Country'),
  byCity(2, 'By City'),
  byLocation(3, 'By Location'),
  byCategory(4, 'By Category'),
  byCode(5, 'By Code'),
  byDeparture(6, 'By Departure');

  final int value;
  final String description;

  const TourSearchType(this.value, this.description);

  String toString() => description;

  static TourSearchType fromString(String name) {
    switch (name) {
      case 'All':
        return all;
      case 'By Country':
        return byCountry;
      case 'By City':
        return byCity;
      case 'By Location':
        return byLocation;
      case 'By Category':
        return byCategory;
      case 'By Code':
        return byCode;
      case 'By Departure':
        return byDeparture;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
