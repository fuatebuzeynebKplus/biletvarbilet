import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum InclusionType {
  excluded(0, 'Excluded'),
  included(1, 'Included'),
  paid(2, 'Paid');

  final int value;
  final String description;

  const InclusionType(this.value, this.description);

  String toString() => description;

  static InclusionType fromJson(int value) {
    switch (value) {
      case 0:
        return excluded;
      case 1:
        return included;
      case 2:
        return paid;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
