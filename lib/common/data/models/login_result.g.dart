// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => LoginResult(
      agent: json['Agent'] == null
          ? null
          : Agent.fromJson(json['Agent'] as Map<String, dynamic>),
      baseUser: json['BaseUser'] == null
          ? null
          : User.fromJson(json['BaseUser'] as Map<String, dynamic>),
      customer: json['Customer'],
      provider: json['Provider'],
      saler: json['Saler'] == null
          ? null
          : Saler.fromJson(json['Saler'] as Map<String, dynamic>),
      simulator: json['Simulator'],
      systemOwnerUser: json['SystemOwnerUser'],
    );

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Agent', instance.agent?.toJson());
  writeNotNull('BaseUser', instance.baseUser?.toJson());
  writeNotNull('Customer', instance.customer);
  writeNotNull('Provider', instance.provider);
  writeNotNull('Saler', instance.saler?.toJson());
  writeNotNull('Simulator', instance.simulator);
  writeNotNull('SystemOwnerUser', instance.systemOwnerUser);
  return val;
}
