import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/hotel/data/models/additional_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_room_pax_price.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelRoomPaxPrice {
  PaxType? paxType;
  List<AdditionalService>? additionalService;

  HotelRoomPaxPrice({this.additionalService, this.paxType});

  factory HotelRoomPaxPrice.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomPaxPriceFromJson(json);

  Map<String, dynamic> toJson() => _$HotelRoomPaxPriceToJson(this);
}

class HotelRoomPaxPriceJson {
  HotelRoomPaxPrice request;

  HotelRoomPaxPriceJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
