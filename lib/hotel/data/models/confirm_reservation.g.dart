// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmReservation _$ConfirmReservationFromJson(Map<String, dynamic> json) =>
    ConfirmReservation(
      tokenCode: json['TokenCode'] as String,
      systemPnr: json['SystemPnr'] as String,
      lastName: json['LastName'] as String,
      paymentInfo:
          PaymentInfo.fromJson(json['PaymentInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfirmReservationToJson(ConfirmReservation instance) =>
    <String, dynamic>{
      'TokenCode': instance.tokenCode,
      'SystemPnr': instance.systemPnr,
      'LastName': instance.lastName,
      'PaymentInfo': instance.paymentInfo.toJson(),
    };
