import 'package:json_annotation/json_annotation.dart';

part 'fare_data.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class FareData {
  dynamic agentPerCalculationTypes;
  bool? applyAllSegments;
  dynamic cFlightScheduleId;
  dynamic combinations;
  dynamic flightProviderId;
  bool? hasSplitTicket;
  dynamic perCalculationType;
  bool? providerHasSplitTicket;
  dynamic providerId;
  dynamic providerType;

  FareData({
    this.agentPerCalculationTypes,
    this.applyAllSegments,
    this.cFlightScheduleId,
    this.combinations,
    this.flightProviderId,
    this.hasSplitTicket,
    this.perCalculationType,
    this.providerHasSplitTicket,
    this.providerId,
    this.providerType,
  });

  factory FareData.fromJson(Map<String, dynamic> json) =>
      _$FareDataFromJson(json);

  Map<String, dynamic> toJson() => _$FareDataToJson(this);
}
