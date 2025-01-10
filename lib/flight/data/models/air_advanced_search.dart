import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/air_cabin_type.dart';
import 'package:bamobile1/common/data/enums/air_result_type.dart';

part 'air_advanced_search.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirAdvancedSearch {
  bool onlyDirectFlights = false;
  bool onlyBestFares = false;
  bool onlyRefundableFlights = false;
  List<String>? permittedAirlineCodes;
  List<AirCabinType>? permittedCabins;
  List<String>? prohibitedAirlineCodes;
  AirResultType? resultType;

  AirAdvancedSearch({
    required this.onlyDirectFlights,
    required this.onlyRefundableFlights,
    required this.onlyBestFares,
    this.permittedAirlineCodes,
    this.permittedCabins,
    this.prohibitedAirlineCodes,
    this.resultType,
  });

  factory AirAdvancedSearch.fromJson(Map<String, dynamic> json) =>
      _$AirAdvancedSearchFromJson(json);

  Map<String, dynamic> toJson() => _$AirAdvancedSearchToJson(this);
}
