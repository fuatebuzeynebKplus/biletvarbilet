import 'package:json_annotation/json_annotation.dart';

part 'flight_booking_rule.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class FlightBookingRule {
  String? alternativeRef;
  String? description;
  String? segmentRef;
  String? title;

  FlightBookingRule({
    this.alternativeRef,
    this.description,
    this.segmentRef,
    this.title,
  });

  factory FlightBookingRule.fromJson(Map<String, dynamic> json) =>
      _$FlightBookingRuleFromJson(json);

  Map<String, dynamic> toJson() => _$FlightBookingRuleToJson(this);
}
