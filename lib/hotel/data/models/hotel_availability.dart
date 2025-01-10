import 'package:bamobile1/hotel/data/models/hotel_availability_data.dart';
import 'package:bamobile1/hotel/data/models/hotel_room_result.dart';
import 'package:bamobile1/hotel/data/models/hotels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_availability.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelAvailability {
  Hotels hotel;
  HotelRoomResult rooms;
  HotelAvailabilityData data;

  HotelAvailability(
      {required this.hotel, required this.rooms, required this.data});

  factory HotelAvailability.fromJson(Map<String, dynamic> json) =>
      _$HotelAvailabilityFromJson(json);

  Map<String, dynamic> toJson() => _$HotelAvailabilityToJson(this);
}

class HotelAvailBilityJson {
  HotelAvailability request;

  HotelAvailBilityJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
