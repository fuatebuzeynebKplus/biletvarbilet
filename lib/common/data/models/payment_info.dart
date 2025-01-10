import 'package:bamobile1/common/data/enums/payment_commission_type.dart';
import 'package:bamobile1/common/data/enums/payment_type.dart';
import 'package:bamobile1/common/data/models/credit_card_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_info.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class PaymentInfo {
  CreditCardInfo? cardInfo;
  PaymentCommissionType? paymentCommissionType;
  String? paymentDescription;
  int? paymentItemId;
  PaymentType? paymentType;

  PaymentInfo({
    this.cardInfo,
    this.paymentCommissionType,
    this.paymentDescription,
    this.paymentItemId,
    this.paymentType,
  });

  factory PaymentInfo.fromJson(Map<String, dynamic> json) =>
      _$PaymentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentInfoToJson(this);
}
