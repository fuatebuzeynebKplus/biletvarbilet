import 'package:bamobile1/common/data/enums/extra_service_type.dart';
import 'package:bamobile1/common/data/enums/price_operation_type.dart';

import 'package:json_annotation/json_annotation.dart';

part 'additional_service_data.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class AdditionalServiceData {
  String? temporaryKey;
  int? id;
  ExtraServiceType? extraServiceType;
  int? providerId;
  PriceOperationType? priceOperationType;

  AdditionalServiceData(
      {this.extraServiceType,
      this.id,
      this.priceOperationType,
      this.providerId,
      this.temporaryKey});

  factory AdditionalServiceData.fromJson(Map<String, dynamic> json) =>
      _$AdditionalServiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalServiceDataToJson(this);
}

class AdditionalServiceDataJson {
  AdditionalServiceData request;

  AdditionalServiceDataJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
