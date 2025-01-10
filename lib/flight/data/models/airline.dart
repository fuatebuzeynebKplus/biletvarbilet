import 'package:json_annotation/json_annotation.dart';

part 'airline.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Airline {
  dynamic rating;
  dynamic searchingWords;
  String? checkInUrl;
  String? code;
  String? logo;
  String? name;
  String? shortName;
  String? ticketingCode;

  Airline(
      {this.rating,
      this.searchingWords,
      this.checkInUrl,
      this.code,
      this.logo,
      this.name,
      this.shortName,
      this.ticketingCode});
  // int? rating; //int?
  // String? checkInUrl;
  // String? code;
  // String? logo;
  // String? name;
  // String? shortName;
  // String? ticketingCode;

  // Airline(
  //     {this.rating,
  //     this.checkInUrl,
  //     this.code,
  //     this.logo,
  //     this.name,
  //     this.shortName,
  //     this.ticketingCode}
  //     //   {
  //     //   this.checkInUrl,
  //     //   required this.code,
  //     //   this.logo,
  //     //   this.name,
  //     //   this.shortName,
  //     //   this.ticketingCode,
  //     // }
  //     );

  factory Airline.fromJson(Map<String, dynamic> json) =>
      _$AirlineFromJson(json);

  Map<String, dynamic> toJson() => _$AirlineToJson(this);
}
