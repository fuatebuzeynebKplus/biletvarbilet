import 'package:bamobile1/common/data/enums/approval_type.dart';
import 'package:bamobile1/common/data/enums/hotel_rate_type.dart';
import 'package:bamobile1/hotel/data/models/additional_service.dart';
import 'package:bamobile1/hotel/data/models/campaign.dart';
import 'package:bamobile1/hotel/data/models/daily_price.dart';
import 'package:bamobile1/hotel/data/models/hotel_cancellation_policy.dart';
import 'package:bamobile1/hotel/data/models/hotel_room_pax_price.dart';
import 'package:bamobile1/hotel/data/models/hotel_room_price_data.dart';
import 'package:bamobile1/hotel/data/models/kick_back.dart';
import 'package:bamobile1/hotel/data/models/media.dart';
import 'package:bamobile1/hotel/data/models/special_offer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_room_price.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelRoomPrice {
  String? roomCode;
  String? combinationId;
  HotelRateType? hotelRateType;
  String? provider;
  int? allotment;
  String? boardCode;
  String? boardName;
  String? roomName;
  String? currencyCode;
  double? agentCommissions;
  double? commission;
  double? originalCommission;
  double? baseAmount;
  double? discountAmount;
  double? taxAmount;
  double? serviceFee;
  double? totalAmount;
  double? totalStrikeAmount;
  double? packageDifferenceAmount;
  double? addOn;
  double? kickBack;
  double? providerCommission;
  double? currencyRate;
  String? remarks;
  List<DailyPrice>? dailyPrice;
  List<SpecialOffer>? specialOffers;
  List<Campaign>? campaigns;
  List<HotelCancellationPolicy>? cancellationPolicies;
  List<KickBack>? kickBacks;
  ApprovalType? approvalType;
  List<AdditionalService>? additionalServices;
  List<HotelRoomPaxPrice>? paxes;
  List<Media>? medias;
  HotelRoomPriceData? data;

  HotelRoomPrice(
      {this.addOn,
      this.additionalServices,
      this.agentCommissions,
      this.allotment,
      this.approvalType,
      this.baseAmount,
      this.boardCode,
      this.boardName,
      this.campaigns,
      this.cancellationPolicies,
      this.combinationId,
      this.commission,
      this.currencyCode,
      this.currencyRate,
      this.data,
      this.discountAmount,
      this.hotelRateType,
      this.kickBack,
      this.kickBacks,
      this.originalCommission,
      this.packageDifferenceAmount,
      this.paxes,
      this.provider,
      this.providerCommission,
      this.remarks,
      this.roomCode,
      this.roomName,
      this.serviceFee,
      this.specialOffers,
      this.taxAmount,
      this.totalAmount,
      this.totalStrikeAmount,
      this.medias,
      this.dailyPrice});

  factory HotelRoomPrice.fromJson(Map<String, dynamic> json) =>
      _$HotelRoomPriceFromJson(json);

  Map<String, dynamic> toJson() => _$HotelRoomPriceToJson(this);
}

class HotelRoomPriceJson {
  HotelRoomPrice request;

  HotelRoomPriceJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
