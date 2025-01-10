import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum TourType {
  outGoing(0, 'Outgoing'),
  outComing(1, 'Outcoming'),
  inGoing(2, 'Incoming'),
  inComing(3, 'Incoming');

  final int value;
  final String description;

  const TourType(this.value, this.description);

  String toString() => description;

  static TourType fromString(String name) {
    switch (name) {
      case 'Outgoing':
        return outGoing;
      case 'Outcoming':
        return outComing;
      case 'Ingoing':
        return inGoing;
      case 'Incoming':
        return inComing;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
