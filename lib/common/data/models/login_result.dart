import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/models/agent.dart';
import 'package:bamobile1/common/data/models/saler.dart';
import 'package:bamobile1/common/data/models/user.dart';

part 'login_result.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class LoginResult {
  final Agent? agent;
  final User? baseUser;
  final dynamic customer;
  final dynamic provider;
  final Saler? saler;
  final dynamic simulator;
  final dynamic systemOwnerUser;

  LoginResult({
    this.agent,
    this.baseUser,
    this.customer,
    this.provider,
    this.saler,
    this.simulator,
    this.systemOwnerUser,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) =>
      _$LoginResultFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResultToJson(this);
}
