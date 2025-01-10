// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_point_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferPointInfo _$TransferPointInfoFromJson(Map<String, dynamic> json) =>
    TransferPointInfo(
      arrivalPointInfo: json['ArrivalPointInfo'] as String?,
      departurePointInfo: json['DeparturePointInfo'] as String?,
    );

Map<String, dynamic> _$TransferPointInfoToJson(TransferPointInfo instance) =>
    <String, dynamic>{
      'ArrivalPointInfo': instance.arrivalPointInfo,
      'DeparturePointInfo': instance.departurePointInfo,
    };
