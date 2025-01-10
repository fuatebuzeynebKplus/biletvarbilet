import 'package:bamobile1/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum BookingStatusType {
  reservationSucceed(1),
  reservationFailed(2),
  reservationExpired(3),
  reservationCancelled(4),
  ticketingFailed(6),
  ticketingSucceed(7),
  ticketingCancelled(8),
  reservationChanged(12),
  ticketingChanged(13),
  cancellationPending(14),
  ticketingVoid(16);

  final int value;

  const BookingStatusType(this.value);

  // الوصف بناءً على لغة التطبيق
  String description(BuildContext context) {
    switch (this) {
      case BookingStatusType.reservationSucceed:
        return S.of(context).reservationSucceed;
      case BookingStatusType.reservationFailed:
        return S.of(context).reservationFailed;
      case BookingStatusType.reservationExpired:
        return S.of(context).reservationExpired;
      case BookingStatusType.reservationCancelled:
        return S.of(context).reservationCancelled;
      case BookingStatusType.ticketingFailed:
        return S.of(context).ticketingFailed;
      case BookingStatusType.ticketingSucceed:
        return S.of(context).ticketingSucceed;
      case BookingStatusType.ticketingCancelled:
        return S.of(context).ticketingCancelled;
      case BookingStatusType.reservationChanged:
        return S.of(context).reservationChanged;
      case BookingStatusType.ticketingChanged:
        return S.of(context).ticketingChanged;
      case BookingStatusType.cancellationPending:
        return S.of(context).cancellationPending;
      case BookingStatusType.ticketingVoid:
        return S.of(context).ticketingVoid;
      default:
        return '';
    }
  }

  // تحويل من النصوص إلى القيم في التعداد
  static BookingStatusType fromValue(BookingStatusType value) {
    switch (value) {
      case reservationSucceed:
        return BookingStatusType.reservationSucceed;
      case reservationFailed:
        return BookingStatusType.reservationFailed;
      case reservationExpired:
        return BookingStatusType.reservationExpired;
      case reservationCancelled:
        return BookingStatusType.reservationCancelled;
      case ticketingFailed:
        return BookingStatusType.ticketingFailed;
      case ticketingSucceed:
        return BookingStatusType.ticketingSucceed;
      case ticketingCancelled:
        return BookingStatusType.ticketingCancelled;
      case reservationChanged:
        return BookingStatusType.reservationChanged;
      case ticketingChanged:
        return BookingStatusType.ticketingChanged;
      case cancellationPending:
        return BookingStatusType.cancellationPending;
      case ticketingVoid:
        return BookingStatusType.ticketingVoid;
      default:
        throw ArgumentError.value(
            value, 'value', 'Invalid Booking Status value');
    }
  }
}
