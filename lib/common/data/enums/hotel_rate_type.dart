import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum HotelRateType {
  refundable(0, 'Refundable rate'),
  nonRefundable(1, 'Non-Refundable rate'),
  special(2, 'Special rate'),
  offer(3, 'Offer'),
  package(4, 'Package rate'),
  unknown(5, 'Unknown');

  final int value;
  final String description;

  const HotelRateType(this.value, this.description);

  String toString() => description;

  static HotelRateType fromString(String name) {
    switch (name) {
      case 'Refundable rate':
        return refundable;
      case 'Non-Refundable rate':
        return nonRefundable;
      case 'Special rate':
        return special;
      case 'Offer':
        return offer;
      case 'Package rate':
        return package;
      case 'Unknown':
        return unknown;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}