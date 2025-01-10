import 'package:bamobile1/common/data/models/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bookingResultReservations.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class BookingResultReservations {
  dynamic cacheHashCode;
  dynamic resultDate;
  dynamic resultExpireDate;
  dynamic errorCode;
  dynamic errorMessage;
  int? errorType;
  bool? hasError;
  List<Booking>? result;
  int? resultCount;
  dynamic userFriendlyErrorMessage;

  BookingResultReservations({
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

  factory BookingResultReservations.fromJson(Map<String, dynamic> json) =>
      _$BookingResultReservationsFromJson(json);

  Map<String, dynamic> toJson() => _$BookingResultReservationsToJson(this);
}
