import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum ActionType {
  earlyReservation(0, 'Early reservation'),
  freeDay(1, 'Free day action'),
  ageDiscount(2, 'Age discount'),
  honeymoon(3, 'Honeymoon action'),
  rollingEarlyReservation(4, 'Rolling early reservation'),
  specialDiscount(5, 'Special discount'),
  fakeDiscount(6, 'Fake discount'),
  couponDiscount(7, 'Coupon Discount');

  final int value;
  final String description;

  const ActionType(this.value, this.description);

  String toString() => description;

  static ActionType fromString(String name) {
    switch (name) {
      case 'Early reservation':
        return earlyReservation;
      case 'Free day action':
        return freeDay;
      case 'Age discount':
        return ageDiscount;
      case 'Honeymoon action':
        return honeymoon;
      case 'Rolling early reservation':
        return rollingEarlyReservation;
      case 'Special discount':
        return specialDiscount;
      case 'Fake discount':
        return fakeDiscount;
      case 'Coupon Discount':
        return couponDiscount;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
