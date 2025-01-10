import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/flight/data/models/pax.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_booking_pax.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class HotelBookingPax {
  PaxType hotelPaxType;
  bool isLeader;
  Pax pax;

  HotelBookingPax({
    required this.hotelPaxType,
    required this.isLeader,
    required this.pax,
  });

  factory HotelBookingPax.fromJson(Map<String, dynamic> json) =>
      _$HotelBookingPaxFromJson(json);

  Map<String, dynamic> toJson() => _$HotelBookingPaxToJson(this);
}

class HotelBookingPaxJson {
  HotelBookingPax request;

  HotelBookingPaxJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
