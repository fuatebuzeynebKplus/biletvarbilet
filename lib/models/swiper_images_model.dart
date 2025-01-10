class SwiperModel {
  String? image;
  String? url;

  SwiperModel({
    required this.image,
    required this.url,
  });

  factory SwiperModel.fromJson(jsonData) {
    return SwiperModel(
      image: jsonData['image'],
      url: jsonData['url'],
    );
  }
}
