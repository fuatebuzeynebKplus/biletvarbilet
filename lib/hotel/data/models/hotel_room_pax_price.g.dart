// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_room_pax_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelRoomPaxPrice _$HotelRoomPaxPriceFromJson(Map<String, dynamic> json) =>
    HotelRoomPaxPrice(
      additionalService: (json['AdditionalService'] as List<dynamic>?)
          ?.map((e) => AdditionalService.fromJson(e as Map<String, dynamic>))
          .toList(),
      paxType: $enumDecodeNullable(_$PaxTypeEnumMap, json['PaxType']),
    );

Map<String, dynamic> _$HotelRoomPaxPriceToJson(HotelRoomPaxPrice instance) =>
    <String, dynamic>{
      'PaxType': _$PaxTypeEnumMap[instance.paxType],
      'AdditionalService':
          instance.additionalService?.map((e) => e.toJson()).toList(),
    };

const _$PaxTypeEnumMap = {
  PaxType.adult: 0,
  PaxType.child: 1,
  PaxType.infant: 2,
};
