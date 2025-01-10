// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_booking_pax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelBookingPax _$HotelBookingPaxFromJson(Map<String, dynamic> json) =>
    HotelBookingPax(
      hotelPaxType: $enumDecode(_$PaxTypeEnumMap, json['HotelPaxType']),
      isLeader: json['IsLeader'] as bool,
      pax: Pax.fromJson(json['Pax'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelBookingPaxToJson(HotelBookingPax instance) =>
    <String, dynamic>{
      'HotelPaxType': _$PaxTypeEnumMap[instance.hotelPaxType]!,
      'IsLeader': instance.isLeader,
      'Pax': instance.pax.toJson(),
    };

const _$PaxTypeEnumMap = {
  PaxType.adult: 0,
  PaxType.child: 1,
  PaxType.infant: 2,
};
