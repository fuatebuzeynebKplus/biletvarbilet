// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_verification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentVerification _$PaymentVerificationFromJson(Map<String, dynamic> json) =>
    PaymentVerification(
      booking: json['Booking'] == null
          ? null
          : Booking.fromJson(json['Booking'] as Map<String, dynamic>),
      is3DPostRequired: json['Is3DPostRequired'] as bool?,
      isPriceChanged: json['IsPriceChanged'] as bool?,
      post3DPageUrl: json['Post3DPageUrl'] as String?,
    );

Map<String, dynamic> _$PaymentVerificationToJson(PaymentVerification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Booking', instance.booking?.toJson());
  writeNotNull('Is3DPostRequired', instance.is3DPostRequired);
  writeNotNull('IsPriceChanged', instance.isPriceChanged);
  writeNotNull('Post3DPageUrl', instance.post3DPageUrl);
  return val;
}
