// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Price _$PriceFromJson(Map<String, dynamic> json) => Price(
      addOn: json['AddOn'],
      agentCommissions: json['AgentCommissions'] as List<dynamic>?,
      baseAmount: json['BaseAmount'],
      commission: json['Commission'],
      currencyCode: json['CurrencyCode'] as String?,
      dailyPrice: json['DailyPrice'],
      discountAmount: json['DiscountAmount'],
      discounts: json['Discounts'] as List<dynamic>?,
      exemptFromCommission: json['ExemptFromCommission'],
      includedExtraAmount: json['IncludedExtraAmount'],
      kickBack: json['KickBack'],
      originalCommission: json['OriginalCommission'],
      originalCurrencyCode: json['OriginalCurrencyCode'],
      originalCurrencyRate: json['OriginalCurrencyRate'],
      packageDifferenceAmount: json['PackageDifferenceAmount'],
      providerCommission: json['ProviderCommission'],
      serviceFee: json['ServiceFee'],
      taxAmount: json['TaxAmount'],
      taxList: (json['TaxList'] as List<dynamic>?)
          ?.map((e) => Tax.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalAmount: json['TotalAmount'],
      totalStrikeAmount: json['TotalStrikeAmount'],
      vatRate: json['VatRate'],
    );

Map<String, dynamic> _$PriceToJson(Price instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AddOn', instance.addOn);
  writeNotNull('AgentCommissions', instance.agentCommissions);
  writeNotNull('BaseAmount', instance.baseAmount);
  writeNotNull('Commission', instance.commission);
  writeNotNull('CurrencyCode', instance.currencyCode);
  writeNotNull('DailyPrice', instance.dailyPrice);
  writeNotNull('DiscountAmount', instance.discountAmount);
  writeNotNull('Discounts', instance.discounts);
  writeNotNull('ExemptFromCommission', instance.exemptFromCommission);
  writeNotNull('IncludedExtraAmount', instance.includedExtraAmount);
  writeNotNull('KickBack', instance.kickBack);
  writeNotNull('OriginalCommission', instance.originalCommission);
  writeNotNull('OriginalCurrencyCode', instance.originalCurrencyCode);
  writeNotNull('OriginalCurrencyRate', instance.originalCurrencyRate);
  writeNotNull('PackageDifferenceAmount', instance.packageDifferenceAmount);
  writeNotNull('ProviderCommission', instance.providerCommission);
  writeNotNull('ServiceFee', instance.serviceFee);
  writeNotNull('TaxAmount', instance.taxAmount);
  writeNotNull('TaxList', instance.taxList?.map((e) => e.toJson()).toList());
  writeNotNull('TotalAmount', instance.totalAmount);
  writeNotNull('TotalStrikeAmount', instance.totalStrikeAmount);
  writeNotNull('VatRate', instance.vatRate);
  return val;
}
