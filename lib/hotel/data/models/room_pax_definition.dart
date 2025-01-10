import 'package:bamobile1/flight/data/models/pax_definition.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_pax_definition.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class RoomPaxDefinition {
  List<PaxDefinition> paxes;
  int? roomIndex;

  RoomPaxDefinition({required this.paxes, this.roomIndex});

  factory RoomPaxDefinition.fromJson(Map<String, dynamic> json) =>
      _$RoomPaxDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$RoomPaxDefinitionToJson(this);

  @override
  String toString() {
    String paxesString = paxes.map((pax) => pax.toString()).join(', ');

    return '--------:\n'
        'Room Index: $roomIndex\n'
        'Paxes: [${paxes.first.count}.]\n';
  }
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
