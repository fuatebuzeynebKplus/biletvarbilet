import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum ProductType {
  flight(0, 'Flight tickets'),
  hotel(1, 'Accommodations'),
  tour(2, 'Tours'),
  rentacar(3, 'Car rentals'),
  transfer(4, 'Transfers'),
  insurance(5, 'Insurances'),
  visa(6, 'Visa'),
  cruise(7, 'Cruises'),
  train(8, 'Train tickets'),
  package(9, 'Dynamic packages'),
  activity(12, 'Activities');

  final int value;
  final String description;

  const ProductType(this.value, this.description);

  String toString() => description;

  static ProductType fromString(String name) {
    switch (name) {
      case 'Flight tickets':
        return flight;
      case 'Accommodations':
        return hotel;
      case 'Tours':
        return tour;
      case 'Car rentals':
        return rentacar;
      case 'Transfers':
        return transfer;
      case 'Insurances':
        return insurance;
      case 'Visa':
        return visa;
      case 'Cruises':
        return cruise;
      case 'Train tickets':
        return train;
      case 'Dynamic packages':
        return package;
      case 'Activities':
        return activity;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}