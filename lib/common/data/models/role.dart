import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Role {
  final String? code;
  final String? description;
  final int? id;
  final String? name;

  Role({
    required this.code,
    required this.description,
    required this.id,
    required this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
