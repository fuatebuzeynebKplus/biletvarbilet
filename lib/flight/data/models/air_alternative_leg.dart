import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/flight/data/models/air_segment.dart';

part 'air_alternative_leg.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirAlternativeLeg {
  String? alternativeRef;
  List<AirSegment>? segments;

  AirAlternativeLeg({
    required this.alternativeRef,
    required this.segments,
  });

  factory AirAlternativeLeg.fromJson(Map<String, dynamic> json) =>
      _$AirAlternativeLegFromJson(json);

  Map<String, dynamic> toJson() => _$AirAlternativeLegToJson(this);
}
