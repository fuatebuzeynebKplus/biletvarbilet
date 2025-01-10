// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResultResponse _$SearchResultResponseFromJson(
        Map<String, dynamic> json) =>
    SearchResultResponse()
      ..errorCode = json['ErrorCode'] as String?
      ..errorMessage = json['ErrorMessage'] as String?
      ..errorType = (json['ErrorType'] as num?)?.toInt()
      ..hasError = json['HasError'] as bool
      ..result = json['Result'] == null
          ? null
          : Result.fromJson(json['Result'] as Map<String, dynamic>);

Map<String, dynamic> _$SearchResultResponseToJson(
        SearchResultResponse instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'ErrorType': instance.errorType,
      'HasError': instance.hasError,
      'Result': instance.result?.toJson(),
    };
