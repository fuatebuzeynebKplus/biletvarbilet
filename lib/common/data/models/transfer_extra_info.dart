import 'package:bamobile1/common/data/models/transfer_point_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer_extra_info.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class TransferExtraInfo {
  List<TransferPointInfo>? transferPointInfos;

  TransferExtraInfo({
    this.transferPointInfos,
  });

  factory TransferExtraInfo.fromJson(Map<String, dynamic> json) =>
      _$TransferExtraInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TransferExtraInfoToJson(this);
}
