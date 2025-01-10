// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_general_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductGeneralRequest _$ProductGeneralRequestFromJson(
        Map<String, dynamic> json) =>
    ProductGeneralRequest(
      languageCode: json['LanguageCode'] as String?,
      productCode: json['ProductCode'] as String?,
      resultKeys: (json['ResultKeys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      searchKeys: json['SearchKeys'] as String?,
      tokenCode: json['TokenCode'] as String?,
    );

Map<String, dynamic> _$ProductGeneralRequestToJson(
        ProductGeneralRequest instance) =>
    <String, dynamic>{
      'LanguageCode': instance.languageCode,
      'ProductCode': instance.productCode,
      'ResultKeys': instance.resultKeys,
      'SearchKeys': instance.searchKeys,
      'TokenCode': instance.tokenCode,
    };
