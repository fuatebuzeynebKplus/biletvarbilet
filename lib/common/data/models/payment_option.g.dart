// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOption _$PaymentOptionFromJson(Map<String, dynamic> json) =>
    PaymentOption(
      paymentGroups: (json['PaymentGroups'] as List<dynamic>?)
          ?.map((e) => PaymentGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentType:
          $enumDecodeNullable(_$PaymentTypeEnumMap, json['PaymentType']),
    )
      ..rating = (json['Rating'] as num?)?.toInt()
      ..name = json['Name'] as String?;

Map<String, dynamic> _$PaymentOptionToJson(PaymentOption instance) =>
    <String, dynamic>{
      'Rating': instance.rating,
      'Name': instance.name,
      'PaymentGroups': instance.paymentGroups?.map((e) => e.toJson()).toList(),
      'PaymentType': _$PaymentTypeEnumMap[instance.paymentType],
    };

const _$PaymentTypeEnumMap = {
  PaymentType.customerCreditCard: 0,
  PaymentType.agentCreditCard: 1,
  PaymentType.currentAccount: 2,
  PaymentType.wireTransfer: 3,
  PaymentType.cash: 4,
  PaymentType.preBooking: 6,
  PaymentType.kuveytTurk: 7,
  PaymentType.aps: 8,
  PaymentType.payToProvider: 9,
  PaymentType.applicationPay: 11,
  PaymentType.approval: 12,
};
