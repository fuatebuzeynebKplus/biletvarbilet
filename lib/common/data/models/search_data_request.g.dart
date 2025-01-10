// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchDataRequest _$SearchDataRequestFromJson(Map<String, dynamic> json) =>
    SearchDataRequest(
      cityCode: json['CityCode'] as String?,
      codes:
          (json['Codes'] as List<dynamic>?)?.map((e) => e as String).toList(),
      countryCode: json['CountryCode'] as String?,
      firstCode: json['FirstCode'] as String?,
      getAllItems: json['GetAllItems'] as bool?,
      providerType:
          $enumDecodeNullable(_$ProviderTypeEnumMap, json['ProviderType']),
      searchKey: json['SearchKey'] as String?,
      tokenCode: json['TokenCode'] as String?,
    );

Map<String, dynamic> _$SearchDataRequestToJson(SearchDataRequest instance) =>
    <String, dynamic>{
      'CityCode': instance.cityCode,
      'Codes': instance.codes,
      'CountryCode': instance.countryCode,
      'FirstCode': instance.firstCode,
      'GetAllItems': instance.getAllItems,
      'ProviderType': _$ProviderTypeEnumMap[instance.providerType],
      'SearchKey': instance.searchKey,
      'TokenCode': instance.tokenCode,
    };

const _$ProviderTypeEnumMap = {
  ProviderType.all: 'all',
  ProviderType.charter: 'charter',
  ProviderType.service: 'service',
};
