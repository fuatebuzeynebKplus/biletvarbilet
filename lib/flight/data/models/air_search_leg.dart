import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/flight/data/models/hotpoint.dart';

part 'air_search_leg.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirSearchLeg {
  Hotpoint? arrivalPoint;
  String? date;
  Hotpoint? departurePoint;

  AirSearchLeg({
    required this.arrivalPoint,
    required this.date,
    required this.departurePoint,
  });

  factory AirSearchLeg.fromJson(Map<String, dynamic> json) =>
      _$AirSearchLegFromJson(json);

  Map<String, dynamic> toJson() => _$AirSearchLegToJson(this);
}
