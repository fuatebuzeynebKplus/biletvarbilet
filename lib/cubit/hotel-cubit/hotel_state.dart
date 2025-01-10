part of 'hotel_cubit.dart';

@immutable
sealed class HotelState {}

final class HotelInitial extends HotelState {}

final class DateRangePickerState extends HotelState {}

final class BottomSheetState extends HotelState {}

final class HotelIncrementState extends HotelState {}

final class SelectAgentCreditCardOrCustomerCreditCardState extends HotelState {}

final class SearchInBinCodesLoadingState extends HotelState {}

final class CheckIsAnyOneNullOrNotCompleatForReservationState
    extends HotelState {}

final class SearchInBinCodesSuccessState extends HotelState {}

final class HotelDropDownState extends HotelState {}

final class HotelRemoveState extends HotelState {}

final class SelectMarkupTypeState extends HotelState {}

final class ClickNationalityState extends HotelState {}

final class SelectHotelCardDetailsState extends HotelState {}

final class SelectRadioButtonForPaymentViewState extends HotelState {}

final class ChangeHotelCardState extends HotelState {}

final class GetTotalRoomPriceState extends HotelState {}

final class SelectHotelCardState extends HotelState {}

final class SendArgumentsHotelState extends HotelState {}

final class SendIndexHotelState extends HotelState {}

final class SelectBetweenTwoTextState extends HotelState {}

final class AddIndexState extends HotelState {}

final class HotelSelectRadioButtonForPaymentViewState extends HotelState {}

final class SearchHotelDataSuccess extends HotelState {}

final class SearchHotelDataLoading extends HotelState {}

final class SearchHotelDataFailure extends HotelState {
  final String errorMassage;

  SearchHotelDataFailure({required this.errorMassage});
}

final class SearchAllHotelListSuccess extends HotelState {}

final class SearchAllHotelListLoading extends HotelState {}

final class SearchAllHotelListFailure extends HotelState {
  final String errorMassage;
  final String errorCode;

  SearchAllHotelListFailure({
    required this.errorMassage,
    required this.errorCode,
  });
}

final class GetHotelRoomPricesSuccess extends HotelState {}

final class GetHotelRoomPricesLoading extends HotelState {}

final class GetHotelRoomPricesFailure extends HotelState {
  final String errorMassage;
  final String errorCode;

  GetHotelRoomPricesFailure({
    required this.errorMassage,
    required this.errorCode,
  });
}

final class GetHotelRoomCancellationPoliciesSuccess extends HotelState {}

final class GetHotelRoomCancellationPoliciesLoading extends HotelState {}

final class GetHotelRoomCancellationPoliciesFailure extends HotelState {
  final String errorMassage;
  final String errorCode;

  GetHotelRoomCancellationPoliciesFailure({
    required this.errorMassage,
    required this.errorCode,
  });
}

final class HotelPaymentOptionsSuccess extends HotelState {}

final class HotelPaymentOptionsLoading extends HotelState {}

final class HotelPaymentOptionsFailure extends HotelState {
  final String errorMassage;
  final String errorCode;

  HotelPaymentOptionsFailure(
      {required this.errorCode, required this.errorMassage});
}

final class HotelBookSuccess extends HotelState {}

final class HotelBookLoading extends HotelState {}

final class HotelBookFailure extends HotelState {
  final String errorMassage;
  final String errorCode;

  HotelBookFailure({required this.errorCode, required this.errorMassage});
}
