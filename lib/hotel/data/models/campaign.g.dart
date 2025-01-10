// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Campaign _$CampaignFromJson(Map<String, dynamic> json) => Campaign(
      amount: (json['Amount'] as num?)?.toDouble(),
      couponCode: json['CouponCode'] as String?,
      currencyCode: json['CurrencyCode'] as String?,
      description: json['Description'] as String?,
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$CampaignToJson(Campaign instance) => <String, dynamic>{
      'Id': instance.id,
      'CouponCode': instance.couponCode,
      'Name': instance.name,
      'Description': instance.description,
      'Amount': instance.amount,
      'CurrencyCode': instance.currencyCode,
    };
