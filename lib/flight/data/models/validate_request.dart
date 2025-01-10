import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/flight/data/models/air_validate_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validate_request.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ValidateRequest {
  AirValidateRequest? air;
  Token? token;

  ValidateRequest({
    this.air,
    this.token,
  });

  factory ValidateRequest.fromJson(Map<String, dynamic> json) =>
      _$ValidateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ValidateRequestToJson(this);
}

class ValidateRequestJson {
  ValidateRequest request;

  ValidateRequestJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
