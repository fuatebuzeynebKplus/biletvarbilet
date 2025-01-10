// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Markup _$MarkupFromJson(Map<String, dynamic> json) => Markup(
      amount: (json['Amount'] as num).toDouble(),
      calculationType:
          $enumDecode(_$CalculationTypeEnumMap, json['CalculationType']),
      currencyCode: json['CurrencyCode'] as String,
    );

Map<String, dynamic> _$MarkupToJson(Markup instance) => <String, dynamic>{
      'Amount': instance.amount,
      'CalculationType': _$CalculationTypeEnumMap[instance.calculationType]!,
      'CurrencyCode': instance.currencyCode,
    };

const _$CalculationTypeEnumMap = {
  CalculationType.percent: 0,
  CalculationType.amount: 1,
};
