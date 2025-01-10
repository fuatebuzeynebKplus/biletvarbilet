// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVoucher _$GetVoucherFromJson(Map<String, dynamic> json) => GetVoucher(
      tokenCode: json['TokenCode'] as String,
      systemPnr: json['SystemPnr'] as String,
      lastName: json['LastName'] as String,
      languageCode: json['LanguageCode'] as String,
      productType: json['ProductType'] as int,
      withPrice: json['WithPrice'] as bool,
    );

Map<String, dynamic> _$GetVoucherToJson(GetVoucher instance) =>
    <String, dynamic>{
      'TokenCode': instance.tokenCode,
      'SystemPnr': instance.systemPnr,
      'LastName': instance.lastName,
      'LanguageCode': instance.languageCode,
      'ProductType': instance.productType,
      'WithPrice': instance.withPrice,
    };
