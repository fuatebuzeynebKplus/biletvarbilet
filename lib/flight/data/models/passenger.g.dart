// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passenger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Passenger _$PassengerFromJson(Map<String, dynamic> json) => Passenger(
      count: json['Count'] as String,
      paxType: json['PaxType'] as String,
    );

Map<String, dynamic> _$PassengerToJson(Passenger instance) => <String, dynamic>{
      'Count': instance.count,
      'PaxType': instance.paxType,
    };
