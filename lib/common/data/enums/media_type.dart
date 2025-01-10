import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum MediaType {
  image(0, 'Image'),
  video(1, 'Video');

  final int value;
  final String description;

  const MediaType(this.value, this.description);

  String toString() => description;

  static MediaType fromJson(int value) {
    switch (value) {
      case 0:
        return image;
      case 1:
        return video;
      default:
        throw ArgumentError.value(value, 'value');
    }
  }
}
