import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/error_type.dart';
import "package:bamobile1/flight/data/models/air_search_response.dart";

part 'result.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class Result {
  dynamic cacheHashCode;
  dynamic resultDate;
  dynamic resultExpireDate;
  dynamic errorCode;
  dynamic errorMessage;
  ErrorType? errorType;
  bool? hasError;
  AirSearchResponse? result;
  int? resultCount;
  dynamic userFriendlyErrorMessage;

  Result(
      {this.cacheHashCode,
      this.resultDate,
      this.resultExpireDate,
      this.errorCode,
      this.errorMessage,
      this.errorType,
      this.hasError,
      this.result,
      this.resultCount,
      this.userFriendlyErrorMessage});

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
