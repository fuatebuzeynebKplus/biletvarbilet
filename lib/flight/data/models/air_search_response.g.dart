// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirSearchResponse _$AirSearchResponseFromJson(Map<String, dynamic> json) =>
    AirSearchResponse(
      searchRequest: json['SearchRequest'] == null
          ? null
          : AirSearchRequest.fromJson(
              json['SearchRequest'] as Map<String, dynamic>),
      searchResults: (json['SearchResults'] as List<dynamic>?)
          ?.map((e) => AirSearchResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasSplitTicket: json['HasSplitTicket'] as bool?,
      id: json['Id'] as String?,
      resultExpireDate: json['ResultExpireDate'] as String?,
      contracts: json['Contracts'],
      exchange: json['Exchange'],
    );

Map<String, dynamic> _$AirSearchResponseToJson(AirSearchResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Contracts', instance.contracts);
  writeNotNull('Exchange', instance.exchange);
  writeNotNull('HasSplitTicket', instance.hasSplitTicket);
  writeNotNull('Id', instance.id);
  writeNotNull('ResultExpireDate', instance.resultExpireDate);
  writeNotNull('SearchRequest', instance.searchRequest?.toJson());
  writeNotNull(
      'SearchResults', instance.searchResults?.map((e) => e.toJson()).toList());
  return val;
}
