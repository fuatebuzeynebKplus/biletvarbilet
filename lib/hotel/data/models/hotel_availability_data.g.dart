// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_availability_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelAvailabilityData _$HotelAvailabilityDataFromJson(
        Map<String, dynamic> json) =>
    HotelAvailabilityData(
      boards: (json['Boards'] as List<dynamic>?)
          ?.map((e) => CodeName.fromJson(e as Map<String, dynamic>))
          .toList(),
      providers: (json['Providers'] as List<dynamic>?)
          ?.map((e) => CodeName.fromJson(e as Map<String, dynamic>))
          .toList(),
      roomCominations: (json['RoomCominations'] as List<dynamic>?)
          ?.map((e) => HotelRoomCombination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotelAvailabilityDataToJson(
        HotelAvailabilityData instance) =>
    <String, dynamic>{
      'Boards': instance.boards?.map((e) => e.toJson()).toList(),
      'Providers': instance.providers?.map((e) => e.toJson()).toList(),
      'RoomCominations':
          instance.roomCominations?.map((e) => e.toJson()).toList(),
    };
