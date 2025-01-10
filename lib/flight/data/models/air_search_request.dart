import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/air_search_type.dart';
import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/flight/data/models/advanced_options.dart';
import 'package:bamobile1/flight/data/models/air_search_leg.dart';
import 'package:bamobile1/flight/data/models/pax_definition.dart';

part 'air_search_request.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirSearchRequest {
  AdvancedOptions? advancedOptions;
  List<AirSearchLeg>? legs;
  List<PaxDefinition>? passengers;
  String? requestId;
  AirSearchType? searchType;
  Token? token;

  AirSearchRequest({
    this.advancedOptions,
    required this.legs,
    required this.passengers,
    this.requestId,
    required this.searchType,
    required this.token,
  });

  factory AirSearchRequest.fromJson(Map<String, dynamic> json) =>
      _$AirSearchRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AirSearchRequestToJson(this);
}

class RequestModel {
  AirSearchRequest request;

  RequestModel({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
