import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/flight/data/models/air_alternative_leg.dart';
import 'package:bamobile1/flight/data/models/air_search_leg.dart';

part 'air_leg.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirLeg {
  List<AirAlternativeLeg>? alternativeLegs;
  AirSearchLeg? searchLeg;

  AirLeg({
    required this.alternativeLegs,
    required this.searchLeg,
  });

  factory AirLeg.fromJson(Map<String, dynamic> json) => _$AirLegFromJson(json);

  Map<String, dynamic> toJson() => _$AirLegToJson(this);
}
