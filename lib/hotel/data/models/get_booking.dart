import 'dart:html';

import 'package:json_annotation/json_annotation.dart';

part 'get_booking.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class GetBooking {
  String tokenCode;
  String SystemPnr;
  String LastName;

  GetBooking({
    required this.tokenCode,
    required this.SystemPnr,
    required this.LastName,
  });

  factory GetBooking.fromJson(Map<String, dynamic> json) =>
      _$GetBookingFromJson(json);

  Map<String, dynamic> toJson() => _$GetBookingToJson(this);
}

class GetBookingJson {
  GetBooking request;

  GetBookingJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
