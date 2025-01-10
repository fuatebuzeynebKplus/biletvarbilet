import 'package:bamobile1/common/data/models/country.dart';

import 'package:json_annotation/json_annotation.dart';

part 'get_countries_result.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class GetCountriesResult {
  dynamic cacheHashCode;
  dynamic resultDate;
  dynamic resultExpireDate;
  dynamic errorCode;
  dynamic errorMessage;
  int? errorType;
  bool? hasError;
  List<Country>? result;
  int? resultCount;
  dynamic userFriendlyErrorMessage;

  GetCountriesResult({
    this.cacheHashCode,
    this.resultDate,
    this.resultExpireDate,
    this.errorCode,
    this.errorMessage,
    this.errorType,
    this.hasError,
    this.result,
    this.resultCount,
    this.userFriendlyErrorMessage,
  });

  factory GetCountriesResult.fromJson(Map<String, dynamic> json) =>
      _$GetCountriesResultFromJson(json);

  Map<String, dynamic> toJson() => _$GetCountriesResultToJson(this);
}
