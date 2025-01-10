// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_hotel_rooms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateHotelRooms _$ValidateHotelRoomsFromJson(Map<String, dynamic> json) =>
    ValidateHotelRooms(
      tokenCode: json['TokenCode'] as String,
      rooms: (json['Rooms'] as List<dynamic>)
          .map((e) => {
                'Key': e['Key'] as String,
              })
          .toList(),
    );

Map<String, dynamic> _$ValidateHotelRoomsToJson(ValidateHotelRooms instance) =>
    <String, dynamic>{
      'Token': {
        "TokenCode": instance.tokenCode,
      },
      'Hotel': {
        'Rooms': instance.rooms.map((e) => {'Key': e['Key']}).toList(),
      }
    };
