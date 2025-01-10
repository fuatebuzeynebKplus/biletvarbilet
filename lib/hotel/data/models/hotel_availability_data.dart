import 'package:bamobile1/hotel/data/models/code_name.dart';
import 'package:bamobile1/hotel/data/models/hotel_room_combination.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_availability_data.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelAvailabilityData {
  List<CodeName>? boards;
  List<CodeName>? providers;
  List<HotelRoomCombination>? roomCominations;

  HotelAvailabilityData({this.boards, this.providers, this.roomCominations});

  factory HotelAvailabilityData.fromJson(Map<String, dynamic> json) =>
      _$HotelAvailabilityDataFromJson(json);

  Map<String, dynamic> toJson() => _$HotelAvailabilityDataToJson(this);
}

class HotelAvailabilityDataJson {
  HotelAvailabilityData request;

  HotelAvailabilityDataJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
