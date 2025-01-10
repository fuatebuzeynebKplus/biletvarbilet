import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum ExtraServiceType {
  tourExtraService(0, 'Tour Extra Service'),
  additionalService(1, 'Additional Service');

  final int value;
  final String description;

  const ExtraServiceType(this.value, this.description);

  String toString() => description;

  static ExtraServiceType fromJson(int value) {
    switch (value) {
      case 0:
        return tourExtraService;
      case 1:
        return additionalService;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
