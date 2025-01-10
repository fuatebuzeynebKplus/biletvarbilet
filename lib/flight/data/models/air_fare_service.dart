import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/inclusion_type.dart';

part 'air_fare_service.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirFareService {
  String? description;
  InclusionType? inclusionType;
  String? title;

  AirFareService({
    this.description,
    this.inclusionType,
    this.title,
  });

  factory AirFareService.fromJson(Map<String, dynamic> json) =>
      _$AirFareServiceFromJson(json);

  Map<String, dynamic> toJson() => _$AirFareServiceToJson(this);
}
