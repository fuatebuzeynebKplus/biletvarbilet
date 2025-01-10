// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentAccount _$CurrentAccountFromJson(Map<String, dynamic> json) =>
    CurrentAccount(
      cariBalance: (json['CariBalance'] as num?)?.toDouble(),
      currencyCode: json['CurrencyCode'] as String?,
      currentBalance: (json['CurrentBalance'] as num?)?.toDouble(),
      minBalance: (json['MinBalance'] as num?)?.toDouble(),
      originalMinBalance: (json['OriginalMinBalance'] as num?)?.toDouble(),
      paymentCurrencyCode: json['PaymentCurrencyCode'] as String?,
      settings: (json['Settings'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      spentBalance: (json['SpentBalance'] as num?)?.toDouble(),
      totalBalance: (json['TotalBalance'] as num?)?.toDouble(),
      unLimited: json['UnLimited'] as bool?,
    );

Map<String, dynamic> _$CurrentAccountToJson(CurrentAccount instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CariBalance', instance.cariBalance);
  writeNotNull('CurrencyCode', instance.currencyCode);
  writeNotNull('CurrentBalance', instance.currentBalance);
  writeNotNull('MinBalance', instance.minBalance);
  writeNotNull('OriginalMinBalance', instance.originalMinBalance);
  writeNotNull('PaymentCurrencyCode', instance.paymentCurrencyCode);
  writeNotNull('Settings', instance.settings);
  writeNotNull('SpentBalance', instance.spentBalance);
  writeNotNull('TotalBalance', instance.totalBalance);
  writeNotNull('UnLimited', instance.unLimited);
  return val;
}
