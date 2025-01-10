// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_fare_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirFareRule _$AirFareRuleFromJson(Map<String, dynamic> json) => AirFareRule(
      alternativeRef: json['AlternativeRef'] as String?,
      description: json['Description'] as String?,
      segmentRef: json['SegmentRef'] as String?,
      title: json['Title'] as String?,
    );

Map<String, dynamic> _$AirFareRuleToJson(AirFareRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlternativeRef', instance.alternativeRef);
  writeNotNull('Description', instance.description);
  writeNotNull('SegmentRef', instance.segmentRef);
  writeNotNull('Title', instance.title);
  return val;
}
