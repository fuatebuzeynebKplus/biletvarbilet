// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_booking_leg.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightBookingLeg _$FlightBookingLegFromJson(Map<String, dynamic> json) =>
    FlightBookingLeg(
      alternativeRef: json['AlternativeRef'] as String?,
      arrivalAirport: json['ArrivalAirport'] == null
          ? null
          : Hotpoint.fromJson(json['ArrivalAirport'] as Map<String, dynamic>),
      arrivalDate: json['ArrivalDate'] as String?,
      cabinType: $enumDecodeNullable(_$AirCabinTypeEnumMap, json['CabinType']),
      classCode: json['ClassCode'] as String?,
      data: json['Data'],
      departureAirport: json['DepartureAirport'] == null
          ? null
          : Hotpoint.fromJson(json['DepartureAirport'] as Map<String, dynamic>),
      departureDate: json['DepartureDate'] as String?,
      fareBasis: json['FareBasis'] as String?,
      fareTitle: json['FareTitle'],
      flightDuration: (json['FlightDuration'] as num?)?.toInt(),
      flightNo: json['FlightNo'] as String?,
      isConnectedToNextFlight: json['IsConnectedToNextFlight'] as bool?,
      legOrderNo: (json['LegOrderNo'] as num?)?.toInt(),
      legStops: json['LegStops'] as List<dynamic>?,
      operatingAirline: json['OperatingAirline'] == null
          ? null
          : Airline.fromJson(json['OperatingAirline'] as Map<String, dynamic>),
      segmentRef: json['SegmentRef'] as String?,
      ticketingAirline: json['TicketingAirline'] == null
          ? null
          : Airline.fromJson(json['TicketingAirline'] as Map<String, dynamic>),
      vendorPnr: json['VendorPnr'] as String?,
      waitingDuration: (json['WaitingDuration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FlightBookingLegToJson(FlightBookingLeg instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlternativeRef', instance.alternativeRef);
  writeNotNull('ArrivalAirport', instance.arrivalAirport?.toJson());
  writeNotNull('ArrivalDate', instance.arrivalDate);
  writeNotNull('CabinType', _$AirCabinTypeEnumMap[instance.cabinType]);
  writeNotNull('ClassCode', instance.classCode);
  writeNotNull('Data', instance.data);
  writeNotNull('DepartureAirport', instance.departureAirport?.toJson());
  writeNotNull('DepartureDate', instance.departureDate);
  writeNotNull('FareBasis', instance.fareBasis);
  writeNotNull('FareTitle', instance.fareTitle);
  writeNotNull('FlightDuration', instance.flightDuration);
  writeNotNull('FlightNo', instance.flightNo);
  writeNotNull('IsConnectedToNextFlight', instance.isConnectedToNextFlight);
  writeNotNull('LegOrderNo', instance.legOrderNo);
  writeNotNull('LegStops', instance.legStops);
  writeNotNull('OperatingAirline', instance.operatingAirline?.toJson());
  writeNotNull('SegmentRef', instance.segmentRef);
  writeNotNull('TicketingAirline', instance.ticketingAirline?.toJson());
  writeNotNull('VendorPnr', instance.vendorPnr);
  writeNotNull('WaitingDuration', instance.waitingDuration);
  return val;
}

const _$AirCabinTypeEnumMap = {
  AirCabinType.all: 0,
  AirCabinType.promotion: 1,
  AirCabinType.first: 2,
  AirCabinType.business: 3,
  AirCabinType.economy: 4,
  AirCabinType.premiumFirst: 5,
  AirCabinType.premiumEconomy: 6,
  AirCabinType.protocol: 7,
  AirCabinType.premiumBusiness: 8,
};
