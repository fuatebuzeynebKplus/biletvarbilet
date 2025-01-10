// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_option_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOptionRequest _$PaymentOptionRequestFromJson(
        Map<String, dynamic> json) =>
    PaymentOptionRequest(
      resultKeys: (json['ResultKeys'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      systemPnr: json['SystemPnr'] as String,
      tokenCode: json['TokenCode'] as String,
    );

Map<String, dynamic> _$PaymentOptionRequestToJson(
        PaymentOptionRequest instance) =>
    <String, dynamic>{
      'ResultKeys': instance.resultKeys,
      'SystemPnr': instance.systemPnr,
      'TokenCode': instance.tokenCode,
    };
