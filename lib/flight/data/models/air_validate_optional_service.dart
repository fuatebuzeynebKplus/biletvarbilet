import 'package:json_annotation/json_annotation.dart';

part 'air_validate_optional_service.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class AirValidateOptionalService {
  String? optionalServiceRef;
  String? segmentRef;

  AirValidateOptionalService({
    this.optionalServiceRef,
    this.segmentRef,
  });

  factory AirValidateOptionalService.fromJson(Map<String, dynamic> json) =>
      _$AirValidateOptionalServiceFromJson(json);

  Map<String, dynamic> toJson() => _$AirValidateOptionalServiceToJson(this);
}
