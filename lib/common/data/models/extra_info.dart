import 'package:bamobile1/common/data/models/transfer_extra_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'extra_info.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ExtraInfo {
  TransferExtraInfo? transferExtraInfo;

  ExtraInfo({
    this.transferExtraInfo,
  });

  factory ExtraInfo.fromJson(Map<String, dynamic> json) =>
      _$ExtraInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ExtraInfoToJson(this);
}
