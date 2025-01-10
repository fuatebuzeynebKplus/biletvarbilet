import 'package:bamobile1/common/data/models/hotel_room_pax.dart';
import 'package:bamobile1/flight/data/models/flight_booking_pax.dart';
import 'package:bamobile1/hotel/data/models/hotel_booking_pax.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pax_info.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class PaxInfo {
  List<FlightBookingPax>? flightPaxes;
  List<HotelRoomPax>? hotelPaxes;

  PaxInfo({
    this.flightPaxes,
    this.hotelPaxes,
  });

  factory PaxInfo.fromJson(Map<String, dynamic> json) =>
      _$PaxInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PaxInfoToJson(this);
}
