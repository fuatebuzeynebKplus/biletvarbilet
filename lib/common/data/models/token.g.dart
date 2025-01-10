// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      channelCode: json['ChannelCode'] as String?,
      tokenCode: json['TokenCode'] as String?,
      createdAt: json['CreatedAt'] as String?,
      refreshedAt: json['RefreshedAt'] as String?,
      expiresAt: json['ExpiresAt'] as String?,
      tokenStatusType: json['TokenStatusType'] == null
          ? TokenStatusType.Active
          : TokenStatusType.fromJson((json['TokenStatusType'] as num).toInt()),
      searchKey: json['SearchKey'] as String?,
      languageCode: json['LanguageCode'] as String?,
      currencyCode: json['CurrencyCode'] as String?,
    );

Map<String, dynamic> _$TokenToJson(Token instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelCode', instance.channelCode);
  writeNotNull('TokenCode', instance.tokenCode);
  writeNotNull('CreatedAt', instance.createdAt);
  writeNotNull('RefreshedAt', instance.refreshedAt);
  writeNotNull('ExpiresAt', instance.expiresAt);
  writeNotNull('TokenStatusType', instance.tokenStatusType?.toJson());
  writeNotNull('SearchKey', instance.searchKey);
  writeNotNull('LanguageCode', instance.languageCode);
  writeNotNull('CurrencyCode', instance.currencyCode);
  return val;
}
