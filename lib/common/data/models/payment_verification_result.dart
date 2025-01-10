import 'package:bamobile1/common/data/models/payment_verification.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_verification_result.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.pascal,
  includeIfNull: false,
)
class PaymentVerificationResult {
  dynamic cacheHashCode;
  dynamic resultDate;
  dynamic resultExpireDate;
  dynamic errorCode;
  dynamic errorMessage;
  int? errorType;
  bool? hasError;
  PaymentVerification? result;
  int? resultCount;
  dynamic userFriendlyErrorMessage;

  PaymentVerificationResult({
    this.cacheHashCode,
    this.resultDate,
    this.resultExpireDate,
    this.errorCode,
    this.errorMessage,
    this.errorType,
    this.hasError,
    this.result,
    this.resultCount,
    this.userFriendlyErrorMessage,
  });

  factory PaymentVerificationResult.fromJson(Map<String, dynamic> json) =>
      _$PaymentVerificationResultFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentVerificationResultToJson(this);
}

class PaymentVerificationn {
  dynamic cacheHashCode;
  dynamic resultDate;
  dynamic resultExpireDate;
  dynamic errorCode;
  dynamic errorMessage;
  int? errorType;
  bool? hasError;
  Resultt? result;
  int? resultCount;
  dynamic userFriendlyErrorMessage;

  PaymentVerificationn(
      {this.cacheHashCode,
      this.resultDate,
      this.resultExpireDate,
      this.errorCode,
      this.errorMessage,
      this.errorType,
      this.hasError,
      this.result,
      this.resultCount,
      this.userFriendlyErrorMessage});

  PaymentVerificationn.fromJson(Map<String, dynamic> json) {
    cacheHashCode = json["CacheHashCode"];
    resultDate = json["ResultDate"];
    resultExpireDate = json["ResultExpireDate"];
    errorCode = json["ErrorCode"];
    errorMessage = json["ErrorMessage"];
    if (json["ErrorType"] is int) {
      errorType = json["ErrorType"];
    }
    if (json["HasError"] is bool) {
      hasError = json["HasError"];
    }
    if (json["Result"] is Map) {
      result = json["Result"] == null ? null : Resultt.fromJson(json["Result"]);
    }
    if (json["ResultCount"] is int) {
      resultCount = json["ResultCount"];
    }
    userFriendlyErrorMessage = json["UserFriendlyErrorMessage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["CacheHashCode"] = cacheHashCode;
    data["ResultDate"] = resultDate;
    data["ResultExpireDate"] = resultExpireDate;
    data["ErrorCode"] = errorCode;
    data["ErrorMessage"] = errorMessage;
    data["ErrorType"] = errorType;
    data["HasError"] = hasError;
    if (result != null) {
      data["Result"] = result?.toJson();
    }
    data["ResultCount"] = resultCount;
    data["UserFriendlyErrorMessage"] = userFriendlyErrorMessage;
    return data;
  }
}

class Resultt {
  BookingL? booking;
  bool? is3DPostRequired;
  bool? isPriceChanged;
  dynamic post3DPageUrl;

  Resultt(
      {this.booking,
      this.is3DPostRequired,
      this.isPriceChanged,
      this.post3DPageUrl});

  Resultt.fromJson(Map<String, dynamic> json) {
    if (json["Booking"] is Map) {
      booking =
          json["Booking"] == null ? null : BookingL.fromJson(json["Booking"]);
    }
    if (json["Is3DPostRequired"] is bool) {
      is3DPostRequired = json["Is3DPostRequired"];
    }
    if (json["IsPriceChanged"] is bool) {
      isPriceChanged = json["IsPriceChanged"];
    }
    post3DPageUrl = json["Post3DPageUrl"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (booking != null) {
      data["Booking"] = booking?.toJson();
    }
    data["Is3DPostRequired"] = is3DPostRequired;
    data["IsPriceChanged"] = isPriceChanged;
    data["Post3DPageUrl"] = post3DPageUrl;
    return data;
  }
}

class BookingL {
  List<dynamic>? activityBookingList;
  List<dynamic>? additionalServiceBookingList;
  dynamic agentReferenceInfo;
  Amount? amount;
  String? bookingDate;
  String? bookingNote;
  int? bookingStatusType;
  List<dynamic>? campaigns;
  List<dynamic>? carBookingList;
  dynamic channelTrackingNumber;
  ContactInfo? contactInfo;
  List<Contracts>? contracts;
  List<dynamic>? corporateDefinitions;
  dynamic data;
  List<dynamic>? discountCodes;
  String? expirationDate;
  String? extraNote;
  List<FlightBookingList>? flightBookingList;
  List<dynamic>? hotelBookingList;
  InvoiceInfo? invoiceInfo;
  String? languageCode;
  String? processId;
  int? productType;
  String? systemPnr;
  String? tokenCode;
  List<dynamic>? tourBookingList;
  List<dynamic>? transferBookingList;
  String? version;
  List<dynamic>? visaBookingList;

  BookingL(
      {this.activityBookingList,
      this.additionalServiceBookingList,
      this.agentReferenceInfo,
      this.amount,
      this.bookingDate,
      this.bookingNote,
      this.bookingStatusType,
      this.campaigns,
      this.carBookingList,
      this.channelTrackingNumber,
      this.contactInfo,
      this.contracts,
      this.corporateDefinitions,
      this.data,
      this.discountCodes,
      this.expirationDate,
      this.extraNote,
      this.flightBookingList,
      this.hotelBookingList,
      this.invoiceInfo,
      this.languageCode,
      this.processId,
      this.productType,
      this.systemPnr,
      this.tokenCode,
      this.tourBookingList,
      this.transferBookingList,
      this.version,
      this.visaBookingList});

  BookingL.fromJson(Map<String, dynamic> json) {
    if (json["ActivityBookingList"] is List) {
      activityBookingList = json["ActivityBookingList"] ?? [];
    }
    if (json["AdditionalServiceBookingList"] is List) {
      additionalServiceBookingList = json["AdditionalServiceBookingList"] ?? [];
    }
    agentReferenceInfo = json["AgentReferenceInfo"];
    if (json["Amount"] is Map) {
      amount = json["Amount"] == null ? null : Amount.fromJson(json["Amount"]);
    }
    if (json["BookingDate"] is String) {
      bookingDate = json["BookingDate"];
    }
    if (json["BookingNote"] is String) {
      bookingNote = json["BookingNote"];
    }
    if (json["BookingStatusType"] is int) {
      bookingStatusType = json["BookingStatusType"];
    }
    if (json["Campaigns"] is List) {
      campaigns = json["Campaigns"] ?? [];
    }
    if (json["CarBookingList"] is List) {
      carBookingList = json["CarBookingList"] ?? [];
    }
    channelTrackingNumber = json["ChannelTrackingNumber"];
    if (json["ContactInfo"] is Map) {
      contactInfo = json["ContactInfo"] == null
          ? null
          : ContactInfo.fromJson(json["ContactInfo"]);
    }
    if (json["Contracts"] is List) {
      contracts = json["Contracts"] == null
          ? null
          : (json["Contracts"] as List)
              .map((e) => Contracts.fromJson(e))
              .toList();
    }
    if (json["CorporateDefinitions"] is List) {
      corporateDefinitions = json["CorporateDefinitions"] ?? [];
    }
    data = json["Data"];
    if (json["DiscountCodes"] is List) {
      discountCodes = json["DiscountCodes"] ?? [];
    }
    if (json["ExpirationDate"] is String) {
      expirationDate = json["ExpirationDate"];
    }
    if (json["ExtraNote"] is String) {
      extraNote = json["ExtraNote"];
    }
    if (json["FlightBookingList"] is List) {
      flightBookingList = json["FlightBookingList"] == null
          ? null
          : (json["FlightBookingList"] as List)
              .map((e) => FlightBookingList.fromJson(e))
              .toList();
    }
    if (json["HotelBookingList"] is List) {
      hotelBookingList = json["HotelBookingList"] ?? [];
    }
    if (json["InvoiceInfo"] is Map) {
      invoiceInfo = json["InvoiceInfo"] == null
          ? null
          : InvoiceInfo.fromJson(json["InvoiceInfo"]);
    }
    if (json["LanguageCode"] is String) {
      languageCode = json["LanguageCode"];
    }
    if (json["ProcessId"] is String) {
      processId = json["ProcessId"];
    }
    if (json["ProductType"] is int) {
      productType = json["ProductType"];
    }
    if (json["SystemPnr"] is String) {
      systemPnr = json["SystemPnr"];
    }
    if (json["TokenCode"] is String) {
      tokenCode = json["TokenCode"];
    }
    if (json["TourBookingList"] is List) {
      tourBookingList = json["TourBookingList"] ?? [];
    }
    if (json["TransferBookingList"] is List) {
      transferBookingList = json["TransferBookingList"] ?? [];
    }
    if (json["Version"] is String) {
      version = json["Version"];
    }
    if (json["VisaBookingList"] is List) {
      visaBookingList = json["VisaBookingList"] ?? [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (activityBookingList != null) {
      data["ActivityBookingList"] = activityBookingList;
    }
    if (additionalServiceBookingList != null) {
      data["AdditionalServiceBookingList"] = additionalServiceBookingList;
    }
    data["AgentReferenceInfo"] = agentReferenceInfo;
    if (amount != null) {
      data["Amount"] = amount?.toJson();
    }
    data["BookingDate"] = bookingDate;
    data["BookingNote"] = bookingNote;
    data["BookingStatusType"] = bookingStatusType;
    if (campaigns != null) {
      data["Campaigns"] = campaigns;
    }
    if (carBookingList != null) {
      data["CarBookingList"] = carBookingList;
    }
    data["ChannelTrackingNumber"] = channelTrackingNumber;
    if (contactInfo != null) {
      data["ContactInfo"] = contactInfo?.toJson();
    }
    if (contracts != null) {
      data["Contracts"] = contracts?.map((e) => e.toJson()).toList();
    }
    if (corporateDefinitions != null) {
      data["CorporateDefinitions"] = corporateDefinitions;
    }
    data["Data"] = data;
    if (discountCodes != null) {
      data["DiscountCodes"] = discountCodes;
    }
    data["ExpirationDate"] = expirationDate;
    data["ExtraNote"] = extraNote;
    if (flightBookingList != null) {
      data["FlightBookingList"] =
          flightBookingList?.map((e) => e.toJson()).toList();
    }
    if (hotelBookingList != null) {
      data["HotelBookingList"] = hotelBookingList;
    }
    if (invoiceInfo != null) {
      data["InvoiceInfo"] = invoiceInfo?.toJson();
    }
    data["LanguageCode"] = languageCode;
    data["ProcessId"] = processId;
    data["ProductType"] = productType;
    data["SystemPnr"] = systemPnr;
    data["TokenCode"] = tokenCode;
    if (tourBookingList != null) {
      data["TourBookingList"] = tourBookingList;
    }
    if (transferBookingList != null) {
      data["TransferBookingList"] = transferBookingList;
    }
    data["Version"] = version;
    if (visaBookingList != null) {
      data["VisaBookingList"] = visaBookingList;
    }
    return data;
  }
}

class InvoiceInfo {
  String? address;
  String? cityCode;
  String? cityName;
  String? companyName;
  String? countryCode;
  String? firstName;
  String? invoiceInfoTitle;
  int? invoiceInfoType;
  String? lastName;
  String? postalCode;
  int? recId;
  int? statusType;
  String? taxNumber;
  String? taxOffice;

  InvoiceInfo(
      {this.address,
      this.cityCode,
      this.cityName,
      this.companyName,
      this.countryCode,
      this.firstName,
      this.invoiceInfoTitle,
      this.invoiceInfoType,
      this.lastName,
      this.postalCode,
      this.recId,
      this.statusType,
      this.taxNumber,
      this.taxOffice});

  InvoiceInfo.fromJson(Map<String, dynamic> json) {
    if (json["Address"] is String) {
      address = json["Address"];
    }
    if (json["CityCode"] is String) {
      cityCode = json["CityCode"];
    }
    if (json["CityName"] is String) {
      cityName = json["CityName"];
    }
    if (json["CompanyName"] is String) {
      companyName = json["CompanyName"];
    }
    if (json["CountryCode"] is String) {
      countryCode = json["CountryCode"];
    }
    if (json["FirstName"] is String) {
      firstName = json["FirstName"];
    }
    if (json["InvoiceInfoTitle"] is String) {
      invoiceInfoTitle = json["InvoiceInfoTitle"];
    }
    if (json["InvoiceInfoType"] is int) {
      invoiceInfoType = json["InvoiceInfoType"];
    }
    if (json["LastName"] is String) {
      lastName = json["LastName"];
    }
    if (json["PostalCode"] is String) {
      postalCode = json["PostalCode"];
    }
    if (json["RecId"] is int) {
      recId = json["RecId"];
    }
    if (json["StatusType"] is int) {
      statusType = json["StatusType"];
    }
    if (json["TaxNumber"] is String) {
      taxNumber = json["TaxNumber"];
    }
    if (json["TaxOffice"] is String) {
      taxOffice = json["TaxOffice"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Address"] = address;
    data["CityCode"] = cityCode;
    data["CityName"] = cityName;
    data["CompanyName"] = companyName;
    data["CountryCode"] = countryCode;
    data["FirstName"] = firstName;
    data["InvoiceInfoTitle"] = invoiceInfoTitle;
    data["InvoiceInfoType"] = invoiceInfoType;
    data["LastName"] = lastName;
    data["PostalCode"] = postalCode;
    data["RecId"] = recId;
    data["StatusType"] = statusType;
    data["TaxNumber"] = taxNumber;
    data["TaxOffice"] = taxOffice;
    return data;
  }
}

class FlightBookingList {
  Amount1? amount;
  String? bookingDate;
  int? bookingStatusType;
  bool? canExchange;
  bool? canRefund;
  dynamic corporatePin;
  dynamic data;
  String? expirationDate;
  List<Legs>? legs;
  List<PaxList>? paxList;
  String? pnr;
  List<Rules>? rules;
  List<dynamic>? services;
  int? voidTime;

  FlightBookingList(
      {this.amount,
      this.bookingDate,
      this.bookingStatusType,
      this.canExchange,
      this.canRefund,
      this.corporatePin,
      this.data,
      this.expirationDate,
      this.legs,
      this.paxList,
      this.pnr,
      this.rules,
      this.services,
      this.voidTime});

  FlightBookingList.fromJson(Map<String, dynamic> json) {
    if (json["Amount"] is Map) {
      amount = json["Amount"] == null ? null : Amount1.fromJson(json["Amount"]);
    }
    if (json["BookingDate"] is String) {
      bookingDate = json["BookingDate"];
    }
    if (json["BookingStatusType"] is int) {
      bookingStatusType = json["BookingStatusType"];
    }
    if (json["CanExchange"] is bool) {
      canExchange = json["CanExchange"];
    }
    if (json["CanRefund"] is bool) {
      canRefund = json["CanRefund"];
    }
    corporatePin = json["CorporatePin"];
    data = json["Data"];
    if (json["ExpirationDate"] is String) {
      expirationDate = json["ExpirationDate"];
    }
    if (json["Legs"] is List) {
      legs = json["Legs"] == null
          ? null
          : (json["Legs"] as List).map((e) => Legs.fromJson(e)).toList();
    }
    if (json["PaxList"] is List) {
      paxList = json["PaxList"] == null
          ? null
          : (json["PaxList"] as List).map((e) => PaxList.fromJson(e)).toList();
    }
    if (json["Pnr"] is String) {
      pnr = json["Pnr"];
    }
    if (json["Rules"] is List) {
      rules = json["Rules"] == null
          ? null
          : (json["Rules"] as List).map((e) => Rules.fromJson(e)).toList();
    }
    if (json["Services"] is List) {
      services = json["Services"] ?? [];
    }
    if (json["VoidTime"] is int) {
      voidTime = json["VoidTime"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (amount != null) {
      data["Amount"] = amount?.toJson();
    }
    data["BookingDate"] = bookingDate;
    data["BookingStatusType"] = bookingStatusType;
    data["CanExchange"] = canExchange;
    data["CanRefund"] = canRefund;
    data["CorporatePin"] = corporatePin;
    data["Data"] = data;
    data["ExpirationDate"] = expirationDate;
    if (legs != null) {
      data["Legs"] = legs?.map((e) => e.toJson()).toList();
    }
    if (paxList != null) {
      data["PaxList"] = paxList?.map((e) => e.toJson()).toList();
    }
    data["Pnr"] = pnr;
    if (rules != null) {
      data["Rules"] = rules?.map((e) => e.toJson()).toList();
    }
    if (services != null) {
      data["Services"] = services;
    }
    data["VoidTime"] = voidTime;
    return data;
  }
}

class Rules {
  String? alternativeRef;
  String? description;
  String? segmentRef;
  String? title;

  Rules({this.alternativeRef, this.description, this.segmentRef, this.title});

  Rules.fromJson(Map<String, dynamic> json) {
    if (json["AlternativeRef"] is String) {
      alternativeRef = json["AlternativeRef"];
    }
    if (json["Description"] is String) {
      description = json["Description"];
    }
    if (json["SegmentRef"] is String) {
      segmentRef = json["SegmentRef"];
    }
    if (json["Title"] is String) {
      title = json["Title"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["AlternativeRef"] = alternativeRef;
    data["Description"] = description;
    data["SegmentRef"] = segmentRef;
    data["Title"] = title;
    return data;
  }
}

class PaxList {
  List<BaggageAllowances>? baggageAllowances;
  BookingAmount? bookingAmount;
  int? flightPaxType;
  List<dynamic>? mileagePrograms;
  List<dynamic>? optionalServices;
  dynamic passengerRef;
  PaxL? pax;
  int? recId;
  dynamic splitPnr;
  int? statusType;
  dynamic ticketNumber;
  int? wheelChairServiceType;

  PaxList(
      {this.baggageAllowances,
      this.bookingAmount,
      this.flightPaxType,
      this.mileagePrograms,
      this.optionalServices,
      this.passengerRef,
      this.pax,
      this.recId,
      this.splitPnr,
      this.statusType,
      this.ticketNumber,
      this.wheelChairServiceType});

  PaxList.fromJson(Map<String, dynamic> json) {
    if (json["BaggageAllowances"] is List) {
      baggageAllowances = json["BaggageAllowances"] == null
          ? null
          : (json["BaggageAllowances"] as List)
              .map((e) => BaggageAllowances.fromJson(e))
              .toList();
    }
    if (json["BookingAmount"] is Map) {
      bookingAmount = json["BookingAmount"] == null
          ? null
          : BookingAmount.fromJson(json["BookingAmount"]);
    }
    if (json["FlightPaxType"] is int) {
      flightPaxType = json["FlightPaxType"];
    }
    if (json["MileagePrograms"] is List) {
      mileagePrograms = json["MileagePrograms"] ?? [];
    }
    if (json["OptionalServices"] is List) {
      optionalServices = json["OptionalServices"] ?? [];
    }
    passengerRef = json["PassengerRef"];
    if (json["Pax"] is Map) {
      pax = json["Pax"] == null ? null : PaxL.fromJson(json["Pax"]);
    }
    if (json["RecId"] is int) {
      recId = json["RecId"];
    }
    splitPnr = json["SplitPNR"];
    if (json["StatusType"] is int) {
      statusType = json["StatusType"];
    }
    ticketNumber = json["TicketNumber"];
    if (json["WheelChairServiceType"] is int) {
      wheelChairServiceType = json["WheelChairServiceType"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (baggageAllowances != null) {
      data["BaggageAllowances"] =
          baggageAllowances?.map((e) => e.toJson()).toList();
    }
    if (bookingAmount != null) {
      data["BookingAmount"] = bookingAmount?.toJson();
    }
    data["FlightPaxType"] = flightPaxType;
    if (mileagePrograms != null) {
      data["MileagePrograms"] = mileagePrograms;
    }
    if (optionalServices != null) {
      data["OptionalServices"] = optionalServices;
    }
    data["PassengerRef"] = passengerRef;
    if (pax != null) {
      data["Pax"] = pax?.toJson();
    }
    data["RecId"] = recId;
    data["SplitPNR"] = splitPnr;
    data["StatusType"] = statusType;
    data["TicketNumber"] = ticketNumber;
    data["WheelChairServiceType"] = wheelChairServiceType;
    return data;
  }
}

class PaxL {
  int? age;
  String? dateOfBirth;
  String? email;
  dynamic employeeId;
  String? firstName;
  int? genderType;
  dynamic hesCode;
  String? identityNumber;
  String? lastName;
  String? mobilePhone;
  String? nationalityCode;
  dynamic passportNumber;
  dynamic passportValidityDate;
  int? paxId;
  dynamic referenceId;
  int? statusType;

  PaxL(
      {this.age,
      this.dateOfBirth,
      this.email,
      this.employeeId,
      this.firstName,
      this.genderType,
      this.hesCode,
      this.identityNumber,
      this.lastName,
      this.mobilePhone,
      this.nationalityCode,
      this.passportNumber,
      this.passportValidityDate,
      this.paxId,
      this.referenceId,
      this.statusType});

  PaxL.fromJson(Map<String, dynamic> json) {
    if (json["Age"] is int) {
      age = json["Age"];
    }
    if (json["DateOfBirth"] is String) {
      dateOfBirth = json["DateOfBirth"];
    }
    if (json["Email"] is String) {
      email = json["Email"];
    }
    employeeId = json["EmployeeId"];
    if (json["FirstName"] is String) {
      firstName = json["FirstName"];
    }
    if (json["GenderType"] is int) {
      genderType = json["GenderType"];
    }
    hesCode = json["HESCode"];
    if (json["IdentityNumber"] is String) {
      identityNumber = json["IdentityNumber"];
    }
    if (json["LastName"] is String) {
      lastName = json["LastName"];
    }
    if (json["MobilePhone"] is String) {
      mobilePhone = json["MobilePhone"];
    }
    if (json["NationalityCode"] is String) {
      nationalityCode = json["NationalityCode"];
    }
    passportNumber = json["PassportNumber"];
    passportValidityDate = json["PassportValidityDate"];
    if (json["PaxId"] is int) {
      paxId = json["PaxId"];
    }
    referenceId = json["ReferenceId"];
    if (json["StatusType"] is int) {
      statusType = json["StatusType"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Age"] = age;
    data["DateOfBirth"] = dateOfBirth;
    data["Email"] = email;
    data["EmployeeId"] = employeeId;
    data["FirstName"] = firstName;
    data["GenderType"] = genderType;
    data["HESCode"] = hesCode;
    data["IdentityNumber"] = identityNumber;
    data["LastName"] = lastName;
    data["MobilePhone"] = mobilePhone;
    data["NationalityCode"] = nationalityCode;
    data["PassportNumber"] = passportNumber;
    data["PassportValidityDate"] = passportValidityDate;
    data["PaxId"] = paxId;
    data["ReferenceId"] = referenceId;
    data["StatusType"] = statusType;
    return data;
  }

  @override
  String toString() {
    return '\n'
        'First Name: $firstName\n'
        'Last Name: $lastName\n'
        'Nationality: $nationalityCode\n'
        'Birthday: $dateOfBirth\n'
        'Passport No: $passportNumber\n'
        'Validity Date: $passportValidityDate\n'
        'Email: $email\n'
        'Gender: $genderType\n----------------------------------';
  }
}

class BookingAmount {
  double? baseBuyAmount;
  double? baseSellAmount;
  List<dynamic>? collectionList;
  int? commission;
  String? currencyCode;
  dynamic data;
  List<dynamic>? discountList;
  int? originalCommission;
  double? serviceFee;
  List<TaxList1>? taxList;
  double? totalBuyAmount;
  int? totalCommission;
  int? totalDiscountAmount;
  int? totalPaymentTypeSellAmount;
  int? totalPenaltySellAmount;
  double? totalSellAmount;
  double? totalTaxAmount;

  BookingAmount(
      {this.baseBuyAmount,
      this.baseSellAmount,
      this.collectionList,
      this.commission,
      this.currencyCode,
      this.data,
      this.discountList,
      this.originalCommission,
      this.serviceFee,
      this.taxList,
      this.totalBuyAmount,
      this.totalCommission,
      this.totalDiscountAmount,
      this.totalPaymentTypeSellAmount,
      this.totalPenaltySellAmount,
      this.totalSellAmount,
      this.totalTaxAmount});

  BookingAmount.fromJson(Map<String, dynamic> json) {
    if (json["BaseBuyAmount"] is double) {
      baseBuyAmount = json["BaseBuyAmount"];
    }
    if (json["BaseSellAmount"] is double) {
      baseSellAmount = json["BaseSellAmount"];
    }
    if (json["CollectionList"] is List) {
      collectionList = json["CollectionList"] ?? [];
    }
    if (json["Commission"] is int) {
      commission = json["Commission"];
    }
    if (json["CurrencyCode"] is String) {
      currencyCode = json["CurrencyCode"];
    }
    data = json["Data"];
    if (json["DiscountList"] is List) {
      discountList = json["DiscountList"] ?? [];
    }
    if (json["OriginalCommission"] is int) {
      originalCommission = json["OriginalCommission"];
    }
    if (json["ServiceFee"] is double) {
      serviceFee = json["ServiceFee"];
    }
    if (json["TaxList"] is List) {
      taxList = json["TaxList"] == null
          ? null
          : (json["TaxList"] as List).map((e) => TaxList1.fromJson(e)).toList();
    }
    if (json["TotalBuyAmount"] is double) {
      totalBuyAmount = json["TotalBuyAmount"];
    }
    if (json["TotalCommission"] is int) {
      totalCommission = json["TotalCommission"];
    }
    if (json["TotalDiscountAmount"] is int) {
      totalDiscountAmount = json["TotalDiscountAmount"];
    }
    if (json["TotalPaymentTypeSellAmount"] is int) {
      totalPaymentTypeSellAmount = json["TotalPaymentTypeSellAmount"];
    }
    if (json["TotalPenaltySellAmount"] is int) {
      totalPenaltySellAmount = json["TotalPenaltySellAmount"];
    }
    if (json["TotalSellAmount"] is double) {
      totalSellAmount = json["TotalSellAmount"];
    }
    if (json["TotalTaxAmount"] is double) {
      totalTaxAmount = json["TotalTaxAmount"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["BaseBuyAmount"] = baseBuyAmount;
    data["BaseSellAmount"] = baseSellAmount;
    if (collectionList != null) {
      data["CollectionList"] = collectionList;
    }
    data["Commission"] = commission;
    data["CurrencyCode"] = currencyCode;
    data["Data"] = data;
    if (discountList != null) {
      data["DiscountList"] = discountList;
    }
    data["OriginalCommission"] = originalCommission;
    data["ServiceFee"] = serviceFee;
    if (taxList != null) {
      data["TaxList"] = taxList?.map((e) => e.toJson()).toList();
    }
    data["TotalBuyAmount"] = totalBuyAmount;
    data["TotalCommission"] = totalCommission;
    data["TotalDiscountAmount"] = totalDiscountAmount;
    data["TotalPaymentTypeSellAmount"] = totalPaymentTypeSellAmount;
    data["TotalPenaltySellAmount"] = totalPenaltySellAmount;
    data["TotalSellAmount"] = totalSellAmount;
    data["TotalTaxAmount"] = totalTaxAmount;
    return data;
  }
}

class TaxList1 {
  double? taxAmount;
  String? taxCode;

  TaxList1({this.taxAmount, this.taxCode});

  TaxList1.fromJson(Map<String, dynamic> json) {
    if (json["TaxAmount"] is double) {
      taxAmount = json["TaxAmount"];
    }
    if (json["TaxCode"] is String) {
      taxCode = json["TaxCode"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["TaxAmount"] = taxAmount;
    data["TaxCode"] = taxCode;
    return data;
  }
}

class BaggageAllowances {
  String? segmentRef;
  int? type;
  String? value;

  BaggageAllowances({this.segmentRef, this.type, this.value});

  BaggageAllowances.fromJson(Map<String, dynamic> json) {
    if (json["SegmentRef"] is String) {
      segmentRef = json["SegmentRef"];
    }
    if (json["Type"] is int) {
      type = json["Type"];
    }
    if (json["Value"] is String) {
      value = json["Value"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["SegmentRef"] = segmentRef;
    data["Type"] = type;
    data["Value"] = value;
    return data;
  }
}

class Legs {
  String? alternativeRef;
  ArrivalAirport? arrivalAirport;
  String? arrivalDate;
  int? cabinType;
  String? classCode;
  dynamic data;
  DepartureAirport? departureAirport;
  String? departureDate;
  String? fareBasis;
  dynamic fareTitle;
  int? flightDuration;
  String? flightNo;
  bool? isConnectedToNextFlight;
  int? legOrderNo;
  List<dynamic>? legStops;
  OperatingAirline? operatingAirline;
  String? segmentRef;
  TicketingAirline? ticketingAirline;
  String? vendorPnr;
  int? waitingDuration;

  Legs(
      {this.alternativeRef,
      this.arrivalAirport,
      this.arrivalDate,
      this.cabinType,
      this.classCode,
      this.data,
      this.departureAirport,
      this.departureDate,
      this.fareBasis,
      this.fareTitle,
      this.flightDuration,
      this.flightNo,
      this.isConnectedToNextFlight,
      this.legOrderNo,
      this.legStops,
      this.operatingAirline,
      this.segmentRef,
      this.ticketingAirline,
      this.vendorPnr,
      this.waitingDuration});

  Legs.fromJson(Map<String, dynamic> json) {
    if (json["AlternativeRef"] is String) {
      alternativeRef = json["AlternativeRef"];
    }
    if (json["ArrivalAirport"] is Map) {
      arrivalAirport = json["ArrivalAirport"] == null
          ? null
          : ArrivalAirport.fromJson(json["ArrivalAirport"]);
    }
    if (json["ArrivalDate"] is String) {
      arrivalDate = json["ArrivalDate"];
    }
    if (json["CabinType"] is int) {
      cabinType = json["CabinType"];
    }
    if (json["ClassCode"] is String) {
      classCode = json["ClassCode"];
    }
    data = json["Data"];
    if (json["DepartureAirport"] is Map) {
      departureAirport = json["DepartureAirport"] == null
          ? null
          : DepartureAirport.fromJson(json["DepartureAirport"]);
    }
    if (json["DepartureDate"] is String) {
      departureDate = json["DepartureDate"];
    }
    if (json["FareBasis"] is String) {
      fareBasis = json["FareBasis"];
    }
    fareTitle = json["FareTitle"];
    if (json["FlightDuration"] is int) {
      flightDuration = json["FlightDuration"];
    }
    if (json["FlightNo"] is String) {
      flightNo = json["FlightNo"];
    }
    if (json["IsConnectedToNextFlight"] is bool) {
      isConnectedToNextFlight = json["IsConnectedToNextFlight"];
    }
    if (json["LegOrderNo"] is int) {
      legOrderNo = json["LegOrderNo"];
    }
    if (json["LegStops"] is List) {
      legStops = json["LegStops"] ?? [];
    }
    if (json["OperatingAirline"] is Map) {
      operatingAirline = json["OperatingAirline"] == null
          ? null
          : OperatingAirline.fromJson(json["OperatingAirline"]);
    }
    if (json["SegmentRef"] is String) {
      segmentRef = json["SegmentRef"];
    }
    if (json["TicketingAirline"] is Map) {
      ticketingAirline = json["TicketingAirline"] == null
          ? null
          : TicketingAirline.fromJson(json["TicketingAirline"]);
    }
    if (json["VendorPnr"] is String) {
      vendorPnr = json["VendorPnr"];
    }
    if (json["WaitingDuration"] is int) {
      waitingDuration = json["WaitingDuration"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["AlternativeRef"] = alternativeRef;
    if (arrivalAirport != null) {
      data["ArrivalAirport"] = arrivalAirport?.toJson();
    }
    data["ArrivalDate"] = arrivalDate;
    data["CabinType"] = cabinType;
    data["ClassCode"] = classCode;
    data["Data"] = data;
    if (departureAirport != null) {
      data["DepartureAirport"] = departureAirport?.toJson();
    }
    data["DepartureDate"] = departureDate;
    data["FareBasis"] = fareBasis;
    data["FareTitle"] = fareTitle;
    data["FlightDuration"] = flightDuration;
    data["FlightNo"] = flightNo;
    data["IsConnectedToNextFlight"] = isConnectedToNextFlight;
    data["LegOrderNo"] = legOrderNo;
    if (legStops != null) {
      data["LegStops"] = legStops;
    }
    if (operatingAirline != null) {
      data["OperatingAirline"] = operatingAirline?.toJson();
    }
    data["SegmentRef"] = segmentRef;
    if (ticketingAirline != null) {
      data["TicketingAirline"] = ticketingAirline?.toJson();
    }
    data["VendorPnr"] = vendorPnr;
    data["WaitingDuration"] = waitingDuration;
    return data;
  }
}

class TicketingAirline {
  int? rating;
  dynamic searchingWords;
  String? checkInUrl;
  String? code;
  String? logo;
  String? name;
  String? shortName;
  String? ticketingCode;

  TicketingAirline(
      {this.rating,
      this.searchingWords,
      this.checkInUrl,
      this.code,
      this.logo,
      this.name,
      this.shortName,
      this.ticketingCode});

  TicketingAirline.fromJson(Map<String, dynamic> json) {
    if (json["Rating"] is int) {
      rating = json["Rating"];
    }
    searchingWords = json["SearchingWords"];
    if (json["CheckInUrl"] is String) {
      checkInUrl = json["CheckInUrl"];
    }
    if (json["Code"] is String) {
      code = json["Code"];
    }
    if (json["Logo"] is String) {
      logo = json["Logo"];
    }
    if (json["Name"] is String) {
      name = json["Name"];
    }
    if (json["ShortName"] is String) {
      shortName = json["ShortName"];
    }
    if (json["TicketingCode"] is String) {
      ticketingCode = json["TicketingCode"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Rating"] = rating;
    data["SearchingWords"] = searchingWords;
    data["CheckInUrl"] = checkInUrl;
    data["Code"] = code;
    data["Logo"] = logo;
    data["Name"] = name;
    data["ShortName"] = shortName;
    data["TicketingCode"] = ticketingCode;
    return data;
  }
}

class OperatingAirline {
  int? rating;
  dynamic searchingWords;
  String? checkInUrl;
  String? code;
  String? logo;
  String? name;
  String? shortName;
  String? ticketingCode;

  OperatingAirline(
      {this.rating,
      this.searchingWords,
      this.checkInUrl,
      this.code,
      this.logo,
      this.name,
      this.shortName,
      this.ticketingCode});

  OperatingAirline.fromJson(Map<String, dynamic> json) {
    if (json["Rating"] is int) {
      rating = json["Rating"];
    }
    searchingWords = json["SearchingWords"];
    if (json["CheckInUrl"] is String) {
      checkInUrl = json["CheckInUrl"];
    }
    if (json["Code"] is String) {
      code = json["Code"];
    }
    if (json["Logo"] is String) {
      logo = json["Logo"];
    }
    if (json["Name"] is String) {
      name = json["Name"];
    }
    if (json["ShortName"] is String) {
      shortName = json["ShortName"];
    }
    if (json["TicketingCode"] is String) {
      ticketingCode = json["TicketingCode"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Rating"] = rating;
    data["SearchingWords"] = searchingWords;
    data["CheckInUrl"] = checkInUrl;
    data["Code"] = code;
    data["Logo"] = logo;
    data["Name"] = name;
    data["ShortName"] = shortName;
    data["TicketingCode"] = ticketingCode;
    return data;
  }
}

class DepartureAirport {
  int? rating;
  dynamic searchingWords;
  String? cityCode;
  String? cityName;
  String? code;
  String? countryCode;
  String? countryName;
  GeoLocation1? geoLocation;
  String? hotPointCodes;
  int? hotpointType;
  String? name;
  int? timeZone;

  DepartureAirport(
      {this.rating,
      this.searchingWords,
      this.cityCode,
      this.cityName,
      this.code,
      this.countryCode,
      this.countryName,
      this.geoLocation,
      this.hotPointCodes,
      this.hotpointType,
      this.name,
      this.timeZone});

  DepartureAirport.fromJson(Map<String, dynamic> json) {
    if (json["Rating"] is int) {
      rating = json["Rating"];
    }
    searchingWords = json["SearchingWords"];
    if (json["CityCode"] is String) {
      cityCode = json["CityCode"];
    }
    if (json["CityName"] is String) {
      cityName = json["CityName"];
    }
    if (json["Code"] is String) {
      code = json["Code"];
    }
    if (json["CountryCode"] is String) {
      countryCode = json["CountryCode"];
    }
    if (json["CountryName"] is String) {
      countryName = json["CountryName"];
    }
    if (json["GeoLocation"] is Map) {
      geoLocation = json["GeoLocation"] == null
          ? null
          : GeoLocation1.fromJson(json["GeoLocation"]);
    }
    if (json["HotPointCodes"] is String) {
      hotPointCodes = json["HotPointCodes"];
    }
    if (json["HotpointType"] is int) {
      hotpointType = json["HotpointType"];
    }
    if (json["Name"] is String) {
      name = json["Name"];
    }
    if (json["TimeZone"] is int) {
      timeZone = json["TimeZone"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Rating"] = rating;
    data["SearchingWords"] = searchingWords;
    data["CityCode"] = cityCode;
    data["CityName"] = cityName;
    data["Code"] = code;
    data["CountryCode"] = countryCode;
    data["CountryName"] = countryName;
    if (geoLocation != null) {
      data["GeoLocation"] = geoLocation?.toJson();
    }
    data["HotPointCodes"] = hotPointCodes;
    data["HotpointType"] = hotpointType;
    data["Name"] = name;
    data["TimeZone"] = timeZone;
    return data;
  }
}

class GeoLocation1 {
  double? latitude;
  double? longitude;

  GeoLocation1({this.latitude, this.longitude});

  GeoLocation1.fromJson(Map<String, dynamic> json) {
    if (json["Latitude"] is double) {
      latitude = json["Latitude"];
    }
    if (json["Longitude"] is double) {
      longitude = json["Longitude"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Latitude"] = latitude;
    data["Longitude"] = longitude;
    return data;
  }
}

class ArrivalAirport {
  int? rating;
  dynamic searchingWords;
  String? cityCode;
  String? cityName;
  String? code;
  String? countryCode;
  String? countryName;
  GeoLocation? geoLocation;
  String? hotPointCodes;
  int? hotpointType;
  String? name;
  int? timeZone;

  ArrivalAirport(
      {this.rating,
      this.searchingWords,
      this.cityCode,
      this.cityName,
      this.code,
      this.countryCode,
      this.countryName,
      this.geoLocation,
      this.hotPointCodes,
      this.hotpointType,
      this.name,
      this.timeZone});

  ArrivalAirport.fromJson(Map<String, dynamic> json) {
    if (json["Rating"] is int) {
      rating = json["Rating"];
    }
    searchingWords = json["SearchingWords"];
    if (json["CityCode"] is String) {
      cityCode = json["CityCode"];
    }
    if (json["CityName"] is String) {
      cityName = json["CityName"];
    }
    if (json["Code"] is String) {
      code = json["Code"];
    }
    if (json["CountryCode"] is String) {
      countryCode = json["CountryCode"];
    }
    if (json["CountryName"] is String) {
      countryName = json["CountryName"];
    }
    if (json["GeoLocation"] is Map) {
      geoLocation = json["GeoLocation"] == null
          ? null
          : GeoLocation.fromJson(json["GeoLocation"]);
    }
    if (json["HotPointCodes"] is String) {
      hotPointCodes = json["HotPointCodes"];
    }
    if (json["HotpointType"] is int) {
      hotpointType = json["HotpointType"];
    }
    if (json["Name"] is String) {
      name = json["Name"];
    }
    if (json["TimeZone"] is int) {
      timeZone = json["TimeZone"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Rating"] = rating;
    data["SearchingWords"] = searchingWords;
    data["CityCode"] = cityCode;
    data["CityName"] = cityName;
    data["Code"] = code;
    data["CountryCode"] = countryCode;
    data["CountryName"] = countryName;
    if (geoLocation != null) {
      data["GeoLocation"] = geoLocation?.toJson();
    }
    data["HotPointCodes"] = hotPointCodes;
    data["HotpointType"] = hotpointType;
    data["Name"] = name;
    data["TimeZone"] = timeZone;
    return data;
  }
}

class GeoLocation {
  double? latitude;
  double? longitude;

  GeoLocation({this.latitude, this.longitude});

  GeoLocation.fromJson(Map<String, dynamic> json) {
    if (json["Latitude"] is double) {
      latitude = json["Latitude"];
    }
    if (json["Longitude"] is double) {
      longitude = json["Longitude"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Latitude"] = latitude;
    data["Longitude"] = longitude;
    return data;
  }
}

class Amount1 {
  double? baseBuyAmount;
  double? baseSellAmount;
  List<dynamic>? collectionList;
  int? commission;
  String? currencyCode;
  dynamic data;
  List<dynamic>? discountList;
  int? originalCommission;
  double? serviceFee;
  List<TaxList>? taxList;
  double? totalBuyAmount;
  int? totalCommission;
  int? totalDiscountAmount;
  int? totalPaymentTypeSellAmount;
  int? totalPenaltySellAmount;
  double? totalSellAmount;
  double? totalTaxAmount;

  Amount1(
      {this.baseBuyAmount,
      this.baseSellAmount,
      this.collectionList,
      this.commission,
      this.currencyCode,
      this.data,
      this.discountList,
      this.originalCommission,
      this.serviceFee,
      this.taxList,
      this.totalBuyAmount,
      this.totalCommission,
      this.totalDiscountAmount,
      this.totalPaymentTypeSellAmount,
      this.totalPenaltySellAmount,
      this.totalSellAmount,
      this.totalTaxAmount});

  Amount1.fromJson(Map<String, dynamic> json) {
    if (json["BaseBuyAmount"] is double) {
      baseBuyAmount = json["BaseBuyAmount"];
    }
    if (json["BaseSellAmount"] is double) {
      baseSellAmount = json["BaseSellAmount"];
    }
    if (json["CollectionList"] is List) {
      collectionList = json["CollectionList"] ?? [];
    }
    if (json["Commission"] is int) {
      commission = json["Commission"];
    }
    if (json["CurrencyCode"] is String) {
      currencyCode = json["CurrencyCode"];
    }
    data = json["Data"];
    if (json["DiscountList"] is List) {
      discountList = json["DiscountList"] ?? [];
    }
    if (json["OriginalCommission"] is int) {
      originalCommission = json["OriginalCommission"];
    }
    if (json["ServiceFee"] is double) {
      serviceFee = json["ServiceFee"];
    }
    if (json["TaxList"] is List) {
      taxList = json["TaxList"] == null
          ? null
          : (json["TaxList"] as List).map((e) => TaxList.fromJson(e)).toList();
    }
    if (json["TotalBuyAmount"] is double) {
      totalBuyAmount = json["TotalBuyAmount"];
    }
    if (json["TotalCommission"] is int) {
      totalCommission = json["TotalCommission"];
    }
    if (json["TotalDiscountAmount"] is int) {
      totalDiscountAmount = json["TotalDiscountAmount"];
    }
    if (json["TotalPaymentTypeSellAmount"] is int) {
      totalPaymentTypeSellAmount = json["TotalPaymentTypeSellAmount"];
    }
    if (json["TotalPenaltySellAmount"] is int) {
      totalPenaltySellAmount = json["TotalPenaltySellAmount"];
    }
    if (json["TotalSellAmount"] is double) {
      totalSellAmount = json["TotalSellAmount"];
    }
    if (json["TotalTaxAmount"] is double) {
      totalTaxAmount = json["TotalTaxAmount"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["BaseBuyAmount"] = baseBuyAmount;
    data["BaseSellAmount"] = baseSellAmount;
    if (collectionList != null) {
      data["CollectionList"] = collectionList;
    }
    data["Commission"] = commission;
    data["CurrencyCode"] = currencyCode;
    data["Data"] = data;
    if (discountList != null) {
      data["DiscountList"] = discountList;
    }
    data["OriginalCommission"] = originalCommission;
    data["ServiceFee"] = serviceFee;
    if (taxList != null) {
      data["TaxList"] = taxList?.map((e) => e.toJson()).toList();
    }
    data["TotalBuyAmount"] = totalBuyAmount;
    data["TotalCommission"] = totalCommission;
    data["TotalDiscountAmount"] = totalDiscountAmount;
    data["TotalPaymentTypeSellAmount"] = totalPaymentTypeSellAmount;
    data["TotalPenaltySellAmount"] = totalPenaltySellAmount;
    data["TotalSellAmount"] = totalSellAmount;
    data["TotalTaxAmount"] = totalTaxAmount;
    return data;
  }
}

class TaxList {
  double? taxAmount;
  String? taxCode;

  TaxList({this.taxAmount, this.taxCode});

  TaxList.fromJson(Map<String, dynamic> json) {
    if (json["TaxAmount"] is double) {
      taxAmount = json["TaxAmount"];
    }
    if (json["TaxCode"] is String) {
      taxCode = json["TaxCode"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["TaxAmount"] = taxAmount;
    data["TaxCode"] = taxCode;
    return data;
  }
}

class Contracts {
  String? content;
  int? productType;

  Contracts({this.content, this.productType});

  Contracts.fromJson(Map<String, dynamic> json) {
    if (json["Content"] is String) {
      content = json["Content"];
    }
    if (json["ProductType"] is int) {
      productType = json["ProductType"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Content"] = content;
    data["ProductType"] = productType;
    return data;
  }
}

class ContactInfo {
  String? email;
  String? firstName;
  int? genderType;
  String? lastName;
  String? phone;

  ContactInfo(
      {this.email, this.firstName, this.genderType, this.lastName, this.phone});

  ContactInfo.fromJson(Map<String, dynamic> json) {
    if (json["Email"] is String) {
      email = json["Email"];
    }
    if (json["FirstName"] is String) {
      firstName = json["FirstName"];
    }
    if (json["GenderType"] is int) {
      genderType = json["GenderType"];
    }
    if (json["LastName"] is String) {
      lastName = json["LastName"];
    }
    if (json["Phone"] is String) {
      phone = json["Phone"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["Email"] = email;
    data["FirstName"] = firstName;
    data["GenderType"] = genderType;
    data["LastName"] = lastName;
    data["Phone"] = phone;
    return data;
  }
}

class Amount {
  double? baseBuyAmount;
  double? baseSellAmount;
  List<dynamic>? collectionList;
  int? commission;
  String? currencyCode;
  dynamic data;
  List<dynamic>? discountList;
  int? originalCommission;
  double? serviceFee;
  List<dynamic>? taxList;
  double? totalBuyAmount;
  int? totalCommission;
  int? totalDiscountAmount;
  int? totalPaymentTypeSellAmount;
  int? totalPenaltySellAmount;
  double? totalSellAmount;
  double? totalTaxAmount;

  Amount(
      {this.baseBuyAmount,
      this.baseSellAmount,
      this.collectionList,
      this.commission,
      this.currencyCode,
      this.data,
      this.discountList,
      this.originalCommission,
      this.serviceFee,
      this.taxList,
      this.totalBuyAmount,
      this.totalCommission,
      this.totalDiscountAmount,
      this.totalPaymentTypeSellAmount,
      this.totalPenaltySellAmount,
      this.totalSellAmount,
      this.totalTaxAmount});

  Amount.fromJson(Map<String, dynamic> json) {
    if (json["BaseBuyAmount"] is double) {
      baseBuyAmount = json["BaseBuyAmount"];
    }
    if (json["BaseSellAmount"] is double) {
      baseSellAmount = json["BaseSellAmount"];
    }
    if (json["CollectionList"] is List) {
      collectionList = json["CollectionList"] ?? [];
    }
    if (json["Commission"] is int) {
      commission = json["Commission"];
    }
    if (json["CurrencyCode"] is String) {
      currencyCode = json["CurrencyCode"];
    }
    data = json["Data"];
    if (json["DiscountList"] is List) {
      discountList = json["DiscountList"] ?? [];
    }
    if (json["OriginalCommission"] is int) {
      originalCommission = json["OriginalCommission"];
    }
    if (json["ServiceFee"] is double) {
      serviceFee = json["ServiceFee"];
    }
    if (json["TaxList"] is List) {
      taxList = json["TaxList"] ?? [];
    }
    if (json["TotalBuyAmount"] is double) {
      totalBuyAmount = json["TotalBuyAmount"];
    }
    if (json["TotalCommission"] is int) {
      totalCommission = json["TotalCommission"];
    }
    if (json["TotalDiscountAmount"] is int) {
      totalDiscountAmount = json["TotalDiscountAmount"];
    }
    if (json["TotalPaymentTypeSellAmount"] is int) {
      totalPaymentTypeSellAmount = json["TotalPaymentTypeSellAmount"];
    }
    if (json["TotalPenaltySellAmount"] is int) {
      totalPenaltySellAmount = json["TotalPenaltySellAmount"];
    }
    if (json["TotalSellAmount"] is double) {
      totalSellAmount = json["TotalSellAmount"];
    }
    if (json["TotalTaxAmount"] is double) {
      totalTaxAmount = json["TotalTaxAmount"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["BaseBuyAmount"] = baseBuyAmount;
    data["BaseSellAmount"] = baseSellAmount;
    if (collectionList != null) {
      data["CollectionList"] = collectionList;
    }
    data["Commission"] = commission;
    data["CurrencyCode"] = currencyCode;
    data["Data"] = data;
    if (discountList != null) {
      data["DiscountList"] = discountList;
    }
    data["OriginalCommission"] = originalCommission;
    data["ServiceFee"] = serviceFee;
    if (taxList != null) {
      data["TaxList"] = taxList;
    }
    data["TotalBuyAmount"] = totalBuyAmount;
    data["TotalCommission"] = totalCommission;
    data["TotalDiscountAmount"] = totalDiscountAmount;
    data["TotalPaymentTypeSellAmount"] = totalPaymentTypeSellAmount;
    data["TotalPenaltySellAmount"] = totalPenaltySellAmount;
    data["TotalSellAmount"] = totalSellAmount;
    data["TotalTaxAmount"] = totalTaxAmount;
    return data;
  }
}
