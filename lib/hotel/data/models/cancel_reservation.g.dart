// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cancel_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelReservation _$CancelReservationFromJson(Map<String, dynamic> json) =>
    CancelReservation(
      tokenCode: json['TokenCode'] as String,
      SystemPnr: json['SystemPnr'] as String,
      LastName: json['LastName'] as String,
    );

Map<String, dynamic> _$CancelReservationToJson(CancelReservation instance) =>
    <String, dynamic>{
      'TokenCode': instance.tokenCode,
      'SystemPnr': instance.SystemPnr,
      'LastName': instance.LastName,
    };
