// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extra_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExtraInfo _$ExtraInfoFromJson(Map<String, dynamic> json) => ExtraInfo(
      transferExtraInfo: json['TransferExtraInfo'] == null
          ? null
          : TransferExtraInfo.fromJson(
              json['TransferExtraInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtraInfoToJson(ExtraInfo instance) => <String, dynamic>{
      'TransferExtraInfo': instance.transferExtraInfo?.toJson(),
    };
