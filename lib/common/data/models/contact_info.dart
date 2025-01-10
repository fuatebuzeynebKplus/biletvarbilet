import 'package:json_annotation/json_annotation.dart';

import '../enums/gender_type.dart';

part 'contact_info.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class ContactInfo {
  String? email;
  String? firstName;
  GenderType? genderType;
  String? lastName;
  String? phone;

  ContactInfo(
      {this.email, this.firstName, this.genderType, this.lastName, this.phone});

  // String? firstName;
  // String? lastName;
  // String? email;
  // String? phone;
  // final GenderType? genderType;

  // ContactInfo({
  //   this.firstName,
  //   this.lastName,
  //   this.email,
  //   this.phone,
  //   this.genderType,
  // });

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ContactInfoToJson(this);
}
