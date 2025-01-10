import 'package:bamobile1/hotel/data/models/hotel_booking_pax.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_room_pax.g.dart';

@JsonSerializable()
class HotelRoomPax {
  final int roomIndex; // أضف RoomIndex هنا
  final List<HotelBookingPax>? paxes;

  HotelRoomPax({required this.roomIndex, required this.paxes});

  factory HotelRoomPax.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomPaxFromJson(json);

  Map<String, dynamic> toJson() => _$HotelRoomPaxToJson(this);
}
