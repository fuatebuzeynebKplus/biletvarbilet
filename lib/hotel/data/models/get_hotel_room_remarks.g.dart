// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hotel_room_remarks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHotelRoomRemarks _$GetHotelRoomRemarksFromJson(Map<String, dynamic> json) =>
    GetHotelRoomRemarks(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      errorType: (json['ErrorType'] as num?)?.toInt(),
      hasError: json['HasError'] as bool?,
      result:
          (json['Result'] as List<dynamic>?)?.map((e) => e as String).toList(),
      resultCount: (json['ResultCount'] as num?)?.toInt(),
      userFriendlyErrorMessage: json['UserFriendlyErrorMessage'] as String?,
    );

Map<String, dynamic> _$GetHotelRoomRemarksToJson(
        GetHotelRoomRemarks instance) =>
    <String, dynamic>{
      'ErrorCode': instance.errorCode,
      'ErrorMessage': instance.errorMessage,
      'ErrorType': instance.errorType,
      'HasError': instance.hasError,
      'Result': instance.result,
      'ResultCount': instance.resultCount,
      'UserFriendlyErrorMessage': instance.userFriendlyErrorMessage,
    };
