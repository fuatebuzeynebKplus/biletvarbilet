// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_cancellation_policy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelCancellationPolicy _$HotelCancellationPolicyFromJson(
        Map<String, dynamic> json) =>
    HotelCancellationPolicy(
      currencyCode: json['CurrencyCode'] as String?,
      endDate: json['EndDate'] as String?,
      id: (json['Id'] as num?)?.toInt(),
      penaltyAmount: (json['PenaltyAmount'] as num?)?.toDouble(),
      penaltyBuyAmount: (json['PenaltyBuyAmount'] as num?)?.toDouble(),
      policyDecription: json['PolicyDecription'] as String?,
      policyType: json['PolicyType'] as String?,
      roomCode: json['RoomCode'] as String?,
      startDate: json['StartDate'] as String?,
    );

Map<String, dynamic> _$HotelCancellationPolicyToJson(
        HotelCancellationPolicy instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'RoomCode': instance.roomCode,
      'PolicyDecription': instance.policyDecription,
      'PolicyType': instance.policyType,
      'StartDate': instance.startDate,
      'EndDate': instance.endDate,
      'PenaltyBuyAmount': instance.penaltyBuyAmount,
      'PenaltyAmount': instance.penaltyAmount,
      'CurrencyCode': instance.currencyCode,
    };
