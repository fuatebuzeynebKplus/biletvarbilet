import 'package:bamobile1/flight/data/models/geo_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Country {
  int? rating;
  dynamic searchingWords;
  String? code;
  String? name;
  String? languageCode;
  double? timeZone;
  GeoLocation? geoLocation;

  Country({
    this.rating,
    this.searchingWords,
    this.code,
    this.name,
    this.languageCode,
    this.timeZone,
    this.geoLocation,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
