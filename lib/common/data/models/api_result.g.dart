// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResult _$ApiResultFromJson(Map<String, dynamic> json) => ApiResult(
      errorCode: json['ErrorCode'] as String,
      errorMessage: json['ErrorMessage'] as String,
      errorType: (json['ErrorType'] as num).toInt(),
      hasError: json['HasError'] as bool,
      result: Result.fromJson(json['Result'] as Map<String, dynamic>),
      resultCount: (json['ResultCount'] as num).toInt(),
      userFriendlyErrorMessage: json['UserFriendlyErrorMessage'],
    );

Map<String, dynamic> _$ApiResultToJson(ApiResult instance) => <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'ErrorType': instance.errorType,
      'HasError': instance.hasError,
      'Result': instance.result.toJson(),
      'ResultCount': instance.resultCount,
      'UserFriendlyErrorMessage': instance.userFriendlyErrorMessage,
    };
