import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum AirCabinType {
  all(0, 'All Cabins'),
  promotion(1, 'Promo Class'),
  first(2, 'First Class'),
  business(3, 'Business Class'),
  economy(4, 'Economy Class'),
  premiumFirst(5, 'Premium First Class'),
  premiumEconomy(6, 'Premium Economy Class'),
  protocol(7, 'Protocol Class'),
  premiumBusiness(8, 'Premium Business Class');

  final int value;
  final String description;

  const AirCabinType(this.value, this.description);

  String toString() => description;

  static AirCabinType fromString(int value) {
    switch (value) {
      case 0:
        return all;
      case 1:
        return promotion;
      case 2:
        return first;
      case 3:
        return business;
      case 4:
        return economy;
      case 5:
        return premiumFirst;
      case 6:
        return premiumEconomy;
      case 7:
        return protocol;
      case 8:
        return premiumBusiness;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
