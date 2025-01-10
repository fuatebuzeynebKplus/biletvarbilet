import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/gender_type.dart';
import 'package:bamobile1/common/data/models/role.dart';

part 'user.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class User {
  final int? baseUserId;
  final String? birthDate;
  final String? currencyCode;
  final String? email;
  final String? fax;
  final String? firstName;
  final GenderType? genderType;
  final String? identityNumber;
  final bool? isSocialAccount;
  final String? lastLoginDate;
  final String? lastName;
  final String? nationalityCode;
  final String password;
  final String? phone;
  final String? profileImageUrl;
  final List<Role>? roles;
  final String? username;

  User({
    this.baseUserId,
    this.birthDate,
    this.currencyCode,
    this.email,
    this.fax,
    this.firstName,
    this.genderType,
    this.identityNumber,
    this.isSocialAccount,
    this.lastLoginDate,
    this.lastName,
    this.nationalityCode,
    required this.password,
    this.phone,
    this.profileImageUrl,
    this.roles,
    required this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
