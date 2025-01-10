// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditCardInfo _$CreditCardInfoFromJson(Map<String, dynamic> json) =>
    CreditCardInfo(
      cardExpMonth: (json['CardExpMonth'] as num).toInt(),
      cardExpYear: (json['CardExpYear'] as num).toInt(),
      cardHolderName: json['CardHolderName'] as String,
      cardNumber: json['CardNumber'] as String,
      cv2: json['Cv2'] as String,
      email: json['Email'] as String,
      ipAdress: json['IpAdress'] as String?,
      is3D: json['Is3D'] as bool,
      returnUrl: json['ReturnUrl'] as String,
    );

Map<String, dynamic> _$CreditCardInfoToJson(CreditCardInfo instance) =>
    <String, dynamic>{
      'CardExpMonth': instance.cardExpMonth,
      'CardExpYear': instance.cardExpYear,
      'CardHolderName': instance.cardHolderName,
      'CardNumber': instance.cardNumber,
      'Cv2': instance.cv2,
      'Email': instance.email,
      'IpAdress': instance.ipAdress,
      'Is3D': instance.is3D,
      'ReturnUrl': instance.returnUrl,
    };
