// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_distance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelDistance _$HotelDistanceFromJson(Map<String, dynamic> json) =>
    HotelDistance(
      code: json['Code'] as String?,
      description: json['Description'] as String?,
      distance: (json['Distance'] as num?)?.toDouble(),
      name: json['Name'] as String?,
      unitType: $enumDecodeNullable(_$UnitTypeEnumMap, json['UnitType']),
    );

Map<String, dynamic> _$HotelDistanceToJson(HotelDistance instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Name': instance.name,
      'Description': instance.description,
      'Distance': instance.distance,
      'UnitType': _$UnitTypeEnumMap[instance.unitType],
    };

const _$UnitTypeEnumMap = {
  UnitType.meter: 0,
  UnitType.kilometer: 1,
  UnitType.mile: 2,
  UnitType.count: 3,
  UnitType.hour: 4,
  UnitType.day: 5,
  UnitType.month: 6,
  UnitType.year: 7,
};
