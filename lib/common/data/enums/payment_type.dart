import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum PaymentType {
  customerCreditCard(0, 'Credit card'),
  agentCreditCard(1, 'Credit card agent'),
  currentAccount(2, 'Credit/Current account'),
  wireTransfer(3, 'WireTransfer'),
  cash(4, 'Cash'),
  preBooking(6, 'Reservation without payment (if applicable)'),
  kuveytTurk(7, 'KuveytTurk'),
  aps(8, "Alternative Payment"),
  payToProvider(9, 'Pay provider directly'),
  applicationPay(11, 'Application payment'),
  approval(12, 'Approval mechanism');

  final int value;
  final String description;

  const PaymentType(this.value, this.description);

  @override
  String toString() => description;

  static PaymentType fromString(String name) {
    switch (name) {
      case 'Credit card':
        return customerCreditCard;
      case 'Credit card agent':
        return agentCreditCard;
      case 'Credit/Current account':
        return currentAccount;
      case 'WireTransfer':
        return wireTransfer;
      case 'Cash':
        return cash;
      case 'Reservation without payment (if applicable)':
        return preBooking;
      case 'KuveytTurk':
        return kuveytTurk;
      case 'Alternative Payment':
        return aps;
      case 'Pay provider directly':
        return payToProvider;
      case 'Application payment':
        return applicationPay;
      case 'Approval mechanism':
        return approval;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
