import 'package:bamobile1/common/data/enums/fee_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_facility.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelFacility {
  String? groupCode;
  String? groupName;
  String? code;
  String? name;
  FeeType? feeType;

  HotelFacility(
      {this.code, this.feeType, this.groupCode, this.groupName, this.name});

  factory HotelFacility.fromJson(Map<String, dynamic> json) =>
      _$HotelFacilityFromJson(json);

  Map<String, dynamic> toJson() => _$HotelFacilityToJson(this);
}

class HotelFacilityJson {
  HotelFacility request;

  HotelFacilityJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
