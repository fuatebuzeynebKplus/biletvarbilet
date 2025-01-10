part of 'flight_ticket_cubit.dart';

@immutable
sealed class FlightTicketState {}

final class FlightTicketInitial extends FlightTicketState {}

final class SearchTypeState extends FlightTicketState {}

final class HomeCheckBoxesState extends FlightTicketState {}

final class ToggleTextsState extends FlightTicketState {}

final class DateRangePickerState extends FlightTicketState {}

final class SelectListIndexForMultiPointState extends FlightTicketState {}

final class RemoveCardFromSelectedMultiPointListState
    extends FlightTicketState {}

final class DatePickerState extends FlightTicketState {}

final class SelectBetweenTwoTextState extends FlightTicketState {}

final class TicketIncrementState extends FlightTicketState {}

final class TicketRemoveState extends FlightTicketState {}

final class BottomSheetState extends FlightTicketState {}

final class SelectedCardLeavingIndexState extends FlightTicketState {}

final class SelectedCardReturnIndexState extends FlightTicketState {}

final class VisibilitySecondListForReturnState extends FlightTicketState {}

final class VisibilityContainerInFlightDetailsState extends FlightTicketState {}

final class SelectedSeatTypeLeavingState extends FlightTicketState {}

final class SelectedSeatTypeReturnState extends FlightTicketState {}

final class VisibilityFlightSeatTypeState extends FlightTicketState {}

final class SelectRadioButtonForPaymentViewState extends FlightTicketState {}

final class SelectRadioButtonForSortState extends FlightTicketState {}

final class SelectMarkupTypeState extends FlightTicketState {}

final class AddIndexState extends FlightTicketState {}

final class SendIndexState extends FlightTicketState {}

final class AddPreferAirlineCodeAndNameState extends FlightTicketState {}

final class PaymentTypesShow extends FlightTicketState {}

final class CheckIfGlobalFlyOrNot extends FlightTicketState {}

final class TotalPriceState extends FlightTicketState {}

final class SendArgumentsState extends FlightTicketState {}

final class SearchInBinCodesLoadingState extends FlightTicketState {}

final class SearchInBinCodesSuccessState extends FlightTicketState {}

final class CheckIsAnyOneNullOrNotCompleatForReservationState
    extends FlightTicketState {}

final class CheckboxBookingTypeForReservationAlertDialogWidgetState
    extends FlightTicketState {}

final class SearchInBinCodesFailureState extends FlightTicketState {
  final String errorMassage;

  SearchInBinCodesFailureState({required this.errorMassage});
}

final class SearchCityDataSuccess extends FlightTicketState {}

final class SearchCityDataLoading extends FlightTicketState {}

final class SearchCityDataFailure extends FlightTicketState {
  final String errorMassage;

  SearchCityDataFailure({required this.errorMassage});
}

final class SearchFlightSuccess extends FlightTicketState {}

final class SearchFlightLoading extends FlightTicketState {}

final class SearchFlightFailure extends FlightTicketState {
  final String errorMassage;
  final String errorCode;

  SearchFlightFailure({
    required this.errorMassage,
    required this.errorCode,
  });
}

final class FlightFaresSuccess extends FlightTicketState {}

final class FlightFaresLoading extends FlightTicketState {}

final class FlightFaresFailure extends FlightTicketState {
  final String errorMassage;
  final String errorCode;

  FlightFaresFailure({
    required this.errorMassage,
    required this.errorCode,
  });
}

final class FlightValidateSuccess extends FlightTicketState {}

final class FlightValidateFailure extends FlightTicketState {
  final String errorMassage;
  final String errorCode;

  FlightValidateFailure({
    required this.errorMassage,
    required this.errorCode,
  });
}

final class FlightPaymentOptionsSuccess extends FlightTicketState {}

final class FlightPaymentOptionsLoading extends FlightTicketState {}

final class FlightPaymentOptionsFailure extends FlightTicketState {
  final String errorMassage;
  final String errorCode;

  FlightPaymentOptionsFailure(
      {required this.errorCode, required this.errorMassage});
}

final class FlightBookSuccess extends FlightTicketState {}

final class FlightBookLoading extends FlightTicketState {}

final class FlightBookFailure extends FlightTicketState {
  final String errorMassage;
  final String errorCode;

  FlightBookFailure({required this.errorCode, required this.errorMassage});
}

final class FlightCancelReservationSuccess extends FlightTicketState {}

final class FlightCancelReservationLoading extends FlightTicketState {}

final class FlightCancelReservationFailure extends FlightTicketState {
  final String errorMassage;
  final String errorCode;

  FlightCancelReservationFailure(
      {required this.errorCode, required this.errorMassage});
}

final class FlightVoidTicketSuccess extends FlightTicketState {}

final class FlightVoidTicketLoading extends FlightTicketState {}

final class FlightVoidTicketFailure extends FlightTicketState {
  final String errorMassage;
  final String errorCode;

  FlightVoidTicketFailure(
      {required this.errorCode, required this.errorMassage});
}

final class SearchLeavingOrReturnListFunction extends FlightTicketState {}

final class LuggageFilterState extends FlightTicketState {}

final class FlightProviderFilterState extends FlightTicketState {}

final class AirportsFilterState extends FlightTicketState {}

final class SelectAgentCreditCardOrCustomerCreditCardState
    extends FlightTicketState {}

final class CabinTypeFilterState extends FlightTicketState {}

final class DateRangePickerReservationState extends FlightTicketState {}

final class AirlinesFilterState extends FlightTicketState {}

final class ClearAllFilterState extends FlightTicketState {}

final class TheTextLengthIs3AndMoreState extends FlightTicketState {}

final class SelectPaymentTypeInReservation extends FlightTicketState {}

final class ApplyFilterState extends FlightTicketState {}

final class GetReservationsSuccess extends FlightTicketState {}

final class GetReservationsLoading extends FlightTicketState {}

final class GetReservationsFailure extends FlightTicketState {
  final String errorMassage;
  final String errorCode;

  GetReservationsFailure({required this.errorCode, required this.errorMassage});
}

final class GetDetailsResultViewSuccess extends FlightTicketState {}

final class GetDetailsResultViewLoading extends FlightTicketState {}

final class GetDetailsResultViewFailure extends FlightTicketState {
  final String errorMassage;
  final String errorCode;

  GetDetailsResultViewFailure(
      {required this.errorCode, required this.errorMassage});
}

final class RetrieveReservationAndReservationToTicketSuccess
    extends FlightTicketState {}

final class RetrieveReservationAndReservationToTicketLoading
    extends FlightTicketState {}

final class RetrieveReservationAndReservationToTicketFailure
    extends FlightTicketState {
  final String errorMassage;
  final String errorCode;

  RetrieveReservationAndReservationToTicketFailure(
      {required this.errorCode, required this.errorMassage});
}

final class ClearTextFieldReservationState extends FlightTicketState {}

//----------------multi point----------------
final class AddPointToMultiPointList extends FlightTicketState {}
