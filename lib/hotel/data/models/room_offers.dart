import 'package:json_annotation/json_annotation.dart';

part 'room_offers.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class RoomOffers {
  String productCode;
  String searchKey;
  String languageCode;
  String tokenCode;

  RoomOffers({
    required this.productCode,
    required this.searchKey,
    required this.languageCode,
    required this.tokenCode,
  });

  factory RoomOffers.fromJson(Map<String, dynamic> json) =>
      _$RoomOffersFromJson(json);

  Map<String, dynamic> toJson() => _$RoomOffersToJson(this);
}

class RoomOffersJson {
  RoomOffers request;

  RoomOffersJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
