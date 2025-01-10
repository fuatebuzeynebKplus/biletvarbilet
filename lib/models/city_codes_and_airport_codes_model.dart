class CityCodesAndAirportCodesModel {
  String? toCityCode;
  String? toAirportCode;
  String? fromCityCode;
  String? fromAirportCode;

  CityCodesAndAirportCodesModel(
      {this.toCityCode,
      this.toAirportCode,
      this.fromCityCode,
      this.fromAirportCode});

  factory CityCodesAndAirportCodesModel.fromJson(jsonData) {
    return CityCodesAndAirportCodesModel(
      toCityCode: jsonData['toCityCode'],
      toAirportCode: jsonData['toAirportCode'],
      fromCityCode: jsonData['fromCityCode'],
      fromAirportCode: jsonData['fromAirportCode'],
    );
  }
}
