// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirResult _$AirResultFromJson(Map<String, dynamic> json) => AirResult(
      data: json['Data'] == null
          ? null
          : FareData.fromJson(json['Data'] as Map<String, dynamic>),
      fares: (json['Fares'] as List<dynamic>?)
          ?.map((e) => AirFare.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupId: json['GroupId'] as String?,
      isCharter: json['IsCharter'] as bool?,
      legs: (json['Legs'] as List<dynamic>?)
          ?.map((e) => AirLeg.fromJson(e as Map<String, dynamic>))
          .toList(),
      providerCode: json['ProviderCode'] as String?,
      resultRef: json['ResultRef'] as String?,
    );

Map<String, dynamic> _$AirResultToJson(AirResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Data', instance.data?.toJson());
  writeNotNull('Fares', instance.fares?.map((e) => e.toJson()).toList());
  writeNotNull('GroupId', instance.groupId);
  writeNotNull('IsCharter', instance.isCharter);
  writeNotNull('Legs', instance.legs?.map((e) => e.toJson()).toList());
  writeNotNull('ProviderCode', instance.providerCode);
  writeNotNull('ResultRef', instance.resultRef);
  return val;
}
