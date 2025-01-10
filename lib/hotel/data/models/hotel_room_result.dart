import 'package:bamobile1/hotel/data/models/hotel_room_price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_room_result.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelRoomResult {
  int roomIndex;
  List<HotelRoomPrice> RoomAlternatives;

  HotelRoomResult({required this.RoomAlternatives, required this.roomIndex});

  factory HotelRoomResult.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomResultFromJson(json);

  Map<String, dynamic> toJson() => _$HotelRoomResultToJson(this);
}

class HotelRoomResultJson {
  HotelRoomResult request;

  HotelRoomResultJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
