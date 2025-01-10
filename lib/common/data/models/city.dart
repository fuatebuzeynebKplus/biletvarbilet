import 'package:bamobile1/flight/data/models/geo_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class City {
  String? code;
  String? name;
  String? countryCode;
  GeoLocation? geoLocation;

  City({
    this.code,
    this.name,
    this.countryCode,
    this.geoLocation,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
