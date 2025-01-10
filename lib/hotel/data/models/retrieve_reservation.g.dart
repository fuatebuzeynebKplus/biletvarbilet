// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retrieve_reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetrieveReservation _$RetrieveReservationFromJson(Map<String, dynamic> json) =>
    RetrieveReservation(
      tokenCode: json['TokenCode'] as String,
      SystemPnr: json['SystemPnr'] as String,
      LastName: json['LastName'] as String,
    );

Map<String, dynamic> _$RetrieveReservationToJson(
        RetrieveReservation instance) =>
    <String, dynamic>{
      'TokenCode': instance.tokenCode,
      'SystemPnr': instance.SystemPnr,
      'LastName': instance.LastName,
    };
