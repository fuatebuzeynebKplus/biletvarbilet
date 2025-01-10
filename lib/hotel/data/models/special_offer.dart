import 'package:bamobile1/common/data/enums/action_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'special_offer.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class SpecialOffer {
  int? id;
  ActionType? actionType;
  String? name;
  double? amount;
  double? baseAmount;
  String? buyPaymentDate;
  String? sellPaymentDate;
  double? buyPaymentRate;
  double? sellPaymentRate;

  SpecialOffer(
      {this.actionType,
      this.amount,
      this.baseAmount,
      this.buyPaymentDate,
      this.buyPaymentRate,
      this.id,
      this.name,
      this.sellPaymentDate,
      this.sellPaymentRate});

  factory SpecialOffer.fromJson(Map<String, dynamic> json) =>
      _$SpecialOfferFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialOfferToJson(this);
}

class SpecialOfferJson {
  SpecialOffer request;

  SpecialOfferJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
