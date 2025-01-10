import 'package:bamobile1/common/data/models/payment_group_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_group.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class PaymentGroup {
  List<String>? binCodes;
  int? id;
  String? logoUrl;
  String? name;
  List<PaymentGroupItem>? paymentGroupItem;

  PaymentGroup({
    this.binCodes,
    this.id,
    this.logoUrl,
    this.name,
    this.paymentGroupItem,
  });

  Map<String, dynamic> json() {
    return {
      'binCodes': binCodes,
      'id': id,
      'logoUrl': logoUrl,
      'name': name,
      'paymentGroupItem': paymentGroupItem?.toString().split('.').last,
    };
  }

  factory PaymentGroup.fromJson(Map<String, dynamic> json) =>
      _$PaymentGroupFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentGroupToJson(this);
}
