import 'package:json_annotation/json_annotation.dart';

part 'air_fare_segment.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirFareSegment {
  //dynamic cabinType;
  dynamic cabinType;
  String? classCode;
  String? fareBasis;
  dynamic seatCount;
  //dynamic seatCount;
  String? segmentRef;
  String? temporaryKey;

  AirFareSegment({
    this.cabinType,
    this.classCode,
    this.fareBasis,
    this.seatCount,
    this.segmentRef,
    this.temporaryKey,
  });

  factory AirFareSegment.fromJson(Map<String, dynamic> json) =>
      _$AirFareSegmentFromJson(json);

  Map<String, dynamic> toJson() => _$AirFareSegmentToJson(this);
}
