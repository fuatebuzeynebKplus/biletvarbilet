// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalInformation _$AdditionalInformationFromJson(
        Map<String, dynamic> json) =>
    AdditionalInformation(
      providerInformations: (json['ProviderInformations'] as List<dynamic>?)
          ?.map((e) =>
              AdditionalProviderInformation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdditionalInformationToJson(
        AdditionalInformation instance) =>
    <String, dynamic>{
      'ProviderInformations':
          instance.providerInformations?.map((e) => e.toJson()).toList(),
    };
