class MileageProgram {
  String airlineCode;
  String mileageNumber;

  MileageProgram({required this.airlineCode, required this.mileageNumber});

  // يمكنك إضافة دوال إضافية مثل منطق الـ toJson و fromJson إذا كنت تستخدم JsonSerializable
  factory MileageProgram.fromJson(Map<String, dynamic> json) {
    return MileageProgram(
      airlineCode: json['AirlineCode'],
      mileageNumber: json['MileageNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'AirlineCode': airlineCode,
      'MileageNumber': mileageNumber,
    };
  }
}
