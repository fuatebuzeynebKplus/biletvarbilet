// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_contract.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductContract _$ProductContractFromJson(Map<String, dynamic> json) =>
    ProductContract(
      content: json['Content'] as String?,
      productType:
          $enumDecodeNullable(_$ProductTypeEnumMap, json['ProductType']),
    );

Map<String, dynamic> _$ProductContractToJson(ProductContract instance) =>
    <String, dynamic>{
      'ProductType': _$ProductTypeEnumMap[instance.productType],
      'Content': instance.content,
    };

const _$ProductTypeEnumMap = {
  ProductType.flight: 0,
  ProductType.hotel: 1,
  ProductType.tour: 2,
  ProductType.rentacar: 3,
  ProductType.transfer: 4,
  ProductType.insurance: 5,
  ProductType.visa: 6,
  ProductType.cruise: 7,
  ProductType.train: 8,
  ProductType.package: 9,
  ProductType.activity: 12,
};
