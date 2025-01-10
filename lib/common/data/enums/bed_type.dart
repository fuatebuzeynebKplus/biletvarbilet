import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum BedType {
  doubleBed(0, 'Double Bed'),
  separateBed(1, 'Separate Bed'),
  singleBed(2, 'Single Bed'),
  doubleAndExtraBed(3, 'Double and Extra Bed');

  final int value;
  final String description;

  const BedType(this.value, this.description);

  String toString() => description;

  static BedType fromJson(int value) {
    switch (value) {
      case 0:
        return doubleBed;
      case 1:
        return separateBed;
      case 2:
        return singleBed;
      case 3:
        return doubleAndExtraBed;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
