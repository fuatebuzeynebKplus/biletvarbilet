import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/common/data/models/payment_option_request.dart';
import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_payment_data_enter_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_search_conclusion_view.dart';
import 'package:bamobile1/views/ticket-views/multi_point_views/flight_ticket_search_conclusion_multi_point_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/flight_details_bottom_sheet_multi_point.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/seat_details_for_multi_point_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/title_for_list_card_multi_point_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/bottom-sheet/select_birthday_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/bottom-sheet/select_validity_date_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/select_nationality_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-details-widgets/contact_info_for_passenger_card_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-details-widgets/passenger_card_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/flight_details_bottom_sheet_leaving_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/flight_details_bottom_sheet_return_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/price_and_continue_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/seat_details_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/title_of_select_seat_type_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightTicketPassengerDetailsView extends StatelessWidget {
  const FlightTicketPassengerDetailsView({super.key});

  static String id = 'FlightTicketPassengerDetailsView';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        bool allNotNull = flightTicketCubit.passengerCardDataList
            .every((element) => element != null);
        return PopScope(
          // onPopInvoked: (didPop) {
          //   flightTicketCubit.showSecondListIfFlightSeatType(value: false);
          //   flightTicketCubit.selectedSeatTypeLeavingFunction(value: null);
          //   flightTicketCubit.selectedSeatTypeReturnFunction(value: null);
          //   flightTicketCubit.selectedCardLeavingFunction(value: null);
          //   flightTicketCubit.selectedCardReturnFunction(value: null);
          //   flightTicketCubit.bottomSheetValue(type: 0);
          //   flightTicketCubit.totalPrice = 0;
          //   flightTicketCubit.passengerCardDataList = [];
          //   Navigator.pushNamed(context, FlightTicketSearchConclusionView.id);
          // },
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.kAppBarColor,
              toolbarHeight: context.height * 0.06,
              automaticallyImplyLeading: false,
              title: AppBarWidget(
                onPressedLeading: () {
                  if (flightTicketCubit.searchTypeValue == 'cok') {
                    flightTicketCubit.selectAirResultForMultiPointList = [];
                    flightTicketCubit.saveIndexFareForCombinedMultiPointValue =
                        null;
                    flightTicketCubit
                        .flightFaresMultiPointSelectedForSeparated = [];
                    flightTicketCubit.totalPriceMultiPoint = 0.0;
                    flightTicketCubit.totalPriceFareMultiPoint = 0.0;
                    flightTicketCubit.passengerCardDataList = [];
                    flightTicketCubit.bottomSheetValue(type: 0);
                    Navigator.pushReplacementNamed(
                        context, FlightTicketSearchConclusionMultiPointView.id);
                  } else {
                    if (flightTicketCubit.bottomSheetType == 5 ||
                        flightTicketCubit.bottomSheetType == 22) {
                      flightTicketCubit.bottomSheetValue(type: 0);
                    } else {
                      flightTicketCubit.selectedCardLeavingFunction(
                          value: null);
                      flightTicketCubit.selectedCardReturnFunction(value: null);
                      flightTicketCubit.showSecondListIfFlightSeatType(
                          value: false);
                      flightTicketCubit.selectedSeatTypeLeavingFunction(
                          value: null);
                      flightTicketCubit.selectedSeatTypeReturnFunction(
                          value: null);
                      if (flightTicketCubit.searchTypeValue != 'tek') {
                        flightTicketCubit.showSecondListIfFlightReturn(
                            value: false);
                      }
                      flightTicketCubit.bottomSheetValue(type: 0);
                      flightTicketCubit.passengerCardDataList = [];
                      flightTicketCubit.totalPrice = 0;

                      Navigator.pushReplacementNamed(
                          context, FlightTicketSearchConclusionView.id);
                    }
                  }
                },
                title: S.of(context).PassengerAndContactInformation,
                leading: Icons.arrow_back_ios,
              ),
            ),
            bottomSheet: flightTicketCubit.bottomSheetType == 53
                ? const SeatDetailsForMultiPointBottomSheet()
                : flightTicketCubit.bottomSheetType == 51
                    ? const FlightDetailsBottomSheetMultiPoint(
                        isSelectedCard: true,
                      )
                    : flightTicketCubit.bottomSheetType == 5
                        ? const FlightDetailsBottomSheetLeavingCard()
                        : flightTicketCubit.bottomSheetType == 4
                            ? const SeatDetailsBottomSheet()
                            : flightTicketCubit.bottomSheetType == 22
                                ? const FlightDetailsBottomSheetReturnCard()
                                : flightTicketCubit.bottomSheetType == 7 &&
                                        allNotNull
                                    ? PriceAndContinueBottomSheet(
                                        onTap: () {
                                          // for (var elementA
                                          //     in flightTicketCubit.mile) {
                                          //   for (var element in elementA) {
                                          //     print(
                                          //         'airlineCode ${element.airlineCode}');
                                          //     print(
                                          //         'mileageNumber ${element.mileageNumber}');
                                          //   }
                                          // }
                                          flightTicketCubit.countryPhone ??=
                                              '+90';
                                          flightTicketCubit.phoneNo ??=
                                              authCubit.agentPhone!
                                                  .split(' ')
                                                  .sublist(1)
                                                  .join(' ')
                                                  .replaceAll(' ', '');
                                          flightTicketCubit.email ??=
                                              authCubit.agentEmail;
                                          if (flightTicketCubit.email == null) {
                                            SnackbarUtils.showSnackbar(
                                                context,
                                                S
                                                    .of(context)
                                                    .TheEmailMustNotBeLeftBlank);
                                          } else if (!RegExp(
                                                  r'^[a-zA-Z0-9._@]+@[a-zA-Z0-9._]+$')
                                              .hasMatch(
                                                  flightTicketCubit.email ??
                                                      'p')) {
                                            SnackbarUtils.showSnackbar(
                                                context,
                                                S
                                                    .of(context)
                                                    .MakeSureYourEmailIsWrittenCorrectly);
                                          } else if (flightTicketCubit
                                                  .phoneNo ==
                                              null) {
                                            SnackbarUtils.showSnackbar(
                                                context,
                                                S
                                                    .of(context)
                                                    .ThePhoneNoMustNotBeLeftBlank);
                                          } else if (!RegExp(r'^\d{10}$')
                                              .hasMatch(
                                                  flightTicketCubit.phoneNo ??
                                                      'p')) {
                                            SnackbarUtils.showSnackbar(
                                                context,
                                                S
                                                    .of(context)
                                                    .MakeSureThePhoneNumberIsWrittenCorrectly);
                                          } else {
                                            Navigator.pushNamed(
                                                context,
                                                FlightTicketPaymentDataEnterView
                                                    .id);

                                            flightTicketCubit.getPaymentOptions(
                                                PaymentOptionRequestJson(
                                                  request: PaymentOptionRequest(
                                                    resultKeys:
                                                        flightTicketCubit
                                                            .validateKeyList,
                                                    systemPnr: '',
                                                    tokenCode: getIt<
                                                                CacheHelper>()
                                                            .getDataString(
                                                                key: 'token') ??
                                                        "",
                                                  ),
                                                ),
                                                context);
                                          }
                                        },
                                      )
                                    : const SizedBox(),
            backgroundColor: Colors.grey.shade200,
            body: SingleChildScrollView(
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
                            itemCount: flightTicketCubit.listMultiPoint.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TitleForListCardMultiPointWidget(
                                weHaveSlider: true,
                                index: index,
                              );
                            },
                          ),
                        ),

                  // const SelectNationalityWidget(),
                  const ContactInfoForPassengerCardWidget(),
                  const SizedBox(
                    height: 8,
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     print(
                  //         'flightTicketCubit.bottomSheetType: ${flightTicketCubit.bottomSheetType}');
                  //   },
                  //   child: Container(
                  //     height: 100,
                  //     width: 100,
                  //     color: Colors.red,
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  SizedBox(
                    height: context.height * 0.57,
                    child: ListView.builder(
                      itemCount: flightTicketCubit.adultQuantity +
                          flightTicketCubit.childQuantity +
                          flightTicketCubit.babyQuantity,
                      itemBuilder: (BuildContext context, int index) {
                        flightTicketCubit.passengerCardDataList.length =
                            flightTicketCubit.adultQuantity +
                                flightTicketCubit.childQuantity +
                                flightTicketCubit.babyQuantity;
                        String text;

                        if (index < flightTicketCubit.adultQuantity) {
                          text = '${index + 1}.${S.of(context).Adult}';
                        } else if (index <
                            flightTicketCubit.adultQuantity +
                                flightTicketCubit.childQuantity) {
                          int childIndex =
                              index - flightTicketCubit.adultQuantity + 1;
                          text = '$childIndex.${S.of(context).Child}';
                        } else {
                          int babyIndex = index -
                              flightTicketCubit.adultQuantity -
                              flightTicketCubit.childQuantity +
                              1;
                          text = '$babyIndex.${S.of(context).Baby}';
                        }

                        return PassengerCardWidget(
                          text: text,
                          index: index,
                        );
                      },
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
