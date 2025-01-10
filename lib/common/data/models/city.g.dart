// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

City _$CityFromJson(Map<String, dynamic> json) => City(
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      countryCode: json['CountryCode'] as String?,
      geoLocation: json['GeoLocation'] == null
          ? null
          : GeoLocation.fromJson(json['GeoLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'Code': instance.code,
      'Name': instance.name,
      'CountryCode': instance.countryCode,
      'GeoLocation': instance.geoLocation?.toJson(),
    };
