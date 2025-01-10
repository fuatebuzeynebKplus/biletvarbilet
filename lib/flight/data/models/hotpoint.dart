import 'package:bamobile1/common/data/enums/hotpoint_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/hot_point_type.dart';
import "package:bamobile1/flight/data/models/geo_location.dart";
part 'hotpoint.g.dart'; // Generated code file

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Hotpoint {
  dynamic rating;
  dynamic searchingWords;
  String? cityCode;
  String? cityName;
  String? code;
  String? countryCode;
  String? countryName;
  GeoLocation? geoLocation;
  String? hotPointCodes;
  HotpointType? hotpointType;
  String? name;
  dynamic timeZone;

  Hotpoint(
      {this.rating,
      this.searchingWords,
      this.cityCode,
      this.cityName,
      this.code,
      this.countryCode,
      this.countryName,
      this.geoLocation,
      this.hotPointCodes,
      this.hotpointType,
      this.name,
      this.timeZone});

  // dynamic rating; // Integer No Noktanın derecelendirmesi
  // dynamic searchingWords;
  // String cityCode; // String Yes Şehir kodu
  // String? cityName; // String No Şehir adı
  // String? code; // String Yes Kodu
  // String? countryCode; // String No Ülke kodu
  // String? countryName; // String No Ülke adı
  // GeoLocation? geoLocation; // GeoLocationDto No Coğrafik konum
  // String? hotPointCodes; // String No Nokta kodları
  // HotpointType? hotpointType; // HotpointTypeEnum Yes Nokta tipi
  // String? name; // String No Nokta adı
  // //@JsonKey(name: 'timeZone', includeIfNull: true)
  // dynamic timeZone; // Decimal No Zaman dilimi

  // Hotpoint({
  //   required this.cityCode,
  //   this.cityName,
  //   required this.code,
  //   this.countryCode,
  //   this.countryName,
  //   this.geoLocation,
  //   this.hotPointCodes,
  //   required this.hotpointType,
  //   this.name,
  //   this.rating,
  //   this.timeZone,
  //   this.searchingWords,
  // });

  factory Hotpoint.fromJson(Map<String, dynamic> json) =>
      _$HotpointFromJson(json);

  Map<String, dynamic> toJson() => _$HotpointToJson(this);
}
