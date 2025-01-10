// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_amount.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingAmount _$BookingAmountFromJson(Map<String, dynamic> json) =>
    BookingAmount(
      baseBuyAmount: (json['BaseBuyAmount'] as num?)?.toDouble(),
      baseSellAmount: (json['BaseSellAmount'] as num?)?.toDouble(),
      collectionList: json['CollectionList'] as List<dynamic>?,
      commission: (json['Commission'] as num?)?.toDouble(),
      currencyCode: json['CurrencyCode'] as String?,
      data: json['Data'],
      discountList: json['DiscountList'] as List<dynamic>?,
      originalCommission: (json['OriginalCommission'] as num?)?.toDouble(),
      serviceFee: (json['ServiceFee'] as num?)?.toDouble(),
      taxList: (json['TaxList'] as List<dynamic>?)
          ?.map((e) => BookingAmountTax.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalBuyAmount: (json['TotalBuyAmount'] as num?)?.toDouble(),
      totalCommission: (json['TotalCommission'] as num?)?.toDouble(),
      totalDiscountAmount: (json['TotalDiscountAmount'] as num?)?.toDouble(),
      totalPaymentTypeSellAmount:
          (json['TotalPaymentTypeSellAmount'] as num?)?.toDouble(),
      totalPenaltySellAmount:
          (json['TotalPenaltySellAmount'] as num?)?.toDouble(),
      totalSellAmount: (json['TotalSellAmount'] as num?)?.toDouble(),
      totalTaxAmount: (json['TotalTaxAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookingAmountToJson(BookingAmount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaseBuyAmount', instance.baseBuyAmount);
  writeNotNull('BaseSellAmount', instance.baseSellAmount);
  writeNotNull('CollectionList', instance.collectionList);
  writeNotNull('Commission', instance.commission);
  writeNotNull('CurrencyCode', instance.currencyCode);
  writeNotNull('Data', instance.data);
  writeNotNull('DiscountList', instance.discountList);
  writeNotNull('OriginalCommission', instance.originalCommission);
  writeNotNull('ServiceFee', instance.serviceFee);
  writeNotNull('TaxList', instance.taxList?.map((e) => e.toJson()).toList());
  writeNotNull('TotalBuyAmount', instance.totalBuyAmount);
  writeNotNull('TotalCommission', instance.totalCommission);
  writeNotNull('TotalDiscountAmount', instance.totalDiscountAmount);
  writeNotNull(
      'TotalPaymentTypeSellAmount', instance.totalPaymentTypeSellAmount);
  writeNotNull('TotalPenaltySellAmount', instance.totalPenaltySellAmount);
  writeNotNull('TotalSellAmount', instance.totalSellAmount);
  writeNotNull('TotalTaxAmount', instance.totalTaxAmount);
  return val;
}
