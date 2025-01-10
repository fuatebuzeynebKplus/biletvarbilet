import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/flight/data/models/air_validate_optional_service.dart';
import 'package:json_annotation/json_annotation.dart';

part 'air_validate_passenger.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class AirValidatePassenger {
  List<AirValidateOptionalService>? optionalServices;
  String? passengerRef;
  PaxType? passengerType;

  AirValidatePassenger({
    this.optionalServices,
    this.passengerRef,
    this.passengerType,
  });

  factory AirValidatePassenger.fromJson(Map<String, dynamic> json) =>
      _$AirValidatePassengerFromJson(json);

  Map<String, dynamic> toJson() => _$AirValidatePassengerToJson(this);
}
