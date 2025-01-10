class GetHotelRoomCancellationPoliciesModel {
  GetHotelRoomCancellationPoliciesModel({
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
  final List<ResultRoomCancellationPoliciesModel> result;
  final int? resultCount;
  final dynamic userFriendlyErrorMessage;

  factory GetHotelRoomCancellationPoliciesModel.fromJson(
      Map<String, dynamic> json) {
    return GetHotelRoomCancellationPoliciesModel(
      cacheHashCode: json["CacheHashCode"],
      resultDate: json["ResultDate"],
      resultExpireDate: json["ResultExpireDate"],
      errorCode: json["ErrorCode"],
      errorMessage: json["ErrorMessage"],
      errorType: json["ErrorType"],
      hasError: json["HasError"],
      result: json["Result"] == null
          ? []
          : List<ResultRoomCancellationPoliciesModel>.from(json["Result"]!
              .map((x) => ResultRoomCancellationPoliciesModel.fromJson(x))),
      resultCount: json["ResultCount"],
      userFriendlyErrorMessage: json["UserFriendlyErrorMessage"],
    );
  }

  Map<String, dynamic> toJson() => {
        "CacheHashCode": cacheHashCode,
        "ResultDate": resultDate,
        "ResultExpireDate": resultExpireDate,
        "ErrorCode": errorCode,
        "ErrorMessage": errorMessage,
        "ErrorType": errorType,
        "HasError": hasError,
        "Result": result.map((x) => x.toJson()).toList(),
        "ResultCount": resultCount,
        "UserFriendlyErrorMessage": userFriendlyErrorMessage,
      };
}

class ResultRoomCancellationPoliciesModel {
  ResultRoomCancellationPoliciesModel({
    required this.currencyCode,
    required this.endDate,
    required this.id,
    required this.penaltyAmount,
    required this.penaltyBuyAmount,
    required this.policyDescription,
    required this.policyType,
    required this.roomCode,
    required this.startDate,
  });

  final String? currencyCode;
  final DateTime? endDate;
  final int? id;
  final dynamic penaltyAmount;
  final dynamic penaltyBuyAmount;
  final String? policyDescription;
  final String? policyType;
  final String? roomCode;
  final DateTime? startDate;

  factory ResultRoomCancellationPoliciesModel.fromJson(
      Map<String, dynamic> json) {
    return ResultRoomCancellationPoliciesModel(
      currencyCode: json["CurrencyCode"],
      endDate: DateTime.tryParse(json["EndDate"] ?? ""),
      id: json["Id"],
      penaltyAmount: json["PenaltyAmount"],
      penaltyBuyAmount: json["PenaltyBuyAmount"],
      policyDescription: json["PolicyDescription"],
      policyType: json["PolicyType"],
      roomCode: json["RoomCode"],
      startDate: DateTime.tryParse(json["StartDate"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "CurrencyCode": currencyCode,
        "EndDate": endDate?.toIso8601String(),
        "Id": id,
        "PenaltyAmount": penaltyAmount,
        "PenaltyBuyAmount": penaltyBuyAmount,
        "PolicyDescription": policyDescription,
        "PolicyType": policyType,
        "RoomCode": roomCode,
        "StartDate": startDate?.toIso8601String(),
      };
}
