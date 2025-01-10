class AdminEmailModel {
  String email;

  AdminEmailModel({required this.email});

  factory AdminEmailModel.fromJson(jsonData) {
    return AdminEmailModel(
      email: jsonData['email'],
    );
  }
}
