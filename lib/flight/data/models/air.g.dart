// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Air _$AirFromJson(Map<String, dynamic> json) => Air(
      onlyBestFares: json['OnlyBestFares'] as bool,
      onlyDirectFlights: json['OnlyDirectFlights'] as bool,
      onlyRefundableFlights: json['OnlyRefundableFlights'] as bool,
      permittedAirlineCodes: (json['PermittedAirlineCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      permittedCabins: (json['PermittedCabins'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      prohibitedAirlineCodes: (json['ProhibitedAirlineCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$AirToJson(Air instance) => <String, dynamic>{
      'OnlyBestFares': instance.onlyBestFares,
      'OnlyDirectFlights': instance.onlyDirectFlights,
      'OnlyRefundableFlights': instance.onlyRefundableFlights,
      'PermittedAirlineCodes': instance.permittedAirlineCodes,
      'PermittedCabins': instance.permittedCabins,
      'ProhibitedAirlineCodes': instance.prohibitedAirlineCodes,
    };
