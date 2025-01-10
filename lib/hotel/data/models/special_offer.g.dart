// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialOffer _$SpecialOfferFromJson(Map<String, dynamic> json) => SpecialOffer(
      actionType: $enumDecodeNullable(_$ActionTypeEnumMap, json['ActionType']),
      amount: (json['Amount'] as num?)?.toDouble(),
      baseAmount: (json['BaseAmount'] as num?)?.toDouble(),
      buyPaymentDate: json['BuyPaymentDate'] as String?,
      buyPaymentRate: (json['BuyPaymentRate'] as num?)?.toDouble(),
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
      sellPaymentDate: json['SellPaymentDate'] as String?,
      sellPaymentRate: (json['SellPaymentRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SpecialOfferToJson(SpecialOffer instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'ActionType': _$ActionTypeEnumMap[instance.actionType],
      'Name': instance.name,
      'Amount': instance.amount,
      'BaseAmount': instance.baseAmount,
      'BuyPaymentDate': instance.buyPaymentDate,
      'SellPaymentDate': instance.sellPaymentDate,
      'BuyPaymentRate': instance.buyPaymentRate,
      'SellPaymentRate': instance.sellPaymentRate,
    };

const _$ActionTypeEnumMap = {
  ActionType.earlyReservation: 0,
  ActionType.freeDay: 1,
  ActionType.ageDiscount: 2,
  ActionType.honeymoon: 3,
  ActionType.rollingEarlyReservation: 4,
  ActionType.specialDiscount: 5,
  ActionType.fakeDiscount: 6,
  ActionType.couponDiscount: 7,
};
