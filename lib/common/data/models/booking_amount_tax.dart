import 'package:json_annotation/json_annotation.dart';

part 'booking_amount_tax.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class BookingAmountTax {
  double? taxAmount;
  String? taxCode;

  BookingAmountTax({this.taxCode, this.taxAmount});

  factory BookingAmountTax.fromJson(Map<String, dynamic> json) =>
      _$BookingAmountTaxFromJson(json);

  Map<String, dynamic> toJson() => _$BookingAmountTaxToJson(this);
}
