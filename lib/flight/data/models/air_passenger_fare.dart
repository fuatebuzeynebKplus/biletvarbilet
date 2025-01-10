import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/flight/data/models/air_baggage_allowance.dart';
import 'package:bamobile1/flight/data/models/air_optional_service.dart';
import 'package:bamobile1/flight/data/models/price.dart';

part 'air_passenger_fare.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirPassengerFare {
  List<AirBaggageAllowance>? baggageAllowances;
  dynamic count; //int
  dynamic exchange;
  //List<dynamic>? optionalServices;
  List<AirOptionalService>? optionalServices;
  String? passengerRef;
  PaxType? passengerType; //int?
  Price? price;
  Price? totalPrice;

  AirPassengerFare({
    this.baggageAllowances,
    this.count,
    this.optionalServices,
    this.passengerRef,
    this.passengerType,
    this.price,
    this.totalPrice,
  });

  factory AirPassengerFare.fromJson(Map<String, dynamic> json) =>
      _$AirPassengerFareFromJson(json);

  Map<String, dynamic> toJson() => _$AirPassengerFareToJson(this);
}
