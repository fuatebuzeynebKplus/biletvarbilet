import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/models/user.dart';

part 'saler.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Saler {
  final String? agentName;
  final User? user;

  Saler({
    required this.agentName,
    required this.user,
  });

  factory Saler.fromJson(Map<String, dynamic> json) => _$SalerFromJson(json);

  Map<String, dynamic> toJson() => _$SalerToJson(this);
}
