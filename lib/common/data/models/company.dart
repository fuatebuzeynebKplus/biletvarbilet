import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/models/invoice_info.dart';

part 'company.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class Company {
  final String? accountingCode;
  final String? address;
  final String? cityCode;
  final String? cityName;
  final String? code;
  final String? countryCode;
  final String? countryName;
  final String? email;
  final String? fax;
  final InvoiceInfo? invoiceInfo;
  final String? logoUrl;
  final String? mobilPhone;
  final String? name;
  final String? note;
  final String? phone;
  final String? region;

  Company(
      {required this.accountingCode,
      this.address,
      required this.cityCode,
      required this.cityName,
      required this.code,
      required this.countryCode,
      required this.countryName,
      required this.email,
      this.fax,
      this.invoiceInfo,
      this.logoUrl,
      this.mobilPhone,
      this.name,
      this.note,
      this.phone,
      this.region});

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
