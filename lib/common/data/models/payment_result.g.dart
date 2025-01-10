// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResult _$PaymentResultFromJson(Map<String, dynamic> json) =>
    PaymentResult(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      errorType: (json['ErrorType'] as num?)?.toInt(),
      hasError: json['HasError'] as bool?,
      result: (json['Result'] as List<dynamic>?)
          ?.map((e) => Payment.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultCount: (json['ResultCount'] as num?)?.toInt(),
      userFriendlyErrorMessage: json['UserFriendlyErrorMessage'],
    );

Map<String, dynamic> _$PaymentResultToJson(PaymentResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ErrorCode', instance.errorCode);
  writeNotNull('ErrorMessage', instance.errorMessage);
  writeNotNull('ErrorType', instance.errorType);
  writeNotNull('HasError', instance.hasError);
  writeNotNull('Result', instance.result?.map((e) => e.toJson()).toList());
  writeNotNull('ResultCount', instance.resultCount);
  writeNotNull('UserFriendlyErrorMessage', instance.userFriendlyErrorMessage);
  return val;
}
