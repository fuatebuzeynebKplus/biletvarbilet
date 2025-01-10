import "package:bamobile1/flight/data/models/air_advanced_search.dart";
import "package:bamobile1/flight/data/models/corporate.dart";
import "package:bamobile1/flight/data/models/markup.dart";
import 'package:json_annotation/json_annotation.dart';

part 'advanced_options.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class AdvancedOptions {
  AirAdvancedSearch? air;
  Markup? markup;
  String? languageCode;
  Corporate? corporate;

  AdvancedOptions(
      {required this.air, this.markup, this.languageCode, this.corporate});

  factory AdvancedOptions.fromJson(Map<String, dynamic> json) {
    return _$AdvancedOptionsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AdvancedOptionsToJson(this);
  }
}
