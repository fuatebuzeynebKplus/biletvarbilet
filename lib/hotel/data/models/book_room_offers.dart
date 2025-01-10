import 'package:bamobile1/common/data/models/pax_info.dart';
import 'package:bamobile1/common/data/models/payment_info.dart';
import 'package:bamobile1/common/data/models/payment_verification_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_room_offers.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class BookRoomOffers {
  ContactInfo contactInfo;
  InvoiceInfo invoiceInfo;
  PaxInfo? paxInfo;
  PaymentInfo? paymentInfo;
  String resultKeys;
  String tokenCode;

  BookRoomOffers(
      {required this.contactInfo,
      required this.invoiceInfo,
      this.paxInfo,
      this.paymentInfo,
      required this.resultKeys,
      required this.tokenCode});

  factory BookRoomOffers.fromJson(Map<String, dynamic> json) =>
      _$BookRoomOffersFromJson(json);

  Map<String, dynamic> toJson() => _$BookRoomOffersToJson(this);
}

class BookRoomOffersJson {
  BookRoomOffers request;

  BookRoomOffersJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
