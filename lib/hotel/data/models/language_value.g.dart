// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguageValue _$LanguageValueFromJson(Map<String, dynamic> json) =>
    LanguageValue(
      languageCode: json['LanguageCode'] as String?,
      value: json['Value'] as String?,
    );

Map<String, dynamic> _$LanguageValueToJson(LanguageValue instance) =>
    <String, dynamic>{
      'LanguageCode': instance.languageCode,
      'Value': instance.value,
    };
