import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum ApprovalType {
  outofRule(0, 'Out of Rule'),
  inRule(1, 'In Rule');

  final int value;
  final String description;

  const ApprovalType(this.value, this.description);

  String toString() => description;

  static ApprovalType fromJson(int value) {
    switch (value) {
      case 0:
        return outofRule;
      case 1:
        return inRule;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
