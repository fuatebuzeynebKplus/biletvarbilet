import 'package:bamobile1/flight/data/models/fare_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/flight/data/models/air_fare.dart';
import 'package:bamobile1/flight/data/models/air_leg.dart';

part 'air_result.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirResult {
  FareData? data;
  List<AirFare>? fares;
  //dynamic groupId;
  String? groupId;
  bool? isCharter;
  List<AirLeg>? legs;
  String? providerCode;
  String? resultRef;

  AirResult({
    required this.data,
    required this.fares,
    required this.groupId,
    required this.isCharter,
    required this.legs,
    required this.providerCode,
    required this.resultRef,
  });

  factory AirResult.fromJson(Map<String, dynamic> json) =>
      _$AirResultFromJson(json);

  Map<String, dynamic> toJson() => _$AirResultToJson(this);
}
