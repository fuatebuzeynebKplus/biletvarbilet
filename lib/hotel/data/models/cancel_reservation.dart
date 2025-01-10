import 'package:json_annotation/json_annotation.dart';

part 'cancel_reservation.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CancelReservation {
  String tokenCode;
  String SystemPnr;
  String LastName;

  CancelReservation({
    required this.tokenCode,
    required this.SystemPnr,
    required this.LastName,
  });

  factory CancelReservation.fromJson(Map<String, dynamic> json) =>
      _$CancelReservationFromJson(json);

  Map<String, dynamic> toJson() => _$CancelReservationToJson(this);
}

class CancelReservationJson {
  CancelReservation request;

  CancelReservationJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
