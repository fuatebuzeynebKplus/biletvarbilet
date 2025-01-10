import 'package:json_annotation/json_annotation.dart';

part 'product_general_request.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ProductGeneralRequest {
  String? languageCode;
  String? productCode;
  List<String>? resultKeys;
  String? searchKeys;
  String? tokenCode;

  ProductGeneralRequest({
    this.languageCode,
    this.productCode,
    this.resultKeys,
    this.searchKeys,
    this.tokenCode,
  });

  factory ProductGeneralRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductGeneralRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ProductGeneralRequestToJson(this);
}
