// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_voucher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultVoucher _$ResultVoucherFromJson(Map<String, dynamic> json) =>
    ResultVoucher(
      cacheHashCode: json['CacheHashCode'],
      resultDate: json['ResultDate'],
      resultExpireDate: json['ResultExpireDate'],
      errorCode: json['ErrorCode'],
      errorMessage: json['ErrorMessage'],
      errorType: $enumDecodeNullable(_$ErrorTypeEnumMap, json['ErrorType']),
      hasError: json['HasError'] as bool?,
      result: json['Result'] as String?,
      resultCount: (json['ResultCount'] as num?)?.toInt(),
      userFriendlyErrorMessage: json['UserFriendlyErrorMessage'],
    );

Map<String, dynamic> _$ResultVoucherToJson(ResultVoucher instance) {
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
  writeNotNull('ErrorType', _$ErrorTypeEnumMap[instance.errorType]);
  writeNotNull('HasError', instance.hasError);
  writeNotNull('Result', instance.result);
  writeNotNull('ResultCount', instance.resultCount);
  writeNotNull('UserFriendlyErrorMessage', instance.userFriendlyErrorMessage);
  return val;
}

const _$ErrorTypeEnumMap = {
  ErrorType.errorNotFound: 0,
  ErrorType.authenticationError: 1,
  ErrorType.authorizationError: 2,
  ErrorType.businessRule: 3,
  ErrorType.invalidData: 4,
  ErrorType.networkError: 5,
  ErrorType.systemError: 6,
  ErrorType.unknownError: 7,
};
