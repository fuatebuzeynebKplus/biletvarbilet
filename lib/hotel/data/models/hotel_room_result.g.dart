// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_room_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelRoomResult _$HotelRoomResultFromJson(Map<String, dynamic> json) =>
    HotelRoomResult(
      RoomAlternatives: (json['RoomAlternatives'] as List<dynamic>)
          .map((e) => HotelRoomPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      roomIndex: (json['RoomIndex'] as num).toInt(),
    );

Map<String, dynamic> _$HotelRoomResultToJson(HotelRoomResult instance) =>
    <String, dynamic>{
      'RoomIndex': instance.roomIndex,
      'RoomAlternatives':
          instance.RoomAlternatives.map((e) => e.toJson()).toList(),
    };
