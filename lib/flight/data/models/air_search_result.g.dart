// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirSearchResult _$AirSearchResultFromJson(Map<String, dynamic> json) =>
    AirSearchResult(
      results: (json['Results'] as List<dynamic>?)
          ?.map((e) => AirResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultType:
          $enumDecodeNullable(_$AirResultTypeEnumMap, json['ResultType']),
      searchLegs: (json['SearchLegs'] as List<dynamic>?)
          ?.map((e) => AirSearchLeg.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchResultRef: json['SearchResultRef'] as String?,
    );

Map<String, dynamic> _$AirSearchResultToJson(AirSearchResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResultType', _$AirResultTypeEnumMap[instance.resultType]);
  writeNotNull('Results', instance.results?.map((e) => e.toJson()).toList());
  writeNotNull(
      'SearchLegs', instance.searchLegs?.map((e) => e.toJson()).toList());
  writeNotNull('SearchResultRef', instance.searchResultRef);
  return val;
}

const _$AirResultTypeEnumMap = {
  AirResultType.all: 0,
  AirResultType.separated: 1,
  AirResultType.combined: 2,
};
