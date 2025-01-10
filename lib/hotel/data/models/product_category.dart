import 'package:bamobile1/hotel/data/models/language_value.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_category.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class ProductCategory {
  String? code;
  List<LanguageValue>? names;
  List<String>? subCategoryCodes;
  String? searchingWords;
  int? rating;

  ProductCategory(
      {this.code,
      this.names,
      this.rating,
      this.searchingWords,
      this.subCategoryCodes});

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}

class ProductCategoryJson {
  ProductCategory request;

  ProductCategoryJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
