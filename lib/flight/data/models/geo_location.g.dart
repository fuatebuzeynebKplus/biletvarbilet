// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) => GeoLocation(
      latitude: json['Latitude'],
      longitude: json['Longitude'],
    );

Map<String, dynamic> _$GeoLocationToJson(GeoLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Latitude', instance.latitude);
  writeNotNull('Longitude', instance.longitude);
  return val;
}
