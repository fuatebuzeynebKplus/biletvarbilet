import 'package:json_annotation/json_annotation.dart';

part 'departure_point.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class DeparturePoint {
  String code;
  String hotpointType;

  DeparturePoint({
    required this.code,
    required this.hotpointType,
  });

  factory DeparturePoint.fromJson(Map<String, dynamic> json) =>
      _$DeparturePointFromJson(json);

  Map<String, dynamic> toJson() => _$DeparturePointToJson(this);
}
