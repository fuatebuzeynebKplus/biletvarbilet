import 'package:json_annotation/json_annotation.dart';

part 'corporate.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Corporate {
  List<Discount> discounts;

  Corporate({
    required this.discounts,
  });

  factory Corporate.fromJson(Map<String, dynamic> json) =>
      _$CorporateFromJson(json);

  Map<String, dynamic> toJson() => _$CorporateToJson(this);
}

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Discount {
  String supplierCode;
  String code;

  Discount({
    required this.supplierCode,
    required this.code,
  });

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}
