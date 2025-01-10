// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saler.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Saler _$SalerFromJson(Map<String, dynamic> json) => Saler(
      agentName: json['AgentName'] as String?,
      user: json['User'] == null
          ? null
          : User.fromJson(json['User'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SalerToJson(Saler instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AgentName', instance.agentName);
  writeNotNull('User', instance.user?.toJson());
  return val;
}
