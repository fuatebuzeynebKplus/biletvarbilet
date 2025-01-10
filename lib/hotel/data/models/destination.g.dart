// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
      cityCode: json['CityCode'] as String?,
      cityName: json['CityName'] as String?,
      countryCode: json['CountryCode'] as String?,
      countryName: json['CountryName'] as String?,
      destinationId: json['DestinationId'] as String,
      name: json['Name'] as String?,
      geoLocation: json['GeoLocation'] == null
          ? null
          : GeoLocation.fromJson(json['GeoLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'CityCode': instance.cityCode,
      'CityName': instance.cityName,
      'CountryName': instance.countryName,
      'CountryCode': instance.countryCode,
      'Name': instance.name,
      'DestinationId': instance.destinationId,
      'GeoLocation': instance.geoLocation?.toJson(),
    };
