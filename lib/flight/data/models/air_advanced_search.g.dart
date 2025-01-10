// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_advanced_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirAdvancedSearch _$AirAdvancedSearchFromJson(Map<String, dynamic> json) =>
    AirAdvancedSearch(
      onlyDirectFlights: json['OnlyDirectFlights'] as bool,
      onlyBestFares: json['OnlyBestFares'] as bool,
      onlyRefundableFlights: json['OnlyRefundableFlights'] as bool,
      permittedAirlineCodes: (json['PermittedAirlineCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      permittedCabins: (json['PermittedCabins'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$AirCabinTypeEnumMap, e))
          .toList(),
      prohibitedAirlineCodes: (json['ProhibitedAirlineCodes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      resultType:
          $enumDecodeNullable(_$AirResultTypeEnumMap, json['ResultType']),
    );

Map<String, dynamic> _$AirAdvancedSearchToJson(AirAdvancedSearch instance) {
  final val = <String, dynamic>{
    'OnlyDirectFlights': instance.onlyDirectFlights,
    'OnlyRefundableFlights': instance.onlyRefundableFlights,
    'OnlyBestFares': instance.onlyBestFares,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PermittedAirlineCodes', instance.permittedAirlineCodes);
  writeNotNull('PermittedCabins',
      instance.permittedCabins?.map((e) => _$AirCabinTypeEnumMap[e]!).toList());
  writeNotNull('ProhibitedAirlineCodes', instance.prohibitedAirlineCodes);
  writeNotNull('ResultType', _$AirResultTypeEnumMap[instance.resultType]);
  return val;
}

const _$AirCabinTypeEnumMap = {
  AirCabinType.all: 0,
  AirCabinType.promotion: 1,
  AirCabinType.first: 2,
  AirCabinType.business: 3,
  AirCabinType.economy: 4,
  AirCabinType.premiumFirst: 5,
  AirCabinType.premiumEconomy: 6,
  AirCabinType.protocol: 7,
  AirCabinType.premiumBusiness: 8,
};

const _$AirResultTypeEnumMap = {
  AirResultType.all: 0,
  AirResultType.separated: 1,
  AirResultType.combined: 2,
};
