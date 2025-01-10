import 'package:json_annotation/json_annotation.dart';

part 'resultx.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Resultx {
  Resultx({
    required this.objectTypeCode,
    required this.primaryCode,
    required this.rating,
    required this.searchingWords,
    required this.agentId,
    required this.baseUserId,
    required this.clientIpAddress,
    required this.createdAt,
    required this.customerId,
    required this.expiresAt,
    required this.salerId,
    required this.simulatorId,
    required this.systemOwnerUserId,
    required this.tokenCode,
    required this.tokenStatusType,
  });

  String objectTypeCode;
  String primaryCode;
  int rating;
  dynamic searchingWords;
  int agentId;
  int baseUserId;
  String clientIpAddress;
  String createdAt;
  int customerId;
  String expiresAt;
  int salerId;
  int simulatorId;
  int systemOwnerUserId;
  String tokenCode;
  int tokenStatusType;

  factory Resultx.fromJson(Map<String, dynamic> json) =>
      _$ResultxFromJson(json);

  Map<String, dynamic> toJson() => _$ResultxToJson(this);
}
