import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/flight/data/models/air_equipment.dart';
import 'package:bamobile1/flight/data/models/airline.dart';
import 'package:bamobile1/flight/data/models/hotpoint.dart';

part 'air_segment.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirSegment {
  Hotpoint? arrivalAirport;
  String? arrivalDate;
  Hotpoint? departureAirport;
  String? departureDate;
  AirEquipment? equipment;
  dynamic flightDuration; //int?
  String? flightNo;
  Airline? operatingAirline;
  dynamic orderNo; // int?
  String? segmentRef;
  dynamic segmentStops;
  Airline? ticketingAirline;
  dynamic waitingDuration; // int?

  AirSegment({
    required this.arrivalAirport,
    required this.arrivalDate,
    required this.departureAirport,
    required this.departureDate,
    this.equipment,
    this.flightDuration,
    this.flightNo,
    this.operatingAirline,
    this.orderNo,
    this.segmentRef,
    this.segmentStops,
    this.ticketingAirline,
    this.waitingDuration,
  });

  factory AirSegment.fromJson(Map<String, dynamic> json) =>
      _$AirSegmentFromJson(json);

  Map<String, dynamic> toJson() => _$AirSegmentToJson(this);
}
