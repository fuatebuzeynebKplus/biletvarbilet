class HotelDetailsResultModel {
  HotelDetailsResultModel({
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
  final ResultHotelDetails? result;
  final int? resultCount;
  final dynamic userFriendlyErrorMessage;

  factory HotelDetailsResultModel.fromJson(Map<String, dynamic> json) {
    return HotelDetailsResultModel(
      cacheHashCode: json["CacheHashCode"],
      resultDate: json["ResultDate"],
      resultExpireDate: json["ResultExpireDate"],
      errorCode: json["ErrorCode"],
      errorMessage: json["ErrorMessage"],
      errorType: json["ErrorType"],
      hasError: json["HasError"],
      result: json["Result"] == null
          ? null
          : ResultHotelDetails.fromJson(json["Result"]),
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
        "Result": result?.toJson(),
        "ResultCount": resultCount,
        "UserFriendlyErrorMessage": userFriendlyErrorMessage,
      };
}

class ResultHotelDetails {
  ResultHotelDetails({
    required this.rating,
    required this.searchingWords,
    required this.additionalTabs,
    required this.address,
    required this.geoLocation,
    required this.hotelCategories,
    required this.hotelCode,
    required this.hotelDistances,
    required this.hotelFacilities,
    required this.hotelImages,
    required this.hotelName,
    required this.seoInformation,
    required this.star,
    required this.summaryText,
  });

  final int? rating;
  final dynamic searchingWords;
  final List<dynamic> additionalTabs;
  final String? address;
  final GeoLocation? geoLocation;
  final List<dynamic> hotelCategories;
  final String? hotelCode;
  final List<HotelDistance> hotelDistances;
  final List<HotelFacility> hotelFacilities;
  final List<HotelImage> hotelImages;
  final String? hotelName;
  final SeoInformation? seoInformation;
  final int? star;
  final String? summaryText;

  factory ResultHotelDetails.fromJson(Map<String, dynamic> json) {
    return ResultHotelDetails(
      rating: json["Rating"],
      searchingWords: json["SearchingWords"],
      additionalTabs: json["AdditionalTabs"] == null
          ? []
          : List<dynamic>.from(json["AdditionalTabs"]!.map((x) => x)),
      address: json["Address"],
      geoLocation: json["GeoLocation"] == null
          ? null
          : GeoLocation.fromJson(json["GeoLocation"]),
      hotelCategories: json["HotelCategories"] == null
          ? []
          : List<dynamic>.from(json["HotelCategories"]!.map((x) => x)),
      hotelCode: json["HotelCode"],
      hotelDistances: json["HotelDistances"] == null
          ? []
          : List<HotelDistance>.from(
              json["HotelDistances"]!.map((x) => HotelDistance.fromJson(x))),
      hotelFacilities: json["HotelFacilities"] == null
          ? []
          : List<HotelFacility>.from(
              json["HotelFacilities"]!.map((x) => HotelFacility.fromJson(x))),
      hotelImages: json["HotelImages"] == null
          ? []
          : List<HotelImage>.from(
              json["HotelImages"]!.map((x) => HotelImage.fromJson(x))),
      hotelName: json["HotelName"],
      seoInformation: json["SeoInformation"] == null
          ? null
          : SeoInformation.fromJson(json["SeoInformation"]),
      star: json["Star"],
      summaryText: json["SummaryText"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Rating": rating,
        "SearchingWords": searchingWords,
        "AdditionalTabs": additionalTabs.map((x) => x).toList(),
        "Address": address,
        "GeoLocation": geoLocation?.toJson(),
        "HotelCategories": hotelCategories.map((x) => x).toList(),
        "HotelCode": hotelCode,
        "HotelDistances": hotelDistances.map((x) => x.toJson()).toList(),
        "HotelFacilities": hotelFacilities.map((x) => x.toJson()).toList(),
        "HotelImages": hotelImages.map((x) => x.toJson()).toList(),
        "HotelName": hotelName,
        "SeoInformation": seoInformation?.toJson(),
        "Star": star,
        "SummaryText": summaryText,
      };
}

class GeoLocation {
  GeoLocation({
    required this.latitude,
    required this.longitude,
  });

  final dynamic latitude;
  final dynamic longitude;

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      latitude: json["Latitude"],
      longitude: json["Longitude"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Latitude": latitude,
        "Longitude": longitude,
      };
}

class HotelDistance {
  HotelDistance({
    required this.code,
    required this.description,
    required this.distance,
    required this.name,
    required this.unitType,
  });

  final String? code;
  final String? description;
  final dynamic distance;
  final String? name;
  final int? unitType;

  factory HotelDistance.fromJson(Map<String, dynamic> json) {
    return HotelDistance(
      code: json["Code"],
      description: json["Description"],
      distance: json["Distance"],
      name: json["Name"],
      unitType: json["UnitType"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Code": code,
        "Description": description,
        "Distance": distance,
        "Name": name,
        "UnitType": unitType,
      };
}

class HotelFacility {
  HotelFacility({
    required this.code,
    required this.feeType,
    required this.groupCode,
    required this.groupName,
    required this.name,
  });

  final String? code;
  final int? feeType;
  final String? groupCode;
  final String? groupName;
  final String? name;

  factory HotelFacility.fromJson(Map<String, dynamic> json) {
    return HotelFacility(
      code: json["Code"],
      feeType: json["FeeType"],
      groupCode: json["GroupCode"],
      groupName: json["GroupName"],
      name: json["Name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Code": code,
        "FeeType": feeType,
        "GroupCode": groupCode,
        "GroupName": groupName,
        "Name": name,
      };
}

class HotelImage {
  HotelImage({
    required this.imageTitle,
    required this.imageType,
    required this.imageUrl,
  });

  final String? imageTitle;
  final int? imageType;
  final String? imageUrl;

  factory HotelImage.fromJson(Map<String, dynamic> json) {
    return HotelImage(
      imageTitle: json["ImageTitle"],
      imageType: json["ImageType"],
      imageUrl: json["ImageUrl"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ImageTitle": imageTitle,
        "ImageType": imageType,
        "ImageUrl": imageUrl,
      };
}

class SeoInformation {
  SeoInformation({
    required this.description,
    required this.keywords,
    required this.title,
  });

  final dynamic description;
  final dynamic keywords;
  final dynamic title;

  factory SeoInformation.fromJson(Map<String, dynamic> json) {
    return SeoInformation(
      description: json["Description"],
      keywords: json["Keywords"],
      title: json["Title"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Description": description,
        "Keywords": keywords,
        "Title": title,
      };
}
