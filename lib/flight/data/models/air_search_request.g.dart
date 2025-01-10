// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirSearchRequest _$AirSearchRequestFromJson(Map<String, dynamic> json) =>
    AirSearchRequest(
      advancedOptions: json['AdvancedOptions'] == null
          ? null
          : AdvancedOptions.fromJson(
              json['AdvancedOptions'] as Map<String, dynamic>),
      legs: (json['Legs'] as List<dynamic>?)
          ?.map((e) => AirSearchLeg.fromJson(e as Map<String, dynamic>))
          .toList(),
      passengers: (json['Passengers'] as List<dynamic>?)
          ?.map((e) => PaxDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      requestId: json['RequestId'] as String?,
      searchType:
          $enumDecodeNullable(_$AirSearchTypeEnumMap, json['SearchType']),
      token: json['Token'] == null
          ? null
          : Token.fromJson(json['Token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirSearchRequestToJson(AirSearchRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdvancedOptions', instance.advancedOptions?.toJson());
  writeNotNull('Legs', instance.legs?.map((e) => e.toJson()).toList());
  writeNotNull(
      'Passengers', instance.passengers?.map((e) => e.toJson()).toList());
  writeNotNull('RequestId', instance.requestId);
  writeNotNull('SearchType', _$AirSearchTypeEnumMap[instance.searchType]);
  writeNotNull('Token', instance.token?.toJson());
  return val;
}

const _$AirSearchTypeEnumMap = {
  AirSearchType.oneway: 0,
  AirSearchType.roundtrip: 1,
  AirSearchType.multiple: 2,
};
