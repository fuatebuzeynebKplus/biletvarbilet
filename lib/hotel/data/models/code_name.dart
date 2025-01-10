import 'package:json_annotation/json_annotation.dart';

part 'code_name.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CodeName {
  String? code;
  String? name;

  CodeName({this.code, this.name});

  factory CodeName.fromJson(Map<String, dynamic> json) =>
      _$CodeNameFromJson(json);

  Map<String, dynamic> toJson() => _$CodeNameToJson(this);
}

class CodeNameJson {
  CodeName request;

  CodeNameJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
