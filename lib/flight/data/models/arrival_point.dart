import 'package:bamobile1/common/data/enums/hotpoint_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/hot_point_type.dart';
import 'geo_location.dart';

part 'arrival_point.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ArrivalPoint {
  int? rating;
  String cityCode;
  String? cityName;
  String code;
  String? countryCode;
  String? countryName;
  GeoLocation? geoLocation;
  String? hotPointCodes;
  HotpointType? hotPointType;
  String? name;
  int? timeZone;

  ArrivalPoint({
    this.rating,
    required this.cityCode,
    this.cityName,
    required this.code,
    this.countryCode,
    this.countryName,
    this.geoLocation,
    this.hotPointCodes,
    this.hotPointType,
    this.name,
    this.timeZone,
  });

  factory ArrivalPoint.fromJson(Map<String, dynamic> json) =>
      _$ArrivalPointFromJson(json);

  Map<String, dynamic> toJson() => _$ArrivalPointToJson(this);
}
