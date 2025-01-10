// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resultx.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resultx _$ResultxFromJson(Map<String, dynamic> json) => Resultx(
      objectTypeCode: json['ObjectTypeCode'] as String,
      primaryCode: json['PrimaryCode'] as String,
      rating: (json['Rating'] as num).toInt(),
      searchingWords: json['SearchingWords'],
      agentId: (json['AgentId'] as num).toInt(),
      baseUserId: (json['BaseUserId'] as num).toInt(),
      clientIpAddress: json['ClientIpAddress'] as String,
      createdAt: json['CreatedAt'] as String,
      customerId: (json['CustomerId'] as num).toInt(),
      expiresAt: json['ExpiresAt'] as String,
      salerId: (json['SalerId'] as num).toInt(),
      simulatorId: (json['SimulatorId'] as num).toInt(),
      systemOwnerUserId: (json['SystemOwnerUserId'] as num).toInt(),
      tokenCode: json['TokenCode'] as String,
      tokenStatusType: (json['TokenStatusType'] as num).toInt(),
    );

Map<String, dynamic> _$ResultxToJson(Resultx instance) => <String, dynamic>{
      'ObjectTypeCode': instance.objectTypeCode,
      'PrimaryCode': instance.primaryCode,
      'Rating': instance.rating,
      'SearchingWords': instance.searchingWords,
      'AgentId': instance.agentId,
      'BaseUserId': instance.baseUserId,
      'ClientIpAddress': instance.clientIpAddress,
      'CreatedAt': instance.createdAt,
      'CustomerId': instance.customerId,
      'ExpiresAt': instance.expiresAt,
      'SalerId': instance.salerId,
      'SimulatorId': instance.simulatorId,
      'SystemOwnerUserId': instance.systemOwnerUserId,
      'TokenCode': instance.tokenCode,
      'TokenStatusType': instance.tokenStatusType,
    };
