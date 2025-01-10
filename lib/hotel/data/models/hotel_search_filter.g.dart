// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_search_filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelSearchFilter _$HotelSearchFilterFromJson(Map<String, dynamic> json) =>
    HotelSearchFilter(
      destinations: (json['Destinations'] as List<dynamic>)
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotel: (json['Hotels'] as List<dynamic>)
          .map((e) => Hotels.fromJson(e as Map<String, dynamic>))
          .toList(),
      checkInDate: json['CheckInDate'] as String,
      checkOutDate: json['CheckOutDate'] as String,
      isAsync: json['IsAsync'] as bool?,
      isforCms: json['IsforCms'] as bool?,
      advancedOptions: AdvancedOptions(
        markup: json['Markup'] == null
            ? null
            : Markup.fromJson(json['Markup'] as Map<String, dynamic>),
        air: null,
      ),
      nationalityCode: json['NationalityCode'] as String,
      onRequest: json['OnRequest'] as bool?,
      rooms: (json['Rooms'] as List<dynamic>)
          .map((e) => RoomPaxDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      searchDate: json['SearchDate'] as String?,
      showMultipleRate: json['ShowMultipleRate'] as bool?,
      token: Token.fromJson(json['Token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelSearchFilterToJson(HotelSearchFilter instance) =>
    <String, dynamic>{
      'Destinations': instance.destinations.map((e) => e.toJson()).toList(),
      'Hotels': instance.hotel.map((e) => e.toJson()).toList(),
      'CheckInDate': instance.checkInDate,
      'CheckOutDate': instance.checkOutDate,
      'IsAsync': instance.isAsync,
      'IsforCms': instance.isforCms,
      'AdvancedOptions': instance.advancedOptions?.toJson(),
      'NationalityCode': instance.nationalityCode,
      'OnRequest': instance.onRequest,
      'Rooms': instance.rooms.map((e) => e.toJson()).toList(),
      'SearchDate': instance.searchDate,
      'ShowMultipleRate': instance.showMultipleRate,
      'Token': instance.token.toJson(),
    };
