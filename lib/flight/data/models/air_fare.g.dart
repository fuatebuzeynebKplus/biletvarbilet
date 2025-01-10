// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_fare.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirFare _$AirFareFromJson(Map<String, dynamic> json) => AirFare(
      campaigns: json['Campaigns'],
      fareAlternativeLegs: (json['FareAlternativeLegs'] as List<dynamic>?)
          ?.map(
              (e) => AirFareAlternativeLeg.fromJson(e as Map<String, dynamic>))
          .toList(),
      fareRef: json['FareRef'] as String?,
      fareRules: (json['FareRules'] as List<dynamic>?)
          ?.map((e) => AirFareRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      passengerFares: (json['PassengerFares'] as List<dynamic>?)
          ?.map((e) => AirPassengerFare.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['Title'],
      totalPrice: json['TotalPrice'] == null
          ? null
          : Price.fromJson(json['TotalPrice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AirFareToJson(AirFare instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Campaigns', instance.campaigns);
  writeNotNull('FareAlternativeLegs',
      instance.fareAlternativeLegs?.map((e) => e.toJson()).toList());
  writeNotNull('FareRef', instance.fareRef);
  writeNotNull(
      'FareRules', instance.fareRules?.map((e) => e.toJson()).toList());
  writeNotNull('PassengerFares',
      instance.passengerFares?.map((e) => e.toJson()).toList());
  writeNotNull('Title', instance.title);
  writeNotNull('TotalPrice', instance.totalPrice?.toJson());
  return val;
}
