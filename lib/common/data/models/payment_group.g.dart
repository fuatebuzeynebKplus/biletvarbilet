// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentGroup _$PaymentGroupFromJson(Map<String, dynamic> json) => PaymentGroup(
      binCodes: (json['BinCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: (json['Id'] as num?)?.toInt(),
      logoUrl: json['LogoUrl'] as String?,
      name: json['Name'] as String?,
      paymentGroupItem: (json['PaymentGroupItem'] as List<dynamic>?)
          ?.map((e) => PaymentGroupItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentGroupToJson(PaymentGroup instance) =>
    <String, dynamic>{
      'BinCodes': instance.binCodes,
      'Id': instance.id,
      'LogoUrl': instance.logoUrl,
      'Name': instance.name,
      'PaymentGroupItem':
          instance.paymentGroupItem?.map((e) => e.toJson()).toList(),
    };
