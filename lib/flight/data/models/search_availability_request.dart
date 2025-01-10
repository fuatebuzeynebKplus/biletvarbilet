import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/air_search_type.dart';
import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/flight/data/models/air_leg.dart';
import 'package:bamobile1/flight/data/models/passenger.dart';
import 'advanced_options.dart';

part 'search_availability_request.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class SearchAvailabilityRequest {
  final AdvancedOptions? advancedOptions;
  final List<AirLeg> legs;
  final List<Passenger> passengers;
  final AirSearchType searchType;
  final Token token;

  SearchAvailabilityRequest({
    this.advancedOptions,
    required this.legs,
    required this.passengers,
    required this.searchType,
    required this.token,
  });

  factory SearchAvailabilityRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchAvailabilityRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchAvailabilityRequestToJson(this);
}
