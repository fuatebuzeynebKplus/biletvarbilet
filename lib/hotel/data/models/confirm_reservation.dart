import 'package:bamobile1/common/data/models/payment_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirm_reservation.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ConfirmReservation {
  String tokenCode;
  String systemPnr;
  String lastName;
  PaymentInfo paymentInfo;

  ConfirmReservation(
      {required this.tokenCode,
      required this.systemPnr,
      required this.lastName,
      required this.paymentInfo});

  factory ConfirmReservation.fromJson(Map<String, dynamic> json) =>
      _$ConfirmReservationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmReservationToJson(this);
}

class ConfirmReservationJson {
  ConfirmReservation request;

  ConfirmReservationJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
