import 'booking_amount_tax.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_amount.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class BookingAmount {
  double? baseBuyAmount;
  double? baseSellAmount;
  List<dynamic>? collectionList;
  double? commission;
  String? currencyCode;
  dynamic data;
  List<dynamic>? discountList;
  double? originalCommission;
  double? serviceFee;
  List<BookingAmountTax>? taxList;
  double? totalBuyAmount;
  double? totalCommission;
  double? totalDiscountAmount;
  double? totalPaymentTypeSellAmount;
  double? totalPenaltySellAmount;
  double? totalSellAmount;
  double? totalTaxAmount;

  BookingAmount(
      {this.baseBuyAmount,
      this.baseSellAmount,
      this.collectionList,
      this.commission,
      this.currencyCode,
      this.data,
      this.discountList,
      this.originalCommission,
      this.serviceFee,
      this.taxList,
      this.totalBuyAmount,
      this.totalCommission,
      this.totalDiscountAmount,
      this.totalPaymentTypeSellAmount,
      this.totalPenaltySellAmount,
      this.totalSellAmount,
      this.totalTaxAmount});

  // double? baseBuyAmount;
  // double? baseSellAmount;
  // List<dynamic>? collectionList;
  // double? baseVatRate;
  // double? commission;
  // String? currencyCode;
  // dynamic data;
  // List<dynamic>? discountList;
  // double? originalCommission;
  // String? paymentDescription;
  // double? serviceFee;
  // double? totalBuyAmount;
  // double? totalCommission;
  // double? totalDiscountAmount;
  // double? totalPaymentTypeSellAmount;
  // double? totalPenaltySellAmout;
  // double? totalSellAmount;
  // double? totalTaxAmount;
  // BookingAmountTax? taxList;

  // BookingAmount({
  //   this.baseBuyAmount,
  //   this.baseSellAmount,
  //   this.collectionList,
  //   this.baseVatRate,
  //   this.commission,
  //   this.currencyCode,
  //   this.data,
  //   this.discountList,
  //   this.originalCommission,
  //   this.paymentDescription,
  //   this.serviceFee,
  //   this.totalBuyAmount,
  //   this.totalCommission,
  //   this.totalDiscountAmount,
  //   this.totalPaymentTypeSellAmount,
  //   this.taxList,
  //   this.totalPenaltySellAmout,
  //   this.totalSellAmount,
  //   this.totalTaxAmount,
  // });

  factory BookingAmount.fromJson(Map<String, dynamic> json) =>
      _$BookingAmountFromJson(json);

  Map<String, dynamic> toJson() => _$BookingAmountToJson(this);
}
