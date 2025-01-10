import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/flight/data/models/air_fare_segment.dart';
import 'package:bamobile1/flight/data/models/air_fare_service.dart';

part 'air_fare_alternative_leg.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirFareAlternativeLeg {
  String? alternativeRef;
  //dynamic approvalType;
  dynamic approvalType;
  List<AirFareSegment>? fareSegments;
  List<AirFareService>? fareServices;
  //dynamic fareTitle;
  String? fareTitle;
  String? key;

  AirFareAlternativeLeg(
      {this.alternativeRef,
      this.fareSegments,
      this.fareServices,
      this.key,
      this.approvalType,
      this.fareTitle});

  factory AirFareAlternativeLeg.fromJson(Map<String, dynamic> json) =>
      _$AirFareAlternativeLegFromJson(json);

  Map<String, dynamic> toJson() => _$AirFareAlternativeLegToJson(this);
}
