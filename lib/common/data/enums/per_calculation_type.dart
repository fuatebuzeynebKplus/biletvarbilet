import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum PerCalculationType {
  perPerson(0, 'Per Person'),
  perPNR(1, 'Per PNR'),
  perPersonalPerLeg(2, 'Per Personal Per Leg'),
  perRoute(3, 'Per Route'),
  perReservation(4, 'Per Reservation'),
  perRoom(5, 'Per Room'),
  perDay(6, 'Per Day');

  final int value;
  final String description;

  const PerCalculationType(this.value, this.description);

  String toString() => description;

  static PerCalculationType fromString(String name) {
    switch (name) {
      case 'Per Person':
        return perPerson;
      case 'Per PNR':
        return perPNR;
      case 'Per Personal Per Leg':
        return perPersonalPerLeg;
      case 'Per Route':
        return perRoute;
      case 'Per Reservation':
        return perReservation;
      case 'Per Room':
        return perRoom;
      case 'Per Day':
        return perDay;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
