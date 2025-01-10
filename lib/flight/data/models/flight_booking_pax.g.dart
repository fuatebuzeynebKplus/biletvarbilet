// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_booking_pax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightBookingPax _$FlightBookingPaxFromJson(Map<String, dynamic> json) =>
    FlightBookingPax(
      baggageAllowances: (json['BaggageAllowances'] as List<dynamic>?)
          ?.map((e) => FlightBookingPaxBaggageAllowence.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      bookingAmount: json['BookingAmount'] == null
          ? null
          : BookingAmount.fromJson(
              json['BookingAmount'] as Map<String, dynamic>),
      flightPaxType:
          $enumDecodeNullable(_$PaxTypeEnumMap, json['FlightPaxType']),
      mileagePrograms: (json['MileagePrograms'] as List<dynamic>?)
          ?.map((e) => FlightBookingPaxMileageProgram.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      optionalServices: (json['OptionalServices'] as List<dynamic>?)
          ?.map((e) => FlightBookingPaxOptionalService.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      passengerRef: json['PassengerRef'],
      pax: json['Pax'] == null
          ? null
          : Pax.fromJson(json['Pax'] as Map<String, dynamic>),
      recId: (json['RecId'] as num?)?.toInt(),
      splitPnr: json['SplitPnr'],
      statusType: (json['StatusType'] as num?)?.toInt(),
      ticketNumber: json['TicketNumber'],
      wheelChairServiceType: (json['WheelChairServiceType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FlightBookingPaxToJson(FlightBookingPax instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaggageAllowances',
      instance.baggageAllowances?.map((e) => e.toJson()).toList());
  writeNotNull('BookingAmount', instance.bookingAmount?.toJson());
  writeNotNull('FlightPaxType', _$PaxTypeEnumMap[instance.flightPaxType]);
  writeNotNull('MileagePrograms',
      instance.mileagePrograms?.map((e) => e.toJson()).toList());
  writeNotNull('OptionalServices',
      instance.optionalServices?.map((e) => e.toJson()).toList());
  writeNotNull('PassengerRef', instance.passengerRef);
  writeNotNull('Pax', instance.pax?.toJson());
  writeNotNull('RecId', instance.recId);
  writeNotNull('SplitPnr', instance.splitPnr);
  writeNotNull('StatusType', instance.statusType);
  writeNotNull('TicketNumber', instance.ticketNumber);
  writeNotNull('WheelChairServiceType', instance.wheelChairServiceType);
  return val;
}

const _$PaxTypeEnumMap = {
  PaxType.adult: 0,
  PaxType.child: 1,
  PaxType.infant: 2,
};
