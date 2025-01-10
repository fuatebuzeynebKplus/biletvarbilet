import 'package:bamobile1/common/data/models/login_result.dart';

import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class LoginResponse {
  dynamic cacheHashCode;
  dynamic resultDate;
  dynamic resultExpireDate;
  dynamic errorCode;
  dynamic errorMessage;
  int? errorType;
  bool? hasError;
  LoginResult? result;
  int? resultCount;
  dynamic userFriendlyErrorMessage;

  LoginResponse({
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

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
