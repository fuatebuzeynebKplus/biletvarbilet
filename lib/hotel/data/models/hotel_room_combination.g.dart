// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_room_combination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelRoomCombination _$HotelRoomCombinationFromJson(
        Map<String, dynamic> json) =>
    HotelRoomCombination(
      board: json['Board'] == null
          ? null
          : CodeName.fromJson(json['Board'] as Map<String, dynamic>),
      rate: (json['Rate'] as num?)?.toDouble(),
      roomCodes: (json['RoomCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HotelRoomCombinationToJson(
        HotelRoomCombination instance) =>
    <String, dynamic>{
      'RoomCodes': instance.roomCodes,
      'Board': instance.board?.toJson(),
      'Rate': instance.rate,
    };
