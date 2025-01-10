import 'dart:math';

import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/corporate.dart';
import 'package:bamobile1/flight/data/models/pax_definition.dart';
import 'package:bamobile1/flight/data/models/price.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_view.dart';
import 'package:bamobile1/widgets/alert_dialog_widget.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/duration_for_first_fly_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/flight_details_bottom_sheet_return_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/hour_for_first_fly_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/hour_for_second_flay_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/price_range_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/filter_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/controller_for_price_and_continue_bottom_sheet_wiget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/flight_details_bottom_sheet_leaving_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/sort_alert_dialog_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/ticket_card_leaving_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/ticket_card_return_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:bamobile1/common/data/enums/air_search_type.dart';
import 'package:bamobile1/common/data/enums/calculation_type.dart';

import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/flight/data/models/markup.dart';
import 'package:bamobile1/common/data/models/token.dart';

import 'package:bamobile1/flight/data/models/advanced_options.dart';
import 'package:bamobile1/flight/data/models/air_advanced_search.dart';
import 'package:bamobile1/flight/data/models/air_search_leg.dart';
import 'package:bamobile1/flight/data/models/air_search_request.dart';
import 'package:bamobile1/flight/data/models/hotpoint.dart';

import 'package:bamobile1/common/data/enums/pax_type.dart';

import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';

class FlightTicketSearchConclusionView extends StatelessWidget {
  const FlightTicketSearchConclusionView({
    super.key,
  });
  static String id = 'FlightTicketSearchConclusionView';

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    List<Map<String, dynamic>> selectedPassengers = [
      {"Count": flightTicketCubit.adultQuantity, "PaxType": "0"},
    ];
    if (flightTicketCubit.childQuantity > 0) {
      selectedPassengers
          .add({"Count": flightTicketCubit.childQuantity, "PaxType": "1"});
    }

    if (flightTicketCubit.babyQuantity > 0) {
      selectedPassengers
          .add({"Count": flightTicketCubit.babyQuantity, "PaxType": "2"});
    }
    List<PaxDefinition> passengers = selectedPassengers.map((passengerData) {
      return PaxDefinition(
        count: passengerData["Count"],
        paxType: PaxType.values[int.parse(passengerData["PaxType"])],
      );
    }).toList();

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {},
      builder: (context, state) {
        //PopScope
        return PopScope(
          canPop: false,
          // onPopInvoked: (didPop) {
          //   flightTicketCubit.bottomSheetValue(type: 0);
          //   flightTicketCubit.bottomSheetType = 0;
          //   flightTicketCubit.selectedCardLeaving = null;
          //   flightTicketCubit.selectedCardReturn = null;
          //   flightTicketCubit.selectedSeatTypeLeaving = null;
          //   flightTicketCubit.selectedSeatTypeReturn = null;
          //   flightTicketCubit.isVisibilitySeatType = false;
          //   flightTicketCubit.isVisibility = false;
          // },
          child: Scaffold(
              appBar: AppBar(
                toolbarHeight: context.height * 0.06,
                automaticallyImplyLeading: false,
                title: AppBarWidget(
                  onPressedLeading: () {
                    // print(
                    //     'currency code=  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}');
                    // for (int i = 0;
                    //     i <
                    //         flightTicketCubit
                    //             .afterRefreshFlightSearchResultsLeaving.length;
                    //     i++) {
                    //   var element = flightTicketCubit
                    //       .afterRefreshFlightSearchResultsLeaving[i];

                    //   print(
                    //       'i= ${element.fares!.first.totalPrice!.currencyCode} -||- leg= ${element.legs!.first.alternativeLegs!.first.segments!.first.flightNo}');
                    // }
                    if (flightTicketCubit.bottomSheetType == 5 ||
                        flightTicketCubit.bottomSheetType == 22) {
                      flightTicketCubit.bottomSheetValue(type: 0);
                    } else {
                      flightTicketCubit.clearAll(type: 'asdadas');
                      flightTicketCubit.bottomSheetType = 0;
                      flightTicketCubit.selectedCardLeaving = null;
                      flightTicketCubit.selectedCardReturn = null;
                      flightTicketCubit.isVisibility = false;
                      flightTicketCubit.selectedSeatTypeLeaving = null;
                      flightTicketCubit.selectedSeatTypeReturn = null;
                      flightTicketCubit.isVisibilitySeatType = false;
                      Navigator.pushReplacementNamed(
                          context, FlightTicketView.id);
                    }
                  },
                  title: S.of(context).SelectFlightTicket,
                  leading: Icons.arrow_back_ios,
                ),
                backgroundColor: AppColors.kAppBarColor,
              ),
              bottomSheet: flightTicketCubit.bottomSheetType == 16
                  ? const DurationForFirstFlyBottomSheet()
                  : flightTicketCubit.bottomSheetType == 15
                      ? const HourForSecondFlyBottomSheet()
                      : flightTicketCubit.bottomSheetType == 14
                          ? const HourForFirstFlyBottomSheet()
                          : flightTicketCubit.bottomSheetType == 13
                              ? const PriceRangeBottomSheet()
                              : flightTicketCubit.bottomSheetType == 12
                                  ? const FilterBottomSheet()
                                  : flightTicketCubit.bottomSheetType == 5
                                      ? const FlightDetailsBottomSheetLeavingCard(
                                          itIsSearchConclusionView: true,
                                        )
                                      : flightTicketCubit.bottomSheetType == 22
                                          ? const FlightDetailsBottomSheetReturnCard(
                                              itIsSearchConclusionView: true,
                                            )
                                          : flightTicketCubit.bottomSheetType ==
                                                  0
                                              ? null
                                              : flightTicketCubit
                                                          .bottomSheetType ==
                                                      7
                                                  ? const ControllerForPriceAndContinueBottomSheetWidget()
                                                  : flightTicketCubit
                                                              .bottomSheetType ==
                                                          4
                                                      ? const ControllerForPriceAndContinueBottomSheetWidget()
                                                      : null,
              backgroundColor: Colors.grey.shade200,
              body: state is SearchFlightLoading
                  ? Column(
                      children: [
                        SizedBox(
                          height: context.height * 0.2,
                        ),
                        const LoadingWidget(),
                      ],
                    )
                  : state is SearchFlightFailure
                      ? ErrorResultWidget(
                          errorCode: state.errorCode,
                          errorMassage: state.errorMassage,
                        )
                      : Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: Colors.white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return const AlertDialogWidget(
                                                      isHaveBorder: true,
                                                      heightTest: 0.4,
                                                      widthTest: 0.61,
                                                      widget:
                                                          SortAlertDialogWidget(),
                                                    );
                                                  });
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.swap_vert,
                                                  color: AppColors.kSecondColor,
                                                ),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                TextWidget(
                                                  text: S.of(context).Sort,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const VerticalDivider(
                                            width: 10.0,
                                            thickness: 1,
                                            color: Colors.grey,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              flightTicketCubit
                                                  .bottomSheetValue(type: 12);
                                              if (flightTicketCubit
                                                      .selectedCardLeaving ==
                                                  null) {
                                                flightTicketCubit
                                                        .afterRefreshFlightSearchResultsLeaving =
                                                    flightTicketCubit
                                                        .mainNotChangeLeavingList;
                                              } else {
                                                null;
                                              }
                                              if (flightTicketCubit
                                                      .searchTypeValue !=
                                                  'tek') {
                                                if (flightTicketCubit
                                                        .selectedCardReturn ==
                                                    null) {
                                                  flightTicketCubit
                                                          .afterRefreshFlightSearchResultsReturn =
                                                      flightTicketCubit
                                                          .mainNotChangeReturnList;
                                                } else {
                                                  null;
                                                }
                                              }
                                              flightTicketCubit
                                                  .sortPriceLessToHighFunc(
                                                      context);
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                  color: AppColors.kSecondColor,
                                                  Icons.filter_alt,
                                                ),
                                                const SizedBox(
                                                  width: 6,
                                                ),
                                                TextWidget(
                                                  text: S.of(context).Filter,
                                                  fontSize: 16,
                                                  color: Colors.black54,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    height: context.height * 0.045,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: AppColors.kSecondColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                flightTicketCubit
                                                    .selectedCardLeavingFunction(
                                                        value: null);
                                                flightTicketCubit.isVisibility =
                                                    false;
                                                if (flightTicketCubit
                                                        .searchTypeValue ==
                                                    'tek') {
                                                  print(
                                                      'tek++++++++++++++++++++');
                                                  print(flightTicketCubit
                                                      .dateTime);
                                                  print(flightTicketCubit
                                                      .dateTimeRange!.start);
                                                  if (flightTicketCubit
                                                          .dateTime!
                                                          .isBefore(
                                                              DateTime.now()) ||
                                                      flightTicketCubit
                                                          .dateTimeRange!.start
                                                          .isBefore(
                                                              DateTime.now())) {
                                                  } else {
                                                    flightTicketCubit.dateTime =
                                                        flightTicketCubit
                                                            .dateTime!
                                                            .subtract(
                                                                const Duration(
                                                                    days: 1));

                                                    flightTicketCubit
                                                            .dateTimeRange =
                                                        DateTimeRange(
                                                            start: flightTicketCubit
                                                                .dateTimeRange!
                                                                .start
                                                                .subtract(
                                                                    const Duration(
                                                                        days:
                                                                            1)),
                                                            end: flightTicketCubit
                                                                .dateTimeRange!
                                                                .end);
                                                  }

                                                  print(flightTicketCubit
                                                      .dateTime);
                                                  print(flightTicketCubit
                                                      .dateTimeRange!.start);
                                                } else {
                                                  if (flightTicketCubit
                                                      .dateTimeRange!.start
                                                      .isBefore(
                                                          DateTime.now())) {
                                                  } else {
                                                    flightTicketCubit
                                                            .dateTimeRange =
                                                        DateTimeRange(
                                                      start: flightTicketCubit
                                                          .dateTimeRange!.start
                                                          .subtract(
                                                              const Duration(
                                                                  days: 1)),
                                                      end: flightTicketCubit
                                                          .dateTimeRange!.end,
                                                    );
                                                  }
                                                }

                                                if (flightTicketCubit
                                                        .searchTypeValue ==
                                                    'tek') {
                                                  flightTicketCubit
                                                      .searchAvailability(
                                                          RequestModel(
                                                              request:
                                                                  AirSearchRequest(
                                                            advancedOptions:
                                                                AdvancedOptions(
                                                              corporate: Corporate(
                                                                  discounts:
                                                                      flightTicketCubit
                                                                          .corporateAirlineCodeList),
                                                              languageCode: getIt<
                                                                          CacheHelper>()
                                                                      .getDataString(
                                                                          key:
                                                                              'Lang') ??
                                                                  'en',
                                                              markup: Markup(
                                                                calculationType: flightTicketCubit
                                                                            .typeIsAmount ==
                                                                        true
                                                                    ? CalculationType
                                                                        .amount
                                                                    : CalculationType
                                                                        .percent,
                                                                amount: flightTicketCubit
                                                                            .typeIsAmount ==
                                                                        true
                                                                    ? flightTicketCubit
                                                                        .amount
                                                                    : flightTicketCubit
                                                                        .percent,
                                                                currencyCode: BlocProvider.of<
                                                                            CurrencyCodeCubit>(
                                                                        context)
                                                                    .currencyCodeValue,
                                                              ),
                                                              air:
                                                                  AirAdvancedSearch(
                                                                permittedAirlineCodes:
                                                                    flightTicketCubit
                                                                        .preferAirlineCodeList,
                                                                onlyDirectFlights:
                                                                    flightTicketCubit
                                                                        .onlyDirectFlightsCheckBoxValue,
                                                                onlyRefundableFlights:
                                                                    flightTicketCubit
                                                                        .onlyRefundableFlightsCheckBoxValue,
                                                                onlyBestFares:
                                                                    true,
                                                              ),
                                                            ),
                                                            legs: [
                                                              AirSearchLeg(
                                                                  arrivalPoint:
                                                                      Hotpoint(
                                                                    cityCode:
                                                                        flightTicketCubit
                                                                            .secondCityCode,
                                                                    code: flightTicketCubit
                                                                        .secondCityCode,
                                                                    hotpointType:
                                                                        flightTicketCubit
                                                                            .arrivalHotpointTypeEnum, // write the error
                                                                  ),
                                                                  date: //"12.06.2023",
                                                                      flightTicketCubit.convertArabicNumbersToEnglish(DateFormat('dd.MM.yyy')
                                                                          .format(flightTicketCubit.isSelectOneWay == true
                                                                              ? flightTicketCubit
                                                                                  .dateTime!
                                                                              : flightTicketCubit
                                                                                  .dateTimeRange!.start)
                                                                          .toString()),
                                                                  departurePoint: Hotpoint(
                                                                      cityCode:
                                                                          flightTicketCubit
                                                                              .firstCityCode,
                                                                      code: flightTicketCubit
                                                                          .firstCityCode,
                                                                      hotpointType:
                                                                          flightTicketCubit
                                                                              .departureHotpointTypeEnum))
                                                            ],
                                                            passengers:
                                                                passengers,
                                                            searchType:
                                                                AirSearchType
                                                                    .oneway,
                                                            token: Token(
                                                              channelCode:
                                                                  "kplusmobile",
                                                              tokenCode: getIt<
                                                                          CacheHelper>()
                                                                      .getDataString(
                                                                          key:
                                                                              'token') ??
                                                                  "",
                                                            ),
                                                          )),
                                                          context);
                                                } else {
                                                  flightTicketCubit
                                                      .searchAvailability(
                                                          RequestModel(
                                                            request:
                                                                AirSearchRequest(
                                                              advancedOptions:
                                                                  AdvancedOptions(
                                                                corporate: Corporate(
                                                                    discounts:
                                                                        flightTicketCubit
                                                                            .corporateAirlineCodeList),
                                                                languageCode: getIt<
                                                                            CacheHelper>()
                                                                        .getDataString(
                                                                            key:
                                                                                'Lang') ??
                                                                    'en',
                                                                markup: Markup(
                                                                  calculationType: flightTicketCubit
                                                                              .typeIsAmount ==
                                                                          true
                                                                      ? CalculationType
                                                                          .amount
                                                                      : CalculationType
                                                                          .percent,
                                                                  amount: flightTicketCubit
                                                                              .typeIsAmount ==
                                                                          true
                                                                      ? flightTicketCubit
                                                                          .amount
                                                                      : flightTicketCubit
                                                                          .percent,
                                                                  currencyCode:
                                                                      BlocProvider.of<CurrencyCodeCubit>(
                                                                              context)
                                                                          .currencyCodeValue,
                                                                ),
                                                                air: AirAdvancedSearch(
                                                                    permittedAirlineCodes:
                                                                        flightTicketCubit
                                                                            .preferAirlineCodeList,
                                                                    onlyDirectFlights:
                                                                        flightTicketCubit
                                                                            .onlyDirectFlightsCheckBoxValue,
                                                                    onlyBestFares:
                                                                        true,
                                                                    onlyRefundableFlights:
                                                                        flightTicketCubit
                                                                            .onlyRefundableFlightsCheckBoxValue),
                                                              ),
                                                              legs: [
                                                                AirSearchLeg(
                                                                    arrivalPoint:
                                                                        Hotpoint(
                                                                      cityCode:
                                                                          flightTicketCubit
                                                                              .secondCityCode,
                                                                      code: flightTicketCubit
                                                                          .secondCityCode,
                                                                      hotpointType:
                                                                          flightTicketCubit
                                                                              .arrivalHotpointTypeEnum, // write the error
                                                                    ),
                                                                    date: DateFormat(
                                                                            'dd.MM.yyy')
                                                                        .format(flightTicketCubit
                                                                            .dateTimeRange!
                                                                            .start)
                                                                        .toString(),
                                                                    departurePoint: Hotpoint(
                                                                        cityCode:
                                                                            flightTicketCubit
                                                                                .firstCityCode,
                                                                        code: flightTicketCubit
                                                                            .firstCityCode,
                                                                        hotpointType:
                                                                            flightTicketCubit.departureHotpointTypeEnum)),
                                                                AirSearchLeg(
                                                                    arrivalPoint:
                                                                        Hotpoint(
                                                                      cityCode:
                                                                          flightTicketCubit
                                                                              .firstCityCode,
                                                                      code: flightTicketCubit
                                                                          .firstCityCode,
                                                                      hotpointType:
                                                                          flightTicketCubit
                                                                              .arrivalHotpointTypeEnum, // write the error
                                                                    ),
                                                                    date: DateFormat(
                                                                            'dd.MM.yyy')
                                                                        .format(flightTicketCubit
                                                                            .dateTimeRange!
                                                                            .end)
                                                                        .toString(),
                                                                    departurePoint: Hotpoint(
                                                                        cityCode:
                                                                            flightTicketCubit
                                                                                .secondCityCode,
                                                                        code: flightTicketCubit
                                                                            .secondCityCode,
                                                                        hotpointType:
                                                                            flightTicketCubit.departureHotpointTypeEnum))
                                                              ],
                                                              passengers:
                                                                  passengers,
                                                              searchType:
                                                                  AirSearchType
                                                                      .roundtrip,
                                                              token: Token(
                                                                channelCode:
                                                                    "kplusmobile",
                                                                tokenCode: getIt<
                                                                            CacheHelper>()
                                                                        .getDataString(
                                                                            key:
                                                                                'token') ??
                                                                    "",
                                                              ),
                                                            ),
                                                          ),
                                                          context);
                                                }
                                              },
                                              child: const CircularIconWidget(
                                                circularColor: Colors.white,
                                                borderColor: Colors.black54,
                                                iconColor: Colors.black87,
                                                icon: Icons
                                                    .keyboard_double_arrow_left,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            TextWidget(
                                              text:
                                                  '${flightTicketCubit.firstSearchCity ?? ''} - ${flightTicketCubit.secondSearchCity ?? ''}',
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            flightTicketCubit.searchTypeValue !=
                                                    'tek'
                                                ? TextWidget(
                                                    text: flightTicketCubit
                                                        .convertArabicNumbersToEnglish(
                                                            DateFormat(
                                                                    'dd-MM-yyy')
                                                                .format(flightTicketCubit
                                                                    .dateTimeRange!
                                                                    .start)),
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  )
                                                : TextWidget(
                                                    text: flightTicketCubit
                                                        .convertArabicNumbersToEnglish(DateFormat(
                                                                'dd-MM-yyy')
                                                            .format(flightTicketCubit
                                                                        .isSelectOneWay ==
                                                                    true
                                                                ? flightTicketCubit
                                                                    .dateTime!
                                                                : flightTicketCubit
                                                                    .dateTimeRange!
                                                                    .start)),
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            //--------------------------
                                            GestureDetector(
                                              onTap: () {
                                                flightTicketCubit
                                                    .selectedCardLeavingFunction(
                                                        value: null);
                                                flightTicketCubit.isVisibility =
                                                    false;
                                                if (flightTicketCubit
                                                        .searchTypeValue ==
                                                    'tek') {
                                                  flightTicketCubit.dateTime =
                                                      flightTicketCubit
                                                          .dateTime!
                                                          .add(const Duration(
                                                              days: 1));

// تحديث قيمة `dateTimeRange.start`
                                                  flightTicketCubit
                                                          .dateTimeRange =
                                                      DateTimeRange(
                                                          start: flightTicketCubit
                                                              .dateTimeRange!
                                                              .start
                                                              .add(
                                                                  const Duration(
                                                                      days: 1)),
                                                          end: flightTicketCubit
                                                              .dateTimeRange!
                                                              .end);
                                                } else {
                                                  flightTicketCubit
                                                          .dateTimeRange =
                                                      DateTimeRange(
                                                    start: flightTicketCubit
                                                        .dateTimeRange!.start
                                                        .add(const Duration(
                                                            days: 1)),
                                                    end: flightTicketCubit
                                                        .dateTimeRange!.end,
                                                  );
                                                }

                                                if (flightTicketCubit
                                                        .searchTypeValue ==
                                                    'tek') {
                                                  flightTicketCubit
                                                      .searchAvailability(
                                                          RequestModel(
                                                              request:
                                                                  AirSearchRequest(
                                                            advancedOptions:
                                                                AdvancedOptions(
                                                              corporate: Corporate(
                                                                  discounts:
                                                                      flightTicketCubit
                                                                          .corporateAirlineCodeList),
                                                              languageCode: getIt<
                                                                          CacheHelper>()
                                                                      .getDataString(
                                                                          key:
                                                                              'Lang') ??
                                                                  'en',
                                                              markup: Markup(
                                                                calculationType: flightTicketCubit
                                                                            .typeIsAmount ==
                                                                        true
                                                                    ? CalculationType
                                                                        .amount
                                                                    : CalculationType
                                                                        .percent,
                                                                amount: flightTicketCubit
                                                                            .typeIsAmount ==
                                                                        true
                                                                    ? flightTicketCubit
                                                                        .amount
                                                                    : flightTicketCubit
                                                                        .percent,
                                                                currencyCode: BlocProvider.of<
                                                                            CurrencyCodeCubit>(
                                                                        context)
                                                                    .currencyCodeValue,
                                                              ),
                                                              air:
                                                                  AirAdvancedSearch(
                                                                permittedAirlineCodes:
                                                                    flightTicketCubit
                                                                        .preferAirlineCodeList,
                                                                onlyDirectFlights:
                                                                    flightTicketCubit
                                                                        .onlyDirectFlightsCheckBoxValue,
                                                                onlyRefundableFlights:
                                                                    flightTicketCubit
                                                                        .onlyRefundableFlightsCheckBoxValue,
                                                                onlyBestFares:
                                                                    true,
                                                              ),
                                                            ),
                                                            legs: [
                                                              AirSearchLeg(
                                                                  arrivalPoint:
                                                                      Hotpoint(
                                                                    cityCode:
                                                                        flightTicketCubit
                                                                            .secondCityCode,
                                                                    code: flightTicketCubit
                                                                        .secondCityCode,
                                                                    hotpointType:
                                                                        flightTicketCubit
                                                                            .arrivalHotpointTypeEnum, // write the error
                                                                  ),
                                                                  date: //"12.06.2023",
                                                                      flightTicketCubit.convertArabicNumbersToEnglish(DateFormat('dd.MM.yyy')
                                                                          .format(flightTicketCubit.isSelectOneWay == true
                                                                              ? flightTicketCubit
                                                                                  .dateTime!
                                                                              : flightTicketCubit
                                                                                  .dateTimeRange!.start)
                                                                          .toString()),
                                                                  departurePoint: Hotpoint(
                                                                      cityCode:
                                                                          flightTicketCubit
                                                                              .firstCityCode,
                                                                      code: flightTicketCubit
                                                                          .firstCityCode,
                                                                      hotpointType:
                                                                          flightTicketCubit
                                                                              .departureHotpointTypeEnum))
                                                            ],
                                                            passengers:
                                                                passengers,
                                                            searchType:
                                                                AirSearchType
                                                                    .oneway,
                                                            token: Token(
                                                              channelCode:
                                                                  "kplusmobile",
                                                              tokenCode: getIt<
                                                                          CacheHelper>()
                                                                      .getDataString(
                                                                          key:
                                                                              'token') ??
                                                                  "",
                                                            ),
                                                          )),
                                                          context);
                                                } else {
                                                  flightTicketCubit
                                                      .searchAvailability(
                                                          RequestModel(
                                                            request:
                                                                AirSearchRequest(
                                                              advancedOptions:
                                                                  AdvancedOptions(
                                                                corporate: Corporate(
                                                                    discounts:
                                                                        flightTicketCubit
                                                                            .corporateAirlineCodeList),
                                                                languageCode: getIt<
                                                                            CacheHelper>()
                                                                        .getDataString(
                                                                            key:
                                                                                'Lang') ??
                                                                    'en',
                                                                markup: Markup(
                                                                  calculationType: flightTicketCubit
                                                                              .typeIsAmount ==
                                                                          true
                                                                      ? CalculationType
                                                                          .amount
                                                                      : CalculationType
                                                                          .percent,
                                                                  amount: flightTicketCubit
                                                                              .typeIsAmount ==
                                                                          true
                                                                      ? flightTicketCubit
                                                                          .amount
                                                                      : flightTicketCubit
                                                                          .percent,
                                                                  currencyCode:
                                                                      BlocProvider.of<CurrencyCodeCubit>(
                                                                              context)
                                                                          .currencyCodeValue,
                                                                ),
                                                                air: AirAdvancedSearch(
                                                                    permittedAirlineCodes:
                                                                        flightTicketCubit
                                                                            .preferAirlineCodeList,
                                                                    onlyDirectFlights:
                                                                        flightTicketCubit
                                                                            .onlyDirectFlightsCheckBoxValue,
                                                                    onlyBestFares:
                                                                        true,
                                                                    onlyRefundableFlights:
                                                                        flightTicketCubit
                                                                            .onlyRefundableFlightsCheckBoxValue),
                                                              ),
                                                              legs: [
                                                                AirSearchLeg(
                                                                    arrivalPoint:
                                                                        Hotpoint(
                                                                      cityCode:
                                                                          flightTicketCubit
                                                                              .secondCityCode,
                                                                      code: flightTicketCubit
                                                                          .secondCityCode,
                                                                      hotpointType:
                                                                          flightTicketCubit
                                                                              .arrivalHotpointTypeEnum, // write the error
                                                                    ),
                                                                    date: flightTicketCubit.convertArabicNumbersToEnglish(DateFormat(
                                                                            'dd.MM.yyy')
                                                                        .format(flightTicketCubit
                                                                            .dateTimeRange!
                                                                            .start)
                                                                        .toString()),
                                                                    departurePoint: Hotpoint(
                                                                        cityCode:
                                                                            flightTicketCubit
                                                                                .firstCityCode,
                                                                        code: flightTicketCubit
                                                                            .firstCityCode,
                                                                        hotpointType:
                                                                            flightTicketCubit.departureHotpointTypeEnum)),
                                                                AirSearchLeg(
                                                                    arrivalPoint:
                                                                        Hotpoint(
                                                                      cityCode:
                                                                          flightTicketCubit
                                                                              .firstCityCode,
                                                                      code: flightTicketCubit
                                                                          .firstCityCode,
                                                                      hotpointType:
                                                                          flightTicketCubit
                                                                              .arrivalHotpointTypeEnum, // write the error
                                                                    ),
                                                                    date: flightTicketCubit.convertArabicNumbersToEnglish(DateFormat(
                                                                            'dd.MM.yyy')
                                                                        .format(flightTicketCubit
                                                                            .dateTimeRange!
                                                                            .end)
                                                                        .toString()),
                                                                    departurePoint: Hotpoint(
                                                                        cityCode:
                                                                            flightTicketCubit
                                                                                .secondCityCode,
                                                                        code: flightTicketCubit
                                                                            .secondCityCode,
                                                                        hotpointType:
                                                                            flightTicketCubit.departureHotpointTypeEnum))
                                                              ],
                                                              passengers:
                                                                  passengers,
                                                              searchType:
                                                                  AirSearchType
                                                                      .roundtrip,
                                                              token: Token(
                                                                channelCode:
                                                                    "kplusmobile",
                                                                tokenCode: getIt<
                                                                            CacheHelper>()
                                                                        .getDataString(
                                                                            key:
                                                                                'token') ??
                                                                    "",
                                                              ),
                                                            ),
                                                          ),
                                                          context);
                                                }
                                              },
                                              child: const CircularIconWidget(
                                                circularColor: Colors.white,
                                                borderColor: Colors.black54,
                                                iconColor: Colors.black87,
                                                icon: Icons
                                                    .keyboard_double_arrow_right,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  flightTicketCubit.selectedCardLeaving != null
                                      ? SizedBox(
                                          height: context.height * 0.24,
                                          width: context.width * 1,
                                          child: ListView.builder(
                                            itemCount: 1,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return TicketCardLeavingWidget(
                                                index: flightTicketCubit
                                                    .selectedCardLeaving!,
                                              );
                                            },
                                          ),
                                        )
                                      : Expanded(
                                          child: ListView.builder(
                                            itemCount: flightTicketCubit
                                                .afterRefreshFlightSearchResultsLeaving
                                                .length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return TicketCardLeavingWidget(
                                                index: index,
                                              );
                                            },
                                          ),
                                        ),
                                  flightTicketCubit.isVisibility == true
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 12, top: 12),
                                          child: Container(
                                            height: 35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(18),
                                              color: AppColors.kSecondColor,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        flightTicketCubit
                                                            .selectedCardLeavingFunction(
                                                                value: null);
                                                        if (flightTicketCubit
                                                                .selectedCardReturn !=
                                                            null) {
                                                          flightTicketCubit
                                                              .selectedCardReturnFunction(
                                                                  value: null);
                                                        }
                                                        flightTicketCubit
                                                                .isVisibility =
                                                            false;

                                                        flightTicketCubit
                                                                .dateTimeRange =
                                                            DateTimeRange(
                                                          start:
                                                              flightTicketCubit
                                                                  .dateTimeRange!
                                                                  .start,
                                                          end: flightTicketCubit
                                                              .dateTimeRange!
                                                              .end
                                                              .subtract(
                                                                  const Duration(
                                                                      days: 1)),
                                                        );

                                                        if (flightTicketCubit
                                                                .searchTypeValue ==
                                                            'tek') {
                                                          flightTicketCubit
                                                              .searchAvailability(
                                                                  RequestModel(
                                                                      request:
                                                                          AirSearchRequest(
                                                                    advancedOptions:
                                                                        AdvancedOptions(
                                                                      corporate:
                                                                          Corporate(
                                                                              discounts: flightTicketCubit.corporateAirlineCodeList),
                                                                      languageCode:
                                                                          getIt<CacheHelper>().getDataString(key: 'Lang') ??
                                                                              'en',
                                                                      markup:
                                                                          Markup(
                                                                        calculationType: flightTicketCubit.typeIsAmount ==
                                                                                true
                                                                            ? CalculationType.amount
                                                                            : CalculationType.percent,
                                                                        amount: flightTicketCubit.typeIsAmount ==
                                                                                true
                                                                            ? flightTicketCubit.amount
                                                                            : flightTicketCubit.percent,
                                                                        currencyCode:
                                                                            BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue,
                                                                      ),
                                                                      air:
                                                                          AirAdvancedSearch(
                                                                        permittedAirlineCodes:
                                                                            flightTicketCubit.preferAirlineCodeList,
                                                                        onlyDirectFlights:
                                                                            flightTicketCubit.onlyDirectFlightsCheckBoxValue,
                                                                        onlyRefundableFlights:
                                                                            flightTicketCubit.onlyRefundableFlightsCheckBoxValue,
                                                                        onlyBestFares:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                    legs: [
                                                                      AirSearchLeg(
                                                                          arrivalPoint:
                                                                              Hotpoint(
                                                                            cityCode:
                                                                                flightTicketCubit.secondCityCode,
                                                                            code:
                                                                                flightTicketCubit.secondCityCode,
                                                                            hotpointType:
                                                                                flightTicketCubit.arrivalHotpointTypeEnum, // write the error
                                                                          ),
                                                                          date: //"12.06.2023",
                                                                              flightTicketCubit.convertArabicNumbersToEnglish(DateFormat('dd.MM.yyy').format(flightTicketCubit.dateTime!).toString()),
                                                                          departurePoint: Hotpoint(cityCode: flightTicketCubit.firstCityCode, code: flightTicketCubit.firstCityCode, hotpointType: flightTicketCubit.departureHotpointTypeEnum))
                                                                    ],
                                                                    passengers:
                                                                        passengers,
                                                                    searchType:
                                                                        AirSearchType
                                                                            .oneway,
                                                                    token:
                                                                        Token(
                                                                      channelCode:
                                                                          "kplusmobile",
                                                                      tokenCode:
                                                                          getIt<CacheHelper>().getDataString(key: 'token') ??
                                                                              "",
                                                                    ),
                                                                  )),
                                                                  context);
                                                        } else {
                                                          flightTicketCubit
                                                              .searchAvailability(
                                                                  RequestModel(
                                                                    request:
                                                                        AirSearchRequest(
                                                                      advancedOptions:
                                                                          AdvancedOptions(
                                                                        corporate:
                                                                            Corporate(discounts: flightTicketCubit.corporateAirlineCodeList),
                                                                        languageCode:
                                                                            getIt<CacheHelper>().getDataString(key: 'Lang') ??
                                                                                'en',
                                                                        markup:
                                                                            Markup(
                                                                          calculationType: flightTicketCubit.typeIsAmount == true
                                                                              ? CalculationType.amount
                                                                              : CalculationType.percent,
                                                                          amount: flightTicketCubit.typeIsAmount == true
                                                                              ? flightTicketCubit.amount
                                                                              : flightTicketCubit.percent,
                                                                          currencyCode:
                                                                              BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue,
                                                                        ),
                                                                        air: AirAdvancedSearch(
                                                                            permittedAirlineCodes: flightTicketCubit
                                                                                .preferAirlineCodeList,
                                                                            onlyDirectFlights: flightTicketCubit
                                                                                .onlyDirectFlightsCheckBoxValue,
                                                                            onlyBestFares:
                                                                                true,
                                                                            onlyRefundableFlights:
                                                                                flightTicketCubit.onlyRefundableFlightsCheckBoxValue),
                                                                      ),
                                                                      legs: [
                                                                        AirSearchLeg(
                                                                            arrivalPoint:
                                                                                Hotpoint(
                                                                              cityCode: flightTicketCubit.secondCityCode,
                                                                              code: flightTicketCubit.secondCityCode,
                                                                              hotpointType: flightTicketCubit.arrivalHotpointTypeEnum, // write the error
                                                                            ),
                                                                            date:
                                                                                flightTicketCubit.convertArabicNumbersToEnglish(DateFormat('dd.MM.yyy').format(flightTicketCubit.dateTimeRange!.start).toString()),
                                                                            departurePoint: Hotpoint(cityCode: flightTicketCubit.firstCityCode, code: flightTicketCubit.firstCityCode, hotpointType: flightTicketCubit.departureHotpointTypeEnum)),
                                                                        AirSearchLeg(
                                                                            arrivalPoint:
                                                                                Hotpoint(
                                                                              cityCode: flightTicketCubit.firstCityCode,
                                                                              code: flightTicketCubit.firstCityCode,
                                                                              hotpointType: flightTicketCubit.arrivalHotpointTypeEnum, // write the error
                                                                            ),
                                                                            date:
                                                                                flightTicketCubit.convertArabicNumbersToEnglish(DateFormat('dd.MM.yyy').format(flightTicketCubit.dateTimeRange!.end).toString()),
                                                                            departurePoint: Hotpoint(cityCode: flightTicketCubit.secondCityCode, code: flightTicketCubit.secondCityCode, hotpointType: flightTicketCubit.departureHotpointTypeEnum))
                                                                      ],
                                                                      passengers:
                                                                          passengers,
                                                                      searchType:
                                                                          AirSearchType
                                                                              .roundtrip,
                                                                      token:
                                                                          Token(
                                                                        channelCode:
                                                                            "kplusmobile",
                                                                        tokenCode:
                                                                            getIt<CacheHelper>().getDataString(key: 'token') ??
                                                                                "",
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  context);
                                                        }
                                                      },
                                                      child:
                                                          const CircularIconWidget(
                                                        circularColor:
                                                            Colors.white,
                                                        borderColor:
                                                            Colors.black54,
                                                        iconColor:
                                                            Colors.black87,
                                                        icon: Icons
                                                            .keyboard_double_arrow_left,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    TextWidget(
                                                      text:
                                                          '${flightTicketCubit.secondSearchCity!} - ${flightTicketCubit.firstSearchCity!}',
                                                      fontSize: 12,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    flightTicketCubit
                                                                .searchTypeValue ==
                                                            'tek'
                                                        ? TextWidget(
                                                            text: flightTicketCubit
                                                                .convertArabicNumbersToEnglish(DateFormat(
                                                                        'dd-MM-yyy')
                                                                    .format(flightTicketCubit
                                                                        .dateTime!)),
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )
                                                        : TextWidget(
                                                            text: flightTicketCubit
                                                                .convertArabicNumbersToEnglish(DateFormat(
                                                                        'dd-MM-yyy')
                                                                    .format(flightTicketCubit
                                                                        .dateTimeRange!
                                                                        .end)),
                                                            fontSize: 12,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        flightTicketCubit
                                                            .selectedCardLeavingFunction(
                                                                value: null);
                                                        if (flightTicketCubit
                                                                .selectedCardReturn !=
                                                            null) {
                                                          flightTicketCubit
                                                              .selectedCardReturnFunction(
                                                                  value: null);
                                                        }
                                                        flightTicketCubit
                                                                .isVisibility =
                                                            false;

                                                        flightTicketCubit
                                                                .dateTimeRange =
                                                            DateTimeRange(
                                                          start:
                                                              flightTicketCubit
                                                                  .dateTimeRange!
                                                                  .start,
                                                          end: flightTicketCubit
                                                              .dateTimeRange!
                                                              .end
                                                              .add(
                                                                  const Duration(
                                                                      days: 1)),
                                                        );

                                                        if (flightTicketCubit
                                                                .searchTypeValue ==
                                                            'tek') {
                                                          flightTicketCubit
                                                              .searchAvailability(
                                                                  RequestModel(
                                                                      request:
                                                                          AirSearchRequest(
                                                                    advancedOptions:
                                                                        AdvancedOptions(
                                                                      corporate:
                                                                          Corporate(
                                                                              discounts: flightTicketCubit.corporateAirlineCodeList),
                                                                      languageCode:
                                                                          getIt<CacheHelper>().getDataString(key: 'Lang') ??
                                                                              'en',
                                                                      markup:
                                                                          Markup(
                                                                        calculationType: flightTicketCubit.typeIsAmount ==
                                                                                true
                                                                            ? CalculationType.amount
                                                                            : CalculationType.percent,
                                                                        amount: flightTicketCubit.typeIsAmount ==
                                                                                true
                                                                            ? flightTicketCubit.amount
                                                                            : flightTicketCubit.percent,
                                                                        currencyCode:
                                                                            BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue,
                                                                      ),
                                                                      air:
                                                                          AirAdvancedSearch(
                                                                        permittedAirlineCodes:
                                                                            flightTicketCubit.preferAirlineCodeList,
                                                                        onlyDirectFlights:
                                                                            flightTicketCubit.onlyDirectFlightsCheckBoxValue,
                                                                        onlyRefundableFlights:
                                                                            flightTicketCubit.onlyRefundableFlightsCheckBoxValue,
                                                                        onlyBestFares:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                    legs: [
                                                                      AirSearchLeg(
                                                                          arrivalPoint:
                                                                              Hotpoint(
                                                                            cityCode:
                                                                                flightTicketCubit.secondCityCode,
                                                                            code:
                                                                                flightTicketCubit.secondCityCode,
                                                                            hotpointType:
                                                                                flightTicketCubit.arrivalHotpointTypeEnum, // write the error
                                                                          ),
                                                                          date: //"12.06.2023",
                                                                              flightTicketCubit.convertArabicNumbersToEnglish(DateFormat('dd.MM.yyy').format(flightTicketCubit.dateTime!).toString()),
                                                                          departurePoint: Hotpoint(cityCode: flightTicketCubit.firstCityCode, code: flightTicketCubit.firstCityCode, hotpointType: flightTicketCubit.departureHotpointTypeEnum))
                                                                    ],
                                                                    passengers:
                                                                        passengers,
                                                                    searchType:
                                                                        AirSearchType
                                                                            .oneway,
                                                                    token:
                                                                        Token(
                                                                      channelCode:
                                                                          "kplusmobile",
                                                                      tokenCode:
                                                                          getIt<CacheHelper>().getDataString(key: 'token') ??
                                                                              "",
                                                                    ),
                                                                  )),
                                                                  context);
                                                        } else {
                                                          flightTicketCubit
                                                              .searchAvailability(
                                                                  RequestModel(
                                                                    request:
                                                                        AirSearchRequest(
                                                                      advancedOptions:
                                                                          AdvancedOptions(
                                                                        corporate:
                                                                            Corporate(discounts: flightTicketCubit.corporateAirlineCodeList),
                                                                        languageCode:
                                                                            getIt<CacheHelper>().getDataString(key: 'Lang') ??
                                                                                'en',
                                                                        markup:
                                                                            Markup(
                                                                          calculationType: flightTicketCubit.typeIsAmount == true
                                                                              ? CalculationType.amount
                                                                              : CalculationType.percent,
                                                                          amount: flightTicketCubit.typeIsAmount == true
                                                                              ? flightTicketCubit.amount
                                                                              : flightTicketCubit.percent,
                                                                          currencyCode:
                                                                              BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue,
                                                                        ),
                                                                        air: AirAdvancedSearch(
                                                                            permittedAirlineCodes: flightTicketCubit
                                                                                .preferAirlineCodeList,
                                                                            onlyDirectFlights: flightTicketCubit
                                                                                .onlyDirectFlightsCheckBoxValue,
                                                                            onlyBestFares:
                                                                                true,
                                                                            onlyRefundableFlights:
                                                                                flightTicketCubit.onlyRefundableFlightsCheckBoxValue),
                                                                      ),
                                                                      legs: [
                                                                        AirSearchLeg(
                                                                            arrivalPoint:
                                                                                Hotpoint(
                                                                              cityCode: flightTicketCubit.secondCityCode,
                                                                              code: flightTicketCubit.secondCityCode,
                                                                              hotpointType: flightTicketCubit.arrivalHotpointTypeEnum, // write the error
                                                                            ),
                                                                            date:
                                                                                flightTicketCubit.convertArabicNumbersToEnglish(DateFormat('dd.MM.yyy').format(flightTicketCubit.dateTimeRange!.start).toString()),
                                                                            departurePoint: Hotpoint(cityCode: flightTicketCubit.firstCityCode, code: flightTicketCubit.firstCityCode, hotpointType: flightTicketCubit.departureHotpointTypeEnum)),
                                                                        AirSearchLeg(
                                                                            arrivalPoint:
                                                                                Hotpoint(
                                                                              cityCode: flightTicketCubit.firstCityCode,
                                                                              code: flightTicketCubit.firstCityCode,
                                                                              hotpointType: flightTicketCubit.arrivalHotpointTypeEnum, // write the error
                                                                            ),
                                                                            date:
                                                                                flightTicketCubit.convertArabicNumbersToEnglish(DateFormat('dd.MM.yyy').format(flightTicketCubit.dateTimeRange!.end).toString()),
                                                                            departurePoint: Hotpoint(cityCode: flightTicketCubit.secondCityCode, code: flightTicketCubit.secondCityCode, hotpointType: flightTicketCubit.departureHotpointTypeEnum))
                                                                      ],
                                                                      passengers:
                                                                          passengers,
                                                                      searchType:
                                                                          AirSearchType
                                                                              .roundtrip,
                                                                      token:
                                                                          Token(
                                                                        channelCode:
                                                                            "kplusmobile",
                                                                        tokenCode:
                                                                            getIt<CacheHelper>().getDataString(key: 'token') ??
                                                                                "",
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  context);
                                                        }
                                                      },
                                                      child:
                                                          const CircularIconWidget(
                                                        circularColor:
                                                            Colors.white,
                                                        borderColor:
                                                            Colors.black54,
                                                        iconColor:
                                                            Colors.black87,
                                                        icon: Icons
                                                            .keyboard_double_arrow_right,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : const SizedBox(),
                                  Visibility(
                                      visible: flightTicketCubit.isVisibility,
                                      child: flightTicketCubit
                                                  .selectedCardReturn !=
                                              null
                                          ? Expanded(
                                              child: ListView.builder(
                                                itemCount: 1,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return TicketCardReturnWidget(
                                                    index: flightTicketCubit
                                                        .selectedCardReturn!,
                                                  );
                                                },
                                              ),
                                            )
                                          : Expanded(
                                              child: ListView.builder(
                                                itemCount: flightTicketCubit
                                                    .afterRefreshFlightSearchResultsReturn
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return TicketCardReturnWidget(
                                                    index: index,
                                                  );
                                                },
                                              ),
                                            )),
                                ],
                              ),
                            ),
                          ],
                        )),
        );
      },
    );
  }
}
