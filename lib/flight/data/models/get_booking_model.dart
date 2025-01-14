class GetBookingModel {
  GetBookingModel({
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
  final ResultGetModel? result;
  final dynamic resultCount;
  final dynamic userFriendlyErrorMessage;

  factory GetBookingModel.fromJson(Map<String, dynamic> json) {
    return GetBookingModel(
      cacheHashCode: json["CacheHashCode"],
      resultDate: json["ResultDate"],
      resultExpireDate: json["ResultExpireDate"],
      errorCode: json["ErrorCode"],
      errorMessage: json["ErrorMessage"],
      errorType: json["ErrorType"],
      hasError: json["HasError"],
      result: json["Result"] == null
          ? null
          : ResultGetModel.fromJson(json["Result"]),
      resultCount: json["ResultCount"],
      userFriendlyErrorMessage: json["UserFriendlyErrorMessage"],
    );
  }
}

class ResultGetModel {
  ResultGetModel({
    required this.activityBookingList,
    required this.additionalServiceBookingList,
    required this.agentReferenceInfo,
    required this.amount,
    required this.bookingDate,
    required this.bookingNote,
    required this.bookingPayments,
    required this.bookingStatusType,
    required this.campaigns,
    required this.carBookingList,
    required this.channelTrackingNumber,
    required this.contactInfo,
    required this.contracts,
    required this.corporateDefinitions,
    required this.data,
    required this.discountCodes,
    required this.expirationDate,
    required this.extraNote,
    required this.flightBookingList,
    required this.hotelBookingList,
    required this.invoiceInfo,
    required this.languageCode,
    required this.processId,
    required this.productType,
    required this.systemPnr,
    required this.tokenCode,
    required this.tourBookingList,
    required this.transferBookingList,
    required this.version,
    required this.visaBookingList,
  });

  final List<dynamic> activityBookingList;
  final List<dynamic> additionalServiceBookingList;
  final dynamic agentReferenceInfo;
  final Amount? amount;
  final DateTime? bookingDate;
  final String? bookingNote;
  final List<dynamic> bookingPayments;
  final dynamic bookingStatusType;
  final List<dynamic> campaigns;
  final List<dynamic> carBookingList;
  final dynamic channelTrackingNumber;
  final ContactInfo? contactInfo;
  final List<Contract> contracts;
  final List<dynamic> corporateDefinitions;
  final dynamic data;
  final List<dynamic> discountCodes;
  final DateTime? expirationDate;
  final String? extraNote;
  final List<FlightBookingList> flightBookingList;
  final List<dynamic> hotelBookingList;
  final InvoiceInfo? invoiceInfo;
  final String? languageCode;
  final String? processId;
  final dynamic productType;
  final String? systemPnr;
  final String? tokenCode;
  final List<dynamic> tourBookingList;
  final List<dynamic> transferBookingList;
  final String? version;
  final List<dynamic> visaBookingList;

  factory ResultGetModel.fromJson(Map<String, dynamic> json) {
    return ResultGetModel(
      activityBookingList: json["ActivityBookingList"] == null
          ? []
          : List<dynamic>.from(json["ActivityBookingList"]!.map((x) => x)),
      additionalServiceBookingList: json["AdditionalServiceBookingList"] == null
          ? []
          : List<dynamic>.from(
              json["AdditionalServiceBookingList"]!.map((x) => x)),
      agentReferenceInfo: json["AgentReferenceInfo"],
      amount: json["Amount"] == null ? null : Amount.fromJson(json["Amount"]),
      bookingDate: DateTime.tryParse(json["BookingDate"] ?? ""),
      bookingNote: json["BookingNote"],
      bookingPayments: json["BookingPayments"] == null
          ? []
          : List<dynamic>.from(json["BookingPayments"]!.map((x) => x)),
      bookingStatusType: json["BookingStatusType"],
      campaigns: json["Campaigns"] == null
          ? []
          : List<dynamic>.from(json["Campaigns"]!.map((x) => x)),
      carBookingList: json["CarBookingList"] == null
          ? []
          : List<dynamic>.from(json["CarBookingList"]!.map((x) => x)),
      channelTrackingNumber: json["ChannelTrackingNumber"],
      contactInfo: json["ContactInfo"] == null
          ? null
          : ContactInfo.fromJson(json["ContactInfo"]),
      contracts: json["Contracts"] == null
          ? []
          : List<Contract>.from(
              json["Contracts"]!.map((x) => Contract.fromJson(x))),
      corporateDefinitions: json["CorporateDefinitions"] == null
          ? []
          : List<dynamic>.from(json["CorporateDefinitions"]!.map((x) => x)),
      data: json["Data"],
      discountCodes: json["DiscountCodes"] == null
          ? []
          : List<dynamic>.from(json["DiscountCodes"]!.map((x) => x)),
      expirationDate: DateTime.tryParse(json["ExpirationDate"] ?? ""),
      extraNote: json["ExtraNote"],
      flightBookingList: json["FlightBookingList"] == null
          ? []
          : List<FlightBookingList>.from(json["FlightBookingList"]!
              .map((x) => FlightBookingList.fromJson(x))),
      hotelBookingList: json["HotelBookingList"] == null
          ? []
          : List<dynamic>.from(json["HotelBookingList"]!.map((x) => x)),
      invoiceInfo: json["InvoiceInfo"] == null
          ? null
          : InvoiceInfo.fromJson(json["InvoiceInfo"]),
      languageCode: json["LanguageCode"],
      processId: json["ProcessId"],
      productType: json["ProductType"],
      systemPnr: json["SystemPnr"],
      tokenCode: json["TokenCode"],
      tourBookingList: json["TourBookingList"] == null
          ? []
          : List<dynamic>.from(json["TourBookingList"]!.map((x) => x)),
      transferBookingList: json["TransferBookingList"] == null
          ? []
          : List<dynamic>.from(json["TransferBookingList"]!.map((x) => x)),
      version: json["Version"],
      visaBookingList: json["VisaBookingList"] == null
          ? []
          : List<dynamic>.from(json["VisaBookingList"]!.map((x) => x)),
    );
  }
}

class Amount {
  Amount({
    required this.baseBuyAmount,
    required this.baseSellAmount,
    required this.collectionList,
    required this.commission,
    required this.currencyCode,
    required this.data,
    required this.discountList,
    required this.originalCommission,
    required this.serviceFee,
    required this.taxList,
    required this.totalBuyAmount,
    required this.totalCommission,
    required this.totalDiscountAmount,
    required this.totalPaymentTypeSellAmount,
    required this.totalPenaltySellAmount,
    required this.totalSellAmount,
    required this.totalTaxAmount,
  });

  final double? baseBuyAmount;
  final double? baseSellAmount;
  final List<CollectionList> collectionList;
  final dynamic commission;
  final String? currencyCode;
  final dynamic data;
  final List<dynamic> discountList;
  final dynamic originalCommission;
  final dynamic serviceFee;
  final List<TaxList> taxList;
  final double? totalBuyAmount;
  final dynamic totalCommission;
  final dynamic totalDiscountAmount;
  final dynamic totalPaymentTypeSellAmount;
  final dynamic totalPenaltySellAmount;
  final double? totalSellAmount;
  final double? totalTaxAmount;

  factory Amount.fromJson(Map<String, dynamic> json) {
    return Amount(
      baseBuyAmount: json["BaseBuyAmount"],
      baseSellAmount: json["BaseSellAmount"],
      collectionList: json["CollectionList"] == null
          ? []
          : List<CollectionList>.from(
              json["CollectionList"]!.map((x) => CollectionList.fromJson(x))),
      commission: json["Commission"],
      currencyCode: json["CurrencyCode"],
      data: json["Data"],
      discountList: json["DiscountList"] == null
          ? []
          : List<dynamic>.from(json["DiscountList"]!.map((x) => x)),
      originalCommission: json["OriginalCommission"],
      serviceFee: json["ServiceFee"],
      taxList: json["TaxList"] == null
          ? []
          : List<TaxList>.from(
              json["TaxList"]!.map((x) => TaxList.fromJson(x))),
      totalBuyAmount: json["TotalBuyAmount"],
      totalCommission: json["TotalCommission"],
      totalDiscountAmount: json["TotalDiscountAmount"],
      totalPaymentTypeSellAmount: json["TotalPaymentTypeSellAmount"],
      totalPenaltySellAmount: json["TotalPenaltySellAmount"],
      totalSellAmount: json["TotalSellAmount"],
      totalTaxAmount: json["TotalTaxAmount"],
    );
  }
}

class CollectionList {
  CollectionList({
    required this.amount,
    required this.collectionDescription,
    required this.createdAt,
    required this.operationCurrencyCode,
    required this.paidAt,
    required this.paymentType,
    required this.paymentTypeAmount,
    required this.paymentTypeItemId,
  });

  final double? amount;
  final dynamic collectionDescription;
  final DateTime? createdAt;
  final String? operationCurrencyCode;
  final DateTime? paidAt;
  final dynamic paymentType;
  final dynamic paymentTypeAmount;
  final dynamic paymentTypeItemId;

  factory CollectionList.fromJson(Map<String, dynamic> json) {
    return CollectionList(
      amount: json["Amount"],
      collectionDescription: json["CollectionDescription"],
      createdAt: DateTime.tryParse(json["CreatedAt"] ?? ""),
      operationCurrencyCode: json["OperationCurrencyCode"],
      paidAt: DateTime.tryParse(json["PaidAt"] ?? ""),
      paymentType: json["PaymentType"],
      paymentTypeAmount: json["PaymentTypeAmount"],
      paymentTypeItemId: json["PaymentTypeItemId"],
    );
  }
}

class TaxList {
  TaxList({
    required this.taxAmount,
    required this.taxCode,
  });

  final double? taxAmount;
  final String? taxCode;

  factory TaxList.fromJson(Map<String, dynamic> json) {
    return TaxList(
      taxAmount: json["TaxAmount"],
      taxCode: json["TaxCode"],
    );
  }
}

class ContactInfo {
  ContactInfo({
    required this.email,
    required this.firstName,
    required this.genderType,
    required this.lastName,
    required this.phone,
  });

  final String? email;
  final String? firstName;
  final dynamic genderType;
  final String? lastName;
  final String? phone;

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      email: json["Email"],
      firstName: json["FirstName"],
      genderType: json["GenderType"],
      lastName: json["LastName"],
      phone: json["Phone"],
    );
  }
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
}

class FlightBookingList {
  FlightBookingList({
    required this.amount,
    required this.bookingDate,
    required this.bookingStatusType,
    required this.canExchange,
    required this.canRefund,
    required this.corporatePin,
    required this.data,
    required this.expirationDate,
    required this.legs,
    required this.paxList,
    required this.pnr,
    required this.rules,
    required this.services,
    required this.voidTime,
  });

  final Amount? amount;
  final DateTime? bookingDate;
  final dynamic bookingStatusType;
  final bool? canExchange;
  final bool? canRefund;
  final dynamic corporatePin;
  final dynamic data;
  final dynamic expirationDate;
  final List<Leg> legs;
  final List<PaxList> paxList;
  final String? pnr;
  final List<Rule> rules;
  final List<Rule> services;
  final dynamic voidTime;

  factory FlightBookingList.fromJson(Map<String, dynamic> json) {
    return FlightBookingList(
      amount: json["Amount"] == null ? null : Amount.fromJson(json["Amount"]),
      bookingDate: DateTime.tryParse(json["BookingDate"] ?? ""),
      bookingStatusType: json["BookingStatusType"],
      canExchange: json["CanExchange"],
      canRefund: json["CanRefund"],
      corporatePin: json["CorporatePin"],
      data: json["Data"],
      expirationDate: json["ExpirationDate"],
      legs: json["Legs"] == null
          ? []
          : List<Leg>.from(json["Legs"]!.map((x) => Leg.fromJson(x))),
      paxList: json["PaxList"] == null
          ? []
          : List<PaxList>.from(
              json["PaxList"]!.map((x) => PaxList.fromJson(x))),
      pnr: json["Pnr"],
      rules: json["Rules"] == null
          ? []
          : List<Rule>.from(json["Rules"]!.map((x) => Rule.fromJson(x))),
      services: json["Services"] == null
          ? []
          : List<Rule>.from(json["Services"]!.map((x) => Rule.fromJson(x))),
      voidTime: json["VoidTime"],
    );
  }
}

class Leg {
  Leg({
    required this.alternativeRef,
    required this.arrivalAirport,
    required this.arrivalDate,
    required this.cabinType,
    required this.classCode,
    required this.data,
    required this.departureAirport,
    required this.departureDate,
    required this.fareBasis,
    required this.fareTitle,
    required this.flightDuration,
    required this.flightNo,
    required this.isConnectedToNextFlight,
    required this.legOrderNo,
    required this.legStops,
    required this.operatingAirline,
    required this.segmentRef,
    required this.ticketingAirline,
    required this.vendorPnr,
    required this.waitingDuration,
  });

  final String? alternativeRef;
  final Airport? arrivalAirport;
  final DateTime? arrivalDate;
  final dynamic cabinType;
  final String? classCode;
  final dynamic data;
  final Airport? departureAirport;
  final DateTime? departureDate;
  final String? fareBasis;
  final String? fareTitle;
  final dynamic flightDuration;
  final String? flightNo;
  final bool? isConnectedToNextFlight;
  final dynamic legOrderNo;
  final List<dynamic> legStops;
  final TingAirline? operatingAirline;
  final String? segmentRef;
  final TingAirline? ticketingAirline;
  final dynamic vendorPnr;
  final dynamic waitingDuration;

  factory Leg.fromJson(Map<String, dynamic> json) {
    return Leg(
      alternativeRef: json["AlternativeRef"],
      arrivalAirport: json["ArrivalAirport"] == null
          ? null
          : Airport.fromJson(json["ArrivalAirport"]),
      arrivalDate: DateTime.tryParse(json["ArrivalDate"] ?? ""),
      cabinType: json["CabinType"],
      classCode: json["ClassCode"],
      data: json["Data"],
      departureAirport: json["DepartureAirport"] == null
          ? null
          : Airport.fromJson(json["DepartureAirport"]),
      departureDate: DateTime.tryParse(json["DepartureDate"] ?? ""),
      fareBasis: json["FareBasis"],
      fareTitle: json["FareTitle"],
      flightDuration: json["FlightDuration"],
      flightNo: json["FlightNo"],
      isConnectedToNextFlight: json["IsConnectedToNextFlight"],
      legOrderNo: json["LegOrderNo"],
      legStops: json["LegStops"] == null
          ? []
          : List<dynamic>.from(json["LegStops"]!.map((x) => x)),
      operatingAirline: json["OperatingAirline"] == null
          ? null
          : TingAirline.fromJson(json["OperatingAirline"]),
      segmentRef: json["SegmentRef"],
      ticketingAirline: json["TicketingAirline"] == null
          ? null
          : TingAirline.fromJson(json["TicketingAirline"]),
      vendorPnr: json["VendorPnr"],
      waitingDuration: json["WaitingDuration"],
    );
  }
}

class Airport {
  Airport({
    required this.rating,
    required this.searchingWords,
    required this.cityCode,
    required this.cityName,
    required this.code,
    required this.countryCode,
    required this.countryName,
    required this.geoLocation,
    required this.hotPointCodes,
    required this.hotpointType,
    required this.name,
    required this.timeZone,
  });

  final dynamic rating;
  final dynamic searchingWords;
  final String? cityCode;
  final String? cityName;
  final String? code;
  final String? countryCode;
  final String? countryName;
  final GeoLocation? geoLocation;
  final String? hotPointCodes;
  final dynamic hotpointType;
  final String? name;
  final dynamic timeZone;

  factory Airport.fromJson(Map<String, dynamic> json) {
    return Airport(
      rating: json["Rating"],
      searchingWords: json["SearchingWords"],
      cityCode: json["CityCode"],
      cityName: json["CityName"],
      code: json["Code"],
      countryCode: json["CountryCode"],
      countryName: json["CountryName"],
      geoLocation: json["GeoLocation"] == null
          ? null
          : GeoLocation.fromJson(json["GeoLocation"]),
      hotPointCodes: json["HotPointCodes"],
      hotpointType: json["HotpointType"],
      name: json["Name"],
      timeZone: json["TimeZone"],
    );
  }
}

class GeoLocation {
  GeoLocation({
    required this.latitude,
    required this.longitude,
  });

  final double? latitude;
  final double? longitude;

  factory GeoLocation.fromJson(Map<String, dynamic> json) {
    return GeoLocation(
      latitude: json["Latitude"],
      longitude: json["Longitude"],
    );
  }
}

class TingAirline {
  TingAirline({
    required this.rating,
    required this.searchingWords,
    required this.checkInUrl,
    required this.code,
    required this.logo,
    required this.name,
    required this.shortName,
    required this.ticketingCode,
  });

  final dynamic rating;
  final dynamic searchingWords;
  final String? checkInUrl;
  final String? code;
  final String? logo;
  final String? name;
  final String? shortName;
  final String? ticketingCode;

  factory TingAirline.fromJson(Map<String, dynamic> json) {
    return TingAirline(
      rating: json["Rating"],
      searchingWords: json["SearchingWords"],
      checkInUrl: json["CheckInUrl"],
      code: json["Code"],
      logo: json["Logo"],
      name: json["Name"],
      shortName: json["ShortName"],
      ticketingCode: json["TicketingCode"],
    );
  }
}

class PaxList {
  PaxList({
    required this.baggageAllowances,
    required this.bookingAmount,
    required this.flightPaxType,
    required this.mileagePrograms,
    required this.optionalServices,
    required this.passengerRef,
    required this.pax,
    required this.recId,
    required this.splitPnr,
    required this.statusType,
    required this.ticketNumber,
    required this.wheelChairServiceType,
  });

  final List<BaggageAllowance> baggageAllowances;
  final Amount? bookingAmount;
  final dynamic flightPaxType;
  final List<dynamic> mileagePrograms;
  final List<dynamic> optionalServices;
  final dynamic passengerRef;
  final PaxGetModel? pax;
  final dynamic recId;
  final dynamic splitPnr;
  final dynamic statusType;
  final String? ticketNumber;
  final dynamic wheelChairServiceType;

  factory PaxList.fromJson(Map<String, dynamic> json) {
    return PaxList(
      baggageAllowances: json["BaggageAllowances"] == null
          ? []
          : List<BaggageAllowance>.from(json["BaggageAllowances"]!
              .map((x) => BaggageAllowance.fromJson(x))),
      bookingAmount: json["BookingAmount"] == null
          ? null
          : Amount.fromJson(json["BookingAmount"]),
      flightPaxType: json["FlightPaxType"],
      mileagePrograms: json["MileagePrograms"] == null
          ? []
          : List<dynamic>.from(json["MileagePrograms"]!.map((x) => x)),
      optionalServices: json["OptionalServices"] == null
          ? []
          : List<dynamic>.from(json["OptionalServices"]!.map((x) => x)),
      passengerRef: json["PassengerRef"],
      pax: json["Pax"] == null ? null : PaxGetModel.fromJson(json["Pax"]),
      recId: json["RecId"],
      splitPnr: json["SplitPNR"],
      statusType: json["StatusType"],
      ticketNumber: json["TicketNumber"],
      wheelChairServiceType: json["WheelChairServiceType"],
    );
  }
}

class BaggageAllowance {
  BaggageAllowance({
    required this.segmentRef,
    required this.type,
    required this.value,
  });

  final String? segmentRef;
  final dynamic type;
  final String? value;

  factory BaggageAllowance.fromJson(Map<String, dynamic> json) {
    return BaggageAllowance(
      segmentRef: json["SegmentRef"],
      type: json["Type"],
      value: json["Value"],
    );
  }
}

class PaxGetModel {
  PaxGetModel({
    required this.age,
    required this.dateOfBirth,
    required this.email,
    required this.employeeId,
    required this.firstName,
    required this.genderType,
    required this.hesCode,
    required this.identityNumber,
    required this.lastName,
    required this.mobilePhone,
    required this.nationalityCode,
    required this.passportCountryCode,
    required this.passportGivenDate,
    required this.passportNumber,
    required this.passportType,
    required this.passportValidityDate,
    required this.paxId,
    required this.referenceId,
    required this.statusType,
  });

  final dynamic age;
  final String? dateOfBirth;
  final dynamic email;
  final dynamic employeeId;
  final String? firstName;
  final dynamic genderType;
  final dynamic hesCode;
  final String? identityNumber;
  final String? lastName;
  final dynamic mobilePhone;
  final String? nationalityCode;
  final dynamic passportCountryCode;
  final dynamic passportGivenDate;
  final String? passportNumber;
  final dynamic passportType;
  final String? passportValidityDate;
  final dynamic paxId;
  final dynamic referenceId;
  final dynamic statusType;

  factory PaxGetModel.fromJson(Map<String, dynamic> json) {
    return PaxGetModel(
      age: json["Age"],
      dateOfBirth: json["DateOfBirth"],
      email: json["Email"],
      employeeId: json["EmployeeId"],
      firstName: json["FirstName"],
      genderType: json["GenderType"],
      hesCode: json["HESCode"],
      identityNumber: json["IdentityNumber"],
      lastName: json["LastName"],
      mobilePhone: json["MobilePhone"],
      nationalityCode: json["NationalityCode"],
      passportCountryCode: json["PassportCountryCode"],
      passportGivenDate: json["PassportGivenDate"],
      passportNumber: json["PassportNumber"],
      passportType: json["PassportType"],
      passportValidityDate: json["PassportValidityDate"],
      paxId: json["PaxId"],
      referenceId: json["ReferenceId"],
      statusType: json["StatusType"],
    );
  }
}

class Rule {
  Rule({
    required this.alternativeRef,
    required this.description,
    required this.segmentRef,
    required this.title,
    required this.inclusionType,
  });

  final String? alternativeRef;
  final String? description;
  final String? segmentRef;
  final String? title;
  final dynamic inclusionType;

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      alternativeRef: json["AlternativeRef"],
      description: json["Description"],
      segmentRef: json["SegmentRef"],
      title: json["Title"],
      inclusionType: json["InclusionType"],
    );
  }
}

class InvoiceInfo {
  InvoiceInfo({
    required this.address,
    required this.cityCode,
    required this.cityName,
    required this.companyName,
    required this.countryCode,
    required this.firstName,
    required this.invoiceInfoTitle,
    required this.invoiceInfoType,
    required this.lastName,
    required this.postalCode,
    required this.recId,
    required this.statusType,
    required this.taxNumber,
    required this.taxOffice,
  });

  final String? address;
  final String? cityCode;
  final String? cityName;
  final String? companyName;
  final String? countryCode;
  final String? firstName;
  final String? invoiceInfoTitle;
  final dynamic invoiceInfoType;
  final String? lastName;
  final dynamic postalCode;
  final dynamic recId;
  final dynamic statusType;
  final dynamic taxNumber;
  final dynamic taxOffice;

  factory InvoiceInfo.fromJson(Map<String, dynamic> json) {
    return InvoiceInfo(
      address: json["Address"],
      cityCode: json["CityCode"],
      cityName: json["CityName"],
      companyName: json["CompanyName"],
      countryCode: json["CountryCode"],
      firstName: json["FirstName"],
      invoiceInfoTitle: json["InvoiceInfoTitle"],
      invoiceInfoType: json["InvoiceInfoType"],
      lastName: json["LastName"],
      postalCode: json["PostalCode"],
      recId: json["RecId"],
      statusType: json["StatusType"],
      taxNumber: json["TaxNumber"],
      taxOffice: json["TaxOffice"],
    );
  }
}
