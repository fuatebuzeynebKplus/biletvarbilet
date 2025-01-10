import 'package:json_annotation/json_annotation.dart';

part 'room_remarks.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class RoomRemarks {
  String tokenCode;
  String ResultKeys;

  RoomRemarks({
    required this.tokenCode,
    required this.ResultKeys,
  });

  factory RoomRemarks.fromJson(Map<String, dynamic> json) =>
      _$RoomRemarksFromJson(json);

  Map<String, dynamic> toJson() => _$RoomRemarksToJson(this);
}

class RoomRemarksJson {
  RoomRemarks request;

  RoomRemarksJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
