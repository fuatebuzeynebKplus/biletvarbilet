import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/flight/data/models/tax.dart';

part 'price.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Price {
  dynamic addOn; //int?
  List<dynamic>?
      agentCommissions; // Uncomment when AgentCommission class is defined
  // dynamic baseAmount; //int?
  // dynamic commission; //int?
  // String? currencyCode;
  // dynamic dailyPrice; //int?
  // dynamic discountAmount; //int?
  // List<dynamic>? discounts;
  // dynamic exemptFromCommission; //int?
  // dynamic includedExtraAmount; //int?
  // dynamic kickBack; //int?
  // dynamic originalCommission; //int?
  // String? originalCurrencyCode;
  // dynamic originalCurrencyRate; //int?
  // dynamic packageDifferenceAmount; //int?
  // dynamic providerCommission; //int?
  // dynamic serviceFee; //int?
  // dynamic taxAmount; //int?
  dynamic baseAmount;
  dynamic commission;
  String? currencyCode;
  dynamic dailyPrice;
  dynamic discountAmount;
  List<dynamic>? discounts; // Uncomment when Discount class is defined
  dynamic exemptFromCommission;
  dynamic includedExtraAmount;
  dynamic kickBack;
  dynamic originalCommission;
  dynamic originalCurrencyCode;
  dynamic originalCurrencyRate;
  dynamic packageDifferenceAmount;
  dynamic providerCommission;
  dynamic serviceFee;
  dynamic taxAmount;
  List<Tax>? taxList;
  // dynamic totalAmount; //int?
  // dynamic totalStrikeAmount; //int?
  // dynamic vatRate; //int?
  dynamic totalAmount;
  dynamic totalStrikeAmount;
  dynamic vatRate;

  Price({
    this.addOn,
    this.agentCommissions,
    this.baseAmount,
    this.commission,
    this.currencyCode,
    this.dailyPrice,
    this.discountAmount,
    this.discounts,
    this.exemptFromCommission,
    this.includedExtraAmount,
    this.kickBack,
    this.originalCommission,
    this.originalCurrencyCode,
    this.originalCurrencyRate,
    this.packageDifferenceAmount,
    this.providerCommission,
    this.serviceFee,
    this.taxAmount,
    this.taxList,
    this.totalAmount,
    this.totalStrikeAmount,
    this.vatRate,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
