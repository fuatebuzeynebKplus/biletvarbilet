// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_service_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalServiceData _$AdditionalServiceDataFromJson(
        Map<String, dynamic> json) =>
    AdditionalServiceData(
      extraServiceType: $enumDecodeNullable(
          _$ExtraServiceTypeEnumMap, json['ExtraServiceType']),
      id: (json['Id'] as num?)?.toInt(),
      priceOperationType: $enumDecodeNullable(
          _$PriceOperationTypeEnumMap, json['PriceOperationType']),
      providerId: (json['ProviderId'] as num?)?.toInt(),
      temporaryKey: json['TemporaryKey'] as String?,
    );

Map<String, dynamic> _$AdditionalServiceDataToJson(
        AdditionalServiceData instance) =>
    <String, dynamic>{
      'TemporaryKey': instance.temporaryKey,
      'Id': instance.id,
      'ExtraServiceType': _$ExtraServiceTypeEnumMap[instance.extraServiceType],
      'ProviderId': instance.providerId,
      'PriceOperationType':
          _$PriceOperationTypeEnumMap[instance.priceOperationType],
    };

const _$ExtraServiceTypeEnumMap = {
  ExtraServiceType.tourExtraService: 0,
  ExtraServiceType.additionalService: 1,
};

const _$PriceOperationTypeEnumMap = {
  PriceOperationType.markup: 0,
  PriceOperationType.commissionAmount: 1,
  PriceOperationType.commissionPercent: 2,
  PriceOperationType.commissionInnerPercent: 3,
  PriceOperationType.taxExcludedCommissionPercent: 4,
  PriceOperationType.taxExcludedCommissionInnerPercent: 5,
  PriceOperationType.markupAmount: 6,
};
