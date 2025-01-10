// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_pax_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomPaxDefinition _$RoomPaxDefinitionFromJson(Map<String, dynamic> json) =>
    RoomPaxDefinition(
      paxes: (json['Paxes'] as List<dynamic>)
          .map((e) => PaxDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      roomIndex: (json['RoomIndex'] as num).toInt(),
    );

Map<String, dynamic> _$RoomPaxDefinitionToJson(RoomPaxDefinition instance) =>
    <String, dynamic>{
      'Paxes': instance.paxes.map((e) => e.toJson()).toList(),
      'RoomIndex': instance.roomIndex,
    };
