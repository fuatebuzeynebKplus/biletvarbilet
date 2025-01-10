// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_search_leg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirSearchLeg _$AirSearchLegFromJson(Map<String, dynamic> json) => AirSearchLeg(
      arrivalPoint: json['ArrivalPoint'] == null
          ? null
          : Hotpoint.fromJson(json['ArrivalPoint'] as Map<String, dynamic>),
      date: json['Date'] as String?,
      departurePoint: json['DeparturePoint'] == null
          ? null
          : Hotpoint.fromJson(json['DeparturePoint'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirSearchLegToJson(AirSearchLeg instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ArrivalPoint', instance.arrivalPoint?.toJson());
  writeNotNull('Date', instance.date);
  writeNotNull('DeparturePoint', instance.departurePoint?.toJson());
  return val;
}
