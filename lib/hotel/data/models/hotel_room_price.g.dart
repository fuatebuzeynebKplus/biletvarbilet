// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_room_price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelRoomPrice _$HotelRoomPriceFromJson(Map<String, dynamic> json) =>
    HotelRoomPrice(
      addOn: (json['AddOn'] as num?)?.toDouble(),
      additionalServices: (json['AdditionalServices'] as List<dynamic>?)
          ?.map((e) => AdditionalService.fromJson(e as Map<String, dynamic>))
          .toList(),
      agentCommissions: (json['AgentCommissions'] as num?)?.toDouble(),
      allotment: (json['Allotment'] as num?)?.toInt(),
      approvalType:
          $enumDecodeNullable(_$ApprovalTypeEnumMap, json['ApprovalType']),
      baseAmount: (json['BaseAmount'] as num?)?.toDouble(),
      boardCode: json['BoardCode'] as String?,
      boardName: json['BoardName'] as String?,
      campaigns: (json['Campaigns'] as List<dynamic>?)
          ?.map((e) => Campaign.fromJson(e as Map<String, dynamic>))
          .toList(),
      cancellationPolicies: (json['CancellationPolicies'] as List<dynamic>?)
          ?.map((e) =>
              HotelCancellationPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      combinationId: json['CombinationId'] as String?,
      commission: (json['Commission'] as num?)?.toDouble(),
      currencyCode: json['CurrencyCode'] as String?,
      currencyRate: (json['CurrencyRate'] as num?)?.toDouble(),
      data: json['Data'] == null
          ? null
          : HotelRoomPriceData.fromJson(json['Data'] as Map<String, dynamic>),
      discountAmount: (json['DiscountAmount'] as num?)?.toDouble(),
      hotelRateType:
          $enumDecodeNullable(_$HotelRateTypeEnumMap, json['HotelRateType']),
      kickBack: (json['KickBack'] as num?)?.toDouble(),
      kickBacks: (json['KickBacks'] as List<dynamic>?)
          ?.map((e) => KickBack.fromJson(e as Map<String, dynamic>))
          .toList(),
      originalCommission: (json['OriginalCommission'] as num?)?.toDouble(),
      packageDifferenceAmount:
          (json['PackageDifferenceAmount'] as num?)?.toDouble(),
      paxes: (json['Paxes'] as List<dynamic>?)
          ?.map((e) => HotelRoomPaxPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
      provider: json['Provider'] as String?,
      providerCommission: (json['ProviderCommission'] as num?)?.toDouble(),
      remarks: json['Remarks'] as String?,
      roomCode: json['RoomCode'] as String?,
      roomName: json['RoomName'] as String?,
      serviceFee: (json['ServiceFee'] as num?)?.toDouble(),
      specialOffers: (json['SpecialOffers'] as List<dynamic>?)
          ?.map((e) => SpecialOffer.fromJson(e as Map<String, dynamic>))
          .toList(),
      taxAmount: (json['TaxAmount'] as num?)?.toDouble(),
      totalAmount: (json['TotalAmount'] as num?)?.toDouble(),
      totalStrikeAmount: (json['TotalStrikeAmount'] as num?)?.toDouble(),
      medias: (json['Medias'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
      dailyPrice: (json['DailyPrice'] as List<dynamic>?)
          ?.map((e) => DailyPrice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotelRoomPriceToJson(HotelRoomPrice instance) =>
    <String, dynamic>{
      'RoomCode': instance.roomCode,
      'CombinationId': instance.combinationId,
      'HotelRateType': _$HotelRateTypeEnumMap[instance.hotelRateType],
      'Provider': instance.provider,
      'Allotment': instance.allotment,
      'BoardCode': instance.boardCode,
      'BoardName': instance.boardName,
      'RoomName': instance.roomName,
      'CurrencyCode': instance.currencyCode,
      'AgentCommissions': instance.agentCommissions,
      'Commission': instance.commission,
      'OriginalCommission': instance.originalCommission,
      'BaseAmount': instance.baseAmount,
      'DiscountAmount': instance.discountAmount,
      'TaxAmount': instance.taxAmount,
      'ServiceFee': instance.serviceFee,
      'TotalAmount': instance.totalAmount,
      'TotalStrikeAmount': instance.totalStrikeAmount,
      'PackageDifferenceAmount': instance.packageDifferenceAmount,
      'AddOn': instance.addOn,
      'KickBack': instance.kickBack,
      'ProviderCommission': instance.providerCommission,
      'CurrencyRate': instance.currencyRate,
      'Remarks': instance.remarks,
      'DailyPrice': instance.dailyPrice?.map((e) => e.toJson()).toList(),
      'SpecialOffers': instance.specialOffers?.map((e) => e.toJson()).toList(),
      'Campaigns': instance.campaigns?.map((e) => e.toJson()).toList(),
      'CancellationPolicies':
          instance.cancellationPolicies?.map((e) => e.toJson()).toList(),
      'KickBacks': instance.kickBacks?.map((e) => e.toJson()).toList(),
      'ApprovalType': _$ApprovalTypeEnumMap[instance.approvalType],
      'AdditionalServices':
          instance.additionalServices?.map((e) => e.toJson()).toList(),
      'Paxes': instance.paxes?.map((e) => e.toJson()).toList(),
      'Medias': instance.medias?.map((e) => e.toJson()).toList(),
      'Data': instance.data?.toJson(),
    };

const _$ApprovalTypeEnumMap = {
  ApprovalType.outofRule: 0,
  ApprovalType.inRule: 1,
};

const _$HotelRateTypeEnumMap = {
  HotelRateType.refundable: 0,
  HotelRateType.nonRefundable: 1,
  HotelRateType.special: 2,
  HotelRateType.offer: 3,
  HotelRateType.package: 4,
  HotelRateType.unknown: 5,
};
