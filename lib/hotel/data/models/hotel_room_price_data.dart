import 'package:json_annotation/json_annotation.dart';

part 'hotel_room_price_data.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelRoomPriceData {
  String? temporaryKey;
  int? hotelProviderId;
  int? providerId;
  int? hotelId;
  int? productProviderTypeId;
  String? proHotelCode;
  int? boardId;
  int? roomId;

  HotelRoomPriceData(
      {this.boardId,
      this.hotelId,
      this.hotelProviderId,
      this.proHotelCode,
      this.productProviderTypeId,
      this.providerId,
      this.roomId,
      this.temporaryKey});

  factory HotelRoomPriceData.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomPriceDataFromJson(json);

  Map<String, dynamic> toJson() => _$HotelRoomPriceDataToJson(this);
}

class HotelRoomPriceDataJson {
  HotelRoomPriceData request;

  HotelRoomPriceDataJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
