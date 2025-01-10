import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/air_result_type.dart';
import 'package:bamobile1/flight/data/models/air_result.dart';
import 'package:bamobile1/flight/data/models/air_search_leg.dart';

part 'air_search_result.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirSearchResult {
  AirResultType? resultType;
  List<AirResult>? results;
  List<AirSearchLeg>? searchLegs;
  String? searchResultRef;

  AirSearchResult({
    this.results,
    this.resultType,
    this.searchLegs,
    this.searchResultRef,
  });

  factory AirSearchResult.fromJson(Map<String, dynamic> json) {
    return _$AirSearchResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AirSearchResultToJson(this);
}
