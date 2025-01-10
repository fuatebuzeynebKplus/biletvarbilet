// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_countries_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCountriesResult _$GetCountriesResultFromJson(Map<String, dynamic> json) =>
    GetCountriesResult(
      cacheHashCode: json['CacheHashCode'],
      resultDate: json['ResultDate'],
      resultExpireDate: json['ResultExpireDate'],
      errorCode: json['ErrorCode'],
      errorMessage: json['ErrorMessage'],
      errorType: (json['ErrorType'] as num?)?.toInt(),
      hasError: json['HasError'] as bool?,
      result: (json['Result'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultCount: (json['ResultCount'] as num?)?.toInt(),
      userFriendlyErrorMessage: json['UserFriendlyErrorMessage'],
    );

Map<String, dynamic> _$GetCountriesResultToJson(GetCountriesResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CacheHashCode', instance.cacheHashCode);
  writeNotNull('ResultDate', instance.resultDate);
  writeNotNull('ResultExpireDate', instance.resultExpireDate);
  writeNotNull('ErrorCode', instance.errorCode);
  writeNotNull('ErrorMessage', instance.errorMessage);
  writeNotNull('ErrorType', instance.errorType);
  writeNotNull('HasError', instance.hasError);
  writeNotNull('Result', instance.result?.map((e) => e.toJson()).toList());
  writeNotNull('ResultCount', instance.resultCount);
  writeNotNull('UserFriendlyErrorMessage', instance.userFriendlyErrorMessage);
  return val;
}
