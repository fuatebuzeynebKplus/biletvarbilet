// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_group_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentGroupItem _$PaymentGroupItemFromJson(Map<String, dynamic> json) =>
    PaymentGroupItem(
      currencyCode: json['CurrencyCode'] as String?,
      installmentAmount: (json['InstallmentAmount'] as num?)?.toDouble(),
      installmentCount: (json['InstallmentCount'] as num?)?.toInt(),
      interestTotal: (json['InterestTotal'] as num?)?.toDouble(),
      isDefaultPaymentItem: json['IsDefaultPaymentItem'] as bool?,
      name: json['Name'] as String?,
      paymentItemId: json['PaymentItemId'] as String?,
      total: (json['Total'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PaymentGroupItemToJson(PaymentGroupItem instance) =>
    <String, dynamic>{
      'CurrencyCode': instance.currencyCode,
      'InstallmentAmount': instance.installmentAmount,
      'InstallmentCount': instance.installmentCount,
      'InterestTotal': instance.interestTotal,
      'IsDefaultPaymentItem': instance.isDefaultPaymentItem,
      'Name': instance.name,
      'PaymentItemId': instance.paymentItemId,
      'Total': instance.total,
    };
