// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyPrice _$DailyPriceFromJson(Map<String, dynamic> json) => DailyPrice(
      accommodationTaxInclude: json['AccommodationTaxInclude'] as bool?,
      baseAmount: (json['BaseAmount'] as num?)?.toDouble(),
      currencyCode: json['CurrencyCode'] as String?,
      date: json['Date'] as String?,
      originalBaseAmount: (json['OriginalBaseAmount'] as num?)?.toDouble(),
      originalTotalAmount: (json['OriginalTotalAmount'] as num?)?.toDouble(),
      priceOperationTypeId: (json['PriceOperationTypeId'] as num?)?.toInt(),
      totalAmount: (json['TotalAmount'] as num?)?.toDouble(),
      vatInclude: json['VatInclude'] as bool?,
    );

Map<String, dynamic> _$DailyPriceToJson(DailyPrice instance) =>
    <String, dynamic>{
      'VatInclude': instance.vatInclude,
      'AccommodationTaxInclude': instance.accommodationTaxInclude,
      'PriceOperationTypeId': instance.priceOperationTypeId,
      'Date': instance.date,
      'OriginalBaseAmount': instance.originalBaseAmount,
      'OriginalTotalAmount': instance.originalTotalAmount,
      'BaseAmount': instance.baseAmount,
      'TotalAmount': instance.totalAmount,
      'CurrencyCode': instance.currencyCode,
    };
