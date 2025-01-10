// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Booking _$BookingFromJson(Map<String, dynamic> json) => Booking(
      activityBookingList: json['ActivityBookingList'] as List<dynamic>?,
      additionalServiceBookingList:
          json['AdditionalServiceBookingList'] as List<dynamic>?,
      agentReferenceInfo: json['AgentReferenceInfo'],
      amount: json['Amount'] == null
          ? null
          : BookingAmount.fromJson(json['Amount'] as Map<String, dynamic>),
      bookingDate: json['BookingDate'] as String?,
      bookingNote: json['BookingNote'] as String?,
      bookingStatusType: $enumDecodeNullable(
          _$BookingStatusTypeEnumMap, json['BookingStatusType']),
      campaigns: json['Campaigns'] as List<dynamic>?,
      carBookingList: json['CarBookingList'] as List<dynamic>?,
      channelTrackingNumber: json['ChannelTrackingNumber'],
      contactInfo: json['ContactInfo'] == null
          ? null
          : ContactInfo.fromJson(json['ContactInfo'] as Map<String, dynamic>),
      contracts: json['Contracts'] as List<dynamic>?,
      corporateDefinitions: json['CorporateDefinitions'] as List<dynamic>?,
      data: json['Data'],
      discountCodes: json['DiscountCodes'] as List<dynamic>?,
      expirationDate: json['ExpirationDate'] as String?,
      extraNote: json['ExtraNote'] as String?,
      flightBookingList: (json['FlightBookingList'] as List<dynamic>?)
          ?.map((e) => FlightBooking.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotelBookingList: json['HotelBookingList'] as List<dynamic>?,
      invoiceInfo: json['InvoiceInfo'] == null
          ? null
          : InvoiceInfo.fromJson(json['InvoiceInfo'] as Map<String, dynamic>),
      languageCode: json['LanguageCode'] as String?,
      processId: json['ProcessId'] as String?,
      productType:
          $enumDecodeNullable(_$ProductTypeEnumMap, json['ProductType']),
      systemPnr: json['SystemPnr'] as String?,
      tokenCode: json['TokenCode'] as String?,
      tourBookingList: json['TourBookingList'] as List<dynamic>?,
      transferBookingList: json['TransferBookingList'] as List<dynamic>?,
      version: json['Version'] as String?,
      visaBookingList: json['VisaBookingList'] as List<dynamic>?,
    );

Map<String, dynamic> _$BookingToJson(Booking instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ActivityBookingList', instance.activityBookingList);
  writeNotNull(
      'AdditionalServiceBookingList', instance.additionalServiceBookingList);
  writeNotNull('AgentReferenceInfo', instance.agentReferenceInfo);
  writeNotNull('Amount', instance.amount?.toJson());
  writeNotNull('BookingDate', instance.bookingDate);
  writeNotNull('BookingNote', instance.bookingNote);
  writeNotNull('BookingStatusType',
      _$BookingStatusTypeEnumMap[instance.bookingStatusType]);
  writeNotNull('Campaigns', instance.campaigns);
  writeNotNull('CarBookingList', instance.carBookingList);
  writeNotNull('ChannelTrackingNumber', instance.channelTrackingNumber);
  writeNotNull('ContactInfo', instance.contactInfo?.toJson());
  writeNotNull('Contracts', instance.contracts);
  writeNotNull('CorporateDefinitions', instance.corporateDefinitions);
  writeNotNull('Data', instance.data);
  writeNotNull('DiscountCodes', instance.discountCodes);
  writeNotNull('ExpirationDate', instance.expirationDate);
  writeNotNull('ExtraNote', instance.extraNote);
  writeNotNull('FlightBookingList',
      instance.flightBookingList?.map((e) => e.toJson()).toList());
  writeNotNull('HotelBookingList', instance.hotelBookingList);
  writeNotNull('InvoiceInfo', instance.invoiceInfo?.toJson());
  writeNotNull('LanguageCode', instance.languageCode);
  writeNotNull('ProcessId', instance.processId);
  writeNotNull('ProductType', _$ProductTypeEnumMap[instance.productType]);
  writeNotNull('SystemPnr', instance.systemPnr);
  writeNotNull('TokenCode', instance.tokenCode);
  writeNotNull('TourBookingList', instance.tourBookingList);
  writeNotNull('TransferBookingList', instance.transferBookingList);
  writeNotNull('Version', instance.version);
  writeNotNull('VisaBookingList', instance.visaBookingList);
  return val;
}

const _$BookingStatusTypeEnumMap = {
  BookingStatusType.reservationSucceed: 1,
  BookingStatusType.reservationFailed: 2,
  BookingStatusType.reservationExpired: 3,
  BookingStatusType.reservationCancelled: 4,
  BookingStatusType.ticketingFailed: 6,
  BookingStatusType.ticketingSucceed: 7,
  BookingStatusType.ticketingCancelled: 8,
  BookingStatusType.reservationChanged: 12,
  BookingStatusType.ticketingChanged: 13,
  BookingStatusType.cancellationPending: 14,
  BookingStatusType.ticketingVoid: 16,
};

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
