// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactInfo _$ContactInfoFromJson(Map<String, dynamic> json) => ContactInfo(
      email: json['Email'] as String?,
      firstName: json['FirstName'] as String?,
      genderType: $enumDecodeNullable(_$GenderTypeEnumMap, json['GenderType']),
      lastName: json['LastName'] as String?,
      phone: json['Phone'] as String?,
    );

Map<String, dynamic> _$ContactInfoToJson(ContactInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Email', instance.email);
  writeNotNull('FirstName', instance.firstName);
  writeNotNull('GenderType', _$GenderTypeEnumMap[instance.genderType]);
  writeNotNull('LastName', instance.lastName);
  writeNotNull('Phone', instance.phone);
  return val;
}

const _$GenderTypeEnumMap = {
  GenderType.female: 0,
  GenderType.male: 1,
  GenderType.unknown: 2,
};
