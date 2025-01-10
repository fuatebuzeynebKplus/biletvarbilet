// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_baggage_allowance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirBaggageAllowance _$AirBaggageAllowanceFromJson(Map<String, dynamic> json) =>
    AirBaggageAllowance(
      segmentRef: json['SegmentRef'] as String?,
      type: $enumDecodeNullable(_$WeightUnitTypeEnumMap, json['Type']),
      value: json['Value'] as String?,
    );

Map<String, dynamic> _$AirBaggageAllowanceToJson(AirBaggageAllowance instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SegmentRef', instance.segmentRef);
  writeNotNull('Type', _$WeightUnitTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$WeightUnitTypeEnumMap = {
  WeightUnitType.kg: 0,
  WeightUnitType.pc: 1,
  WeightUnitType.lb: 2,
};
