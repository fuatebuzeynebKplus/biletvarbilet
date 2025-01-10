// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_alternative_leg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirAlternativeLeg _$AirAlternativeLegFromJson(Map<String, dynamic> json) =>
    AirAlternativeLeg(
      alternativeRef: json['AlternativeRef'] as String?,
      segments: (json['Segments'] as List<dynamic>?)
          ?.map((e) => AirSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AirAlternativeLegToJson(AirAlternativeLeg instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlternativeRef', instance.alternativeRef);
  writeNotNull('Segments', instance.segments?.map((e) => e.toJson()).toList());
  return val;
}
