// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_passenger_fare.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirPassengerFare _$AirPassengerFareFromJson(Map<String, dynamic> json) =>
    AirPassengerFare(
      baggageAllowances: (json['BaggageAllowances'] as List<dynamic>?)
          ?.map((e) => AirBaggageAllowance.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: json['Count'],
      optionalServices: (json['OptionalServices'] as List<dynamic>?)
          ?.map((e) => AirOptionalService.fromJson(e as Map<String, dynamic>))
          .toList(),
      passengerRef: json['PassengerRef'] as String?,
      passengerType:
          $enumDecodeNullable(_$PaxTypeEnumMap, json['PassengerType']),
      price: json['Price'] == null
          ? null
          : Price.fromJson(json['Price'] as Map<String, dynamic>),
      totalPrice: json['TotalPrice'] == null
          ? null
          : Price.fromJson(json['TotalPrice'] as Map<String, dynamic>),
    )..exchange = json['Exchange'];

Map<String, dynamic> _$AirPassengerFareToJson(AirPassengerFare instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaggageAllowances',
      instance.baggageAllowances?.map((e) => e.toJson()).toList());
  writeNotNull('Count', instance.count);
  writeNotNull('Exchange', instance.exchange);
  writeNotNull('OptionalServices',
      instance.optionalServices?.map((e) => e.toJson()).toList());
  writeNotNull('PassengerRef', instance.passengerRef);
  writeNotNull('PassengerType', _$PaxTypeEnumMap[instance.passengerType]);
  writeNotNull('Price', instance.price?.toJson());
  writeNotNull('TotalPrice', instance.totalPrice?.toJson());
  return val;
}

const _$PaxTypeEnumMap = {
  PaxType.adult: 0,
  PaxType.child: 1,
  PaxType.infant: 2,
};
