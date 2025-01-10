import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum AdditionalServiceIconType {
  none(0, 'None'),
  babySeat(1, 'Baby Seat'),
  additionalDriver(2, 'Additional Driver'),
  additionalKilometres(3, 'Additional Kilometres'),
  insurance(4, 'Insurance'),
  navigation(5, 'Navigation'),
  childSeat(6, 'Child Seat'),
  babyStroller(7, 'Baby Stroller'),
  cancellationPackage(8, 'Cancellation Package');

  final int value;
  final String description;

  const AdditionalServiceIconType(this.value, this.description);

  String toString() => description;

  static AdditionalServiceIconType fromString(String name) {
    switch (name) {
      case 'None':
        return none;
      case 'Baby Seat':
        return babySeat;
      case 'Additional Driver':
        return additionalDriver;
      case 'Additional Kilometres':
        return additionalKilometres;
      case 'Insurance':
        return insurance;
      case 'Navigation':
        return navigation;
      case 'Child Seat':
        return childSeat;
      case 'Baby Stroller':
        return babyStroller;
      case 'Cancellation Package':
        return cancellationPackage;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
