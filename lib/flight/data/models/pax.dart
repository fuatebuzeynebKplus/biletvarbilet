import 'package:bamobile1/flight/data/models/mileage_program.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/gender_type.dart';

part 'pax.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class Pax {
  int? age;
  String? dateOfBirth;
  String? email;
  dynamic employeeId;
  String? firstName;
  GenderType? genderType;
  dynamic hesCode;
  String? identityNumber;
  String? lastName;
  String? mobilePhone;
  String? nationalityCode;
  dynamic passportNumber;
  dynamic passportValidityDate;
  int? paxId;
  dynamic referenceId;
  int? statusType;
  List<MileageProgram>? mileagePrograms;

  Pax(
      {this.age,
      this.dateOfBirth,
      this.email,
      this.employeeId,
      this.firstName,
      this.genderType,
      this.hesCode,
      this.identityNumber,
      this.lastName,
      this.mobilePhone,
      this.nationalityCode,
      this.passportNumber,
      this.passportValidityDate,
      this.mileagePrograms,
      this.paxId,
      this.referenceId,
      this.statusType});
  // int? age;
  // String? dateOfBirth;
  // String? email;
  // dynamic employeeId;
  // String? firstName;
  // GenderType? genderType;
  // String? identityNumber;
  // String? lastName;
  // String? mobilePhone;
  // String? nationalityCode;
  // String? hesCode;
  // String? passportNumber;
  // String? passportValidityDate;
  // int? paxId;
  // dynamic referenceId;
  // int? statusType;

  // Pax(
  //     {this.age,
  //     this.dateOfBirth,
  //     this.email,
  //     this.employeeId,
  //     this.firstName,
  //     this.genderType,
  //     this.identityNumber,
  //     this.lastName,
  //     this.mobilePhone,
  //     this.nationalityCode,
  //     this.hesCode,
  //     this.passportNumber,
  //     this.passportValidityDate,
  //     this.paxId,
  //     this.referenceId,
  //     this.statusType});

  factory Pax.fromJson(Map<String, dynamic> json) => _$PaxFromJson(json);

  Map<String, dynamic> toJson() => _$PaxToJson(this);
}
