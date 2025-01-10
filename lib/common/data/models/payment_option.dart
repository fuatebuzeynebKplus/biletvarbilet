import 'package:bamobile1/common/data/enums/payment_type.dart';
import 'package:bamobile1/common/data/models/payment_group.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_option.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class PaymentOption {
  int? rating;
  String? name;
  List<PaymentGroup>? paymentGroups;
  PaymentType? paymentType;

  PaymentOption({
    this.paymentGroups,
    this.paymentType,
  });

  factory PaymentOption.fromJson(Map<String, dynamic> json) =>
      _$PaymentOptionFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOptionToJson(this);
}
