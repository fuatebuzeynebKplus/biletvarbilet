// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_leg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirLeg _$AirLegFromJson(Map<String, dynamic> json) => AirLeg(
      alternativeLegs: (json['AlternativeLegs'] as List<dynamic>?)
          ?.map((e) => AirAlternativeLeg.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchLeg: json['SearchLeg'] == null
          ? null
          : AirSearchLeg.fromJson(json['SearchLeg'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirLegToJson(AirLeg instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlternativeLegs',
      instance.alternativeLegs?.map((e) => e.toJson()).toList());
  writeNotNull('SearchLeg', instance.searchLeg?.toJson());
  return val;
}
