import 'package:bamobile1/hotel/data/models/additional_service.dart';
import 'package:bamobile1/hotel/data/models/room_pax_definition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validate_hotel_rooms.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ValidateHotelRooms {
  String tokenCode;
  List<Map<String, String>> rooms;

  ValidateHotelRooms({
    required this.tokenCode,
    required this.rooms,
  });

  factory ValidateHotelRooms.fromJson(Map<String, dynamic> json) =>
      _$ValidateHotelRoomsFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateHotelRoomsToJson(this);
}

class ValidateHotelRoomsJson {
  ValidateHotelRooms request;

  ValidateHotelRoomsJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
