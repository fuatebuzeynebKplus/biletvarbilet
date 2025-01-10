part of 'hotel_room_pax.dart';

HotelRoomPax _$HotelRoomPaxFromJson(Map<String, dynamic> json) {
  return HotelRoomPax(
    roomIndex: json['RoomIndex'] as int,
    paxes: (json['Paxes'] as List<dynamic>)
        .map((e) => HotelBookingPax.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HotelRoomPaxToJson(HotelRoomPax instance) =>
    <String, dynamic>{
      'RoomIndex': instance.roomIndex,
      'Paxes': instance.paxes?.map((e) => e.toJson()).toList(),
    };
