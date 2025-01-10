import 'package:json_annotation/json_annotation.dart';

part 'current_account.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class CurrentAccount {
  final double? cariBalance;
  final String? currencyCode;
  final double? currentBalance;
  final double? minBalance;
  final double? originalMinBalance;
  final String? paymentCurrencyCode;
  final List<Map<String, dynamic>>? settings;
  final double? spentBalance;
  final double? totalBalance;
  bool? unLimited = false;

  CurrentAccount({
    this.cariBalance,
    this.currencyCode,
    this.currentBalance,
    this.minBalance,
    this.originalMinBalance,
    this.paymentCurrencyCode,
    this.settings,
    this.spentBalance,
    this.totalBalance,
    required this.unLimited,
  });

  factory CurrentAccount.fromJson(Map<String, dynamic> json) =>
      _$CurrentAccountFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentAccountToJson(this);
}
