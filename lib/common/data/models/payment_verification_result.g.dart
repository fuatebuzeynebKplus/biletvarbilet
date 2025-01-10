// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_verification_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentVerificationResult _$PaymentVerificationResultFromJson(
        Map<String, dynamic> json) =>
    PaymentVerificationResult(
      cacheHashCode: json['CacheHashCode'],
      resultDate: json['ResultDate'],
      resultExpireDate: json['ResultExpireDate'],
      errorCode: json['ErrorCode'],
      errorMessage: json['ErrorMessage'],
      errorType: (json['ErrorType'] as num?)?.toInt(),
      hasError: json['HasError'] as bool?,
      result: json['Result'] == null
          ? null
          : PaymentVerification.fromJson(
              json['Result'] as Map<String, dynamic>),
      resultCount: (json['ResultCount'] as num?)?.toInt(),
      userFriendlyErrorMessage: json['UserFriendlyErrorMessage'],
    );

Map<String, dynamic> _$PaymentVerificationResultToJson(
    PaymentVerificationResult instance) {
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
  writeNotNull('Result', instance.result?.toJson());
  writeNotNull('ResultCount', instance.resultCount);
  writeNotNull('UserFriendlyErrorMessage', instance.userFriendlyErrorMessage);
  return val;
}
