import 'package:bamobile1/generated/l10n.dart';
import 'package:flutter/material.dart';

class ErrorsModel {
  String? code;
  String? message;

  ErrorsModel({this.code, this.message});

  static List<ErrorsModel> getErrorList(BuildContext context) {
    return [
      ErrorsModel(code: "GE0001", message: S.of(context).UnauthorisedAccess),
      ErrorsModel(code: "GE0002", message: S.of(context).InvalidTokenCode),
      ErrorsModel(code: "GE0003", message: S.of(context).TokenHasExpired),
      ErrorsModel(
          code: "GE0004", message: S.of(context).InvalidUsernameOrPassword),
      ErrorsModel(code: "GE0005", message: S.of(context).InvalidEmail),
      ErrorsModel(code: "GE0006", message: S.of(context).InvalidData),
      ErrorsModel(code: "GE0007", message: S.of(context).InvalidUsername),
      ErrorsModel(code: "GE0008", message: S.of(context).InvalidFirstName),
      ErrorsModel(code: "GE0009", message: S.of(context).InvalidLastName),
      ErrorsModel(code: "GE0010", message: S.of(context).InvalidPhoneNumber),
      ErrorsModel(code: "GE0011", message: S.of(context).InvalidCompanyName),
      ErrorsModel(code: "GE0012", message: S.of(context).EmailIsUsed),
      ErrorsModel(code: "GE0013", message: S.of(context).UsernameIsUsed),
      ErrorsModel(
          code: "GE0014", message: S.of(context).InsufficientPermission),
      ErrorsModel(
          code: "GE0015",
          message: S.of(context).NewPasswordCannotBeEmptyOrLessThan8Characters),
      ErrorsModel(code: "GE0016", message: S.of(context).DataNotFound),
      ErrorsModel(
          code: "GE0017",
          message: S.of(context).AgentRequiredToSavePaxInformation),
      ErrorsModel(code: "GE0018", message: S.of(context).InvalidBirthDate),
      ErrorsModel(
          code: "GE0019",
          message: S.of(context).InvalidIdentityOrPassportNumber),
      ErrorsModel(code: "GE0020", message: S.of(context).InvalidSystemPNR),
      ErrorsModel(code: "GE0021", message: S.of(context).InvalidDate),
      ErrorsModel(
          code: "GE0022", message: S.of(context).DateRangeMaximum30Days),
      ErrorsModel(code: "GE0023", message: S.of(context).InvalidAddress),
      ErrorsModel(code: "GE0024", message: S.of(context).InvalidSubject),
      ErrorsModel(code: "GE0025", message: S.of(context).InvalidContent),
      ErrorsModel(code: "GE0026", message: S.of(context).InvalidDeparturePoint),
      ErrorsModel(code: "GE0027", message: S.of(context).InvalidArrivalPoint),
      ErrorsModel(code: "GE0028", message: S.of(context).PriceChanged),
      ErrorsModel(code: "GE0029", message: S.of(context).AgencyNotActivated),
      ErrorsModel(code: "GE0030", message: S.of(context).InvalidIPAddress),
      ErrorsModel(code: "GE0031", message: S.of(context).InvalidContactPerson),
      ErrorsModel(
          code: "GE0032", message: S.of(context).InvalidInvoiceInformation),
      ErrorsModel(code: "GE0033", message: S.of(context).InvalidTaxNumber),
      ErrorsModel(code: "GE0034", message: S.of(context).InvalidPostalCode),
      ErrorsModel(code: "GE0035", message: S.of(context).InvalidInvoiceName),
      ErrorsModel(code: "GE0036", message: S.of(context).InvalidCity),
      ErrorsModel(code: "GE0037", message: S.of(context).ReservationFailed),
      ErrorsModel(
          code: "GE0038",
          message: S.of(context).MethodAvailableOnlyForSucceedReservations),
      ErrorsModel(
          code: "GE0039", message: S.of(context).TicketAlreadyCancelled),
      ErrorsModel(
          code: "GE0040", message: S.of(context).ReservationAlreadyCancelled),
      ErrorsModel(
          code: "GE0041", message: S.of(context).ReservationAlreadyExpired),
      ErrorsModel(
          code: "GE0042", message: S.of(context).TicketCouldNotBeCancelled),
      ErrorsModel(
          code: "GE0043",
          message: S.of(context).ReservationCouldNotBeCancelled),
      ErrorsModel(code: "GE0044", message: S.of(context).InvalidNationality),
      ErrorsModel(code: "GE0045", message: S.of(context).InvalidPaxInformation),
      ErrorsModel(code: "GE0046", message: S.of(context).InvalidPaxType),
      ErrorsModel(code: "GE0047", message: S.of(context).ProvidePassengerCount),
      ErrorsModel(
          code: "GE0048", message: S.of(context).MinimumCountOfAdultShouldBe1),
      ErrorsModel(code: "GE0049", message: S.of(context).InvalidChildAge),
      ErrorsModel(code: "GE0050", message: S.of(context).InvalidResultKey),
      ErrorsModel(
          code: "GE0051",
          message: S.of(context).PassengerCountNotCompatibleWithPassengerType),
      ErrorsModel(code: "GE0052", message: S.of(context).InsufficientQuota),
      ErrorsModel(code: "GE0053", message: S.of(context).InvalidProductType),
      ErrorsModel(code: "GE0054", message: S.of(context).AvailabilityNotFound),
      ErrorsModel(code: "GE0055", message: S.of(context).InvalidCountry),
      ErrorsModel(
          code: "GE0056",
          message: S.of(context).ReservationUpdatedByMainAccountUser),
      ErrorsModel(code: "GE0057", message: S.of(context).SearchResultExpired),
      ErrorsModel(code: "GE0058", message: S.of(context).CancelledFailed),
      ErrorsModel(
          code: "GE0059", message: S.of(context).InvalidMileageProgramNumber),
      ErrorsModel(code: "GE0060", message: S.of(context).InvalidHESCode),
      ErrorsModel(code: "GE0061", message: S.of(context).HESCodeIsMandatory),
      ErrorsModel(code: "PE0001", message: S.of(context).InvalidPaymentType),
      ErrorsModel(
          code: "PE0002", message: S.of(context).InvalidCardInformation),
      ErrorsModel(
          code: "PE0003",
          message: S.of(context).ThreeDSecurePaymentIsMandatory),
      ErrorsModel(
          code: "PE0004",
          message: S.of(context).ReturnUrlIsMandatoryForThreeDSecurePayment),
      ErrorsModel(
          code: "PE0005", message: S.of(context).ReturnUrlIsMandatoryForAPS),
      ErrorsModel(code: "PE0006", message: S.of(context).BalanceNotEnough),
      ErrorsModel(
          code: "PE0007",
          message: S.of(context).CreditCardDoesNotMatchPaymentOption),
    ];
  }
}
