// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      rating: (json['Rating'] as num?)?.toInt(),
      searchingWords: json['SearchingWords'],
      code: json['Code'] as String?,
      name: json['Name'] as String?,
      languageCode: json['LanguageCode'] as String?,
      timeZone: (json['TimeZone'] as num?)?.toDouble(),
      geoLocation: json['GeoLocation'] == null
          ? null
          : GeoLocation.fromJson(json['GeoLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountryToJson(Country instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rating', instance.rating);
  writeNotNull('SearchingWords', instance.searchingWords);
  writeNotNull('Code', instance.code);
  writeNotNull('Name', instance.name);
  writeNotNull('LanguageCode', instance.languageCode);
  writeNotNull('TimeZone', instance.timeZone);
  writeNotNull('GeoLocation', instance.geoLocation?.toJson());
  return val;
}
