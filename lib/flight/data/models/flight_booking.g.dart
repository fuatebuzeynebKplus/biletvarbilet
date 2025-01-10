// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightBooking _$FlightBookingFromJson(Map<String, dynamic> json) =>
    FlightBooking(
      amount: json['Amount'] == null
          ? null
          : BookingAmount.fromJson(json['Amount'] as Map<String, dynamic>),
      bookingDate: json['BookingDate'] as String?,
      bookingStatusType: $enumDecodeNullable(
          _$BookingStatusTypeEnumMap, json['BookingStatusType']),
      canExchange: json['CanExchange'] as bool?,
      canRefund: json['CanRefund'] as bool?,
      corporatePin: json['CorporatePin'],
      data: json['Data'],
      expirationDate: json['ExpirationDate'] as String?,
      legs: (json['Legs'] as List<dynamic>?)
          ?.map((e) => FlightBookingLeg.fromJson(e as Map<String, dynamic>))
          .toList(),
      paxList: (json['PaxList'] as List<dynamic>?)
          ?.map((e) => FlightBookingPax.fromJson(e as Map<String, dynamic>))
          .toList(),
      pnr: json['Pnr'] as String?,
      rules: (json['Rules'] as List<dynamic>?)
          ?.map((e) => FlightBookingRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      services: json['Services'] as List<dynamic>?,
      voidTime: (json['VoidTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FlightBookingToJson(FlightBooking instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Amount', instance.amount?.toJson());
  writeNotNull('BookingDate', instance.bookingDate);
  writeNotNull('BookingStatusType',
      _$BookingStatusTypeEnumMap[instance.bookingStatusType]);
  writeNotNull('CanExchange', instance.canExchange);
  writeNotNull('CanRefund', instance.canRefund);
  writeNotNull('CorporatePin', instance.corporatePin);
  writeNotNull('Data', instance.data);
  writeNotNull('ExpirationDate', instance.expirationDate);
  writeNotNull('Legs', instance.legs?.map((e) => e.toJson()).toList());
  writeNotNull('PaxList', instance.paxList?.map((e) => e.toJson()).toList());
  writeNotNull('Pnr', instance.pnr);
  writeNotNull('Rules', instance.rules?.map((e) => e.toJson()).toList());
  writeNotNull('Services', instance.services);
  writeNotNull('VoidTime', instance.voidTime);
  return val;
}

const _$BookingStatusTypeEnumMap = {
  BookingStatusType.reservationSucceed: 1,
  BookingStatusType.reservationFailed: 2,
  BookingStatusType.reservationExpired: 3,
  BookingStatusType.reservationCancelled: 4,
  BookingStatusType.ticketingFailed: 6,
  BookingStatusType.ticketingSucceed: 7,
  BookingStatusType.ticketingCancelled: 8,
  BookingStatusType.reservationChanged: 12,
  BookingStatusType.ticketingChanged: 13,
  BookingStatusType.cancellationPending: 14,
  BookingStatusType.ticketingVoid: 16,
};
