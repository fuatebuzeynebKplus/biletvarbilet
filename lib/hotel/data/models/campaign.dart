import 'package:json_annotation/json_annotation.dart';

part 'campaign.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Campaign {
  int? id;
  String? couponCode;
  String? name;
  String? description;
  double? amount;
  String? currencyCode;

  Campaign(
      {this.amount,
      this.couponCode,
      this.currencyCode,
      this.description,
      this.id,
      this.name});

  factory Campaign.fromJson(Map<String, dynamic> json) =>
      _$CampaignFromJson(json);

  Map<String, dynamic> toJson() => _$CampaignToJson(this);
}

class CampaignJson {
  Campaign request;

  CampaignJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
