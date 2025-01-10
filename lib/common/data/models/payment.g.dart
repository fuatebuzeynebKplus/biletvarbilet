// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      paymentCommissionType: $enumDecodeNullable(
          _$PaymentCommissionTypeEnumMap, json['PaymentCommissionType']),
      paymentOptions: (json['PaymentOptions'] as List<dynamic>?)
          ?.map((e) => PaymentOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentOptionType: (json['PaymentOptionType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'PaymentCommissionType':
          _$PaymentCommissionTypeEnumMap[instance.paymentCommissionType],
      'PaymentOptions':
          instance.paymentOptions?.map((e) => e.toJson()).toList(),
      'PaymentOptionType': instance.paymentOptionType,
    };

const _$PaymentCommissionTypeEnumMap = {
  PaymentCommissionType.collecting: 0,
  PaymentCommissionType.decreaseFromPrice: 1,
};
