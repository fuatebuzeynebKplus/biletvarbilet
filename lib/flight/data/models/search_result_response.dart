import 'package:bamobile1/common/data/models/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_result_response.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class SearchResultResponse {
  String? errorCode;
  String? errorMessage;
  int? errorType;
  bool hasError = false;
  Result? result;

  SearchResultResponse();

  factory SearchResultResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultResponseToJson(this);
}
