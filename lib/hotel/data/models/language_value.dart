import 'package:json_annotation/json_annotation.dart';

part 'language_value.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class LanguageValue {
  String? languageCode;
  String? value;

  LanguageValue({this.languageCode, this.value});

  factory LanguageValue.fromJson(Map<String, dynamic> json) =>
      _$LanguageValueFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageValueToJson(this);
}

class LanguageValueJson {
  LanguageValue request;

  LanguageValueJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
