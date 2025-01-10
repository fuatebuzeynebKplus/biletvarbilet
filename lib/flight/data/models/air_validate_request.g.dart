// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_validate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirValidateRequest _$AirValidateRequestFromJson(Map<String, dynamic> json) =>
    AirValidateRequest(
      fareAlternativeLegKeys: (json['FareAlternativeLegKeys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      passengers: (json['Passengers'] as List<dynamic>?)
          ?.map((e) => AirValidatePassenger.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AirValidateRequestToJson(AirValidateRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FareAlternativeLegKeys', instance.fareAlternativeLegKeys);
  writeNotNull(
      'Passengers', instance.passengers?.map((e) => e.toJson()).toList());
  return val;
}
