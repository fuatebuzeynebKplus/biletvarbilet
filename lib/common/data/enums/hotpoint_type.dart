import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum HotpointType {
  city(0, 'City'),
  airport(1, 'Airport'),
  trainStation(2, 'Train station'),
  busTerminal(3, 'Bus terminal'),
  heliPort(4, 'Heliport'),
  seaport(5, 'Seaport'),
  poi(6, 'Point of interest'),
  hotel(7, 'Hotel'),
  destination(8, 'Destination'),
  country(9, 'Country');

  final int value;
  final String description;

  const HotpointType(this.value, this.description);

  String toString() => description;

  static HotpointType fromString(String name) {
    switch (name) {
      case 'City':
        return city;
      case 'Airport':
        return airport;
      case 'Train station':
        return trainStation;
      case 'Bus terminal':
        return busTerminal;
      case 'Heliport':
        return heliPort;
      case 'Seaport':
        return seaport;
      case 'Point of interest':
        return poi;
      case 'Hotel':
        return hotel;
      case 'Destination':
        return destination;
      case 'Country':
        return country;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}