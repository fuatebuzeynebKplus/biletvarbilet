// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_branded_fare_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirBrandedFareRequest _$AirBrandedFareRequestFromJson(
        Map<String, dynamic> json) =>
    AirBrandedFareRequest(
      fareAlternativeLegKeys: (json['FareAlternativeLegKeys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      token: json['Token'] == null
          ? null
          : Token.fromJson(json['Token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirBrandedFareRequestToJson(
    AirBrandedFareRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FareAlternativeLegKeys', instance.fareAlternativeLegKeys);
  writeNotNull('Token', instance.token?.toJson());
  return val;
}
