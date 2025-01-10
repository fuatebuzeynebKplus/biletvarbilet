// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pax_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaxDefinition _$PaxDefinitionFromJson(Map<String, dynamic> json) =>
    PaxDefinition(
      childAgeList: (json['ChildAgeList'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          [],
      count: (json['Count'] as num).toInt(),
      paxType: $enumDecode(_$PaxTypeEnumMap, json['PaxType']),
    );

Map<String, dynamic> _$PaxDefinitionToJson(PaxDefinition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChildAgeList', instance.childAgeList);
  val['Count'] = instance.count;
  val['PaxType'] = _$PaxTypeEnumMap[instance.paxType]!;
  return val;
}

const _$PaxTypeEnumMap = {
  PaxType.adult: 0,
  PaxType.child: 1,
  PaxType.infant: 2,
};
