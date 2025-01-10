// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markup.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Markup _$MarkupFromJson(Map<String, dynamic> json) => Markup(
      calculationType:
          $enumDecode(_$CalculationTypeEnumMap, json['CalculationType']),
      amount: json['Amount'],
      currencyCode: json['CurrencyCode'] as String?,
    );

Map<String, dynamic> _$MarkupToJson(Markup instance) {
  final val = <String, dynamic>{
    'CalculationType': _$CalculationTypeEnumMap[instance.calculationType]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Amount', instance.amount);
  writeNotNull('CurrencyCode', instance.currencyCode);
  return val;
}

const _$CalculationTypeEnumMap = {
  CalculationType.percent: 0,
  CalculationType.amount: 1,
};
