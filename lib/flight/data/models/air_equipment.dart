import 'package:json_annotation/json_annotation.dart';

part 'air_equipment.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AirEquipment {
  String? code;
  dynamic value;

  AirEquipment({
    this.code,
    this.value,
  });

  factory AirEquipment.fromJson(Map<String, dynamic> json) =>
      _$AirEquipmentFromJson(json);

  Map<String, dynamic> toJson() => _$AirEquipmentToJson(this);
}
