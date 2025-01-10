import 'package:bamobile1/common/data/enums/product_type.dart';
import 'contact_info.dart';
import 'extra_info.dart';
import 'pax_info.dart';
import 'payment_info.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bamobile1/common/data/models/invoice_info.dart';

part 'booking_request.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class BookingRequest {
  String? agentReferenceInfo;
  String? bookingNote;
  ContactInfo? contactInfo;
  String? corporatePin;
  ExtraInfo? extraInfo;
  String? extraNote;
  InvoiceInfo? invoiceInfo;
  String? languageCode;
  String? lastName;
  PaxInfo? paxInfo;
  PaymentInfo? paymentInfo;
  ProductType? productType;
  List<String>? resultKeys;
  String? systemPnr;
  String? tokenCode;
  String? version;

  BookingRequest({
    this.agentReferenceInfo,
    this.bookingNote,
    this.contactInfo,
    this.corporatePin,
    this.extraInfo,
    this.extraNote,
    this.invoiceInfo,
    this.languageCode,
    this.lastName,
    this.paxInfo,
    this.paymentInfo,
    this.productType,
    this.resultKeys,
    this.systemPnr,
    this.tokenCode,
    this.version,
  });

  factory BookingRequest.fromJson(Map<String, dynamic> json) =>
      _$BookingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$BookingRequestToJson(this);
}

class WrappedBookingRequest {
  BookingRequest request;

  WrappedBookingRequest({required this.request});

  Map<String, dynamic> toJson() {
    return {
      "request": request.toJson(),
    };
  }
}
