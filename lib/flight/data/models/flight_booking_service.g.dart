// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flight_booking_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FlightBookingService _$FlightBookingServiceFromJson(
        Map<String, dynamic> json) =>
    FlightBookingService(
      alternativeRef: json['AlternativeRef'] as String?,
      description: json['Description'] as String?,
      inclusionType:
          $enumDecodeNullable(_$InclusionTypeEnumMap, json['InclusionType']),
      title: json['Title'] as String?,
    );

Map<String, dynamic> _$FlightBookingServiceToJson(
    FlightBookingService instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AlternativeRef', instance.alternativeRef);
  writeNotNull('Description', instance.description);
  writeNotNull('InclusionType', _$InclusionTypeEnumMap[instance.inclusionType]);
  writeNotNull('Title', instance.title);
  return val;
}

const _$InclusionTypeEnumMap = {
  InclusionType.excluded: 0,
  InclusionType.included: 1,
  InclusionType.paid: 2,
};
