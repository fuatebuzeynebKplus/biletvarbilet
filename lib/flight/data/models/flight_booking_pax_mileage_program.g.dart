// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_booking_pax_mileage_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightBookingPaxMileageProgram _$FlightBookingPaxMileageProgramFromJson(
        Map<String, dynamic> json) =>
    FlightBookingPaxMileageProgram(
      airlineCode: json['AirlineCode'] as String?,
      mileageNumber: json['MileageNumber'] as String?,
    );

Map<String, dynamic> _$FlightBookingPaxMileageProgramToJson(
    FlightBookingPaxMileageProgram instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AirlineCode', instance.airlineCode);
  writeNotNull('MileageNumber', instance.mileageNumber);
  return val;
}
