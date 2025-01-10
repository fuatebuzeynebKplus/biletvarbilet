import 'package:json_annotation/json_annotation.dart';

part 'geo_location.g.dart'; // Generated code file

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class GeoLocation {
  dynamic latitude;
  dynamic longitude;

  GeoLocation({this.latitude, this.longitude});

  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);

  Map<String, dynamic> toJson() => _$GeoLocationToJson(this);
}
