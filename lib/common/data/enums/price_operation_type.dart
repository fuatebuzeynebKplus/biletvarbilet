import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum PriceOperationType {
  markup(0, 'Markup'),
  commissionAmount(1, 'Commission Amount'),
  commissionPercent(2, 'Commission Percent'),
  commissionInnerPercent(3, 'Commission Inner Percent'),
  taxExcludedCommissionPercent(4, 'Tax Excluded Commission Percent'),
  taxExcludedCommissionInnerPercent(5, 'Tax Excluded Commission Inner Percent'),
  markupAmount(6, 'Markup Amount');

  final int value;
  final String description;

  const PriceOperationType(this.value, this.description);

  String toString() => description;

  static PriceOperationType fromString(String name) {
    switch (name) {
      case 'Markup':
        return markup;
      case 'Commission Amount':
        return commissionAmount;
      case 'Commission Percent':
        return commissionPercent;
      case 'Commission Inner Percent':
        return commissionInnerPercent;
      case 'Tax Excluded Commission Percent':
        return taxExcludedCommissionPercent;
      case 'Tax Excluded Commission Inner Percent':
        return taxExcludedCommissionInnerPercent;
      case 'Markup Amount':
        return markupAmount;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
