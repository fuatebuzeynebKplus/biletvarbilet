// import 'package:json_annotation/json_annotation.dart';

// @JsonEnum(valueField: 'value')
// enum HotpointType {
//   city(0, 'City'),
//   airport(1, 'Airport'),
//   trainStation(2, 'Train station'),
//   busTerminal(3, 'Bus terminal'),
//   heliPort(4, 'Heliport'),
//   seaport(5, 'Seaport'),
//   poi(6, 'Point of interest'),
//   hotel(7, 'Hotel'),
//   destination(8, 'Destination'),
//   country(9, 'Country');

//   final int value;
//   final String description;

//   const HotpointType(this.value, this.description);

//   String toString() => description;

//   static HotpointType fromString(int value) {
//     switch (value) {
//       case 0:
//         return city;
//       case 1:
//         return airport;
//       case 2:
//         return trainStation;
//       case 3:
//         return busTerminal;
//       case 4:
//         return heliPort;
//       case 5:
//         return seaport;
//       case 6:
//         return poi;
//       case 7:
//         return hotel;
//       case 8:
//         return destination;
//       case 9:
//         return country;
//       default:
//         throw ArgumentError.value(value, 'value');
//     }
//   }
// }
