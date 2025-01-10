import 'package:bamobile1/common/data/models/token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_details.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelDetails {
  String productCode;
  String tokenCode;

  HotelDetails({required this.productCode, required this.tokenCode});

  factory HotelDetails.fromJson(Map<String, dynamic> json) =>
      _$HotelDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$HotelDetailsToJson(this);
}

class HotelDetailsJson {
  HotelDetails request;

  HotelDetailsJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
