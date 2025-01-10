// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_extra_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferExtraInfo _$TransferExtraInfoFromJson(Map<String, dynamic> json) =>
    TransferExtraInfo(
      transferPointInfos: (json['TransferPointInfos'] as List<dynamic>?)
          ?.map((e) => TransferPointInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TransferExtraInfoToJson(TransferExtraInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TransferPointInfos',
      instance.transferPointInfos?.map((e) => e.toJson()).toList());
  return val;
}
