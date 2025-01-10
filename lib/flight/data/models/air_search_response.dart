import 'package:bamobile1/flight/data/models/air_search_request.dart';
import 'package:bamobile1/flight/data/models/air_search_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'air_search_response.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirSearchResponse {
  dynamic contracts;
  dynamic exchange;
  bool? hasSplitTicket;
  String? id;
  String? resultExpireDate;
  AirSearchRequest? searchRequest;
  List<AirSearchResult>? searchResults;

  AirSearchResponse(
      {this.searchRequest,
      this.searchResults,
      this.hasSplitTicket,
      this.id,
      this.resultExpireDate,
      this.contracts,
      this.exchange});

  factory AirSearchResponse.fromJson(Map<String, dynamic> json) =>
      _$AirSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AirSearchResponseToJson(this);
}
