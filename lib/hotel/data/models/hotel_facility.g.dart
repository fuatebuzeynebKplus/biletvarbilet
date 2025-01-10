// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_facility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelFacility _$HotelFacilityFromJson(Map<String, dynamic> json) =>
    HotelFacility(
      code: json['Code'] as String?,
      feeType: $enumDecodeNullable(_$FeeTypeEnumMap, json['FeeType']),
      groupCode: json['GroupCode'] as String?,
      groupName: json['GroupName'] as String?,
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$HotelFacilityToJson(HotelFacility instance) =>
    <String, dynamic>{
      'GroupCode': instance.groupCode,
      'GroupName': instance.groupName,
      'Code': instance.code,
      'Name': instance.name,
      'FeeType': _$FeeTypeEnumMap[instance.feeType],
    };

const _$FeeTypeEnumMap = {
  FeeType.unknown: 0,
  FeeType.free: 1,
  FeeType.paid: 2,
};
