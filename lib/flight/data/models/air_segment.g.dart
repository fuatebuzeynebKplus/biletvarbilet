// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirSegment _$AirSegmentFromJson(Map<String, dynamic> json) => AirSegment(
      arrivalAirport: json['ArrivalAirport'] == null
          ? null
          : Hotpoint.fromJson(json['ArrivalAirport'] as Map<String, dynamic>),
      arrivalDate: json['ArrivalDate'] as String?,
      departureAirport: json['DepartureAirport'] == null
          ? null
          : Hotpoint.fromJson(json['DepartureAirport'] as Map<String, dynamic>),
      departureDate: json['DepartureDate'] as String?,
      equipment: json['Equipment'] == null
          ? null
          : AirEquipment.fromJson(json['Equipment'] as Map<String, dynamic>),
      flightDuration: json['FlightDuration'],
      flightNo: json['FlightNo'] as String?,
      operatingAirline: json['OperatingAirline'] == null
          ? null
          : Airline.fromJson(json['OperatingAirline'] as Map<String, dynamic>),
      orderNo: json['OrderNo'],
      segmentRef: json['SegmentRef'] as String?,
      segmentStops: json['SegmentStops'],
      ticketingAirline: json['TicketingAirline'] == null
          ? null
          : Airline.fromJson(json['TicketingAirline'] as Map<String, dynamic>),
      waitingDuration: json['WaitingDuration'],
    );

Map<String, dynamic> _$AirSegmentToJson(AirSegment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ArrivalAirport', instance.arrivalAirport?.toJson());
  writeNotNull('ArrivalDate', instance.arrivalDate);
  writeNotNull('DepartureAirport', instance.departureAirport?.toJson());
  writeNotNull('DepartureDate', instance.departureDate);
  writeNotNull('Equipment', instance.equipment?.toJson());
  writeNotNull('FlightDuration', instance.flightDuration);
  writeNotNull('FlightNo', instance.flightNo);
  writeNotNull('OperatingAirline', instance.operatingAirline?.toJson());
  writeNotNull('OrderNo', instance.orderNo);
  writeNotNull('SegmentRef', instance.segmentRef);
  writeNotNull('SegmentStops', instance.segmentStops);
  writeNotNull('TicketingAirline', instance.ticketingAirline?.toJson());
  writeNotNull('WaitingDuration', instance.waitingDuration);
  return val;
}
