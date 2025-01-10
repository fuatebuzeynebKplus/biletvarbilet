// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      accountingCode: json['AccountingCode'] as String?,
      address: json['Address'] as String?,
      cityCode: json['CityCode'] as String?,
      cityName: json['CityName'] as String?,
      code: json['Code'] as String?,
      countryCode: json['CountryCode'] as String?,
      countryName: json['CountryName'] as String?,
      email: json['Email'] as String?,
      fax: json['Fax'] as String?,
      invoiceInfo: json['InvoiceInfo'] == null
          ? null
          : InvoiceInfo.fromJson(json['InvoiceInfo'] as Map<String, dynamic>),
      logoUrl: json['LogoUrl'] as String?,
      mobilPhone: json['MobilPhone'] as String?,
      name: json['Name'] as String?,
      note: json['Note'] as String?,
      phone: json['Phone'] as String?,
      region: json['Region'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccountingCode', instance.accountingCode);
  writeNotNull('Address', instance.address);
  writeNotNull('CityCode', instance.cityCode);
  writeNotNull('CityName', instance.cityName);
  writeNotNull('Code', instance.code);
  writeNotNull('CountryCode', instance.countryCode);
  writeNotNull('CountryName', instance.countryName);
  writeNotNull('Email', instance.email);
  writeNotNull('Fax', instance.fax);
  writeNotNull('InvoiceInfo', instance.invoiceInfo?.toJson());
  writeNotNull('LogoUrl', instance.logoUrl);
  writeNotNull('MobilPhone', instance.mobilPhone);
  writeNotNull('Name', instance.name);
  writeNotNull('Note', instance.note);
  writeNotNull('Phone', instance.phone);
  writeNotNull('Region', instance.region);
  return val;
}
