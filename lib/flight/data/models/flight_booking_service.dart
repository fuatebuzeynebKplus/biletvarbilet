import 'package:bamobile1/common/data/enums/inclusion_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_booking_service.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class FlightBookingService {
  String? alternativeRef;
  String? description;
  InclusionType? inclusionType;
  String? title;

  FlightBookingService({
    this.alternativeRef,
    this.description,
    this.inclusionType,
    this.title,
  });

  factory FlightBookingService.fromJson(Map<String, dynamic> json) =>
      _$FlightBookingServiceFromJson(json);

  Map<String, dynamic> toJson() => _$FlightBookingServiceToJson(this);
}
