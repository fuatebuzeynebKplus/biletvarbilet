import 'package:json_annotation/json_annotation.dart';
import 'result.dart';

part 'api_result.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ApiResult {
  ApiResult({
    required this.errorCode,
    required this.errorMessage,
    required this.errorType,
    required this.hasError,
    required this.result,
    required this.resultCount,
    required this.userFriendlyErrorMessage,
  });

  String errorCode;
  String errorMessage;
  int errorType;
  bool hasError;
  Result result;
  int resultCount;
  dynamic userFriendlyErrorMessage;

  factory ApiResult.fromJson(Map<String, dynamic> json) =>
      _$ApiResultFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResultToJson(this);
}


      // result: Result.fromJson(json['Result'] as Map<String, dynamic>),
