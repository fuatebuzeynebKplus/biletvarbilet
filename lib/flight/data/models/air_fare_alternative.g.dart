// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_fare_alternative.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirFareAlternative _$AirFareAlternativeFromJson(Map<String, dynamic> json) =>
    AirFareAlternative(
      fareAlternativeLegs: (json['FareAlternativeLegs'] as List<dynamic>)
          .map((e) => AirFareAlternativeLeg.fromJson(e as Map<String, dynamic>))
          .toList(),
      fareRef: json['FareRef'] as String,
      passengerFares: (json['PassengerFares'] as List<dynamic>)
          .map((e) => AirPassengerFare.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['Title'] as String,
      totalPrice: Price.fromJson(json['TotalPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirFareAlternativeToJson(AirFareAlternative instance) =>
    <String, dynamic>{
      'FareAlternativeLegs':
          instance.fareAlternativeLegs.map((e) => e.toJson()).toList(),
      'FareRef': instance.fareRef,
      'PassengerFares': instance.passengerFares.map((e) => e.toJson()).toList(),
      'Title': instance.title,
      'TotalPrice': instance.totalPrice.toJson(),
    };
