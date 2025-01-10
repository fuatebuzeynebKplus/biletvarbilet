import 'package:json_annotation/json_annotation.dart';
import "package:bamobile1/common/data/models/payment.dart";

part 'payment_result.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class PaymentResult {
  String? errorCode;
  String? errorMessage;
  int? errorType;
  bool? hasError;

  List<Payment>? result;
  int? resultCount;
  dynamic userFriendlyErrorMessage;

  PaymentResult({
    this.errorCode,
    this.errorMessage,
    this.errorType,
    this.hasError,
    this.result,
    this.resultCount,
    this.userFriendlyErrorMessage,
  });

  factory PaymentResult.fromJson(Map<String, dynamic> json) =>
      _$PaymentResultFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResultToJson(this);
}
