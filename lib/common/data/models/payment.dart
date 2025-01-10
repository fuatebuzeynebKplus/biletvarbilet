import 'package:bamobile1/common/data/enums/payment_commission_type.dart';
import 'package:bamobile1/common/data/models/payment_option.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Payment {
  PaymentCommissionType? paymentCommissionType;
  List<PaymentOption>? paymentOptions;
  int? paymentOptionType;

  Payment(
      {this.paymentCommissionType,
      this.paymentOptions,
      this.paymentOptionType});

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);
}
