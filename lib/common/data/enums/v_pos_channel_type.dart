import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum VPosChannelType {
  all(0, 'All'),
  classic(1, 'Classic Payment'),
  secure(2, '3D Secure Payment');

  final int value;
  final String description;

  const VPosChannelType(this.value, this.description);

  String toString() => description;

  static VPosChannelType fromString(int value) {
    switch (value) {
      case 0:
        return all;
      case 1:
        return classic;
      case 2:
        return secure;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
