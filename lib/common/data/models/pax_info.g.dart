// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pax_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaxInfo _$PaxInfoFromJson(Map<String, dynamic> json) => PaxInfo(
      flightPaxes: (json['FlightPaxes'] as List<dynamic>?)
          ?.map((e) => FlightBookingPax.fromJson(e as Map<String, dynamic>))
          .toList(),
      hotelPaxes: (json['HotelRoomPaxes'] as List<dynamic>?)
          ?.asMap()
          .entries
          .map((entry) {
        final roomIndex = entry.key; // احصل على الفهرس الخاص بالغرفة
        final room = entry.value as Map<String, dynamic>; // بيانات الغرفة
        return HotelRoomPax(
          roomIndex: roomIndex, // إسناد RoomIndex
          paxes: (room['Paxes'] as List<dynamic>)
              .map((pax) =>
                  HotelBookingPax.fromJson(pax as Map<String, dynamic>))
              .toList(),
        );
      }).toList(),
    );

Map<String, dynamic> _$PaxInfoToJson(PaxInfo instance) => <String, dynamic>{
      'FlightPaxes': instance.flightPaxes?.map((e) => e.toJson()).toList(),
      'HotelRoomPaxes': instance.hotelPaxes?.map((room) {
        return {
          'RoomIndex': room.roomIndex, // أضف RoomIndex
          'Paxes': room.paxes?.map((pax) => pax.toJson()).toList(),
        };
      }).toList(),
    };


    
// PaxInfo _$PaxInfoFromJson(Map<String, dynamic> json) => PaxInfo(
//       flightPaxes: (json['FlightPaxes'] as List<dynamic>?)
//           ?.map((e) => FlightBookingPax.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       hotelPaxes: (json['HotelRoomPaxes'] as List<dynamic>?)?.map((e) {
//         return {
//           'Paxes': (e['Paxes'] as List<dynamic>)
//               .map((pax) =>
//                   HotelBookingPax.fromJson(pax as Map<String, dynamic>))
//               .toList(),
//           'RoomIndex': e['RoomIndex'],
//         };
//       }).toList(),
//     );

// Map<String, dynamic> _$PaxInfoToJson(PaxInfo instance) => <String, dynamic>{
//       'FlightPaxes': instance.flightPaxes?.map((e) => e.toJson()).toList(),
//       'HotelRoomPaxes': instance.hotelPaxes?.map((paxGroup) {
//         return {
//           'Paxes': paxGroup['Paxes']?.map((pax) => pax.toJson()).toList(),
//           'RoomIndex': paxGroup['RoomIndex'],
//         };
//       }).toList(),
//     };

