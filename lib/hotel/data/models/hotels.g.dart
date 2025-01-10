// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hotels _$HotelsFromJson(Map<String, dynamic> json) => Hotels(
      HotelCode: json['HotelCode'] as String?,
      HotelName: json['HotelName'] as String?,
      HotelImageURL: json['HotelImageURL'] as String?,
      Address: json['Address'] as String?,
      CategoryName: json['CategoryName'] as String?,
      CountryCode: json['CountryCode'] as String?,
      Email: json['Email'] as String?,
      Phone: json['Phone'] as String?,
      Fax: json['Fax'] as String?,
      Location: json['Location'] as String?,
      TripAdvisorId: json['TripAdvisorId'] as String?,
      geoLocation: json['GeoLocation'] == null
          ? null
          : GeoLocation.fromJson(json['GeoLocation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelsToJson(Hotels instance) => <String, dynamic>{
      'HotelCode': instance.HotelCode,
      'HotelName': instance.HotelName,
      'HotelImageURL': instance.HotelImageURL,
      'Address': instance.Address,
      'CategoryName': instance.CategoryName,
      'CountryCode': instance.CountryCode,
      'Email': instance.Email,
      'Phone': instance.Phone,
      'Fax': instance.Fax,
      'Location': instance.Location,
      'TripAdvisorId': instance.TripAdvisorId,
      'GeoLocation': instance.geoLocation?.toJson(),
    };
