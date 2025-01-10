import 'package:bamobile1/common/data/enums/product_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_contract.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ProductContract {
  ProductType? productType;
  String? content;

  ProductContract({this.content, this.productType});

  factory ProductContract.fromJson(Map<String, dynamic> json) =>
      _$ProductContractFromJson(json);

  Map<String, dynamic> toJson() => _$ProductContractToJson(this);
}

class ProductContractJson {
  ProductContract request;

  ProductContractJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
