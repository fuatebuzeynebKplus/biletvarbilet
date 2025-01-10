// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHotel _$SearchHotelFromJson(Map<String, dynamic> json) => SearchHotel(
      destinationId: (json['DestinationId'] as List<dynamic>)
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotelCode: (json['HotelCode'] as List<dynamic>?)
          ?.map((e) => Hotels.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotel: json['Hotel'] == null
          ? null
          : AdvancedOptions.fromJson(json['Hotel'] as Map<String, dynamic>),
      hotelSearchFilter: (json['HotelSearchFilter'] as List<dynamic>?)
          ?.map((e) => HotelSearchFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      checkInDate: json['CheckInDate'] as String?,
      checkOutDate: json['CheckOutDate'] as String?,
      nationalityCode: json['NationalityCode'] as String?,
      rooms: (json['Rooms'] as List<dynamic>?)
          ?.map((e) => RoomPaxDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      showMultipleRate: json['ShowMultipleRate'] as String?,
      token: json['Token'] == null
          ? null
          : Token.fromJson(json['Token'] as Map<String, dynamic>),
      markup: json['Markup'] == null
          ? null
          : Markup.fromJson(json['Markup'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchHotelToJson(SearchHotel instance) {
  final val = <String, dynamic>{
    'DestinationId': instance.destinationId.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'HotelCode', instance.hotelCode?.map((e) => e.toJson()).toList());
  writeNotNull('Hotel', instance.hotel?.toJson());
  writeNotNull('HotelSearchFilter',
      instance.hotelSearchFilter?.map((e) => e.toJson()).toList());
  writeNotNull('CheckInDate', instance.checkInDate);
  writeNotNull('CheckOutDate', instance.checkOutDate);
  writeNotNull('NationalityCode', instance.nationalityCode);
  writeNotNull('Rooms', instance.rooms?.map((e) => e.toJson()).toList());
  writeNotNull('ShowMultipleRate', instance.showMultipleRate);
  writeNotNull('Token', instance.token?.toJson());
  writeNotNull('Markup', instance.markup?.toJson());
  return val;
}
