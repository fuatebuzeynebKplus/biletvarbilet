// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_cancellation_policies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomCancellationPolicies _$RoomCancellationPoliciesFromJson(
        Map<String, dynamic> json) =>
    RoomCancellationPolicies(
      tokenCode: json['TokenCode'] as String,
      ResultKeys: (json['ResultKeys'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoomCancellationPoliciesToJson(
        RoomCancellationPolicies instance) =>
    <String, dynamic>{
      'TokenCode': instance.tokenCode,
      'ResultKeys': instance.ResultKeys,
    };
