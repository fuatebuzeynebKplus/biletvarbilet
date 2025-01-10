// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCategory _$ProductCategoryFromJson(Map<String, dynamic> json) =>
    ProductCategory(
      code: json['Code'] as String?,
      names: (json['Names'] as List<dynamic>?)
          ?.map((e) => LanguageValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: (json['Rating'] as num?)?.toInt(),
      searchingWords: json['SearchingWords'] as String?,
      subCategoryCodes: (json['SubCategoryCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ProductCategoryToJson(ProductCategory instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Names': instance.names?.map((e) => e.toJson()).toList(),
      'SubCategoryCodes': instance.subCategoryCodes,
      'SearchingWords': instance.searchingWords,
      'Rating': instance.rating,
    };
