import 'package:bamobile1/hotel/data/models/additional_provider_information.dart';
import 'package:json_annotation/json_annotation.dart';

part 'additional_information.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class AdditionalInformation {
  List<AdditionalProviderInformation>? providerInformations;

  AdditionalInformation({this.providerInformations});

  factory AdditionalInformation.fromJson(Map<String, dynamic> json) =>
      _$AdditionalInformationFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalInformationToJson(this);
}

class AdditionalInformationJson {
  AdditionalInformation request;

  AdditionalInformationJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
