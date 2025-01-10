import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/calculation_type.dart';

part 'markup.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Markup {
  double amount;
  CalculationType calculationType;
  String currencyCode;

  Markup({
    required this.amount,
    required this.calculationType,
    required this.currencyCode,
  });

  factory Markup.fromJson(Map<String, dynamic> json) => _$MarkupFromJson(json);

  Map<String, dynamic> toJson() => _$MarkupToJson(this);
}
