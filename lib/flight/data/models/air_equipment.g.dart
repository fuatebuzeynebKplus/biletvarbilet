// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_equipment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirEquipment _$AirEquipmentFromJson(Map<String, dynamic> json) => AirEquipment(
      code: json['Code'] as String?,
      value: json['Value'],
    );

Map<String, dynamic> _$AirEquipmentToJson(AirEquipment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Code', instance.code);
  writeNotNull('Value', instance.value);
  return val;
}
