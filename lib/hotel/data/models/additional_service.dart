import 'package:bamobile1/common/data/enums/additional_service_icon_type.dart';
import 'package:bamobile1/common/data/enums/per_calculation_type.dart';
import 'package:bamobile1/hotel/data/models/additional_service_data.dart';
import 'package:bamobile1/hotel/data/models/media.dart';
import 'package:bamobile1/flight/data/models/price.dart';
import 'package:json_annotation/json_annotation.dart';

part 'additional_service.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class AdditionalService {
  String? code;
  String? name;
  AdditionalServiceIconType? iconType;
  bool? isMandatory;
  bool? selected;
  PerCalculationType? perCalculationType;
  Price? price;
  String? description;
  List<Media>? medias;
  AdditionalServiceData? data;
  int? count;
  int? macCount;

  AdditionalService({
    this.code,
    this.count,
    this.iconType,
    this.data,
    this.description,
    this.isMandatory,
    this.macCount,
    this.medias,
    this.name,
    this.perCalculationType,
    this.price,
    this.selected,
  });

  factory AdditionalService.fromJson(Map<String, dynamic> json) =>
      _$AdditionalServiceFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalServiceToJson(this);
}

class AdditionalServiceJson {
  AdditionalService request;

  AdditionalServiceJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
