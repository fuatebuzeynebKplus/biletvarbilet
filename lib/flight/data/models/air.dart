import 'package:json_annotation/json_annotation.dart';

part 'air.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Air {
  bool onlyBestFares;
  bool onlyDirectFlights;
  bool onlyRefundableFlights;
  List<String>? permittedAirlineCodes;
  List<int>? permittedCabins;
  List<String>? prohibitedAirlineCodes;

  Air({
    required this.onlyBestFares,
    required this.onlyDirectFlights,
    required this.onlyRefundableFlights,
    this.permittedAirlineCodes,
    this.permittedCabins,
    this.prohibitedAirlineCodes,
  });

  factory Air.fromJson(Map<String, dynamic> json) {
    return _$AirFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AirToJson(this);
  }
}