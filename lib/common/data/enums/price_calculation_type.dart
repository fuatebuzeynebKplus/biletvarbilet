import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum PriceCalculationType {
  individual(0, 'Individual'),
  package(1, 'Package'),
  purchasePrice(2, 'Purchase price'),
  all(3, 'All');

  final int value;
  final String description;

  const PriceCalculationType(this.value, this.description);

  String toString() => description;

  static PriceCalculationType fromString(String name) {
    switch (name) {
      case 'Individual':
        return individual;
      case 'Package':
        return package;
      case 'Purchase price':
        return purchasePrice;
      case 'All':
        return all;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}