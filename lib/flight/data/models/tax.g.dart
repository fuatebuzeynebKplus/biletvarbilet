// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tax _$TaxFromJson(Map<String, dynamic> json) => Tax(
      currencyCode: json['CurrencyCode'] as String?,
      taxAmount: json['TaxAmount'],
      taxCode: json['TaxCode'] as String?,
    );

Map<String, dynamic> _$TaxToJson(Tax instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CurrencyCode', instance.currencyCode);
  writeNotNull('TaxAmount', instance.taxAmount);
  writeNotNull('TaxCode', instance.taxCode);
  return val;
}
