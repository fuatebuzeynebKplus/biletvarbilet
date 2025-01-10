import 'package:bamobile1/common/data/models/payment_verification_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'destination.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Destination {
  String? cityCode;
  String? cityName;
  String? countryName;
  String? countryCode;
  String? name;
  String destinationId;
  GeoLocation? geoLocation;

  Destination(
      {this.cityCode,
      this.cityName,
      this.countryCode,
      this.countryName,
      required this.destinationId,
      this.name,
      this.geoLocation});

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

class DestinationJson {
  Destination request;

  DestinationJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
