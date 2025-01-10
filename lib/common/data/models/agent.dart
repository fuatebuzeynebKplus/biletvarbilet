import 'package:json_annotation/json_annotation.dart';
import 'company.dart';
import 'current_account.dart';
import 'user.dart';

part 'agent.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Agent {
  final int? agentId;
  final int? agentType;
  final Company? company;
  final CurrentAccount? currentAccount;
  final List<dynamic>? discountCodes;
  final dynamic gSAInfo;
  final int? iATAType;
  final String? logo;
  final User? user;

  Agent({
    required this.agentId,
    required this.agentType,
    required this.company,
    required this.currentAccount,
    this.discountCodes,
    this.gSAInfo,
    this.iATAType,
    this.logo,
    required this.user,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => _$AgentFromJson(json);

  Map<String, dynamic> toJson() => _$AgentToJson(this);
}
