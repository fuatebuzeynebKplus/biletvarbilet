// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_room_offers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookRoomOffers _$BookRoomOffersFromJson(Map<String, dynamic> json) =>
    BookRoomOffers(
      contactInfo:
          ContactInfo.fromJson(json['ContactInfo'] as Map<String, dynamic>),
      invoiceInfo:
          InvoiceInfo.fromJson(json['InvoiceInfo'] as Map<String, dynamic>),
      paxInfo: json['PaxInfo'] == null
          ? null
          : PaxInfo.fromJson(json['PaxInfo'] as Map<String, dynamic>),
      paymentInfo: json['PaymentInfo'] == null
          ? null
          : PaymentInfo.fromJson(json['PaymentInfo'] as Map<String, dynamic>),
      resultKeys: json['ResultKeys'] as String,
      tokenCode: json['TokenCode'] as String,
    );

Map<String, dynamic> _$BookRoomOffersToJson(BookRoomOffers instance) =>
    <String, dynamic>{
      'ContactInfo': instance.contactInfo.toJson(),
      'InvoiceInfo': instance.invoiceInfo.toJson(),
      'PaxInfo': instance.paxInfo?.toJson(),
      'PaymentInfo': instance.paymentInfo?.toJson(),
      'ResultKeys': instance.resultKeys,
      'TokenCode': instance.tokenCode,
    };
