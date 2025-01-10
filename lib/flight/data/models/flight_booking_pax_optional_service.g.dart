// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_booking_pax_optional_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightBookingPaxOptionalService _$FlightBookingPaxOptionalServiceFromJson(
        Map<String, dynamic> json) =>
    FlightBookingPaxOptionalService(
      bookingAmount: json['BookingAmount'] == null
          ? null
          : BookingAmount.fromJson(
              json['BookingAmount'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      segmentRef: json['SegmentRef'] as String?,
      title: json['Title'] as String?,
    );

Map<String, dynamic> _$FlightBookingPaxOptionalServiceToJson(
    FlightBookingPaxOptionalService instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BookingAmount', instance.bookingAmount?.toJson());
  writeNotNull('Description', instance.description);
  writeNotNull('SegmentRef', instance.segmentRef);
  writeNotNull('Title', instance.title);
  return val;
}
