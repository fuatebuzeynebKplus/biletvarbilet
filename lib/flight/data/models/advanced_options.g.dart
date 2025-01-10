// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advanced_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvancedOptions _$AdvancedOptionsFromJson(Map<String, dynamic> json) =>
    AdvancedOptions(
      languageCode: json['LanguageCode'] as String?,
      air: json['Air'] == null
          ? null
          : AirAdvancedSearch.fromJson(json['Air'] as Map<String, dynamic>),
      markup: json['Markup'] == null
          ? null
          : Markup.fromJson(json['Markup'] as Map<String, dynamic>),
      corporate: json['Corporate'] == null
          ? null
          : Corporate.fromJson(json['Corporate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AdvancedOptionsToJson(AdvancedOptions instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LanguageCode', instance.languageCode);
  writeNotNull('Air', instance.air?.toJson());
  writeNotNull('Markup', instance.markup?.toJson());
  writeNotNull('Corporate', instance.corporate?.toJson());
  return val;
}
