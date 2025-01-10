// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_fare_alternative_leg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirFareAlternativeLeg _$AirFareAlternativeLegFromJson(
        Map<String, dynamic> json) =>
    AirFareAlternativeLeg(
      alternativeRef: json['AlternativeRef'] as String?,
      fareSegments: (json['FareSegments'] as List<dynamic>?)
          ?.map((e) => AirFareSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      fareServices: (json['FareServices'] as List<dynamic>?)
          ?.map((e) => AirFareService.fromJson(e as Map<String, dynamic>))
          .toList(),
      key: json['Key'] as String?,
      approvalType: json['ApprovalType'],
      fareTitle: json['FareTitle'] as String?,
    );

Map<String, dynamic> _$AirFareAlternativeLegToJson(
    AirFareAlternativeLeg instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlternativeRef', instance.alternativeRef);
  writeNotNull('ApprovalType', instance.approvalType);
  writeNotNull(
      'FareSegments', instance.fareSegments?.map((e) => e.toJson()).toList());
  writeNotNull(
      'FareServices', instance.fareServices?.map((e) => e.toJson()).toList());
  writeNotNull('FareTitle', instance.fareTitle);
  writeNotNull('Key', instance.key);
  return val;
}
