// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corporate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Corporate _$CorporateFromJson(Map<String, dynamic> json) => Corporate(
      discounts: (json['Discounts'] as List<dynamic>)
          .map((e) => Discount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CorporateToJson(Corporate instance) => <String, dynamic>{
      'Discounts': instance.discounts.map((e) => e.toJson()).toList(),
    };

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
      supplierCode: json['SupplierCode'] as String,
      code: json['Code'] as String,
    );

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
      'SupplierCode': instance.supplierCode,
      'Code': instance.code,
    };
