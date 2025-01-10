import 'package:json_annotation/json_annotation.dart';

part 'retrieve_reservation.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class RetrieveReservation {
  String tokenCode;
  String SystemPnr;
  String LastName;

  RetrieveReservation({
    required this.tokenCode,
    required this.SystemPnr,
    required this.LastName,
  });

  factory RetrieveReservation.fromJson(Map<String, dynamic> json) =>
      _$RetrieveReservationFromJson(json);

  Map<String, dynamic> toJson() => _$RetrieveReservationToJson(this);
}

class RetrieveReservationJson {
  RetrieveReservation request;

  RetrieveReservationJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
