import 'package:json_annotation/json_annotation.dart';

part 'hotel_image.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelImage {
  String? imageUrl;
  int? imageType;
  String? imageTitle;

  HotelImage({this.imageTitle, this.imageType, this.imageUrl});

  factory HotelImage.fromJson(Map<String, dynamic> json) =>
      _$HotelImageFromJson(json);

  Map<String, dynamic> toJson() => _$HotelImageToJson(this);
}

class HotelImageJson {
  HotelImage request;

  HotelImageJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
