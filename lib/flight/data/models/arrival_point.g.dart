// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arrival_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArrivalPoint _$ArrivalPointFromJson(Map<String, dynamic> json) => ArrivalPoint(
      rating: (json['Rating'] as num?)?.toInt(),
      cityCode: json['CityCode'] as String,
      cityName: json['CityName'] as String?,
      code: json['Code'] as String,
      countryCode: json['CountryCode'] as String?,
      countryName: json['CountryName'] as String?,
      geoLocation: json['GeoLocation'] == null
          ? null
          : GeoLocation.fromJson(json['GeoLocation'] as Map<String, dynamic>),
      hotPointCodes: json['HotPointCodes'] as String?,
      hotPointType:
          $enumDecodeNullable(_$HotpointTypeEnumMap, json['HotPointType']),
      name: json['Name'] as String?,
      timeZone: (json['TimeZone'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ArrivalPointToJson(ArrivalPoint instance) =>
    <String, dynamic>{
      'Rating': instance.rating,
      'CityCode': instance.cityCode,
      'CityName': instance.cityName,
      'Code': instance.code,
      'CountryCode': instance.countryCode,
      'CountryName': instance.countryName,
      'GeoLocation': instance.geoLocation?.toJson(),
      'HotPointCodes': instance.hotPointCodes,
      'HotPointType': _$HotpointTypeEnumMap[instance.hotPointType],
      'Name': instance.name,
      'TimeZone': instance.timeZone,
    };

const _$HotpointTypeEnumMap = {
  HotpointType.city: 0,
  HotpointType.airport: 1,
  HotpointType.trainStation: 2,
  HotpointType.busTerminal: 3,
  HotpointType.heliPort: 4,
  HotpointType.seaport: 5,
  HotpointType.poi: 6,
  HotpointType.hotel: 7,
  HotpointType.destination: 8,
  HotpointType.country: 9,
};
