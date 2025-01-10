// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      baseUserId: (json['BaseUserId'] as num?)?.toInt(),
      birthDate: json['BirthDate'] as String?,
      currencyCode: json['CurrencyCode'] as String?,
      email: json['Email'] as String?,
      fax: json['Fax'] as String?,
      firstName: json['FirstName'] as String?,
      genderType: $enumDecodeNullable(_$GenderTypeEnumMap, json['GenderType']),
      identityNumber: json['IdentityNumber'] as String?,
      isSocialAccount: json['IsSocialAccount'] as bool?,
      lastLoginDate: json['LastLoginDate'] as String?,
      lastName: json['LastName'] as String?,
      nationalityCode: json['NationalityCode'] as String?,
      password: json['Password'] as String,
      phone: json['Phone'] as String?,
      profileImageUrl: json['ProfileImageUrl'] as String?,
      roles: (json['Roles'] as List<dynamic>?)
          ?.map((e) => Role.fromJson(e as Map<String, dynamic>))
          .toList(),
      username: json['Username'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BaseUserId', instance.baseUserId);
  writeNotNull('BirthDate', instance.birthDate);
  writeNotNull('CurrencyCode', instance.currencyCode);
  writeNotNull('Email', instance.email);
  writeNotNull('Fax', instance.fax);
  writeNotNull('FirstName', instance.firstName);
  writeNotNull('GenderType', _$GenderTypeEnumMap[instance.genderType]);
  writeNotNull('IdentityNumber', instance.identityNumber);
  writeNotNull('IsSocialAccount', instance.isSocialAccount);
  writeNotNull('LastLoginDate', instance.lastLoginDate);
  writeNotNull('LastName', instance.lastName);
  writeNotNull('NationalityCode', instance.nationalityCode);
  val['Password'] = instance.password;
  writeNotNull('Phone', instance.phone);
  writeNotNull('ProfileImageUrl', instance.profileImageUrl);
  writeNotNull('Roles', instance.roles?.map((e) => e.toJson()).toList());
  writeNotNull('Username', instance.username);
  return val;
}

const _$GenderTypeEnumMap = {
  GenderType.female: 0,
  GenderType.male: 1,
  GenderType.unknown: 2,
};
