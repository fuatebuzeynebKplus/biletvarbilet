// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      code: json['Code'] as String?,
      description: json['Description'] as String?,
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
    );

Map<String, dynamic> _$RoleToJson(Role instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Code', instance.code);
  writeNotNull('Description', instance.description);
  writeNotNull('Id', instance.id);
  writeNotNull('Name', instance.name);
  return val;
}
