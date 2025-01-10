import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/inclusion_type.dart';

part 'fare_service.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class FareService {
  String? description;
  InclusionType? inclusionType;
  String? title;

  FareService({
    this.description,
    this.inclusionType,
    this.title,
  });

  factory FareService.fromJson(Map<String, dynamic> json) =>
      _$FareServiceFromJson(json);

  Map<String, dynamic> toJson() => _$FareServiceToJson(this);
}
