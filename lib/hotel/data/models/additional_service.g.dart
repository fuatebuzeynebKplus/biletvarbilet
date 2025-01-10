// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalService _$AdditionalServiceFromJson(Map<String, dynamic> json) =>
    AdditionalService(
      code: json['Code'] as String?,
      count: (json['Count'] as num?)?.toInt(),
      iconType: $enumDecodeNullable(
          _$AdditionalServiceIconTypeEnumMap, json['IconType']),
      data: json['Data'] == null
          ? null
          : AdditionalServiceData.fromJson(
              json['Data'] as Map<String, dynamic>),
      description: json['Description'] as String?,
      isMandatory: json['IsMandatory'] as bool?,
      macCount: (json['MacCount'] as num?)?.toInt(),
      medias: (json['Medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      perCalculationType: $enumDecodeNullable(
          _$PerCalculationTypeEnumMap, json['PerCalculationType']),
      price: json['Price'] == null
          ? null
          : Price.fromJson(json['Price'] as Map<String, dynamic>),
      selected: json['Selected'] as bool?,
    );

Map<String, dynamic> _$AdditionalServiceToJson(AdditionalService instance) =>
    <String, dynamic>{
      'Code': instance.code,
      'Name': instance.name,
      'IconType': _$AdditionalServiceIconTypeEnumMap[instance.iconType],
      'IsMandatory': instance.isMandatory,
      'Selected': instance.selected,
      'PerCalculationType':
          _$PerCalculationTypeEnumMap[instance.perCalculationType],
      'Price': instance.price?.toJson(),
      'Description': instance.description,
      'Medias': instance.medias?.map((e) => e.toJson()).toList(),
      'Data': instance.data?.toJson(),
      'Count': instance.count,
      'MacCount': instance.macCount,
    };

const _$AdditionalServiceIconTypeEnumMap = {
  AdditionalServiceIconType.none: 0,
  AdditionalServiceIconType.babySeat: 1,
  AdditionalServiceIconType.additionalDriver: 2,
  AdditionalServiceIconType.additionalKilometres: 3,
  AdditionalServiceIconType.insurance: 4,
  AdditionalServiceIconType.navigation: 5,
  AdditionalServiceIconType.childSeat: 6,
  AdditionalServiceIconType.babyStroller: 7,
  AdditionalServiceIconType.cancellationPackage: 8,
};

const _$PerCalculationTypeEnumMap = {
  PerCalculationType.perPerson: 0,
  PerCalculationType.perPNR: 1,
  PerCalculationType.perPersonalPerLeg: 2,
  PerCalculationType.perRoute: 3,
  PerCalculationType.perReservation: 4,
  PerCalculationType.perRoom: 5,
  PerCalculationType.perDay: 6,
};
