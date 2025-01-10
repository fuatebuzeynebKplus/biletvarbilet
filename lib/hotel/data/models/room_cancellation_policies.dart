import 'package:json_annotation/json_annotation.dart';

part 'room_cancellation_policies.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class RoomCancellationPolicies {
  String tokenCode;
  List<String> ResultKeys;

  RoomCancellationPolicies({
    required this.tokenCode,
    required this.ResultKeys,
  });

  factory RoomCancellationPolicies.fromJson(Map<String, dynamic> json) =>
      _$RoomCancellationPoliciesFromJson(json);

  Map<String, dynamic> toJson() => _$RoomCancellationPoliciesToJson(this);
}

class RoomCancellationPoliciesJson {
  RoomCancellationPolicies request;

  RoomCancellationPoliciesJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
