// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_credential.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelCredential _$ChannelCredentialFromJson(Map<String, dynamic> json) =>
    ChannelCredential(
      channelCode: json['ChannelCode'] as String,
      channelPassword: json['ChannelPassword'] as String,
      clientIdentifier: json['ClientIdentifier'] as String?,
      userIpAddress: json['UserIpAddress'] as String?,
    );

Map<String, dynamic> _$ChannelCredentialToJson(ChannelCredential instance) =>
    <String, dynamic>{
      'ChannelCode': instance.channelCode,
      'ChannelPassword': instance.channelPassword,
      'ClientIdentifier': instance.clientIdentifier,
      'UserIpAddress': instance.userIpAddress,
    };
