// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'void_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VoidReservation _$VoidReservationFromJson(Map<String, dynamic> json) =>
    VoidReservation(
      tokenCode: json['TokenCode'] as String,
      SystemPnr: json['SystemPnr'] as String,
      LastName: json['LastName'] as String,
    );

Map<String, dynamic> _$VoidReservationToJson(VoidReservation instance) =>
    <String, dynamic>{
      'TokenCode': instance.tokenCode,
      'SystemPnr': instance.SystemPnr,
      'LastName': instance.LastName,
    };
