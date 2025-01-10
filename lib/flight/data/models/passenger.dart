import 'package:json_annotation/json_annotation.dart';

part 'passenger.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class Passenger {
  final String count;
  final String paxType;

  Passenger({
    required this.count,
    required this.paxType,
  });

  factory Passenger.fromJson(Map<String, dynamic> json) => _$PassengerFromJson(json);

  Map<String, dynamic> toJson() => _$PassengerToJson(this);
}
