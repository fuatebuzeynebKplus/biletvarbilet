import 'package:json_annotation/json_annotation.dart';

part 'flight_booking_pax_mileage_program.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class FlightBookingPaxMileageProgram {
  String? airlineCode;
  String? mileageNumber;

  FlightBookingPaxMileageProgram({
    this.airlineCode,
    this.mileageNumber,
  });

  factory FlightBookingPaxMileageProgram.fromJson(Map<String, dynamic> json) =>
      _$FlightBookingPaxMileageProgramFromJson(json);

  Map<String, dynamic> toJson() => _$FlightBookingPaxMileageProgramToJson(this);
}
