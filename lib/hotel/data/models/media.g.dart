// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      mediaType: $enumDecodeNullable(_$MediaTypeEnumMap, json['MediaType']),
      title: json['Title'] as String?,
      url: json['Url'] as String?,
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'MediaType': _$MediaTypeEnumMap[instance.mediaType],
      'Title': instance.title,
      'Url': instance.url,
    };

const _$MediaTypeEnumMap = {
  MediaType.image: 0,
  MediaType.video: 1,
};
