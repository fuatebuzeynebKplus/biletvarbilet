import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/flight/data/models/air_fare_alternative_leg.dart';
import 'package:bamobile1/flight/data/models/air_passenger_fare.dart';
import 'package:bamobile1/flight/data/models/price.dart';

part 'air_fare_alternative.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class AirFareAlternative {
  List<AirFareAlternativeLeg> fareAlternativeLegs;
  String fareRef;
  List<AirPassengerFare> passengerFares;
  String title;
  Price totalPrice;

  AirFareAlternative({
    required this.fareAlternativeLegs,
    required this.fareRef,
    required this.passengerFares,
    required this.title,
    required this.totalPrice,
  });

  factory AirFareAlternative.fromJson(Map<String, dynamic> json) =>
      _$AirFareAlternativeFromJson(json);

  Map<String, dynamic> toJson() => _$AirFareAlternativeToJson(this);
}
