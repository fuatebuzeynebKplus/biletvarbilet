import 'package:json_annotation/json_annotation.dart';

part 'tax.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Tax {
  String? currencyCode;
  dynamic taxAmount;
  String? taxCode;

  Tax({
    this.currencyCode,
    this.taxAmount,
    this.taxCode,
  });

  factory Tax.fromJson(Map<String, dynamic> json) => _$TaxFromJson(json);

  Map<String, dynamic> toJson() => _$TaxToJson(this);
}
