import 'package:json_annotation/json_annotation.dart';

part 'air_fare_rule.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirFareRule {
  String? alternativeRef;
  String? description;
  String? segmentRef;
  String? title;

  AirFareRule({
    this.alternativeRef,
    this.description,
    this.segmentRef,
    this.title,
  });

  factory AirFareRule.fromJson(Map<String, dynamic> json) =>
      _$AirFareRuleFromJson(json);

  Map<String, dynamic> toJson() => _$AirFareRuleToJson(this);
}
