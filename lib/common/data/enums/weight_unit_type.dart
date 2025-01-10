import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum WeightUnitType {
  kg(0, 'KG'),
  pc(1, 'Piece'),
  lb(2, 'Pound');

  final int value;
  final String description;

  const WeightUnitType(this.value, this.description);

  @override
  String toString() => description;

  static WeightUnitType fromJson(int value) {
    switch (value) {
      case 0:
        return kg;
      case 1:
        return pc;
      case 2:
        return lb;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
