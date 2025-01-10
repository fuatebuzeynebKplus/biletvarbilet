import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/pax_type.dart';

part 'pax_definition.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class PaxDefinition {
  @JsonKey(defaultValue: [])
  List<int>? childAgeList;
  int count;
  PaxType paxType;

  PaxDefinition({
    this.childAgeList,
    required this.count,
    required this.paxType,
  });

  factory PaxDefinition.fromJson(Map<String, dynamic> json) =>
      _$PaxDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$PaxDefinitionToJson(this);
}
