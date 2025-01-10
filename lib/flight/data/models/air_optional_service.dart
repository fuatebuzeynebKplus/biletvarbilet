import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/flight/data/models/price.dart';

part 'air_optional_service.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirOptionalService {
  String? description;
  String? optionalServiceRef;
  Price? price;
  String? segmentRef;
  bool? selected;
  String? title;

  AirOptionalService({
    this.description,
    this.optionalServiceRef,
    this.price,
    this.segmentRef,
    this.selected,
    this.title,
  });

  factory AirOptionalService.fromJson(Map<String, dynamic> json) =>
      _$AirOptionalServiceFromJson(json);

  Map<String, dynamic> toJson() => _$AirOptionalServiceToJson(this);
}
