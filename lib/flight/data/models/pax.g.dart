// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pax.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pax _$PaxFromJson(Map<String, dynamic> json) => Pax(
      age: (json['Age'] as num?)?.toInt(),
      dateOfBirth: json['DateOfBirth'] as String?,
      email: json['Email'] as String?,
      employeeId: json['EmployeeId'],
      firstName: json['FirstName'] as String?,
      genderType: $enumDecodeNullable(_$GenderTypeEnumMap, json['GenderType']),
      hesCode: json['HesCode'],
      identityNumber: json['IdentityNumber'] as String?,
      mileagePrograms: (json['MileagePrograms'] as List?)
              ?.map((item) =>
                  MileageProgram.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [], // map each item to a MileageProgram object
      lastName: json['LastName'] as String?,
      mobilePhone: json['MobilePhone'] as String?,
      nationalityCode: json['NationalityCode'] as String?,
      passportNumber: json['PassportNumber'],
      passportValidityDate: json['PassportValidityDate'],
      paxId: (json['PaxId'] as num?)?.toInt(),
      referenceId: json['ReferenceId'],
      statusType: (json['StatusType'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaxToJson(Pax instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Age', instance.age);
  writeNotNull('DateOfBirth', instance.dateOfBirth);
  writeNotNull('Email', instance.email);
  writeNotNull('EmployeeId', instance.employeeId);
  writeNotNull('FirstName', instance.firstName);
  writeNotNull('GenderType', _$GenderTypeEnumMap[instance.genderType]);
  writeNotNull('HesCode', instance.hesCode);
  writeNotNull('IdentityNumber', instance.identityNumber);
  writeNotNull('LastName', instance.lastName);
  writeNotNull('MobilePhone', instance.mobilePhone);
  writeNotNull('NationalityCode', instance.nationalityCode);
  writeNotNull('PassportNumber', instance.passportNumber);
  writeNotNull('PassportValidityDate', instance.passportValidityDate);
  writeNotNull('PaxId', instance.paxId);
  writeNotNull('ReferenceId', instance.referenceId);
  writeNotNull(
      'MileagePrograms',
      instance.mileagePrograms
          ?.map((e) => e.toJson())
          .toList()); // تضمين MileagePrograms
  writeNotNull('StatusType', instance.statusType);
  return val;
}

const _$GenderTypeEnumMap = {
  GenderType.female: 0,
  GenderType.male: 1,
  GenderType.unknown: 2,
};
