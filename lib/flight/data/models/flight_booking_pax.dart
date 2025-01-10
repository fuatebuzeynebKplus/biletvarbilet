import 'package:bamobile1/common/data/enums/pax_type.dart';
//import 'package:bamobile1/common/data/enums/wheel_chair_service.dart';
import 'package:bamobile1/common/data/models/booking_amount.dart';
import 'package:bamobile1/flight/data/models/flight_booking_pax_baggage_allowence.dart';
import 'package:bamobile1/flight/data/models/flight_booking_pax_mileage_program.dart';
import 'package:bamobile1/flight/data/models/flight_booking_pax_optional_service.dart';
import 'package:bamobile1/flight/data/models/pax.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_booking_pax.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class FlightBookingPax {
  List<FlightBookingPaxBaggageAllowence>? baggageAllowances;
  BookingAmount? bookingAmount;
  PaxType? flightPaxType;
  List<FlightBookingPaxMileageProgram>? mileagePrograms;
  List<FlightBookingPaxOptionalService>? optionalServices;
  dynamic passengerRef;
  Pax? pax;
  int? recId;
  dynamic splitPnr;
  int? statusType;
  dynamic ticketNumber;
  // WheelChairServiceType? wheelChairServiceType;
  int? wheelChairServiceType;

  FlightBookingPax({
    this.baggageAllowances,
    this.bookingAmount,
    this.flightPaxType,
    this.mileagePrograms,
    this.optionalServices,
    this.passengerRef,
    this.pax,
    this.recId,
    this.splitPnr,
    this.statusType,
    this.ticketNumber,
    this.wheelChairServiceType,
  });

  // List<FlightBookingPaxBaggageAllowence>? baggageAllowence;
  // BookingAmount? bookingAmount;
  // PaxType? flightPaxType;
  // List<FlightBookingPaxMileageProgram>? mileagePrograms;
  // List<FlightBookingPaxOptionalService>? optionalServices;
  // String? passengerRef;
  // Pax? pax;
  // int? recId;
  // dynamic splitPnr;
  // int? statusType;
  // String? ticketNumber;
  // WheelChairServiceType? wheelChairServiceType;

  // FlightBookingPax({
  //   this.baggageAllowence,
  //   this.bookingAmount,
  //   this.flightPaxType,
  //   this.mileagePrograms,
  //   this.optionalServices,
  //   this.passengerRef,
  //   this.pax,
  //   this.recId,
  //   this.splitPnr,
  //   this.statusType,
  //   this.ticketNumber,
  //   this.wheelChairServiceType,
  // });

  factory FlightBookingPax.fromJson(Map<String, dynamic> json) =>
      _$FlightBookingPaxFromJson(json);

  Map<String, dynamic> toJson() => _$FlightBookingPaxToJson(this);
}
