import 'package:bamobile1/common/data/enums/unit_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_distance.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelDistance {
  String? code;
  String? name;
  String? description;
  double? distance;
  UnitType? unitType;

  HotelDistance(
      {this.code, this.description, this.distance, this.name, this.unitType});

  factory HotelDistance.fromJson(Map<String, dynamic> json) =>
      _$HotelDistanceFromJson(json);

  Map<String, dynamic> toJson() => _$HotelDistanceToJson(this);
}

class HotelDistanceJson {
  HotelDistance request;

  HotelDistanceJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
