import 'package:json_annotation/json_annotation.dart';

part 'daily_price.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class DailyPrice {
  bool? vatInclude;
  bool? accommodationTaxInclude;
  int? priceOperationTypeId;
  String? date;
  double? originalBaseAmount;
  double? originalTotalAmount;
  double? baseAmount;
  double? totalAmount;
  String? currencyCode;

  DailyPrice(
      {this.accommodationTaxInclude,
      this.baseAmount,
      this.currencyCode,
      this.date,
      this.originalBaseAmount,
      this.originalTotalAmount,
      this.priceOperationTypeId,
      this.totalAmount,
      this.vatInclude});

  factory DailyPrice.fromJson(Map<String, dynamic> json) =>
      _$DailyPriceFromJson(json);

  Map<String, dynamic> toJson() => _$DailyPriceToJson(this);
}

class DailyPriceFilterJson {
  DailyPrice request;

  DailyPriceFilterJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
