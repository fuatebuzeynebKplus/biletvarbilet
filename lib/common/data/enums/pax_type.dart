import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum PaxType {
  adult(0, 'Adult'),
  child(1, 'Child'),
  infant(2, 'Infant');

  final int value;
  final String description;

  const PaxType(this.value, this.description);

  @override
  String toString() => description;

  static PaxType fromJson(int value) {
    switch (value) {
      case 0:
        return adult;
      case 1:
        return child;
      case 2:
        return infant;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
