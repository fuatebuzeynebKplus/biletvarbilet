// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asynchronous_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AsynchronousResults _$AsynchronousResultsFromJson(Map<String, dynamic> json) =>
    AsynchronousResults(
      SearchId: json['SearchId'] as String,
      ReturnNewResult: json['ReturnNewResult'] as String,
      token: Token.fromJson(json['Token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AsynchronousResultsToJson(
        AsynchronousResults instance) =>
    <String, dynamic>{
      'SearchId': instance.SearchId,
      'ReturnNewResult': instance.ReturnNewResult,
      'Token': instance.token.toJson(),
    };
