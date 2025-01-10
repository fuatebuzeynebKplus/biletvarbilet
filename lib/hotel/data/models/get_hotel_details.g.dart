// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_hotel_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHotelDetails _$GetHotelDetailsFromJson(Map<String, dynamic> json) =>
    GetHotelDetails(
      additionalTabs: (json['AdditionalTabs'] as List<dynamic>?)
          ?.map((e) => AdditionalTab.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['Address'] as String?,
      geoLocation: json['GeoLocation'] == null
          ? null
          : GeoLocation.fromJson(json['GeoLocation'] as Map<String, dynamic>),
      hotelCategories: (json['HotelCategories'] as List<dynamic>?)
          ?.map((e) => ProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotelCode: json['HotelCode'] as String?,
      hotelDistance: (json['HotelDistance'] as List<dynamic>?)
          ?.map((e) => HotelDistance.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotelFacilities: (json['HotelFacilities'] as List<dynamic>?)
          ?.map((e) => HotelFacility.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotelImages: (json['HotelImages'] as List<dynamic>?)
          ?.map((e) => HotelImage.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotelName: json['HotelName'] as String?,
      rating: (json['Rating'] as num?)?.toInt(),
      searchingWords: json['SearchingWords'] as String?,
      seoInformation: json['SeoInformation'] == null
          ? null
          : Seo.fromJson(json['SeoInformation'] as Map<String, dynamic>),
      star: (json['Star'] as num?)?.toInt(),
      summaryText: json['SummaryText'] as String?,
    );

Map<String, dynamic> _$GetHotelDetailsToJson(GetHotelDetails instance) =>
    <String, dynamic>{
      'HotelCode': instance.hotelCode,
      'HotelName': instance.hotelName,
      'Address': instance.address,
      'Star': instance.star,
      'GeoLocation': instance.geoLocation?.toJson(),
      'SummaryText': instance.summaryText,
      'HotelImages': instance.hotelImages?.map((e) => e.toJson()).toList(),
      'HotelFacilities':
          instance.hotelFacilities?.map((e) => e.toJson()).toList(),
      'HotelDistance': instance.hotelDistance?.map((e) => e.toJson()).toList(),
      'SeoInformation': instance.seoInformation?.toJson(),
      'HotelCategories':
          instance.hotelCategories?.map((e) => e.toJson()).toList(),
      'AdditionalTabs':
          instance.additionalTabs?.map((e) => e.toJson()).toList(),
      'SearchingWords': instance.searchingWords,
      'Rating': instance.rating,
    };
