import 'package:bamobile1/flight/data/models/air_validate_passenger.dart';
import 'package:json_annotation/json_annotation.dart';

part 'air_validate_request.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirValidateRequest {
  List<String>? fareAlternativeLegKeys;
  List<AirValidatePassenger>? passengers;

  AirValidateRequest({
    this.fareAlternativeLegKeys,
    this.passengers,
  });

  factory AirValidateRequest.fromJson(Map<String, dynamic> json) =>
      _$AirValidateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AirValidateRequestToJson(this);
}
