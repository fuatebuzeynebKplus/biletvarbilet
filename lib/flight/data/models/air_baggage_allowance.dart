import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/weight_unit_type.dart';

part 'air_baggage_allowance.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirBaggageAllowance {
  String? segmentRef;
  WeightUnitType? type; //int?
  String? value;

  AirBaggageAllowance({
    required this.segmentRef,
    required this.type,
    required this.value,
  });

  factory AirBaggageAllowance.fromJson(Map<String, dynamic> json) =>
      _$AirBaggageAllowanceFromJson(json);

  Map<String, dynamic> toJson() => _$AirBaggageAllowanceToJson(this);
}
