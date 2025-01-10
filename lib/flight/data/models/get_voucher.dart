import 'package:json_annotation/json_annotation.dart';

part 'get_voucher.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class GetVoucher {
  String tokenCode;
  String systemPnr;
  String lastName;
  int productType;
  String languageCode;
  bool withPrice;
  GetVoucher(
      {required this.tokenCode,
      required this.systemPnr,
      required this.lastName,
      required this.productType,
      required this.languageCode,
      required this.withPrice});

  factory GetVoucher.fromJson(Map<String, dynamic> json) =>
      _$GetVoucherFromJson(json);

  Map<String, dynamic> toJson() => _$GetVoucherToJson(this);
}

class GetVoucherJson {
  GetVoucher request;

  GetVoucherJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
