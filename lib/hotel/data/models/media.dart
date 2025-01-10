import 'package:bamobile1/common/data/enums/media_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class Media {
  MediaType? mediaType;
  String? title;
  String? url;

  Media({this.mediaType, this.title, this.url});

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}

class MediaJson {
  Media request;

  MediaJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
