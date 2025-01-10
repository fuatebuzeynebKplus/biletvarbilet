class CurrencyModel {
  CurrencyModel({
    required this.cacheHashCode,
    required this.resultDate,
    required this.resultExpireDate,
    required this.errorCode,
    required this.errorMessage,
    required this.errorType,
    required this.hasError,
    required this.result,
    required this.resultCount,
    required this.userFriendlyErrorMessage,
  });

  final dynamic cacheHashCode;
  final dynamic resultDate;
  final dynamic resultExpireDate;
  final dynamic errorCode;
  final dynamic errorMessage;
  final int? errorType;
  final bool? hasError;
  final List<Result> result;
  final int? resultCount;
  final dynamic userFriendlyErrorMessage;

  factory CurrencyModel.fromJson(Map<String, dynamic> json) {
    return CurrencyModel(
      cacheHashCode: json["CacheHashCode"],
      resultDate: json["ResultDate"],
      resultExpireDate: json["ResultExpireDate"],
      errorCode: json["ErrorCode"],
      errorMessage: json["ErrorMessage"],
      errorType: json["ErrorType"],
      hasError: json["HasError"],
      result: json["Result"] == null
          ? []
          : List<Result>.from(json["Result"]!.map((x) => Result.fromJson(x))),
      resultCount: json["ResultCount"],
      userFriendlyErrorMessage: json["UserFriendlyErrorMessage"],
    );
  }
}

class Result {
  Result({
    required this.rating,
    required this.searchingWords,
    required this.code,
    required this.currencyRate,
    required this.currencyRateDate,
    required this.fixedBaseCurrencyCode,
    required this.groupId,
    required this.internationalCode,
    required this.name,
    required this.orderNo,
    required this.statusType,
    required this.symbolId,
    required this.updateDate,
  });

  final int? rating;
  final String? searchingWords;
  final String? code;
  final double? currencyRate;
  final DateTime? currencyRateDate;
  final String? fixedBaseCurrencyCode;
  final String? groupId;
  final String? internationalCode;
  final String? name;
  final int? orderNo;
  final int? statusType;
  final int? symbolId;
  final DateTime? updateDate;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      rating: json["Rating"],
      searchingWords: json["SearchingWords"],
      code: json["Code"],
      currencyRate: json["CurrencyRate"],
      currencyRateDate: DateTime.tryParse(json["CurrencyRateDate"] ?? ""),
      fixedBaseCurrencyCode: json["FixedBaseCurrencyCode"],
      groupId: json["GroupId"],
      internationalCode: json["InternationalCode"],
      name: json["Name"],
      orderNo: json["OrderNo"],
      statusType: json["StatusType"],
      symbolId: json["SymbolId"],
      updateDate: DateTime.tryParse(json["UpdateDate"] ?? ""),
    );
  }
}
