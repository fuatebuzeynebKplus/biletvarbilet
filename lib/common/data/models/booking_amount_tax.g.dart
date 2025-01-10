// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_amount_tax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingAmountTax _$BookingAmountTaxFromJson(Map<String, dynamic> json) =>
    BookingAmountTax(
      taxCode: json['TaxCode'] as String?,
      taxAmount: (json['TaxAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BookingAmountTaxToJson(BookingAmountTax instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TaxAmount', instance.taxAmount);
  writeNotNull('TaxCode', instance.taxCode);
  return val;
}
