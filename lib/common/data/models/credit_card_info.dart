import 'package:json_annotation/json_annotation.dart';

part 'credit_card_info.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CreditCardInfo {
  int cardExpMonth;
  int cardExpYear;
  String cardHolderName;
  String cardNumber;
  String cv2;
  String email;
  String? ipAdress;
  bool is3D;
  String returnUrl;

  CreditCardInfo({
    required this.cardExpMonth,
    required this.cardExpYear,
    required this.cardHolderName,
    required this.cardNumber,
    required this.cv2,
    required this.email,
    this.ipAdress,
    required this.is3D,
    required this.returnUrl,
  });

  factory CreditCardInfo.fromJson(Map<String, dynamic> json) =>
      _$CreditCardInfoFromJson(json);

  Map<String, dynamic> toJson() => _$CreditCardInfoToJson(this);
}
