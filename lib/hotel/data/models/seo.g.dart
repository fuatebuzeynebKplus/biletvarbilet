// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Seo _$SeoFromJson(Map<String, dynamic> json) => Seo(
      description: json['Description'] as String?,
      keywords: json['Keywords'] as String?,
      title: json['Title'] as String?,
    );

Map<String, dynamic> _$SeoToJson(Seo instance) => <String, dynamic>{
      'Title': instance.title,
      'Description': instance.description,
      'Keywords': instance.keywords,
    };
