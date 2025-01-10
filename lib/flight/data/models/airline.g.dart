// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'airline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Airline _$AirlineFromJson(Map<String, dynamic> json) => Airline(
      rating: json['Rating'],
      searchingWords: json['SearchingWords'],
      checkInUrl: json['CheckInUrl'] as String?,
      code: json['Code'] as String?,
      logo: json['Logo'] as String?,
      name: json['Name'] as String?,
      shortName: json['ShortName'] as String?,
      ticketingCode: json['TicketingCode'] as String?,
    );

Map<String, dynamic> _$AirlineToJson(Airline instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rating', instance.rating);
  writeNotNull('SearchingWords', instance.searchingWords);
  writeNotNull('CheckInUrl', instance.checkInUrl);
  writeNotNull('Code', instance.code);
  writeNotNull('Logo', instance.logo);
  writeNotNull('Name', instance.name);
  writeNotNull('ShortName', instance.shortName);
  writeNotNull('TicketingCode', instance.ticketingCode);
  return val;
}
