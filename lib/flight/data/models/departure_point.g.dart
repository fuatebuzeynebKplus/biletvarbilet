// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departure_point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeparturePoint _$DeparturePointFromJson(Map<String, dynamic> json) =>
    DeparturePoint(
      code: json['Code'] as String,
      hotpointType: json['HotpointType'] as String,
    );

Map<String, dynamic> _$DeparturePointToJson(DeparturePoint instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'HotpointType': instance.hotpointType,
    };
