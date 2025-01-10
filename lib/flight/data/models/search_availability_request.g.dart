// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_availability_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchAvailabilityRequest _$SearchAvailabilityRequestFromJson(
        Map<String, dynamic> json) =>
    SearchAvailabilityRequest(
      advancedOptions: json['AdvancedOptions'] == null
          ? null
          : AdvancedOptions.fromJson(
              json['AdvancedOptions'] as Map<String, dynamic>),
      legs: (json['Legs'] as List<dynamic>)
          .map((e) => AirLeg.fromJson(e as Map<String, dynamic>))
          .toList(),
      passengers: (json['Passengers'] as List<dynamic>)
          .map((e) => Passenger.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchType: $enumDecode(_$AirSearchTypeEnumMap, json['SearchType']),
      token: Token.fromJson(json['Token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchAvailabilityRequestToJson(
        SearchAvailabilityRequest instance) =>
    <String, dynamic>{
      'AdvancedOptions': instance.advancedOptions?.toJson(),
      'Legs': instance.legs.map((e) => e.toJson()).toList(),
      'Passengers': instance.passengers.map((e) => e.toJson()).toList(),
      'SearchType': _$AirSearchTypeEnumMap[instance.searchType]!,
      'Token': instance.token.toJson(),
    };

const _$AirSearchTypeEnumMap = {
  AirSearchType.oneway: 0,
  AirSearchType.roundtrip: 1,
  AirSearchType.multiple: 2,
};
