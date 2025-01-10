class GetValidateHotelRoomsModel {
  GetValidateHotelRoomsModel({
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
  final dynamic errorType;
  final bool? hasError;
  final Result? result;
  final dynamic resultCount;
  final dynamic userFriendlyErrorMessage;

  factory GetValidateHotelRoomsModel.fromJson(Map<String, dynamic> json) {
    return GetValidateHotelRoomsModel(
      cacheHashCode: json["CacheHashCode"],
      resultDate: json["ResultDate"],
      resultExpireDate: json["ResultExpireDate"],
      errorCode: json["ErrorCode"],
      errorMessage: json["ErrorMessage"],
      errorType: json["ErrorType"],
      hasError: json["HasError"],
      result: json["Result"] == null ? null : Result.fromJson(json["Result"]),
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

class Result {
  Result({
    required this.cacheHashCode,
    required this.resultDate,
    required this.resultExpireDate,
    required this.additionalInformation,
    required this.contracts,
    required this.hotels,
    required this.isFinished,
    required this.searchFilter,
    required this.searchKey,
  });

  final dynamic cacheHashCode;
  final DateTime? resultDate;
  final DateTime? resultExpireDate;
  final dynamic additionalInformation;
  final List<Contract> contracts;
  final List<HotelElementValidate> hotels;
  final bool? isFinished;
  final SearchFilter? searchFilter;
  final String? searchKey;

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      cacheHashCode: json["CacheHashCode"],
      resultDate: DateTime.tryParse(json["ResultDate"] ?? ""),
      resultExpireDate: DateTime.tryParse(json["ResultExpireDate"] ?? ""),
      additionalInformation: json["AdditionalInformation"],
      contracts: json["Contracts"] == null
          ? []
          : List<Contract>.from(
              json["Contracts"]!.map((x) => Contract.fromJson(x))),
      hotels: json["Hotels"] == null
          ? []
          : List<HotelElementValidate>.from(
              json["Hotels"]!.map((x) => HotelElementValidate.fromJson(x))),
      isFinished: json["IsFinished"],
      searchFilter: json["SearchFilter"] == null
          ? null
          : SearchFilter.fromJson(json["SearchFilter"]),
      searchKey: json["SearchKey"],
    );
  }

  Map<String, dynamic> toJson() => {
        "CacheHashCode": cacheHashCode,
        "ResultDate": resultDate?.toIso8601String(),
        "ResultExpireDate": resultExpireDate?.toIso8601String(),
        "AdditionalInformation": additionalInformation,
        "Contracts": contracts.map((x) => x.toJson()).toList(),
        "Hotels": hotels.map((x) => x.toJson()).toList(),
        "IsFinished": isFinished,
        "SearchFilter": searchFilter?.toJson(),
        "SearchKey": searchKey,
      };
}

class Contract {
  Contract({
    required this.content,
    required this.productType,
  });

  final String? content;
  final dynamic productType;

  factory Contract.fromJson(Map<String, dynamic> json) {
    return Contract(
      content: json["Content"],
      productType: json["ProductType"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Content": content,
        "ProductType": productType,
      };
}

class HotelElementValidate {
  HotelElementValidate({
    required this.data,
    required this.hotel,
    required this.rooms,
  });

  final dynamic data;
  final HotelHotel? hotel;
  final List<HotelRoom> rooms;

  factory HotelElementValidate.fromJson(Map<String, dynamic> json) {
    return HotelElementValidate(
      data: json["Data"],
      hotel: json["Hotel"] == null ? null : HotelHotel.fromJson(json["Hotel"]),
      rooms: json["Rooms"] == null
          ? []
          : List<HotelRoom>.from(
              json["Rooms"]!.map((x) => HotelRoom.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "Data": data,
        "Hotel": hotel?.toJson(),
        "Rooms": rooms.map((x) => x.toJson()).toList(),
      };
}

class HotelHotel {
  HotelHotel({
    required this.rating,
    required this.searchingWords,
    required this.address,
    required this.categoryName,
    required this.countryCode,
    required this.destinationId,
    required this.email,
    required this.fax,
    required this.fullLocation,
    required this.geoLocation,
    required this.hotelCode,
    required this.hotelImageUrl,
    required this.hotelName,
    required this.location,
    required this.phone,
    required this.relatedDestinationIds,
    required this.star,
  });

  final dynamic rating;
  final dynamic searchingWords;
  final String? address;
  final String? categoryName;
  final String? countryCode;
  final dynamic destinationId;
  final String? email;
  final String? fax;
  final String? fullLocation;
  final GeoLocation? geoLocation;
  final String? hotelCode;
  final String? hotelImageUrl;
  final String? hotelName;
  final String? location;
  final String? phone;
  final List<int> relatedDestinationIds;
  final dynamic star;

  factory HotelHotel.fromJson(Map<String, dynamic> json) {
    return HotelHotel(
      rating: json["Rating"],
      searchingWords: json["SearchingWords"],
      address: json["Address"],
      categoryName: json["CategoryName"],
      countryCode: json["CountryCode"],
      destinationId: json["DestinationId"],
      email: json["Email"],
      fax: json["Fax"],
      fullLocation: json["FullLocation"],
      geoLocation: json["GeoLocation"] == null
          ? null
          : GeoLocation.fromJson(json["GeoLocation"]),
      hotelCode: json["HotelCode"],
      hotelImageUrl: json["HotelImageURL"],
      hotelName: json["HotelName"],
      location: json["Location"],
      phone: json["Phone"],
      relatedDestinationIds: json["RelatedDestinationIds"] == null
          ? []
          : List<int>.from(json["RelatedDestinationIds"]!.map((x) => x)),
      star: json["Star"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Rating": rating,
        "SearchingWords": searchingWords,
        "Address": address,
        "CategoryName": categoryName,
        "CountryCode": countryCode,
        "DestinationId": destinationId,
        "Email": email,
        "Fax": fax,
        "FullLocation": fullLocation,
        "GeoLocation": geoLocation?.toJson(),
        "HotelCode": hotelCode,
        "HotelImageURL": hotelImageUrl,
        "HotelName": hotelName,
        "Location": location,
        "Phone": phone,
        "RelatedDestinationIds": relatedDestinationIds.map((x) => x).toList(),
        "Star": star,
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

class HotelRoom {
  HotelRoom({
    required this.roomAlternatives,
    required this.roomIndex,
  });

  final List<RoomAlternative> roomAlternatives;
  final dynamic roomIndex;

  factory HotelRoom.fromJson(Map<String, dynamic> json) {
    return HotelRoom(
      roomAlternatives: json["RoomAlternatives"] == null
          ? []
          : List<RoomAlternative>.from(json["RoomAlternatives"]!
              .map((x) => RoomAlternative.fromJson(x))),
      roomIndex: json["RoomIndex"],
    );
  }

  Map<String, dynamic> toJson() => {
        "RoomAlternatives": roomAlternatives.map((x) => x.toJson()).toList(),
        "RoomIndex": roomIndex,
      };
}

class RoomAlternative {
  RoomAlternative({
    required this.addOn,
    required this.additionalServices,
    required this.agentCommissions,
    required this.allotment,
    required this.approvalType,
    required this.baseAmount,
    required this.boardCode,
    required this.boardName,
    required this.campaigns,
    required this.cancellationPolicies,
    required this.combinationId,
    required this.commission,
    required this.currencyCode,
    required this.currencyRate,
    required this.daliyPrices,
    required this.data,
    required this.discountAmount,
    required this.hotelRateType,
    required this.kickBack,
    required this.kickBacks,
    required this.medias,
    required this.originalCommission,
    required this.packageDifferenceAmount,
    required this.paxes,
    required this.provider,
    required this.providerCommission,
    required this.remarks,
    required this.roomCode,
    required this.roomName,
    required this.serviceFee,
    required this.specialOffers,
    required this.taxAmount,
    required this.totalAmount,
    required this.totalStrikeAmount,
  });

  final dynamic addOn;
  final dynamic additionalServices;
  final dynamic agentCommissions;
  final dynamic allotment;
  final dynamic approvalType;
  final dynamic baseAmount;
  final String? boardCode;
  final String? boardName;
  final dynamic campaigns;
  final List<CancellationPolicy> cancellationPolicies;
  final String? combinationId;
  final dynamic commission;
  final String? currencyCode;
  final dynamic currencyRate;
  final List<dynamic> daliyPrices;
  final dynamic data;
  final dynamic discountAmount;
  final dynamic hotelRateType;
  final dynamic kickBack;
  final List<dynamic> kickBacks;
  final dynamic medias;
  final dynamic originalCommission;
  final dynamic packageDifferenceAmount;
  final dynamic paxes;
  final dynamic provider;
  final dynamic providerCommission;
  final String? remarks;
  final String? roomCode;
  final String? roomName;
  final dynamic serviceFee;
  final List<dynamic> specialOffers;
  final dynamic taxAmount;
  final dynamic totalAmount;
  final dynamic totalStrikeAmount;

  factory RoomAlternative.fromJson(Map<String, dynamic> json) {
    return RoomAlternative(
      addOn: json["AddOn"],
      additionalServices: json["AdditionalServices"],
      agentCommissions: json["AgentCommissions"],
      allotment: json["Allotment"],
      approvalType: json["ApprovalType"],
      baseAmount: json["BaseAmount"],
      boardCode: json["BoardCode"],
      boardName: json["BoardName"],
      campaigns: json["Campaigns"],
      cancellationPolicies: json["CancellationPolicies"] == null
          ? []
          : List<CancellationPolicy>.from(json["CancellationPolicies"]!
              .map((x) => CancellationPolicy.fromJson(x))),
      combinationId: json["CombinationId"],
      commission: json["Commission"],
      currencyCode: json["CurrencyCode"],
      currencyRate: json["CurrencyRate"],
      daliyPrices: json["DaliyPrices"] == null
          ? []
          : List<dynamic>.from(json["DaliyPrices"]!.map((x) => x)),
      data: json["Data"],
      discountAmount: json["DiscountAmount"],
      hotelRateType: json["HotelRateType"],
      kickBack: json["KickBack"],
      kickBacks: json["KickBacks"] == null
          ? []
          : List<dynamic>.from(json["KickBacks"]!.map((x) => x)),
      medias: json["Medias"],
      originalCommission: json["OriginalCommission"],
      packageDifferenceAmount: json["PackageDifferenceAmount"],
      paxes: json["Paxes"],
      provider: json["Provider"],
      providerCommission: json["ProviderCommission"],
      remarks: json["Remarks"],
      roomCode: json["RoomCode"],
      roomName: json["RoomName"],
      serviceFee: json["ServiceFee"],
      specialOffers: json["SpecialOffers"] == null
          ? []
          : List<dynamic>.from(json["SpecialOffers"]!.map((x) => x)),
      taxAmount: json["TaxAmount"],
      totalAmount: json["TotalAmount"],
      totalStrikeAmount: json["TotalStrikeAmount"],
    );
  }

  Map<String, dynamic> toJson() => {
        "AddOn": addOn,
        "AdditionalServices": additionalServices,
        "AgentCommissions": agentCommissions,
        "Allotment": allotment,
        "ApprovalType": approvalType,
        "BaseAmount": baseAmount,
        "BoardCode": boardCode,
        "BoardName": boardName,
        "Campaigns": campaigns,
        "CancellationPolicies":
            cancellationPolicies.map((x) => x.toJson()).toList(),
        "CombinationId": combinationId,
        "Commission": commission,
        "CurrencyCode": currencyCode,
        "CurrencyRate": currencyRate,
        "DaliyPrices": daliyPrices.map((x) => x).toList(),
        "Data": data,
        "DiscountAmount": discountAmount,
        "HotelRateType": hotelRateType,
        "KickBack": kickBack,
        "KickBacks": kickBacks.map((x) => x).toList(),
        "Medias": medias,
        "OriginalCommission": originalCommission,
        "PackageDifferenceAmount": packageDifferenceAmount,
        "Paxes": paxes,
        "Provider": provider,
        "ProviderCommission": providerCommission,
        "Remarks": remarks,
        "RoomCode": roomCode,
        "RoomName": roomName,
        "ServiceFee": serviceFee,
        "SpecialOffers": specialOffers.map((x) => x).toList(),
        "TaxAmount": taxAmount,
        "TotalAmount": totalAmount,
        "TotalStrikeAmount": totalStrikeAmount,
      };
}

class CancellationPolicy {
  CancellationPolicy({
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
  final dynamic id;
  final dynamic penaltyAmount;
  final dynamic penaltyBuyAmount;
  final String? policyDescription;
  final String? policyType;
  final String? roomCode;
  final DateTime? startDate;

  factory CancellationPolicy.fromJson(Map<String, dynamic> json) {
    return CancellationPolicy(
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

class SearchFilter {
  SearchFilter({
    required this.advancedOptions,
    required this.checkInDate,
    required this.checkOutDate,
    required this.destinations,
    required this.hotels,
    required this.nationalityCode,
    required this.rooms,
    required this.searchKey,
    required this.showMultipleRate,
    required this.token,
  });

  final AdvancedOptions? advancedOptions;
  final String? checkInDate;
  final String? checkOutDate;
  final List<Destination> destinations;
  final dynamic hotels;
  final String? nationalityCode;
  final List<SearchFilterRoom> rooms;
  final String? searchKey;
  final bool? showMultipleRate;
  final Token? token;

  factory SearchFilter.fromJson(Map<String, dynamic> json) {
    return SearchFilter(
      advancedOptions: json["AdvancedOptions"] == null
          ? null
          : AdvancedOptions.fromJson(json["AdvancedOptions"]),
      checkInDate: json["CheckInDate"],
      checkOutDate: json["CheckOutDate"],
      destinations: json["Destinations"] == null
          ? []
          : List<Destination>.from(
              json["Destinations"]!.map((x) => Destination.fromJson(x))),
      hotels: json["Hotels"],
      nationalityCode: json["NationalityCode"],
      rooms: json["Rooms"] == null
          ? []
          : List<SearchFilterRoom>.from(
              json["Rooms"]!.map((x) => SearchFilterRoom.fromJson(x))),
      searchKey: json["SearchKey"],
      showMultipleRate: json["ShowMultipleRate"],
      token: json["Token"] == null ? null : Token.fromJson(json["Token"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "AdvancedOptions": advancedOptions?.toJson(),
        "CheckInDate": checkInDate,
        "CheckOutDate": checkOutDate,
        "Destinations": destinations.map((x) => x.toJson()).toList(),
        "Hotels": hotels,
        "NationalityCode": nationalityCode,
        "Rooms": rooms.map((x) => x.toJson()).toList(),
        "SearchKey": searchKey,
        "ShowMultipleRate": showMultipleRate,
        "Token": token?.toJson(),
      };
}

class AdvancedOptions {
  AdvancedOptions({
    required this.activity,
    required this.air,
    required this.corporate,
    required this.exchange,
    required this.hotel,
    required this.languageCode,
    required this.markup,
    required this.maxResponseTime,
    required this.priceCalculationType,
    required this.processId,
    required this.providerType,
    required this.rentACar,
    required this.searchModuleType,
    required this.searchProcessId,
    required this.tour,
    required this.transfer,
    required this.visa,
  });

  final dynamic activity;
  final dynamic air;
  final dynamic corporate;
  final dynamic exchange;
  final dynamic hotel;
  final String? languageCode;
  final dynamic markup;
  final dynamic maxResponseTime;
  final dynamic priceCalculationType;
  final String? processId;
  final dynamic providerType;
  final dynamic rentACar;
  final dynamic searchModuleType;
  final String? searchProcessId;
  final dynamic tour;
  final dynamic transfer;
  final dynamic visa;

  factory AdvancedOptions.fromJson(Map<String, dynamic> json) {
    return AdvancedOptions(
      activity: json["Activity"],
      air: json["Air"],
      corporate: json["Corporate"],
      exchange: json["Exchange"],
      hotel: json["Hotel"],
      languageCode: json["LanguageCode"],
      markup: json["Markup"],
      maxResponseTime: json["MaxResponseTime"],
      priceCalculationType: json["PriceCalculationType"],
      processId: json["ProcessId"],
      providerType: json["ProviderType"],
      rentACar: json["RentACar"],
      searchModuleType: json["SearchModuleType"],
      searchProcessId: json["SearchProcessId"],
      tour: json["Tour"],
      transfer: json["Transfer"],
      visa: json["Visa"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Activity": activity,
        "Air": air,
        "Corporate": corporate,
        "Exchange": exchange,
        "Hotel": hotel,
        "LanguageCode": languageCode,
        "Markup": markup,
        "MaxResponseTime": maxResponseTime,
        "PriceCalculationType": priceCalculationType,
        "ProcessId": processId,
        "ProviderType": providerType,
        "RentACar": rentACar,
        "SearchModuleType": searchModuleType,
        "SearchProcessId": searchProcessId,
        "Tour": tour,
        "Transfer": transfer,
        "Visa": visa,
      };
}

class Destination {
  Destination({
    required this.destinationId,
  });

  final dynamic destinationId;

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      destinationId: json["DestinationId"],
    );
  }

  Map<String, dynamic> toJson() => {
        "DestinationId": destinationId,
      };
}

class SearchFilterRoom {
  SearchFilterRoom({
    required this.index,
    required this.paxes,
  });

  final dynamic index;
  final List<PaxX> paxes;

  factory SearchFilterRoom.fromJson(Map<String, dynamic> json) {
    return SearchFilterRoom(
      index: json["Index"],
      paxes: json["Paxes"] == null
          ? []
          : List<PaxX>.from(json["Paxes"]!.map((x) => PaxX.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "Index": index,
        "Paxes": paxes.map((x) => x.toJson()).toList(),
      };
}

class PaxX {
  PaxX({
    required this.childAgeList,
    required this.count,
    required this.paxType,
  });

  final dynamic childAgeList;
  final dynamic count;
  final dynamic paxType;

  factory PaxX.fromJson(Map<String, dynamic> json) {
    return PaxX(
      childAgeList: json["ChildAgeList"],
      count: json["Count"],
      paxType: json["PaxType"],
    );
  }

  Map<String, dynamic> toJson() => {
        "ChildAgeList": childAgeList,
        "Count": count,
        "PaxType": paxType,
      };
}

class Token {
  Token({
    required this.agentGroups,
    required this.agentId,
    required this.baseUserId,
    required this.branchId,
    required this.channelId,
    required this.channelMarketingType,
    required this.clientIpAddress,
    required this.createdAt,
    required this.customerId,
    required this.expiresAt,
    required this.externalLoginRequest,
    required this.logProductProviderId,
    required this.mergeBookingId,
    required this.parentAgentIds,
    required this.salerId,
    required this.simulatorId,
    required this.systemOwnerUserId,
    required this.tokenCode,
    required this.tokenDuration,
    required this.tokenStatusType,
    required this.userBrowser,
    required this.userIpAddress,
  });

  final List<AgentGroup> agentGroups;
  final dynamic agentId;
  final dynamic baseUserId;
  final dynamic branchId;
  final dynamic channelId;
  final dynamic channelMarketingType;
  final String? clientIpAddress;
  final DateTime? createdAt;
  final dynamic customerId;
  final DateTime? expiresAt;
  final dynamic externalLoginRequest;
  final dynamic logProductProviderId;
  final dynamic mergeBookingId;
  final List<int> parentAgentIds;
  final dynamic salerId;
  final dynamic simulatorId;
  final dynamic systemOwnerUserId;
  final String? tokenCode;
  final dynamic tokenDuration;
  final dynamic tokenStatusType;
  final dynamic userBrowser;
  final dynamic userIpAddress;

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      agentGroups: json["AgentGroups"] == null
          ? []
          : List<AgentGroup>.from(
              json["AgentGroups"]!.map((x) => AgentGroup.fromJson(x))),
      agentId: json["AgentId"],
      baseUserId: json["BaseUserId"],
      branchId: json["BranchId"],
      channelId: json["ChannelId"],
      channelMarketingType: json["ChannelMarketingType"],
      clientIpAddress: json["ClientIpAddress"],
      createdAt: DateTime.tryParse(json["CreatedAt"] ?? ""),
      customerId: json["CustomerId"],
      expiresAt: DateTime.tryParse(json["ExpiresAt"] ?? ""),
      externalLoginRequest: json["ExternalLoginRequest"],
      logProductProviderId: json["LogProductProviderId"],
      mergeBookingId: json["MergeBookingId"],
      parentAgentIds: json["ParentAgentIds"] == null
          ? []
          : List<int>.from(json["ParentAgentIds"]!.map((x) => x)),
      salerId: json["SalerId"],
      simulatorId: json["SimulatorId"],
      systemOwnerUserId: json["SystemOwnerUserId"],
      tokenCode: json["TokenCode"],
      tokenDuration: json["TokenDuration"],
      tokenStatusType: json["TokenStatusType"],
      userBrowser: json["UserBrowser"],
      userIpAddress: json["UserIpAddress"],
    );
  }

  Map<String, dynamic> toJson() => {
        "AgentGroups": agentGroups.map((x) => x.toJson()).toList(),
        "AgentId": agentId,
        "BaseUserId": baseUserId,
        "BranchId": branchId,
        "ChannelId": channelId,
        "ChannelMarketingType": channelMarketingType,
        "ClientIpAddress": clientIpAddress,
        "CreatedAt": createdAt?.toIso8601String(),
        "CustomerId": customerId,
        "ExpiresAt": expiresAt?.toIso8601String(),
        "ExternalLoginRequest": externalLoginRequest,
        "LogProductProviderId": logProductProviderId,
        "MergeBookingId": mergeBookingId,
        "ParentAgentIds": parentAgentIds.map((x) => x).toList(),
        "SalerId": salerId,
        "SimulatorId": simulatorId,
        "SystemOwnerUserId": systemOwnerUserId,
        "TokenCode": tokenCode,
        "TokenDuration": tokenDuration,
        "TokenStatusType": tokenStatusType,
        "UserBrowser": userBrowser,
        "UserIpAddress": userIpAddress,
      };
}

class AgentGroup {
  AgentGroup({
    required this.key,
    required this.value,
  });

  final dynamic key;
  final dynamic value;

  factory AgentGroup.fromJson(Map<String, dynamic> json) {
    return AgentGroup(
      key: json["Key"],
      value: json["Value"],
    );
  }

  Map<String, dynamic> toJson() => {
        "Key": key,
        "Value": value,
      };
}
