// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ValidateRequest _$ValidateRequestFromJson(Map<String, dynamic> json) =>
    ValidateRequest(
      air: json['Air'] == null
          ? null
          : AirValidateRequest.fromJson(json['Air'] as Map<String, dynamic>),
      token: json['Token'] == null
          ? null
          : Token.fromJson(json['Token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ValidateRequestToJson(ValidateRequest instance) =>
    <String, dynamic>{
      'Air': instance.air?.toJson(),
      'Token': instance.token?.toJson(),
    };
