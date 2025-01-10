import 'package:bamobile1/flight/data/models/pax_definition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rooms.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class RoomPaxDefinition {
  List<PaxDefinition> paxes;

  RoomPaxDefinition({
    required this.paxes,
  });

  factory RoomPaxDefinition.fromJson(Map<String, dynamic> json) =>
      _$RoomPaxDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$RoomPaxDefinitionToJson(this);
}

class RoomPaxDefinitionJson {
  RoomPaxDefinition request;

  RoomPaxDefinitionJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
