import 'package:bamobile1/common/data/models/payment_verification_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotels.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Hotels {
  String? HotelCode;
  String? HotelName;
  String? HotelImageURL;
  String? Address;
  String? CategoryName;
  String? CountryCode;
  String? Email;
  String? Phone;
  String? Fax;
  String? Location;
  String? TripAdvisorId;
  GeoLocation? geoLocation;

  Hotels(
      {this.HotelCode,
      this.HotelName,
      this.HotelImageURL,
      this.Address,
      this.CategoryName,
      this.CountryCode,
      this.Email,
      this.Phone,
      this.Fax,
      this.Location,
      this.TripAdvisorId,
      this.geoLocation});

  factory Hotels.fromJson(Map<String, dynamic> json) => _$HotelsFromJson(json);

  Map<String, dynamic> toJson() => _$HotelsToJson(this);
}

class HotelsJson {
  Hotels request;

  HotelsJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
