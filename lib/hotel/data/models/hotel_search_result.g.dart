// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelSearchResult _$HotelSearchResultFromJson(Map<String, dynamic> json) =>
    HotelSearchResult(
      resultDate: json['Result']['ResultDate'] as String,
      resultExpireDate: json['Result']['ResultExpireDate'] as String,
      searchKey: json['Result']['SearchKey'] as String,
      searchFilter: HotelSearchFilter.fromJson(
          json['Result']['SearchFilter'] as Map<String, dynamic>),
      additionalInformation: json['Result']['AdditionalInformation'] == null
          ? null
          : AdditionalInformation.fromJson(
              json['Result']['AdditionalInformation'] as Map<String, dynamic>),
      contracts: (json['Result']['Contracts'] as List<dynamic>)
          .map((e) => ProductContract.fromJson(e as Map<String, dynamic>))
          .toList(),
      isFinished: json['Result']['IsFinished'] as bool?,
      hotels: (json['Result']['Hotels'] as List<dynamic>)
          .map((e) => HotelAvailability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotelSearchResultToJson(HotelSearchResult instance) =>
    <String, dynamic>{
      'SearchKey': instance.searchKey,
      'ResultDate': instance.resultDate,
      'ResultExpireDate': instance.resultExpireDate,
      'SearchFilter': instance.searchFilter.toJson(),
      'Hotels': instance.hotels.map((e) => e.toJson()).toList(),
      'AdditionalInformation': instance.additionalInformation?.toJson(),
      'Contracts': instance.contracts.map((e) => e.toJson()).toList(),
      'IsFinished': instance.isFinished,
    };
