// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingRequest _$BookingRequestFromJson(Map<String, dynamic> json) =>
    BookingRequest(
      agentReferenceInfo: json['AgentReferenceInfo'] as String?,
      bookingNote: json['BookingNote'] as String?,
      contactInfo: json['ContactInfo'] == null
          ? null
          : ContactInfo.fromJson(json['ContactInfo'] as Map<String, dynamic>),
      corporatePin: json['CorporatePin'] as String?,
      extraInfo: json['ExtraInfo'] == null
          ? null
          : ExtraInfo.fromJson(json['ExtraInfo'] as Map<String, dynamic>),
      extraNote: json['ExtraNote'] as String?,
      invoiceInfo: json['InvoiceInfo'] == null
          ? null
          : InvoiceInfo.fromJson(json['InvoiceInfo'] as Map<String, dynamic>),
      languageCode: json['LanguageCode'] as String?,
      lastName: json['LastName'] as String?,
      paxInfo: json['PaxInfo'] == null
          ? null
          : PaxInfo.fromJson(json['PaxInfo'] as Map<String, dynamic>),
      paymentInfo: json['PaymentInfo'] == null
          ? null
          : PaymentInfo.fromJson(json['PaymentInfo'] as Map<String, dynamic>),
      productType:
          $enumDecodeNullable(_$ProductTypeEnumMap, json['ProductType']),
      resultKeys: (json['ResultKeys'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      systemPnr: json['SystemPnr'] as String?,
      tokenCode: json['TokenCode'] as String?,
      version: json['Version'] as String?,
    );

Map<String, dynamic> _$BookingRequestToJson(BookingRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AgentReferenceInfo', instance.agentReferenceInfo);
  writeNotNull('BookingNote', instance.bookingNote);
  writeNotNull('ContactInfo', instance.contactInfo?.toJson());
  writeNotNull('CorporatePin', instance.corporatePin);
  writeNotNull('ExtraInfo', instance.extraInfo?.toJson());
  writeNotNull('ExtraNote', instance.extraNote);
  writeNotNull('InvoiceInfo', instance.invoiceInfo?.toJson());
  writeNotNull('LanguageCode', instance.languageCode);
  writeNotNull('LastName', instance.lastName);
  writeNotNull('PaxInfo', instance.paxInfo?.toJson());
  writeNotNull('PaymentInfo', instance.paymentInfo?.toJson());
  writeNotNull('ProductType', _$ProductTypeEnumMap[instance.productType]);
  writeNotNull('ResultKeys', instance.resultKeys);
  writeNotNull('SystemPnr', instance.systemPnr);
  writeNotNull('TokenCode', instance.tokenCode);
  writeNotNull('Version', instance.version);
  return val;
}

const _$ProductTypeEnumMap = {
  ProductType.flight: 0,
  ProductType.hotel: 1,
  ProductType.tour: 2,
  ProductType.rentacar: 3,
  ProductType.transfer: 4,
  ProductType.insurance: 5,
  ProductType.visa: 6,
  ProductType.cruise: 7,
  ProductType.train: 8,
  ProductType.package: 9,
  ProductType.activity: 12,
};
