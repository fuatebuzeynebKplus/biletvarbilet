// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceInfo _$InvoiceInfoFromJson(Map<String, dynamic> json) => InvoiceInfo(
      address: json['Address'] as String?,
      cityCode: json['CityCode'] as String?,
      cityName: json['CityName'] as String?,
      companyName: json['CompanyName'] as String?,
      countryCode: json['CountryCode'] as String?,
      firstName: json['FirstName'] as String?,
      invoiceInfoTitle: json['InvoiceInfoTitle'] as String?,
      invoiceInfoType: $enumDecodeNullable(
          _$InvoiceInfoTypeEnumMap, json['InvoiceInfoType']),
      lastName: json['LastName'] as String?,
      postalCode: json['PostalCode'] as String?,
      recId: (json['RecId'] as num?)?.toInt(),
      statusType: (json['StatusType'] as num?)?.toInt(),
      taxNumber: json['TaxNumber'] as String?,
      taxOffice: json['TaxOffice'] as String?,
    );

Map<String, dynamic> _$InvoiceInfoToJson(InvoiceInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Address', instance.address);
  writeNotNull('CityCode', instance.cityCode);
  writeNotNull('CityName', instance.cityName);
  writeNotNull('CompanyName', instance.companyName);
  writeNotNull('CountryCode', instance.countryCode);
  writeNotNull('FirstName', instance.firstName);
  writeNotNull('InvoiceInfoTitle', instance.invoiceInfoTitle);
  writeNotNull(
      'InvoiceInfoType', _$InvoiceInfoTypeEnumMap[instance.invoiceInfoType]);
  writeNotNull('LastName', instance.lastName);
  writeNotNull('PostalCode', instance.postalCode);
  writeNotNull('RecId', instance.recId);
  writeNotNull('StatusType', instance.statusType);
  writeNotNull('TaxNumber', instance.taxNumber);
  writeNotNull('TaxOffice', instance.taxOffice);
  return val;
}

const _$InvoiceInfoTypeEnumMap = {
  InvoiceInfoType.personal: 0,
  InvoiceInfoType.corporate: 1,
};
