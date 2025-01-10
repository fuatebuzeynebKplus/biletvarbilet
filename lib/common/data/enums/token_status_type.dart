import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum TokenStatusType {
  Closed(0),
  Active(1),
  Expired(2),
  Updated(3),
  Invalid(4);

  final int value;

  const TokenStatusType(this.value);

  factory TokenStatusType.fromJson(int value) {
    switch (value) {
      case 0:
        return Closed;
      case 1:
        return Active;
      case 2:
        return Expired;
      case 3:
        return Updated;
      case 4:
        return Invalid;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }

  int toJson() => value;
}
