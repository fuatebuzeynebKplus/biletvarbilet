// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_validate_passenger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirValidatePassenger _$AirValidatePassengerFromJson(
        Map<String, dynamic> json) =>
    AirValidatePassenger(
      optionalServices: (json['OptionalServices'] as List<dynamic>?)
          ?.map((e) =>
              AirValidateOptionalService.fromJson(e as Map<String, dynamic>))
          .toList(),
      passengerRef: json['PassengerRef'] as String?,
      passengerType:
          $enumDecodeNullable(_$PaxTypeEnumMap, json['PassengerType']),
    );

Map<String, dynamic> _$AirValidatePassengerToJson(
        AirValidatePassenger instance) =>
    <String, dynamic>{
      'OptionalServices':
          instance.optionalServices?.map((e) => e.toJson()).toList(),
      'PassengerRef': instance.passengerRef,
      'PassengerType': _$PaxTypeEnumMap[instance.passengerType],
    };

const _$PaxTypeEnumMap = {
  PaxType.adult: 0,
  PaxType.child: 1,
  PaxType.infant: 2,
};
