import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/flight/data/models/air_fare_alternative_leg.dart';
import 'package:bamobile1/flight/data/models/air_fare_rule.dart';
import 'package:bamobile1/flight/data/models/air_passenger_fare.dart';
import 'package:bamobile1/flight/data/models/price.dart';

part 'air_fare.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirFare {
  dynamic campaigns;
  List<AirFareAlternativeLeg>? fareAlternativeLegs;
  String? fareRef;
  //dynamic fareRules;
  List<AirFareRule>? fareRules;
  List<AirPassengerFare>? passengerFares;
  dynamic title;
  Price? totalPrice;

  AirFare({
    this.campaigns,
    required this.fareAlternativeLegs,
    required this.fareRef,
    required this.fareRules,
    required this.passengerFares,
    required this.title,
    required this.totalPrice,
  });

  factory AirFare.fromJson(Map<String, dynamic> json) =>
      _$AirFareFromJson(json);

  Map<String, dynamic> toJson() => _$AirFareToJson(this);
}
