// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_booking_rule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightBookingRule _$FlightBookingRuleFromJson(Map<String, dynamic> json) =>
    FlightBookingRule(
      alternativeRef: json['AlternativeRef'] as String?,
      description: json['Description'] as String?,
      segmentRef: json['SegmentRef'] as String?,
      title: json['Title'] as String?,
    );

Map<String, dynamic> _$FlightBookingRuleToJson(FlightBookingRule instance) {
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
