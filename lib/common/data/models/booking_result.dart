import 'package:bamobile1/common/data/models/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_result.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class BookingResult {
  dynamic cacheHashCode;
  dynamic resultDate;
  dynamic resultExpireDate;
  dynamic errorCode;
  dynamic errorMessage;
  int? errorType;
  bool? hasError;
  Booking? result;
  int? resultCount;
  dynamic userFriendlyErrorMessage;

  BookingResult({
    this.cacheHashCode,
    this.resultDate,
    this.resultExpireDate,
    this.errorCode,
    this.errorMessage,
    this.errorType,
    this.hasError,
    this.result,
    this.resultCount,
    this.userFriendlyErrorMessage,
  });

  factory BookingResult.fromJson(Map<String, dynamic> json) =>
      _$BookingResultFromJson(json);

  Map<String, dynamic> toJson() => _$BookingResultToJson(this);
}
