import 'package:bamobile1/hotel/data/models/code_name.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_room_combination.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelRoomCombination {
  List<String>? roomCodes;
  CodeName? board;
  double? rate;

  HotelRoomCombination({this.board, this.rate, this.roomCodes});

  factory HotelRoomCombination.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomCombinationFromJson(json);

  Map<String, dynamic> toJson() => _$HotelRoomCombinationToJson(this);
}

class HotelRoomCombinationJson {
  HotelRoomCombination request;

  HotelRoomCombinationJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
