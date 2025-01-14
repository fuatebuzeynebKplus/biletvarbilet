import 'package:bamobile1/bottom_nav_bar.dart';
import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/common/data/enums/payment_commission_type.dart';
import 'package:bamobile1/common/data/enums/payment_type.dart';
import 'package:bamobile1/common/data/enums/product_type.dart';
import 'package:bamobile1/common/data/models/booking_request.dart';
import 'package:bamobile1/common/data/models/credit_card_info.dart';
import 'package:bamobile1/common/data/models/payment_info.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/flight_booking_leg.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/hotel/data/models/cancel_reservation.dart';
import 'package:bamobile1/hotel/data/models/retrieve_reservation.dart';
import 'package:bamobile1/pdf_view.dart';

import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_colors.dart';

import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/other-views/flight-other-views/get_reservations_view.dart';
import 'package:bamobile1/views/other-views/webview_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_book_result.dart';
import 'package:bamobile1/widgets/alert_dialog_widget.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/flight_details_container_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/guset_details_container_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/passengers_details_container_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/reservation_details_container_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/two_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_field_other_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/bottom-sheet-widgets/for_credit_card_validity_date_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_installment_type_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/price_and_continue_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/sort_alert_dialog_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:slide_countdown/slide_countdown.dart';

class HotelReservationDetailsView extends StatelessWidget {
  const HotelReservationDetailsView({
    super.key,
  });
  static String id = 'HotelReservationDetailsView';

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    String? lastName;
    String? systemPnr;
    BookingStatusType? reservationState;

    flightTicketCubit.isTicket = flightTicketCubit
                .getReservationsList[
                    flightTicketCubit.saveReservationIndexValue!]
                .bookingStatusType ==
            BookingStatusType.ticketingSucceed
        ? true
        : false;

    DateTime newExpireDate = DateTime.now();

    if (flightTicketCubit.isCanceled) {
      print('1-isCanceled: ${flightTicketCubit.isCanceled}');
    } else {
      print('2-isCanceled: ${flightTicketCubit.isCanceled}');
      lastName = flightTicketCubit
          .getReservationsList[flightTicketCubit.saveReservationIndexValue!]
          .contactInfo!
          .lastName;
      systemPnr = flightTicketCubit
          .getReservationsList[flightTicketCubit.saveReservationIndexValue!]
          .systemPnr;
      reservationState = flightTicketCubit
          .getReservationsList[flightTicketCubit.saveReservationIndexValue!]
          .bookingStatusType;
    }

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        if (state is FlightCancelReservationSuccess) {
          flightTicketCubit.getReservationsList = [];
          SnackbarUtils.showSnackbar(context, S.of(context).Canceled);

          Navigator.pushReplacementNamed(context, GetReservationsView.id);
          BlocProvider.of<FlightTicketCubit>(context).getReservations(context);
          BlocProvider.of<FlightTicketCubit>(context).isCanceled = false;
        } else if (state is FlightVoidTicketSuccess) {
          flightTicketCubit.getReservationsList = [];
          Navigator.pushReplacementNamed(context, GetReservationsView.id);
          BlocProvider.of<FlightTicketCubit>(context).getReservations(context);
        } else if (state is FlightCancelReservationFailure) {
          SnackbarUtils.showSnackbar(context, state.errorMassage);
        } else if (state is RetrieveReservationAndReservationToTicketSuccess) {
          if (flightTicketCubit.selectedPaymentTypeForReservation ==
              PaymentType.customerCreditCard) {
            Navigator.pushNamed(
              context,
              WebViewView.id,
              arguments: flightTicketCubit.bookUrlResultReservation,
            );
          } else {
            Navigator.pushNamed(
              context,
              FlightTicketBookResult.id,
            );
          }
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              toolbarHeight: context.height * 0.06,
              automaticallyImplyLeading: false,
              title: AppBarWidget(
                onPressedLeading: () {
                  flightTicketCubit.selectedPaymentTypeForReservation = null;
                  flightTicketCubit
                          .checkIsAnyOneNullOrNotCompleatForReservationValue =
                      false;
                  Navigator.pushReplacementNamed(
                      context, GetReservationsView.id);
                },
                title: S.of(context).ReservationInfo,
                leading: Icons.arrow_back_ios,
              ),
              backgroundColor: AppColors.kAppBarColor,
            ),
            bottomSheet: flightTicketCubit.bottomSheetType == 24
                ? const ForCreditCardValidityDateBottomSheet()
                : flightTicketCubit
                                .checkIsAnyOneNullOrNotCompleatForReservationValue ==
                            true ||
                        flightTicketCubit.selectedPaymentTypeForReservation ==
                            PaymentType.currentAccount
                    ? BottomSheetWidget(
                        height: 0.1,
                        paddingTop: 0,
                        paddingLeftRight: 0,
                        circularRadius: 0,
                        color: Colors.white,
                        widgetBody: Center(
                          child: ButtonWidget(
                            color: AppColors.kSecondColor,
                            title: S.of(context).Continue,
                            height: 0.055,
                            width: 0.7,
                            fontSize: 16,
                            textColor: Colors.white,
                            onTap: () async {
                              await flightTicketCubit.retrieveReservation(
                                RetrieveReservationJson(
                                    request: RetrieveReservation(
                                        tokenCode: getIt<CacheHelper>()
                                                .getDataString(key: 'token') ??
                                            "",
                                        SystemPnr: systemPnr!,
                                        LastName: lastName!)),
                              );

                              await flightTicketCubit
                                  .reservationToTicket(WrappedBookingRequest(
                                      request: BookingRequest(
                                systemPnr: systemPnr,
                                lastName: lastName,
                                paymentInfo: flightTicketCubit.selectedPaymentTypeForReservation ==
                                        PaymentType.currentAccount
                                    ? PaymentInfo(
                                        paymentType: PaymentType.currentAccount)
                                    : PaymentInfo(
                                        cardInfo: CreditCardInfo(
                                            cardExpMonth: int.parse(flightTicketCubit
                                                .creditCardMonthAndYear!
                                                .substring(0, 2)),
                                            cardExpYear: int.parse(
                                                '20${flightTicketCubit.creditCardMonthAndYear!.substring(flightTicketCubit.creditCardMonthAndYear!.length - 2)}'),
                                            cardHolderName: flightTicketCubit
                                                .creditCardName!,
                                            cardNumber: flightTicketCubit
                                                .creditCardNumber!,
                                            cv2: flightTicketCubit
                                                .creditCardCvv!,
                                            is3D: true, // 38CM12TS82
                                            ipAdress: "88.241.185.1",
                                            returnUrl:
                                                "https://www.bookingagora.com/",
                                            email: ''),
                                        paymentItemId: flightTicketCubit.paymentId == null
                                            ? int.parse(
                                                flightTicketCubit.bookItemId!)
                                            : int.parse(
                                                flightTicketCubit.paymentId!),
                                        paymentType:
                                            PaymentType.customerCreditCard,
                                        paymentCommissionType: flightTicketCubit
                                            .paymentCommissionType),
                                productType: ProductType.flight,
                                tokenCode: getIt<CacheHelper>()
                                        .getDataString(key: 'token') ??
                                    "",
                              )));
                            },
                          ),
                        ))
                    : const SizedBox(),
            body: ModalProgressHUD(
              progressIndicator: const LoadingWidget(),
              inAsyncCall: state is FlightCancelReservationLoading ||
                  state is RetrieveReservationAndReservationToTicketLoading,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 12, left: 12, right: 12, bottom: 12),
                child: SingleChildScrollView(
                  controller: flightTicketCubit.scrollController,
                  child: flightTicketCubit.isCanceled
                      ? const SizedBox()
                      : Column(
                          children: [
                            flightTicketCubit.isTicket == false
                                ? const SizedBox()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ButtonWidget(
                                        title: S.of(context).PriceVoucher,
                                        height: 0.04,
                                        width: 0.45,
                                        fontSize: 14,
                                        textColor: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        onTap: () {
                                          flightTicketCubit.voucherWithPrice =
                                              true;
                                          Navigator.pushNamed(
                                              context, PdfPreviewScreen.id);
                                        },
                                      ),
                                      ButtonWidget(
                                        title: S.of(context).NonePriceVoucher,
                                        height: 0.04,
                                        width: 0.45,
                                        fontSize: 14,
                                        textColor: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        onTap: () {
                                          flightTicketCubit.voucherWithPrice =
                                              false;
                                          Navigator.pushNamed(
                                              context, PdfPreviewScreen.id);
                                        },
                                      ),
                                    ],
                                  ),
                            const SizedBox(
                              height: 6,
                            ),
                            const ReservationDetailsContainerWidget(),
                            const SizedBox(
                              height: 6,
                            ),
                            GuestDetailsContainerWidget(
                              index:
                                  flightTicketCubit.saveReservationIndexValue!,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            // FlightDetailsContainerWidget(
                            //   index:
                            //       flightTicketCubit.saveReservationIndexValue!,
                            // ),

                            reservationState !=
                                    BookingStatusType.reservationSucceed
                                ? const SizedBox()
                                : Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      ButtonWidget(
                                        title: S.of(context).Buy,
                                        onTap: () {
                                          flightTicketCubit
                                              .paymentTypesShowFunction();
                                          print(
                                              'paymentTypesShowFunction ${flightTicketCubit.paymentTypesShow}');

                                          if (flightTicketCubit
                                                  .paymentTypesShow ==
                                              true) {
                                            WidgetsBinding.instance
                                                .addPostFrameCallback((_) {
                                              flightTicketCubit
                                                  .scrollToBottom();
                                            });
                                          }
                                        },
                                        height: 0.046,
                                        width: 0.4,
                                        fontSize: 14,
                                        textColor: Colors.white,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      ButtonWidget(
                                        title: S.of(context).Cancel,
                                        onTap: () {
                                          showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) {
                                                return AlertDialogWidget(
                                                    isHaveBorder: true,
                                                    heightTest: 0.13,
                                                    widthTest: 1,
                                                    widget: Column(
                                                      children: [
                                                        TextWidget(
                                                          textAlign:
                                                              TextAlign.left,
                                                          text: S
                                                              .of(context)
                                                              .ReservationCancelMessage,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        const Spacer(),
                                                        Row(
                                                          children: [
                                                            const Spacer(),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: TextWidget(
                                                                color: AppColors
                                                                    .kSecondColor,
                                                                text: S
                                                                    .of(context)
                                                                    .Close,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 40,
                                                            ),
                                                            GestureDetector(
                                                              onTap: () async {
                                                                BlocProvider.of<
                                                                            FlightTicketCubit>(
                                                                        context)
                                                                    .isCanceled = true;
                                                                Navigator.pop(
                                                                    context);
                                                                await flightTicketCubit.cancelReservation(
                                                                    CancelReservationJson(
                                                                        request: CancelReservation(
                                                                            tokenCode: getIt<CacheHelper>().getDataString(key: 'token') ??
                                                                                "",
                                                                            SystemPnr:
                                                                                systemPnr!,
                                                                            LastName:
                                                                                lastName!)),
                                                                    context);
                                                              },
                                                              child: TextWidget(
                                                                color: AppColors
                                                                    .kSecondColor,
                                                                text: S
                                                                    .of(context)
                                                                    .Yes,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ));
                                              });
                                        },
                                        height: 0.046,
                                        width: 0.4,
                                        fontSize: 14,
                                        textColor: Colors.white,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                            const SizedBox(
                              height: 6,
                            ),
                            Visibility(
                                visible: flightTicketCubit.paymentTypesShow,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Column(
                                    children: [
                                      flightTicketCubit
                                              .currentAccountOptions.isEmpty
                                          ? const SizedBox()
                                          : ButtonWidget(
                                              border: flightTicketCubit
                                                          .selectedPaymentTypeForReservation ==
                                                      PaymentType.currentAccount
                                                  ? Border.all(
                                                      color: AppColors
                                                          .kSecondColor,
                                                      width: 2)
                                                  : Border.all(
                                                      color:
                                                          Colors.transparent),
                                              title: S.of(context).Current,
                                              onTap: () {
                                                flightTicketCubit
                                                    .selectPaymentTypeInReservation(
                                                        value: PaymentType
                                                            .currentAccount);
                                              },
                                              height: 0.06,
                                              width: 1,
                                              fontSize: 18,
                                              textColor: Colors.black,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      ButtonWidget(
                                        border: flightTicketCubit
                                                    .selectedPaymentTypeForReservation ==
                                                PaymentType.customerCreditCard
                                            ? Border.all(
                                                color: AppColors.kSecondColor,
                                                width: 2)
                                            : Border.all(
                                                color: Colors.transparent),
                                        title: S.of(context).CreditCard,
                                        onTap: () {
                                          flightTicketCubit
                                              .selectPaymentTypeInReservation(
                                                  value: PaymentType
                                                      .customerCreditCard);
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            flightTicketCubit.scrollToBottom();
                                          });
                                        },
                                        height: 0.06,
                                        width: 1,
                                        fontSize: 18,
                                        textColor: Colors.black,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ],
                                  ),
                                )),
                            Visibility(
                              visible: flightTicketCubit
                                          .selectedPaymentTypeForReservation ==
                                      PaymentType.customerCreditCard
                                  ? true
                                  : false,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  children: [
                                    flightTicketCubit.amount == null &&
                                            flightTicketCubit.percent == null
                                        ? const SizedBox()
                                        : Container(
                                            width: context.width * 8,
                                            height: context.height * 0.045,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(24),
                                              color: Colors.white,
                                            ),
                                            child: SizedBox(
                                              height: 30,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  ButtonWidget(
                                                    borderCircularValue: 14,
                                                    title: S
                                                        .of(context)
                                                        .CustomerPayment,
                                                    height:
                                                        context.height * 0.049,
                                                    width: 0.42,
                                                    fontSize: 14,
                                                    textColor: flightTicketCubit
                                                                .selectAgentCreditCardOrCustomerCreditCardValue ==
                                                            0
                                                        ? Colors.white
                                                        : Colors.black,
                                                    color: flightTicketCubit
                                                                .selectAgentCreditCardOrCustomerCreditCardValue ==
                                                            0
                                                        ? AppColors.kSecondColor
                                                        : Colors.white,
                                                    onTap: () {
                                                      flightTicketCubit
                                                          .selectAgentCreditCardOrCustomerCreditCardFunction(
                                                              value: 0);
                                                    },
                                                  ),
                                                  ButtonWidget(
                                                    borderCircularValue: 14,
                                                    title: S
                                                        .of(context)
                                                        .AgencyPayment,
                                                    height:
                                                        context.height * 0.049,
                                                    width: 0.42,
                                                    fontSize: 14,
                                                    textColor: flightTicketCubit
                                                                .selectAgentCreditCardOrCustomerCreditCardValue ==
                                                            1
                                                        ? Colors.white
                                                        : Colors.black,
                                                    color: flightTicketCubit
                                                                .selectAgentCreditCardOrCustomerCreditCardValue ==
                                                            1
                                                        ? AppColors.kSecondColor
                                                        : Colors.white,
                                                    border: flightTicketCubit
                                                                .selectAgentCreditCardOrCustomerCreditCardValue ==
                                                            1
                                                        ? Border.all(
                                                            color: AppColors
                                                                .kSecondColor)
                                                        : null,
                                                    onTap: () {
                                                      flightTicketCubit
                                                          .selectAgentCreditCardOrCustomerCreditCardFunction(
                                                              value: 1);
                                                    },
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFieldOtherDesignWidget(
                                      textInputType: TextInputType.name,
                                      width: 1,
                                      text: S.of(context).NameOnCard,
                                      padding: 8,
                                      onChanged: (value) {
                                        flightTicketCubit.creditCardName =
                                            value;
                                        flightTicketCubit
                                            .checkIsAnyOneNullOrNotCompleatForReservationFunction();
                                      },
                                      inputFormatters: [
                                        TextInputFormatter.withFunction(
                                          (oldValue, newValue) {
                                            final filteredText = newValue.text
                                                .replaceAll(
                                                    RegExp(r'[^a-zA-Z\s]'), '');
                                            return TextEditingValue(
                                              text: filteredText.toUpperCase(),
                                              selection: newValue.selection,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 6),
                                    TextFieldOtherDesignWidget(
                                      inputFormatters: [
                                        FilteringTextInputFormatter
                                            .digitsOnly, // السماح فقط بالأرقام
                                        TextInputFormatter.withFunction(
                                            (oldValue, newValue) {
                                          // إزالة جميع الفراغات أولاً ثم إعادة إدخالها بعد كل 4 أرقام
                                          String newText =
                                              newValue.text.replaceAll(' ', '');
                                          if (newText.length > 16) {
                                            return oldValue; // تحديد الحد الأقصى بـ 16 رقم فقط
                                          }

                                          String formatted = '';
                                          for (int i = 0;
                                              i < newText.length;
                                              i++) {
                                            formatted += newText[i];
                                            if ((i + 1) % 4 == 0 &&
                                                i + 1 != newText.length) {
                                              formatted +=
                                                  ' '; // إضافة فراغ بعد كل 4 أرقام
                                            }
                                          }
                                          return TextEditingValue(
                                            text: formatted,
                                            selection: TextSelection.collapsed(
                                                offset: formatted.length),
                                          );
                                        }),
                                      ],
                                      initialValue:
                                          flightTicketCubit.creditCardNumber,
                                      textInputType: TextInputType.number,
                                      width: 1,
                                      height: 0.05,
                                      text: S.of(context).CardNumber,
                                      onChanged: (value) {
                                        flightTicketCubit.searchInBinCodes(
                                            value: value);
                                        flightTicketCubit.creditCardNumber =
                                            value;
                                        flightTicketCubit
                                            .checkIsAnyOneNullOrNotCompleatForReservationFunction();
                                      },

                                      //  padding: 18,
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            flightTicketCubit.bottomSheetValue(
                                                type: 24);
                                          },
                                          child: Container(
                                            height: context.height * 0.04,
                                            width: context.width * 0.45,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  color: Colors.black26,
                                                )),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: Row(
                                                children: [
                                                  TextWidget(
                                                      text: flightTicketCubit
                                                              .creditCardMonthAndYear ??
                                                          S
                                                              .of(context)
                                                              .ExpirationDate,
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        // TextFieldOtherDesignWidget(
                                        //   inputFormatters: [
                                        //     FilteringTextInputFormatter
                                        //         .digitsOnly, // السماح فقط بالأرقام
                                        //     TextInputFormatter.withFunction(
                                        //         (oldValue, newValue) {
                                        //       String newText = newValue.text
                                        //           .replaceAll('/', '');
                                        //       if (newText.length > 4) {
                                        //         return oldValue; // تحديد الحد الأقصى بـ 4 أرقام فقط (MMYY)
                                        //       }

                                        //       String formatted = '';
                                        //       for (int i = 0;
                                        //           i < newText.length;
                                        //           i++) {
                                        //         formatted += newText[i];
                                        //         if (i == 1 &&
                                        //             newText.length > 2) {
                                        //           formatted +=
                                        //               '/'; // إضافة الشرطة بعد الشهر (MM/)
                                        //         }
                                        //       }
                                        //       return TextEditingValue(
                                        //         text: formatted,
                                        //         selection:
                                        //             TextSelection.collapsed(
                                        //                 offset: formatted.length),
                                        //       );
                                        //     }),
                                        //   ],
                                        //   width: 0.45,
                                        //   text: S.of(context).ValidityDate,
                                        //   padding: 8,
                                        //   textInputType: TextInputType.number,
                                        //   onChanged: (value) {
                                        //     flightTicketCubit
                                        //         .creditCardMonthAndYear = value;
                                        //     flightTicketCubit
                                        //         .checkIsAnyOneNullOrNotCompleatForReservationFunction();
                                        //   },
                                        // ),
                                        TextFieldOtherDesignWidget(
                                          textInputType: TextInputType.number,
                                          width: 0.25,
                                          height: 0.06,
                                          text: 'CVV',
                                          padding: 8,
                                          maxLength: 3,
                                          onChanged: (value) {
                                            flightTicketCubit.creditCardCvv =
                                                value;
                                            flightTicketCubit
                                                .checkIsAnyOneNullOrNotCompleatForReservationFunction();
                                          },
                                        ),
                                      ],
                                    ),
                                    BlocConsumer<FlightTicketCubit,
                                        FlightTicketState>(
                                      listener: (context, state) {
                                        // TODO: implement listener
                                      },
                                      builder: (context, state) {
                                        return state
                                                is SearchInBinCodesLoadingState
                                            ? const SizedBox()
                                            : state is SearchInBinCodesSuccessState ||
                                                    state
                                                        is SelectRadioButtonForPaymentViewState
                                                ? Column(
                                                    children: [
                                                      const SizedBox(height: 6),
                                                      SizedBox(
                                                        height: context.height *
                                                            0.3,
                                                        width:
                                                            context.width * 1,
                                                        child: ListView.builder(
                                                          itemCount: 1,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            return Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          2),
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    padding: const EdgeInsets
                                                                        .symmetric(
                                                                        horizontal:
                                                                            12),
                                                                    height: context
                                                                            .height *
                                                                        0.07,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      boxShadow: const [
                                                                        BoxShadow(
                                                                          color:
                                                                              Colors.black45,
                                                                          offset: Offset(
                                                                              0.0,
                                                                              1.0), //(x,y)
                                                                          blurRadius:
                                                                              0.2,
                                                                        ),
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade300,
                                                                      ),
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Image
                                                                            .network(
                                                                          flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0
                                                                              ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].logoUrl!
                                                                              : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].logoUrl!,
                                                                          errorBuilder: (context,
                                                                              error,
                                                                              stackTrace) {
                                                                            return Image.asset(
                                                                              'assets/images/no_Image.png',
                                                                              height: 30,
                                                                            );
                                                                          },
                                                                          height:
                                                                              30,
                                                                        ),
                                                                        TextWidget(
                                                                          text: flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0
                                                                              ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].name!
                                                                              : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].name!,
                                                                          color:
                                                                              Colors.black45,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          6),
                                                                  flightTicketCubit
                                                                              .creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!]
                                                                              .paymentGroupItem!
                                                                              .length >
                                                                          1
                                                                      ? TextWidget(
                                                                          text: S
                                                                              .of(context)
                                                                              .InstallmentTypes,
                                                                          fontSize:
                                                                              16,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          color:
                                                                              Colors.black,
                                                                        )
                                                                      : const SizedBox(),
                                                                  const SizedBox(
                                                                      height:
                                                                          6),
                                                                  ListView
                                                                      .builder(
                                                                    physics:
                                                                        const NeverScrollableScrollPhysics(),
                                                                    shrinkWrap:
                                                                        true,
                                                                    itemCount: flightTicketCubit
                                                                                .selectAgentCreditCardOrCustomerCreditCardValue ==
                                                                            0
                                                                        ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem!.length -
                                                                            1
                                                                        : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem!.length -
                                                                            1,
                                                                    itemBuilder:
                                                                        (BuildContext
                                                                                context,
                                                                            int subIndex) {
                                                                      return Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            bottom:
                                                                                6),
                                                                        child:
                                                                            ContainerCardWidget(
                                                                          isShadow:
                                                                              true,
                                                                          borderColor: flightTicketCubit.radioForInstallmentType == '${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)}${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId!} TRY)'
                                                                              ? AppColors.kSecondColor
                                                                              : Colors.transparent,
                                                                          onTap:
                                                                              () {
                                                                            flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0
                                                                                ? flightTicketCubit.paymentId = flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId
                                                                                : flightTicketCubit.paymentId = flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId;
                                                                          },
                                                                          fontSize:
                                                                              14,
                                                                          height:
                                                                              0.045,
                                                                          paddingTop:
                                                                              context.height * 0.006,
                                                                          paddingLeftRight:
                                                                              4,
                                                                          text:
                                                                              '${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)} TRY)',
                                                                          action:
                                                                              RadioForInstallmentTypeWidget(
                                                                            text:
                                                                                '${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)}${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId!} TRY)',
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: flightTicketCubit.binCodeIsHere == null
                                  ? context.height * 0.12
                                  : 0,
                            ),
                            SizedBox(
                              height: flightTicketCubit
                                              .checkIsAnyOneNullOrNotCompleatForReservationValue ==
                                          true ||
                                      flightTicketCubit
                                              .selectedPaymentTypeForReservation ==
                                          PaymentType.currentAccount
                                  ? context.height * 0.12
                                  : 0,
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/*

Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: AppColors.kSecondColor)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 12, left: 12, right: 12, bottom: 12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                Image.network(
                                  logo!,
                                  height: 40,
                                  width: 50,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/no_Image.png',
                                      width: 50,
                                      height: 40,
                                    );
                                  },
                                ),
                                // const SizedBox(
                                //   width: 8,
                                // ),
                                SizedBox(
                                  width: context.width * 0.02,
                                ),
                                Row(
                                  children: [
                                    TextWidget(
                                      text: departureAirportCode,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                    TextWidget(
                                      text: ' $formattedDepartureTime',
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: context.width * 0.01,
                                ),

                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    stopCount == 1
                                        ? const NonStopDesignWidget(
                                            pointValue: 3,
                                            text: false,
                                          )
                                        : stopCount == 2
                                            ? const OneStopDesignWidget(
                                                pointValue: 3,
                                                text: false,
                                              )
                                            : const TwoStopDesignWidget(
                                                pointValue: 3,
                                                text: false,
                                              ),
                                  ],
                                ),
                                SizedBox(
                                  width: context.width * 0.01,
                                ),
                                Row(
                                  children: [
                                    TextWidget(
                                      text: formattedArriveTime,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    TextWidget(
                                      text: ' $arrivalAirportCode',
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: context.width * 0.02,
                                ),

                                Row(
                                  children: [
                                    TextWidget(
                                      text: dateDepartureTime.day.toString(),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                    SizedBox(
                                      width: context.width * 0.01,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        TextWidget(
                                          text:
                                              formattedDepartureForStringMonth,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                        TextWidget(
                                          text:
                                              dateDepartureTime.year.toString(),
                                          fontSize: 10,
                                          color: Colors.black54,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.person,
                                    color: AppColors.kSecondColor, size: 25),
                                const SizedBox(
                                  width: 4,
                                ),
                                const TextWidget(
                                  text: 'AD Soyad:   ', //totalPrice!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text:
                                      '$firstName $lastName  $index', //totalPrice!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.code,
                                    color: AppColors.kSecondColor, size: 25),
                                const SizedBox(
                                  width: 4,
                                ),
                                const TextWidget(
                                  text: 'System PNR:   ', //totalPrice!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text: '$systemPnr', //totalPrice!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.currency_lira,
                                    color: AppColors.kSecondColor, size: 25),
                                const SizedBox(
                                  width: 4,
                                ),
                                const TextWidget(
                                  text: 'Fiyat:   ', //totalPrice!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text: '$price TRY', //totalPrice!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.currency_lira,
                                    color: AppColors.kSecondColor, size: 25),
                                const SizedBox(
                                  width: 4,
                                ),
                                const TextWidget(
                                  text: 'Reservasyon:   ', //totalPrice!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text: '$reservationState', //totalPrice!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.currency_lira,
                                    color: AppColors.kSecondColor, size: 25),
                                const SizedBox(
                                  width: 4,
                                ),
                                const TextWidget(
                                  text: 'Time:   ', //totalPrice!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text: DateFormat('dd-MM-yyyy HH:mm')
                                      .format(expirationDate), //totalPrice!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

*/
