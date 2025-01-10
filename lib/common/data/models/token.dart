import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/token_status_type.dart';

part 'token.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Token {
  String? channelCode;
  String? tokenCode;
  String? createdAt;
  String? refreshedAt;
  String? expiresAt;
  TokenStatusType? tokenStatusType;
  String? searchKey;
  String? languageCode;
  String? currencyCode;

  Token({
    required this.channelCode,
    required this.tokenCode,
    this.createdAt,
    this.refreshedAt,
    this.expiresAt,
    this.tokenStatusType = TokenStatusType.Active,
    this.searchKey,
    this.languageCode,
    this.currencyCode,
  });

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
