import 'package:json_annotation/json_annotation.dart';

part 'void_reservation.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class VoidReservation {
  String tokenCode;
  String SystemPnr;
  String LastName;

  VoidReservation({
    required this.tokenCode,
    required this.SystemPnr,
    required this.LastName,
  });

  factory VoidReservation.fromJson(Map<String, dynamic> json) =>
      _$VoidReservationFromJson(json);

  Map<String, dynamic> toJson() => _$VoidReservationToJson(this);
}

class VoidReservationJson {
  VoidReservation request;

  VoidReservationJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
