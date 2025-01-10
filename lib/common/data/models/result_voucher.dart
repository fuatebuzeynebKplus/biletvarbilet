import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/error_type.dart';

part 'result_voucher.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class ResultVoucher {
  dynamic cacheHashCode;
  dynamic resultDate;
  dynamic resultExpireDate;
  dynamic errorCode;
  dynamic errorMessage;
  ErrorType? errorType;
  bool? hasError;
  String? result;
  int? resultCount;
  dynamic userFriendlyErrorMessage;

  ResultVoucher(
      {this.cacheHashCode,
      this.resultDate,
      this.resultExpireDate,
      this.errorCode,
      this.errorMessage,
      this.errorType,
      this.hasError,
      this.result,
      this.resultCount,
      this.userFriendlyErrorMessage});

  factory ResultVoucher.fromJson(Map<String, dynamic> json) =>
      _$ResultVoucherFromJson(json);

  Map<String, dynamic> toJson() => _$ResultVoucherToJson(this);
}
