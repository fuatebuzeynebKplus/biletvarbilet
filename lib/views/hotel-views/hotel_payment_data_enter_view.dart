import 'package:bamobile1/common/data/enums/invoice_info_type.dart';
import 'package:bamobile1/common/data/enums/payment_type.dart';
import 'package:bamobile1/common/data/enums/product_type.dart';
import 'package:bamobile1/common/data/models/booking_request.dart';
import 'package:bamobile1/common/data/models/contact_info.dart';
import 'package:bamobile1/common/data/models/credit_card_info.dart';
import 'package:bamobile1/common/data/models/invoice_info.dart';
import 'package:bamobile1/common/data/models/pax_info.dart';
import 'package:bamobile1/common/data/models/payment_info.dart';
import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';

import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/other-views/webview_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_book_result.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-guest-details-view-widgets/bottom-sheet/hotel_card_all_details_for_title_card_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-payment-data-enter-view/bottom-sheet/hotel_credit_card_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-payment-data-enter-view/hotel_credit_card_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-payment-data-enter-view/hotel_current_account_card_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-payment-data-enter-view/hotel_reservation_card_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/bottom-sheet/hotel_price_and_continue_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/title_for_hotel_card_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class HotelPaymentDataEnterView extends StatelessWidget {
  const HotelPaymentDataEnterView({super.key});
  static String id = 'HotelPaymentDataEnterView';
  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    hotelCubit.convertGuestDataToPaxList(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        if (state is HotelBookSuccess) {
          if (hotelCubit.paymentType == PaymentType.customerCreditCard) {
            if (hotelCubit.is3DPostRequired == true) {
              Navigator.pushReplacementNamed(
                context,
                WebViewView.id,
                arguments: hotelCubit.bookUrlResult,
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
        } else if (state is HotelBookFailure) {
          SnackbarUtils.showSnackbar(context, state.errorMassage, 2);
          hotelCubit.bottomSheetValueFunction(type: 'h0');
        } else {}
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              toolbarHeight: context.height * 0.06,
              automaticallyImplyLeading: false,
              title: AppBarWidget(
                onPressedLeading: () {
                  Navigator.pop(context);
                },
                title: S.of(context).PaymentInfo,
                leading: Icons.arrow_back_ios,
              ),
              backgroundColor: AppColors.kAppBarColor,
            ),
            bottomSheet: hotelCubit.bottomSheetValue == 'h9'
                ? HotelPriceAndContinueBottomSheet(
                    onTap: () async {
                      await hotelCubit.convertGuestDataToPaxList(context);
                      print('paxInfoList: ${hotelCubit.paxInfoList}');
                      await hotelCubit.bookHotel(
                          WrappedBookingRequest(
                              request: BookingRequest(
                            contactInfo: ContactInfo(
                                firstName: hotelCubit.paxInfoList.first.paxes!
                                    .first.pax.firstName,
                                lastName: hotelCubit.paxInfoList.first.paxes!
                                    .first.pax.lastName,
                                email: hotelCubit.email,
                                phone:
                                    '${hotelCubit.countryPhone}${hotelCubit.phoneNo}'), //${hotelCubit.countryPhone}${hotelCubit.phoneNo}
                            invoiceInfo: InvoiceInfo(
                                address:
                                    authCubit.invoiceInfoAddress ?? "İstanbul",
                                cityCode:
                                    authCubit.invoiceInfoCityCode ?? "IST",
                                companyName: authCubit.invoiceInfoCompanyName ??
                                    "İstanbul",
                                firstName:
                                    authCubit.invoiceInfoFirstName ?? "test",
                                invoiceInfoTitle: authCubit.invoiceInfoTitle ??
                                    "Fatura Bilgisi",
                                invoiceInfoType: authCubit.invoiceInfoType ??
                                    InvoiceInfoType.corporate,
                                lastName:
                                    authCubit.invoiceInfoLastName ?? "user"),
                            paxInfo:
                                PaxInfo(hotelPaxes: hotelCubit.paxInfoList),
                            paymentInfo: hotelCubit.paymentType !=
                                    PaymentType.customerCreditCard
                                ? PaymentInfo(
                                    paymentType: hotelCubit.paymentType)
                                : PaymentInfo(
                                    cardInfo: CreditCardInfo(
                                        cardExpMonth: int.parse(hotelCubit
                                            .creditCardMonthAndYear!
                                            .substring(0, 2)),
                                        cardExpYear: int.parse(
                                            '20${hotelCubit.creditCardMonthAndYear!.substring(hotelCubit.creditCardMonthAndYear!.length - 2)}'),
                                        cardHolderName:
                                            hotelCubit.creditCardName!,
                                        cardNumber: hotelCubit.creditCardNumber!
                                            .replaceAll(' ', ''),
                                        cv2: hotelCubit.creditCardCvv!,
                                        email: hotelCubit.email!,
                                        is3D: true, // 38CM12TS82
                                        ipAdress: "88.241.185.1",
                                        returnUrl:
                                            "https://www.bookingagora.com/"),
                                    paymentItemId: hotelCubit.paymentId == null
                                        ? int.parse(hotelCubit.bookItemId!)
                                        : int.parse(hotelCubit.paymentId!),
                                    paymentType: hotelCubit.paymentType,
                                    paymentCommissionType:
                                        hotelCubit.paymentCommissionType),
                            productType: ProductType.hotel,
                            resultKeys: hotelCubit.roomKeyAfterValidateList,
                            tokenCode: getIt<CacheHelper>()
                                    .getDataString(key: 'token') ??
                                "",
                          )),
                          context);
                    },
                  )
                : hotelCubit.bottomSheetValue == 'h5'
                    ? const HotelCardAllDetailsForTitleCardBottomSheet()
                    : hotelCubit.bottomSheetValue == 'h7'
                        ? const HotelCreditCardBottomSheet()
                        : null,
            body: state is HotelPaymentOptionsFailure
                ? ErrorResultWidget(
                    errorCode: state.errorCode,
                    errorMassage: state.errorMassage)
                : state is HotelBookFailure
                    ? ErrorResultWidget(
                        errorCode: state.errorCode,
                        errorMassage: state.errorMassage)
                    : ModalProgressHUD(
                        progressIndicator: const LoadingWidget(),
                        inAsyncCall: state is HotelPaymentOptionsLoading ||
                            state is HotelBookLoading,
                        child: Column(
                          children: [
                            const TitleForHotelCardWidget(),
                            GestureDetector(
                              onTap: () {
                                hotelCubit.bottomSheetValueFunction(type: 'h5');
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                width: context.width * 0.25,
                                height: context.height * 0.025,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    TextWidget(
                                      text: S.of(context).Details,
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                    const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.grey,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
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
                                        '${hotelCubit.paxInfoList.first.paxes!.first.pax.firstName!} ${hotelCubit.paxInfoList.first.paxes!.first.pax.lastName!}',
                                    text: S.of(context).PassengerInformation,
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
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  // ContainerCardWidget(
                                  //   text: S.of(context).ReservationNote,
                                  //   action: const Icon(
                                  //     Icons.arrow_drop_down,
                                  //     color: Colors.black,
                                  //     size: 30,
                                  //   ),
                                  // ),
                                  // const SizedBox(
                                  //   height: 8,
                                  // ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
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
                                                color: AppColors.kSecondColor,
                                                size: 30,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              TextWidget(
                                                text: S.of(context).PaymentType,
                                                color: AppColors.kSecondColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: hotelCubit
                                                    .creditCardOptionsCustomer
                                                    .isEmpty
                                                ? 0
                                                : 12,
                                          ),
                                          hotelCubit.creditCardOptionsCustomer
                                                  .isEmpty
                                              ? const SizedBox()
                                              : const HotelCreditCardWidget(),
                                          SizedBox(
                                            height: hotelCubit
                                                    .currentAccountOptions
                                                    .isEmpty
                                                ? 0
                                                : 8,
                                          ),
                                          hotelCubit
                                                  .currentAccountOptions.isEmpty
                                              ? const SizedBox()
                                              : const HotelCurrentAccountCardWidget(),
                                          SizedBox(
                                            height: hotelCubit
                                                    .preBookingOptions.isEmpty
                                                ? 0
                                                : 8,
                                          ),
                                          hotelCubit.preBookingOptions.isEmpty
                                              ? const SizedBox()
                                              : GestureDetector(
                                                  child:
                                                      const HotelReservationCardWidget(),
                                                  onTap: () {
                                                    hotelCubit
                                                        .bottomSheetValueFunction(
                                                            type: 'h9');
                                                  },
                                                ),
                                          SizedBox(
                                            height: hotelCubit
                                                    .alternativeOptions.isEmpty
                                                ? 0
                                                : 8,
                                          ),
                                          // hotelCubit
                                          //         .alternativeOptions.isEmpty
                                          //     ? const SizedBox()
                                          //     : const HotelAlternativeCardWidget(),
                                          // const SizedBox(
                                          //   height: 8,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ));
      },
    );
  }
}
