// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fare_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FareService _$FareServiceFromJson(Map<String, dynamic> json) => FareService(
      description: json['Description'] as String?,
      inclusionType:
          $enumDecodeNullable(_$InclusionTypeEnumMap, json['InclusionType']),
      title: json['Title'] as String?,
    );

Map<String, dynamic> _$FareServiceToJson(FareService instance) =>
    <String, dynamic>{
      'Description': instance.description,
      'InclusionType': _$InclusionTypeEnumMap[instance.inclusionType],
      'Title': instance.title,
    };

const _$InclusionTypeEnumMap = {
  InclusionType.excluded: 0,
  InclusionType.included: 1,
  InclusionType.paid: 2,
};
