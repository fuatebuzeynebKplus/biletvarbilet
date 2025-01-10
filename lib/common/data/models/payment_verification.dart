import 'package:bamobile1/common/data/models/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_verification.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class PaymentVerification {
  Booking? booking;
  bool? is3DPostRequired;
  bool? isPriceChanged;
  String? post3DPageUrl;

  PaymentVerification({
    this.booking,
    this.is3DPostRequired,
    this.isPriceChanged,
    this.post3DPageUrl,
  });

  factory PaymentVerification.fromJson(Map<String, dynamic> json) =>
      _$PaymentVerificationFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentVerificationToJson(this);
}
