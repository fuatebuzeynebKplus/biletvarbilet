// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_availability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelAvailability _$HotelAvailabilityFromJson(Map<String, dynamic> json) =>
    HotelAvailability(
      hotel: Hotels.fromJson(json['Hotel'] as Map<String, dynamic>),
      rooms: HotelRoomResult.fromJson(json['Rooms'] as Map<String, dynamic>),
      data:
          HotelAvailabilityData.fromJson(json['Data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelAvailabilityToJson(HotelAvailability instance) =>
    <String, dynamic>{
      'Hotel': instance.hotel.toJson(),
      'Rooms': instance.rooms.toJson(),
      'Data': instance.data.toJson(),
    };
