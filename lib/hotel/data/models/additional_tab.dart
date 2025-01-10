import 'package:json_annotation/json_annotation.dart';

part 'additional_tab.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class AdditionalTab {
  String? title;
  String? subject;

  AdditionalTab({this.subject, this.title});

  factory AdditionalTab.fromJson(Map<String, dynamic> json) =>
      _$AdditionalTabFromJson(json);

  Map<String, dynamic> toJson() => _$AdditionalTabToJson(this);
}

class AdditionalTypeJson {
  AdditionalTab request;

  AdditionalTypeJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
