// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_provider_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalProviderInformation _$AdditionalProviderInformationFromJson(
        Map<String, dynamic> json) =>
    AdditionalProviderInformation(
      code: json['Code'] as String?,
      count: (json['Count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AdditionalProviderInformationToJson(
        AdditionalProviderInformation instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Count': instance.count,
    };
