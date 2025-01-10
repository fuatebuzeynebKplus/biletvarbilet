// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_fare_segment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirFareSegment _$AirFareSegmentFromJson(Map<String, dynamic> json) =>
    AirFareSegment(
      cabinType: json['CabinType'],
      classCode: json['ClassCode'] as String?,
      fareBasis: json['FareBasis'] as String?,
      seatCount: json['SeatCount'],
      segmentRef: json['SegmentRef'] as String?,
      temporaryKey: json['TemporaryKey'] as String?,
    );

Map<String, dynamic> _$AirFareSegmentToJson(AirFareSegment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CabinType', instance.cabinType);
  writeNotNull('ClassCode', instance.classCode);
  writeNotNull('FareBasis', instance.fareBasis);
  writeNotNull('SeatCount', instance.seatCount);
  writeNotNull('SegmentRef', instance.segmentRef);
  writeNotNull('TemporaryKey', instance.temporaryKey);
  return val;
}
