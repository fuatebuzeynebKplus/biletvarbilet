// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBooking _$GetBookingFromJson(Map<String, dynamic> json) => GetBooking(
      tokenCode: json['TokenCode'] as String,
      SystemPnr: json['SystemPnr'] as String,
      LastName: json['LastName'] as String,
    );

Map<String, dynamic> _$GetBookingToJson(GetBooking instance) =>
    <String, dynamic>{
      'TokenCode': instance.tokenCode,
      'SystemPnr': instance.SystemPnr,
      'LastName': instance.LastName,
    };
