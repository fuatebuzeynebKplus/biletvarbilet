import 'package:json_annotation/json_annotation.dart';

part 'hotel_cancellation_policy.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelCancellationPolicy {
  int? id;
  String? roomCode;
  String? policyDecription;
  String? policyType;
  String? startDate;
  String? endDate;
  double? penaltyBuyAmount;
  double? penaltyAmount;
  String? currencyCode;

  HotelCancellationPolicy({
    this.currencyCode,
    this.endDate,
    this.id,
    this.penaltyAmount,
    this.penaltyBuyAmount,
    this.policyDecription,
    this.policyType,
    this.roomCode,
    this.startDate,
  });

  factory HotelCancellationPolicy.fromJson(Map<String, dynamic> json) =>
      _$HotelCancellationPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$HotelCancellationPolicyToJson(this);
}

class HotelCancellationPolicyJson {
  HotelCancellationPolicy request;

  HotelCancellationPolicyJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
