// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_fare_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirFareService _$AirFareServiceFromJson(Map<String, dynamic> json) =>
    AirFareService(
      description: json['Description'] as String?,
      inclusionType:
          $enumDecodeNullable(_$InclusionTypeEnumMap, json['InclusionType']),
      title: json['Title'] as String?,
    );

Map<String, dynamic> _$AirFareServiceToJson(AirFareService instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  writeNotNull('InclusionType', _$InclusionTypeEnumMap[instance.inclusionType]);
  writeNotNull('Title', instance.title);
  return val;
}

const _$InclusionTypeEnumMap = {
  InclusionType.excluded: 0,
  InclusionType.included: 1,
  InclusionType.paid: 2,
};
