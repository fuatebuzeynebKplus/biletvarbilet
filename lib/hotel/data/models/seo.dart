import 'package:json_annotation/json_annotation.dart';

part 'seo.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Seo {
  String? title;
  String? description;
  String? keywords;

  Seo({this.description, this.keywords, this.title});

  factory Seo.fromJson(Map<String, dynamic> json) => _$SeoFromJson(json);

  Map<String, dynamic> toJson() => _$SeoToJson(this);
}

class SeoJson {
  Seo request;

  SeoJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
