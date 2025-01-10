import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/common/data/enums/product_type.dart';
import 'package:bamobile1/flight/data/models/flight_booking.dart';
import 'package:json_annotation/json_annotation.dart';

import 'booking_amount.dart';
import 'contact_info.dart';
import 'invoice_info.dart';

part 'booking.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class Booking {
  List<dynamic>? activityBookingList;
  List<dynamic>? additionalServiceBookingList;
  dynamic agentReferenceInfo;
  BookingAmount? amount;
  String? bookingDate;
  String? bookingNote;
  BookingStatusType? bookingStatusType;
  List<dynamic>? campaigns;
  List<dynamic>? carBookingList;
  dynamic channelTrackingNumber;
  ContactInfo? contactInfo;
  List<dynamic>? contracts;
  List<dynamic>? corporateDefinitions;
  dynamic data;
  List<dynamic>? discountCodes;
  String? expirationDate;
  String? extraNote;
  List<FlightBooking>? flightBookingList;
  List<dynamic>? hotelBookingList;
  InvoiceInfo? invoiceInfo;
  String? languageCode;
  String? processId;
  ProductType? productType;
  String? systemPnr;
  String? tokenCode;
  List<dynamic>? tourBookingList;
  List<dynamic>? transferBookingList;
  String? version;
  List<dynamic>? visaBookingList;

  Booking(
      {this.activityBookingList,
      this.additionalServiceBookingList,
      this.agentReferenceInfo,
      this.amount,
      this.bookingDate,
      this.bookingNote,
      this.bookingStatusType,
      this.campaigns,
      this.carBookingList,
      this.channelTrackingNumber,
      this.contactInfo,
      this.contracts,
      this.corporateDefinitions,
      this.data,
      this.discountCodes,
      this.expirationDate,
      this.extraNote,
      this.flightBookingList,
      this.hotelBookingList,
      this.invoiceInfo,
      this.languageCode,
      this.processId,
      this.productType,
      this.systemPnr,
      this.tokenCode,
      this.tourBookingList,
      this.transferBookingList,
      this.version,
      this.visaBookingList});
  // String? agentReferenceInfo;
  // String? bookingDate;
  // String? bookingNote;
  // String? expirationDate;
  // String? extraNote;
  // String? languageCode;
  // String? systemPnr;
  // List<String>? tokenCode;
  // BookingStatusType? bookingStatusType;
  // ProductType? productType;
  // BookingAmount? amount;
  // InvoiceInfo? invoiceInfo;
  // ContactInfo? contactInfo;
  // List<FlightBooking>? hotelBookingList;

  // Booking({
  //   this.agentReferenceInfo,
  //   this.amount,
  //   this.bookingDate,
  //   this.bookingNote,
  //   this.bookingStatusType,
  //   this.contactInfo,
  //   this.expirationDate,
  //   this.extraNote,
  //   this.hotelBookingList,
  //   this.invoiceInfo,
  //   this.languageCode,
  //   this.productType,
  //   this.systemPnr,
  //   this.tokenCode,
  // });

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  Map<String, dynamic> toJson() => _$BookingToJson(this);
}
