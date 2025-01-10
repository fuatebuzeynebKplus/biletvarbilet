import 'package:bamobile1/common/data/enums/air_cabin_type.dart';
import 'package:bamobile1/flight/data/models/airline.dart';
import 'package:bamobile1/flight/data/models/hotpoint.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_booking_leg.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class FlightBookingLeg {
  String? alternativeRef;
  Hotpoint? arrivalAirport;
  String? arrivalDate;
  AirCabinType? cabinType;
  String? classCode;
  dynamic data;
  Hotpoint? departureAirport;
  String? departureDate;
  String? fareBasis;
  dynamic fareTitle;
  int? flightDuration;
  String? flightNo;
  bool? isConnectedToNextFlight;
  int? legOrderNo;
  List<dynamic>? legStops;
  Airline? operatingAirline;
  String? segmentRef;
  Airline? ticketingAirline;
  String? vendorPnr;
  int? waitingDuration;

  FlightBookingLeg(
      {this.alternativeRef,
      this.arrivalAirport,
      this.arrivalDate,
      this.cabinType,
      this.classCode,
      this.data,
      this.departureAirport,
      this.departureDate,
      this.fareBasis,
      this.fareTitle,
      this.flightDuration,
      this.flightNo,
      this.isConnectedToNextFlight,
      this.legOrderNo,
      this.legStops,
      this.operatingAirline,
      this.segmentRef,
      this.ticketingAirline,
      this.vendorPnr,
      this.waitingDuration});

  // String? alternativeRef;
  // Hotpoint? arrivalAirport;
  // String? arrivalDate;
  // AirCabinType? cabinType;
  // String? classCode;
  // dynamic data;
  // Hotpoint? departureAirport;
  // String? departureDate;
  // String? fareBasis;
  // dynamic fareTitle;
  // int? flightDuration;
  // String? flightNo;
  // bool? isConnectedToNextFlight;
  // int? legOrderNo;
  // Airline? operatingAirline;
  // String? segmentKey;
  // String? segmentRef;
  // Airline? ticketingAirline;
  // String? vendoPnr;
  // String? waitingDuration;

  // FlightBookingLeg({
  //   required this.alternativeRef,
  //   required this.arrivalAirport,
  //   required this.arrivalDate,
  //   required this.cabinType,
  //   required this.classCode,
  //   this.data,
  //   required this.departureAirport,
  //   required this.departureDate,
  //   this.fareBasis,
  //   this.fareTitle,
  //   required this.flightDuration,
  //   required this.flightNo,
  //   required this.isConnectedToNextFlight,
  //   this.legOrderNo,
  //   required this.operatingAirline,
  //   required this.segmentKey,
  //   required this.segmentRef,
  //   required this.ticketingAirline,
  //   required this.vendoPnr,
  //   required this.waitingDuration,
  // });

  factory FlightBookingLeg.fromJson(Map<String, dynamic> json) =>
      _$FlightBookingLegFromJson(json);

  Map<String, dynamic> toJson() => _$FlightBookingLegToJson(this);
}
