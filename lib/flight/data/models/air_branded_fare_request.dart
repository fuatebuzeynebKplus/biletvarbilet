import 'package:bamobile1/common/data/models/token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'air_branded_fare_request.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirBrandedFareRequest {
  List<String>? fareAlternativeLegKeys;
  Token? token;

  AirBrandedFareRequest({
    this.fareAlternativeLegKeys,
    this.token,
  });

  factory AirBrandedFareRequest.fromJson(Map<String, dynamic> json) =>
      _$AirBrandedFareRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AirBrandedFareRequestToJson(this);
}

class AirBrandedFareRequestJson {
  AirBrandedFareRequest request;

  AirBrandedFareRequestJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
