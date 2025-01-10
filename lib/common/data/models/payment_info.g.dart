// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentInfo _$PaymentInfoFromJson(Map<String, dynamic> json) => PaymentInfo(
      cardInfo: json['CardInfo'] == null
          ? null
          : CreditCardInfo.fromJson(json['CardInfo'] as Map<String, dynamic>),
      paymentCommissionType: $enumDecodeNullable(
          _$PaymentCommissionTypeEnumMap, json['PaymentCommissionType']),
      paymentDescription: json['PaymentDescription'] as String?,
      paymentItemId: (json['PaymentItemId'] as num?)?.toInt(),
      paymentType:
          $enumDecodeNullable(_$PaymentTypeEnumMap, json['PaymentType']),
    );

Map<String, dynamic> _$PaymentInfoToJson(PaymentInfo instance) =>
    <String, dynamic>{
      'CardInfo': instance.cardInfo?.toJson(),
      'PaymentCommissionType':
          _$PaymentCommissionTypeEnumMap[instance.paymentCommissionType],
      'PaymentDescription': instance.paymentDescription,
      'PaymentItemId': instance.paymentItemId,
      'PaymentType': _$PaymentTypeEnumMap[instance.paymentType],
    };

const _$PaymentCommissionTypeEnumMap = {
  PaymentCommissionType.collecting: 0,
  PaymentCommissionType.decreaseFromPrice: 1,
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
