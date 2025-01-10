import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/common/data/models/booking_amount.dart';
import 'package:bamobile1/flight/data/models/flight_booking_leg.dart';
import 'package:bamobile1/flight/data/models/flight_booking_pax.dart';
import 'package:bamobile1/flight/data/models/flight_booking_rule.dart';

import 'package:json_annotation/json_annotation.dart';

part 'flight_booking.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class FlightBooking {
  BookingAmount? amount;
  String? bookingDate;
  BookingStatusType? bookingStatusType;
  bool? canExchange;
  bool? canRefund;
  dynamic corporatePin;
  dynamic data;
  String? expirationDate;
  List<FlightBookingLeg>? legs;
  List<FlightBookingPax>? paxList;
  String? pnr;
  List<FlightBookingRule>? rules;
  List<dynamic>? services;
  int? voidTime;

  FlightBooking(
      {this.amount,
      this.bookingDate,
      this.bookingStatusType,
      this.canExchange,
      this.canRefund,
      this.corporatePin,
      this.data,
      this.expirationDate,
      this.legs,
      this.paxList,
      this.pnr,
      this.rules,
      this.services,
      this.voidTime});
  // BookingAmount? amount;
  // String? bookingDate;
  // String? bookingNote;
  // BookingStatusType? bookingStatusType;
  // String? corporatePin;
  // dynamic data;
  // String? expirationDate;
  // List<FlightBookingLeg>? legs;
  // List<FlightBookingPax>? paxList;
  // String? pnr;
  // List<FlightBookingRule>? rules;
  // List<FlightBookingService>? services;
  // int? voidTime;
  // bool? canExchange;
  // bool? canRefund;

  // FlightBooking(
  //     {this.amount,
  //     this.bookingDate,
  //     this.bookingNote,
  //     this.bookingStatusType,
  //     this.corporatePin,
  //     this.data,
  //     this.expirationDate,
  //     this.legs,
  //     this.paxList,
  //     this.pnr,
  //     this.rules,
  //     this.services,
  //     this.voidTime,
  //     this.canExchange,
  //     this.canRefund});

  factory FlightBooking.fromJson(Map<String, dynamic> json) =>
      _$FlightBookingFromJson(json);

  Map<String, dynamic> toJson() => _$FlightBookingToJson(this);
}
