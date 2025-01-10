import 'package:bamobile1/common/data/enums/provider_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_data_request.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class SearchDataRequest {
  String? cityCode;
  List<String>? codes;
  String? countryCode;
  String? firstCode;
  bool? getAllItems;
  ProviderType? providerType;
  String? searchKey;
  String? tokenCode;

  SearchDataRequest({
    this.cityCode,
    this.codes,
    this.countryCode,
    this.firstCode,
    this.getAllItems,
    this.providerType,
    this.searchKey,
    this.tokenCode,
  });

  factory SearchDataRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchDataRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchDataRequestToJson(this);
}
