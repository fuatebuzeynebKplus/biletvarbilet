class VersionModel {
  String android;
  String ios;

  VersionModel({required this.android, required this.ios});

  factory VersionModel.fromJson(jsonData) {
    return VersionModel(
      android: jsonData['android'],
      ios: jsonData['ios'],
    );
  }
}
