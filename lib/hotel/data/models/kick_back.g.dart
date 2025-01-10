// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kick_back.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KickBack _$KickBackFromJson(Map<String, dynamic> json) => KickBack(
      amount: (json['Amount'] as num?)?.toDouble(),
      currencyCode: json['CurrencyCode'] as String?,
      id: (json['Id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$KickBackToJson(KickBack instance) => <String, dynamic>{
      'Id': instance.id,
      'Amount': instance.amount,
      'CurrencyCode': instance.currencyCode,
    };
