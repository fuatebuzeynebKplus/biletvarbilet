import 'package:json_annotation/json_annotation.dart';

part 'additional_provider_information.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class AdditionalProviderInformation {
  String? code;
  int? count;

  AdditionalProviderInformation({this.code, this.count});

  factory AdditionalProviderInformation.fromJson(Map<String, dynamic> json) =>
      _$AdditionalProviderInformationFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalProviderInformationToJson(this);
}

class AdditionalProviderInformationJson {
  AdditionalProviderInformation request;

  AdditionalProviderInformationJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
