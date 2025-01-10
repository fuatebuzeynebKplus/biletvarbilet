// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_room_price_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelRoomPriceData _$HotelRoomPriceDataFromJson(Map<String, dynamic> json) =>
    HotelRoomPriceData(
      boardId: (json['BoardId'] as num?)?.toInt(),
      hotelId: (json['HotelId'] as num?)?.toInt(),
      hotelProviderId: (json['HotelProviderId'] as num?)?.toInt(),
      proHotelCode: json['ProHotelCode'] as String?,
      productProviderTypeId: (json['ProductProviderTypeId'] as num?)?.toInt(),
      providerId: (json['ProviderId'] as num?)?.toInt(),
      roomId: (json['RoomId'] as num?)?.toInt(),
      temporaryKey: json['TemporaryKey'] as String?,
    );

Map<String, dynamic> _$HotelRoomPriceDataToJson(HotelRoomPriceData instance) =>
    <String, dynamic>{
      'TemporaryKey': instance.temporaryKey,
      'HotelProviderId': instance.hotelProviderId,
      'ProviderId': instance.providerId,
      'HotelId': instance.hotelId,
      'ProductProviderTypeId': instance.productProviderTypeId,
      'ProHotelCode': instance.proHotelCode,
      'BoardId': instance.boardId,
      'RoomId': instance.roomId,
    };
