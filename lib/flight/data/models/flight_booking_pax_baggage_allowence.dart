import 'package:bamobile1/common/data/enums/weight_unit_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_booking_pax_baggage_allowence.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class FlightBookingPaxBaggageAllowence {
  String? segmentRef;
  WeightUnitType? type;
  String? value;

  FlightBookingPaxBaggageAllowence({this.segmentRef, this.type, this.value});
  // String? segmentRef;
  // WeightUnitType? type;
  // String? value;

  // FlightBookingPaxBaggageAllowence({
  //   this.segmentRef,
  //   this.type,
  //   this.value,
  // });

  factory FlightBookingPaxBaggageAllowence.fromJson(
          Map<String, dynamic> json) =>
      _$FlightBookingPaxBaggageAllowenceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FlightBookingPaxBaggageAllowenceToJson(this);
}
