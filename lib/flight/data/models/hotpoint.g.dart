// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotpoint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotpoint _$HotpointFromJson(Map<String, dynamic> json) => Hotpoint(
      rating: json['Rating'],
      searchingWords: json['SearchingWords'],
      cityCode: json['CityCode'] as String?,
      cityName: json['CityName'] as String?,
      code: json['Code'] as String?,
      countryCode: json['CountryCode'] as String?,
      countryName: json['CountryName'] as String?,
      geoLocation: json['GeoLocation'] == null
          ? null
          : GeoLocation.fromJson(json['GeoLocation'] as Map<String, dynamic>),
      hotPointCodes: json['HotPointCodes'] as String?,
      hotpointType:
          $enumDecodeNullable(_$HotpointTypeEnumMap, json['HotpointType']),
      name: json['Name'] as String?,
      timeZone: json['TimeZone'],
    );

Map<String, dynamic> _$HotpointToJson(Hotpoint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rating', instance.rating);
  writeNotNull('SearchingWords', instance.searchingWords);
  writeNotNull('CityCode', instance.cityCode);
  writeNotNull('CityName', instance.cityName);
  writeNotNull('Code', instance.code);
  writeNotNull('CountryCode', instance.countryCode);
  writeNotNull('CountryName', instance.countryName);
  writeNotNull('GeoLocation', instance.geoLocation?.toJson());
  writeNotNull('HotPointCodes', instance.hotPointCodes);
  writeNotNull('HotpointType', _$HotpointTypeEnumMap[instance.hotpointType]);
  writeNotNull('Name', instance.name);
  writeNotNull('TimeZone', instance.timeZone);
  return val;
}

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
