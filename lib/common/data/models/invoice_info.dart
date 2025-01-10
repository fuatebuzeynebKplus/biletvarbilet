import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/enums/invoice_info_type.dart';

part 'invoice_info.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class InvoiceInfo {
  String? address;
  String? cityCode;
  String? cityName;
  String? companyName;
  String? countryCode;
  String? firstName;
  String? invoiceInfoTitle;
  InvoiceInfoType? invoiceInfoType;
  String? lastName;
  String? postalCode;
  int? recId;
  int? statusType;
  String? taxNumber;
  String? taxOffice;

  InvoiceInfo(
      {this.address,
      this.cityCode,
      this.cityName,
      this.companyName,
      this.countryCode,
      this.firstName,
      this.invoiceInfoTitle,
      this.invoiceInfoType,
      this.lastName,
      this.postalCode,
      this.recId,
      this.statusType,
      this.taxNumber,
      this.taxOffice});
  // final String? address;
  // final String? cityCode;
  // final String? cityName;
  // final String? companyName;
  // final String? countryCode;
  // final String? firstName;
  // final String? lastName;
  // final String? invoiceInfoTitle;
  // final InvoiceInfoType? invoiceInfoType;
  // final String? postalCode;
  // final String? taxNumber;
  // final String? taxOffice;

  // InvoiceInfo({
  //   this.address,
  //   this.cityCode,
  //   this.cityName,
  //   this.companyName,
  //   this.countryCode,
  //   this.firstName,
  //   this.lastName,
  //   this.invoiceInfoTitle,
  //   this.invoiceInfoType,
  //   this.postalCode,
  //   this.taxNumber,
  //   this.taxOffice,
  // });

  factory InvoiceInfo.fromJson(Map<String, dynamic> json) =>
      _$InvoiceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$InvoiceInfoToJson(this);
}
