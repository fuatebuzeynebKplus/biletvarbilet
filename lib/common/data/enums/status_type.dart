import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum StatusType {
  delete(-1, 'Deleted'),
  passive(0, 'Passive'),
  active(1, 'Active');

  final int value;
  final String description;

  const StatusType(this.value, this.description);

  String toString() => description;

  static StatusType fromJson(int value) {
    switch (value) {
      case -1:
        return StatusType.delete;
      case 0:
        return StatusType.passive;
      case 1:
        return StatusType.active;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
