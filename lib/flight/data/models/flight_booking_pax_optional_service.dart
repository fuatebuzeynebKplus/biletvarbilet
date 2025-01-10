import 'package:bamobile1/common/data/models/booking_amount.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_booking_pax_optional_service.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class FlightBookingPaxOptionalService {
  BookingAmount? bookingAmount;
  String? description;
  String? segmentRef;
  String? title;

  FlightBookingPaxOptionalService({
    this.bookingAmount,
    this.description,
    this.segmentRef,
    this.title,
  });

  factory FlightBookingPaxOptionalService.fromJson(Map<String, dynamic> json) =>
      _$FlightBookingPaxOptionalServiceFromJson(json);

  Map<String, dynamic> toJson() =>
      _$FlightBookingPaxOptionalServiceToJson(this);
}
