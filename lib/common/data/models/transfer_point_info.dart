import 'package:json_annotation/json_annotation.dart';

part 'transfer_point_info.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class TransferPointInfo {
  String? arrivalPointInfo;
  String? departurePointInfo;

  TransferPointInfo({
    this.arrivalPointInfo,
    this.departurePointInfo,
  });

  factory TransferPointInfo.fromJson(Map<String, dynamic> json) =>
      _$TransferPointInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TransferPointInfoToJson(this);
}
