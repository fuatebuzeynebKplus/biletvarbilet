import 'package:bamobile1/common/data/enums/gender_type.dart';
import 'package:bamobile1/common/data/enums/invoice_info_type.dart';
import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/common/data/enums/payment_commission_type.dart';
import 'package:bamobile1/common/data/enums/payment_type.dart';
import 'package:bamobile1/common/data/enums/product_type.dart';
import 'package:bamobile1/common/data/models/booking_request.dart';
import 'package:bamobile1/common/data/models/contact_info.dart';
import 'package:bamobile1/common/data/models/credit_card_info.dart';
import 'package:bamobile1/common/data/models/invoice_info.dart';
import 'package:bamobile1/common/data/models/pax_info.dart';
import 'package:bamobile1/common/data/models/payment_info.dart';
import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/flight_booking_pax.dart';
import 'package:bamobile1/flight/data/models/pax.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';

import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_book_result.dart';
import 'package:bamobile1/views/other-views/webview_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/container_card_two_widget.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/seat_details_for_multi_point_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/title_for_list_card_multi_point_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/alternative_card_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/bottom-sheet-widgets/alternative_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/bottom-sheet-widgets/current_account_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/bottom-sheet-widgets/credit_card_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/bottom-sheet-widgets/for_credit_card_validity_date_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/bottom-sheet-widgets/reservation_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/current_account_card_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/credit_card_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_alternative_type_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_payment_type_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/reservation_card_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/flight_details_bottom_sheet_leaving_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/flight_details_bottom_sheet_return_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/price_and_continue_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/seat_details_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/title_of_select_seat_type_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class FlightTicketPaymentDataEnterView extends StatelessWidget {
  const FlightTicketPaymentDataEnterView({super.key});

  static String id = 'FlightTicketPaymentDataEnterView';
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        if (state is FlightBookSuccess) {
          if (flightTicketCubit.paymentType == PaymentType.customerCreditCard) {
            if (flightTicketCubit.is3DPostRequired == true) {
              Navigator.pushReplacementNamed(
                context,
                WebViewView.id,
                arguments: flightTicketCubit.bookUrlResult,
              );
            } else {
              Navigator.pushReplacementNamed(
                context,
                FlightTicketBookResult.id,
              );
            }
          } else {
            Navigator.pushReplacementNamed(
              context,
              FlightTicketBookResult.id,
            );
          }
        } else if (state is FlightBookFailure) {
          SnackbarUtils.showSnackbar(context, state.errorMassage, 2);
          flightTicketCubit.bottomSheetValue(type: 0);
        } else {}
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          // onPopInvoked: (didPop) {
          //   flightTicketCubit.bottomSheetValue(type: 7);
          // },
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: context.height * 0.06,
              automaticallyImplyLeading: false,
              title: AppBarWidget(
                onPressedLeading: () {
                  flightTicketCubit.paxInfoList.clear();
                  if (flightTicketCubit.bottomSheetType == 5 ||
                      flightTicketCubit.bottomSheetType == 22 ||
                      flightTicketCubit.bottomSheetType == 18) {
                    flightTicketCubit.bottomSheetValue(type: 0);
                    flightTicketCubit.selectPaymentTypeFunction(
                        'add anything just for unselect payment type', context);
                  } else {
                    Navigator.pop(context);
                    flightTicketCubit.selectPaymentTypeFunction(
                        'add anything just for unselect payment type', context);
                  }
                  flightTicketCubit.bottomSheetValue(type: 7);
                },
                title: S.of(context).PaymentInfo,
                leading: Icons.arrow_back_ios,
              ),
              backgroundColor: AppColors.kAppBarColor,
            ), //ForCreditCardValidityDateBottomSheet
            bottomSheet: flightTicketCubit.bottomSheetType == 53
                ? const SeatDetailsForMultiPointBottomSheet()
                : flightTicketCubit.bottomSheetType == 24
                    ? const ForCreditCardValidityDateBottomSheet()
                    : flightTicketCubit.bottomSheetType == 18
                        ? const CreditCardBottomSheet()
                        : flightTicketCubit.bottomSheetType == 5
                            ? const FlightDetailsBottomSheetLeavingCard()
                            : flightTicketCubit.bottomSheetType == 4
                                ? const SeatDetailsBottomSheet(
                                    itIsPaymentView: true,
                                  )
                                : flightTicketCubit.bottomSheetType == 22
                                    ? const FlightDetailsBottomSheetReturnCard()
                                    : flightTicketCubit.bottomSheetType == 6
                                        ? PriceAndContinueBottomSheet(
                                            onTap: () async {
                                              await flightTicketCubit
                                                  .convertPassengerDataToPaxList(
                                                      context);
                                              await flightTicketCubit
                                                  .bookFlight(
                                                      WrappedBookingRequest(
                                                          request:
                                                              BookingRequest(
                                                        contactInfo: ContactInfo(
                                                            firstName:
                                                                flightTicketCubit
                                                                    .paxInfoList
                                                                    .first
                                                                    .pax!
                                                                    .firstName,
                                                            lastName:
                                                                flightTicketCubit
                                                                    .paxInfoList
                                                                    .first
                                                                    .pax!
                                                                    .lastName,
                                                            email:
                                                                flightTicketCubit
                                                                    .email,
                                                            phone:
                                                                '${flightTicketCubit.countryPhone}${flightTicketCubit.phoneNo}'), //${flightTicketCubit.countryPhone}${flightTicketCubit.phoneNo}
                                                        invoiceInfo: InvoiceInfo(
                                                            address: authCubit
                                                                    .invoiceInfoAddress ??
                                                                "İstanbul",
                                                            cityCode:
                                                                authCubit
                                                                        .invoiceInfoCityCode ??
                                                                    "IST",
                                                            companyName: authCubit
                                                                    .invoiceInfoCompanyName ??
                                                                "İstanbul",
                                                            firstName:
                                                                authCubit
                                                                        .invoiceInfoFirstName ??
                                                                    "test",
                                                            invoiceInfoTitle: authCubit
                                                                    .invoiceInfoTitle ??
                                                                "Fatura Bilgisi",
                                                            invoiceInfoType: authCubit
                                                                    .invoiceInfoType ??
                                                                InvoiceInfoType
                                                                    .corporate,
                                                            lastName: authCubit
                                                                    .invoiceInfoLastName ??
                                                                "user"),
                                                        paxInfo: PaxInfo(
                                                            flightPaxes:
                                                                flightTicketCubit
                                                                    .paxInfoList),
                                                        paymentInfo: flightTicketCubit
                                                                    .paymentType !=
                                                                PaymentType
                                                                    .customerCreditCard
                                                            ? PaymentInfo(
                                                                paymentType:
                                                                    flightTicketCubit
                                                                        .paymentType)
                                                            : PaymentInfo(
                                                                cardInfo:
                                                                    CreditCardInfo(
                                                                        cardExpMonth: int.parse(flightTicketCubit
                                                                            .creditCardMonthAndYear!
                                                                            .substring(
                                                                                0, 2)),
                                                                        cardExpYear: int.parse(
                                                                            '20${flightTicketCubit.convertArabicNumbersToEnglish(flightTicketCubit.creditCardMonthAndYear!.substring(flightTicketCubit.creditCardMonthAndYear!.length - 2))}'),
                                                                        cardHolderName:
                                                                            flightTicketCubit
                                                                                .creditCardName!,
                                                                        cardNumber: flightTicketCubit.creditCardNumber!.replaceAll(
                                                                            ' ',
                                                                            ''),
                                                                        cv2: flightTicketCubit
                                                                            .creditCardCvv!,
                                                                        email: flightTicketCubit
                                                                            .email!,
                                                                        is3D: true, // 38CM12TS82
                                                                        ipAdress: "88.241.185.1",
                                                                        returnUrl: "https://www.bookingagora.com/"),
                                                                paymentItemId: flightTicketCubit.paymentId == null ? int.parse(flightTicketCubit.bookItemId!) : int.parse(flightTicketCubit.paymentId!),
                                                                paymentType: flightTicketCubit.paymentType,
                                                                paymentCommissionType: flightTicketCubit.paymentCommissionType),
                                                        productType:
                                                            ProductType.flight,
                                                        resultKeys:
                                                            flightTicketCubit
                                                                .validateKeyList,
                                                        tokenCode: getIt<
                                                                    CacheHelper>()
                                                                .getDataString(
                                                                    key:
                                                                        'token') ??
                                                            "",
                                                      )),
                                                      context);
                                            },
                                          )
                                        : const SizedBox(),
            backgroundColor: Colors.grey.shade200,
            body: state is FlightPaymentOptionsFailure
                ? ErrorResultWidget(
                    errorCode: state.errorCode,
                    errorMassage: state.errorMassage)
                : state is FlightBookFailure
                    ? ErrorResultWidget(
                        errorCode: state.errorCode,
                        errorMassage: state.errorMassage)
                    : ModalProgressHUD(
                        progressIndicator: const LoadingWidget(),
                        inAsyncCall: state is FlightPaymentOptionsLoading ||
                            state is FlightBookLoading,
                        child: Column(
                          children: [
                            flightTicketCubit.searchTypeValue != 'cok'
                                ? const TitleOfSelectSeatTypeWidget(
                                    flightTypeReturnOrOneWay: 0,
                                  )
                                : SizedBox(
                                    height: context.height * 0.11,
                                    child: PageView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: flightTicketCubit
                                          .listMultiPoint.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return TitleForListCardMultiPointWidget(
                                          weHaveSlider: true,
                                          index: index,
                                        );
                                      },
                                    ),
                                  ),
                            // const SizedBox(
                            //   height: 8,
                            // ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Column(
                                    children: [
                                      ContainerCardWidget(
                                        paddingTop: 6,
                                        height: 0.07,
                                        haveAColumText: true,
                                        columText:
                                            '${flightTicketCubit.passengerCardDataList.first!.firstName} ${flightTicketCubit.passengerCardDataList.first!.lastName}',
                                        text:
                                            S.of(context).PassengerInformation,
                                        action: Row(
                                          children: [
                                            const Icon(
                                              Icons.done,
                                              color: Colors.green,
                                              size: 25,
                                            ),
                                            const SizedBox(
                                              width: 6,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                flightTicketCubit.paxInfoList
                                                    .clear();
                                                Navigator.pop(context);
                                              },
                                              child: Icon(
                                                Icons.edit,
                                                color: AppColors.kSecondColor,
                                                size: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // const SizedBox(
                                      //   height: 8,
                                      // ),
                                      // ContainerCardWidget(
                                      //   text: S.of(context).ReservationNote,
                                      //   action: const Icon(
                                      //     Icons.arrow_drop_down,
                                      //     color: Colors.black,
                                      //     size: 30,
                                      //   ),
                                      // ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: Colors.white,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    Icons.list,
                                                    color:
                                                        AppColors.kSecondColor,
                                                    size: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 8,
                                                  ),
                                                  TextWidget(
                                                    text: S
                                                        .of(context)
                                                        .PaymentType,
                                                    color:
                                                        AppColors.kSecondColor,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: flightTicketCubit
                                                        .creditCardOptionsCustomer
                                                        .isEmpty
                                                    ? 0
                                                    : 12,
                                              ),
                                              flightTicketCubit
                                                      .creditCardOptionsCustomer
                                                      .isEmpty
                                                  ? const SizedBox()
                                                  : const CreditCardWidget(),
                                              SizedBox(
                                                height: flightTicketCubit
                                                        .currentAccountOptions
                                                        .isEmpty
                                                    ? 0
                                                    : 8,
                                              ),
                                              flightTicketCubit
                                                      .currentAccountOptions
                                                      .isEmpty
                                                  ? const SizedBox()
                                                  : const CurrentAccountCardWidget(),
                                              SizedBox(
                                                height: flightTicketCubit
                                                        .preBookingOptions
                                                        .isEmpty
                                                    ? 0
                                                    : 8,
                                              ),
                                              flightTicketCubit
                                                      .preBookingOptions.isEmpty
                                                  ? const SizedBox()
                                                  : const ReservationCardWidget(),
                                              SizedBox(
                                                height: flightTicketCubit
                                                        .alternativeOptions
                                                        .isEmpty
                                                    ? 0
                                                    : 8,
                                              ),
                                              flightTicketCubit
                                                      .alternativeOptions
                                                      .isEmpty
                                                  ? const SizedBox()
                                                  : const AlternativeCardWidget(),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
          ),
        );
      },
    );
  }
}
