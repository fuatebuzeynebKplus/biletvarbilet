// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOptions _$PaymentOptionsFromJson(Map<String, dynamic> json) =>
    PaymentOptions(
      tokenCode: json['TokenCode'] as String,
      ResultKeys: (json['ResultKeys'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PaymentOptionsToJson(PaymentOptions instance) =>
    <String, dynamic>{
      'TokenCode': instance.tokenCode,
      'ResultKeys': instance.ResultKeys,
    };
