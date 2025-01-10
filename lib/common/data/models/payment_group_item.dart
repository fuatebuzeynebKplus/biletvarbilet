import 'package:json_annotation/json_annotation.dart';

part 'payment_group_item.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class PaymentGroupItem {
  String? currencyCode;
  double? installmentAmount;
  int? installmentCount;
  double? interestTotal;
  bool? isDefaultPaymentItem;
  String? name;
  String? paymentItemId;
  double? total;

  PaymentGroupItem({
    this.currencyCode,
    this.installmentAmount,
    this.installmentCount,
    this.interestTotal,
    this.isDefaultPaymentItem,
    this.name,
    this.paymentItemId,
    this.total,
  });

  factory PaymentGroupItem.fromJson(Map<String, dynamic> json) =>
      _$PaymentGroupItemFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentGroupItemToJson(this);
}
