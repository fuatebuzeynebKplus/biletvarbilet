// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_offers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomOffers _$RoomOffersFromJson(Map<String, dynamic> json) => RoomOffers(
      productCode: json['ProductCode'] as String,
      searchKey: json['SearchKey'] as String,
      languageCode: json['LanguageCode'] as String,
      tokenCode: json['TokenCode'] as String,
    );

Map<String, dynamic> _$RoomOffersToJson(RoomOffers instance) =>
    <String, dynamic>{
      'ProductCode': instance.productCode,
      'SearchKey': instance.searchKey,
      'LanguageCode': instance.languageCode,
      'TokenCode': instance.tokenCode,
    };
