import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_branded_fare_request.dart';
import 'package:bamobile1/flight/data/models/air_fare.dart';
import 'package:bamobile1/flight/data/models/air_segment.dart';
import 'package:bamobile1/flight/data/models/pax_definition.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_view.dart';
import 'package:bamobile1/views/ticket-views/multi_point_views/flight_ticket_select_multi_point_seat_view.dart';
import 'package:bamobile1/widgets/alert_dialog_widget.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/flight_details_bottom_sheet_multi_point.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/seat_details_for_multi_point_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/filter_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/price_and_continue_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/flight_ticket_multi_point_card.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/flight_ticket_multi_point_selected_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/seat_details_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/sort_alert_dialog_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:bamobile1/common/data/enums/air_search_type.dart';
import 'package:bamobile1/common/data/enums/calculation_type.dart';

import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';

import 'package:bamobile1/flight/data/models/corporate.dart';
import 'package:bamobile1/flight/data/models/markup.dart';

import 'package:bamobile1/flight/data/models/advanced_options.dart';
import 'package:bamobile1/flight/data/models/air_advanced_search.dart';

import 'package:bamobile1/flight/data/models/air_search_request.dart';

import 'package:bamobile1/models/multi_point_model.dart';

class FlightTicketSearchConclusionMultiPointView extends StatelessWidget {
  const FlightTicketSearchConclusionMultiPointView({super.key});

  static const String id = 'FlightTicketSearchConclusionMultiPointView';
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
    // flightTicketCubit.bottomSheetType = 0;
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
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
                  //flightTicketCubit.bottomSheetValue(type: 0);
                  flightTicketCubit.selectAirResultForMultiPointList = [];
                  flightTicketCubit.totalPriceMultiPoint = 0.0;
                  Navigator.pushReplacementNamed(context, FlightTicketView.id);
                },
                title: S.of(context).SelectFlightTicket,
                leading: Icons.arrow_back_ios,
              ),
              backgroundColor: AppColors.kAppBarColor,
            ),
            bottomSheet: flightTicketCubit.bottomSheetType == 53
                ? const SeatDetailsForMultiPointBottomSheet()
                : flightTicketCubit.bottomSheetType == 52
                    ? const FilterBottomSheet()
                    : flightTicketCubit.bottomSheetType == 51
                        ? const FlightDetailsBottomSheetMultiPoint()
                        : flightTicketCubit.listMultiPoint.length ==
                                flightTicketCubit
                                    .selectAirResultForMultiPointList.length
                            ? PriceAndContinueBottomSheet(
                                onTap: () {
                                  List<String> keysForAllList = [];
                                  bool dd = true;
                                  for (var element in flightTicketCubit
                                      .selectAirResultForMultiPointList) {
                                    keysForAllList.add(element.fares!.first
                                        .fareAlternativeLegs!.first.key!);
                                    if (flightTicketCubit
                                                .selectAirResultForMultiPointList[
                                                    1]
                                                .groupId![0] ==
                                            'P' &&
                                        dd == true) {
                                      for (var aA in flightTicketCubit
                                          .searchResultsMultiPoint[0]
                                          .results!) {
                                        for (var bB in aA.fares!.first
                                            .fareAlternativeLegs!) {
                                          print(
                                              'bB.alternativeRef: ${bB.alternativeRef}');
                                          print(
                                              'flightTicketCubit.selectAirResultForMultiPointLis.alternativeRef: ${flightTicketCubit.selectAirResultForMultiPointList.first.fares!.first.fareAlternativeLegs!.first.alternativeRef}');
                                          if (bB.alternativeRef ==
                                              flightTicketCubit
                                                  .selectAirResultForMultiPointList[
                                                      1]
                                                  .fares!
                                                  .first
                                                  .fareAlternativeLegs!
                                                  .first
                                                  .alternativeRef) {
                                            print(
                                                '+++++++++++++++++++++++++++++++++');
                                            keysForAllList[0] = aA
                                                .fares!
                                                .first
                                                .fareAlternativeLegs!
                                                .first
                                                .key!;
                                            dd = false;
                                          }
                                        }
                                      }
                                    }
                                    // keysForAllList.add(element
                                    //     .fares!.first.fareAlternativeLegs!.first.key!);
                                  }

                                  print('k list: $keysForAllList');
                                  flightTicketCubit.totalPrice = 0.0;
                                  flightTicketCubit.paxTypeListCountFunction();
                                  print(
                                      'hhhhhhhhhon1111111111111111111111111111111111111111111111111111111111111   ');
                                  print('keysForAllList: $keysForAllList');
                                  //flightTicketCubit.keysForAllFunction();
                                  flightTicketCubit.getBrandedFares(
                                      AirBrandedFareRequestJson(
                                        request: AirBrandedFareRequest(
                                          fareAlternativeLegKeys:
                                              keysForAllList,
                                          token: Token(
                                            channelCode: "kplusmobile",
                                            tokenCode: getIt<CacheHelper>()
                                                    .getDataString(
                                                        key: 'token') ??
                                                "",
                                          ),
                                        ),
                                      ),
                                      context);
                                  Navigator.pushNamed(
                                    context,
                                    FlightTicketSelectMultiPointSeatView.id,
                                  );
                                },
                              )
                            : null,
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
                    : Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
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
                                                widget: SortAlertDialogWidget(
                                                  thisIsMultiPoint: true,
                                                ),
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
                                            .flightSearchResultForMultiPoints = [];
                                        flightTicketCubit
                                            .flightSearchResultForMultiPoints
                                            .addAll(flightTicketCubit
                                                .savedFlightSearchResults);
                                        flightTicketCubit.bottomSheetValue(
                                            type: 52);
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
                            SizedBox(
                              height: context.height * 0.012,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  var flightResults = flightTicketCubit
                                      .flightSearchResultForMultiPoints[index];

                                  print(
                                      'Flight Results for Card $index: $flightResults');

                                  return Column(
                                    children: [
                                      Column(
                                        children: [
                                          Visibility(
                                            visible: flightTicketCubit
                                                .selectAirResultForMultiPointList
                                                .isNotEmpty,
                                            child: SizedBox(
                                              height: context.height *
                                                  flightTicketCubit
                                                      .selectAirResultForMultiPointList
                                                      .length *
                                                  0.309,
                                              child: ListView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  itemCount: flightTicketCubit
                                                      .selectAirResultForMultiPointList
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    // إضافة لوجيك للتعامل مع الضغط على البطاقة وتحديث selectListIndexForMultiPointValue
                                                    return FlightTicketMultiPointSelectedCard(
                                                        index: index);
                                                  }),
                                            ),
                                          ),
                                          Visibility(
                                            visible: flightTicketCubit
                                                    .listMultiPoint.length !=
                                                flightTicketCubit
                                                    .selectAirResultForMultiPointList
                                                    .length,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                bottom: context.height * 0.012,
                                              ),
                                              child: Container(
                                                height: context.height * 0.045,
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
                                                                .addOrRemoveDay(
                                                              index: flightTicketCubit
                                                                  .currentListIndex,
                                                              isAddOneDay:
                                                                  false,
                                                            );
                                                            flightTicketCubit
                                                                .searchAvailabilityForMultiPoint(
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
                                                                      legs: convertMultiPointToAirSearchLeg(
                                                                          flightTicketCubit
                                                                              .listMultiPoint,
                                                                          context),
                                                                      passengers:
                                                                          passengers,
                                                                      searchType:
                                                                          AirSearchType
                                                                              .multiple,
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
                                                            width: 4),
                                                        TextWidget(
                                                          text:
                                                              '${flightTicketCubit.listMultiPoint[flightTicketCubit.currentListIndex].departureCityName} - ${flightTicketCubit.listMultiPoint[flightTicketCubit.currentListIndex].arrivalCityName}',
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        TextWidget(
                                                          text: DateFormat(
                                                                  'dd-MM-yyy')
                                                              .format(flightTicketCubit
                                                                  .listMultiPoint[
                                                                      flightTicketCubit
                                                                          .currentListIndex]
                                                                  .departureDate!),
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        const SizedBox(
                                                            width: 4),
                                                        GestureDetector(
                                                          onTap: () {
                                                            flightTicketCubit
                                                                .addOrRemoveDay(
                                                              index: flightTicketCubit
                                                                  .currentListIndex,
                                                              isAddOneDay: true,
                                                            );
                                                            flightTicketCubit
                                                                .searchAvailabilityForMultiPoint(
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
                                                                      legs: convertMultiPointToAirSearchLeg(
                                                                          flightTicketCubit
                                                                              .listMultiPoint,
                                                                          context),
                                                                      passengers:
                                                                          passengers,
                                                                      searchType:
                                                                          AirSearchType
                                                                              .multiple,
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
                                            ),
                                          ),
                                          flightTicketCubit
                                                  .flightSearchResultForMultiPoints[
                                                      flightTicketCubit
                                                          .currentListIndex]
                                                  .isNotEmpty
                                              ? Visibility(
                                                  visible: flightTicketCubit
                                                          .flightSearchResultForMultiPoints
                                                          .length !=
                                                      flightTicketCubit
                                                          .selectAirResultForMultiPointList
                                                          .length,
                                                  child: SizedBox(
                                                    height: flightTicketCubit
                                                            .selectAirResultForMultiPointList
                                                            .isEmpty
                                                        ? context.height * 0.9
                                                        : context.height * 0.7,
                                                    child: ListView.builder(
                                                        itemCount: flightTicketCubit
                                                            .flightSearchResultForMultiPoints[
                                                                flightTicketCubit
                                                                    .currentListIndex]
                                                            .length,
                                                        itemBuilder: (context,
                                                            subIndex) {
                                                          // var currentLeg =
                                                          //     flightResults[subIndex];
                                                          // print(
                                                          //     'Current Leg for Card $index, SubIndex $subIndex: $currentLeg');

                                                          // إضافة لوجيك للتعامل مع الضغط على البطاقة وتحديث selectListIndexForMultiPointValue
                                                          return FlightTicketMultiPointCard(
                                                            index: flightTicketCubit
                                                                .currentListIndex,
                                                            subIndex: subIndex,
                                                            isSelected: flightTicketCubit
                                                                    .selectListIndexForMultiPointValue[
                                                                flightTicketCubit
                                                                    .currentListIndex][subIndex],
                                                          );
                                                        }),
                                                  ),
                                                )
                                              : flightTicketCubit.listMultiPoint
                                                          .length ==
                                                      flightTicketCubit
                                                          .selectAirResultForMultiPointList
                                                          .length
                                                  ? const SizedBox()
                                                  : const Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      'No Flights Found',
                                                    ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: context.height * 0.01,
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


//         return Scaffold(
//           appBar: AppBar(
//             toolbarHeight: context.height * 0.06,
//             automaticallyImplyLeading: false,
//             title: AppBarWidget(
//               onPressedLeading: () {},
//               title: S.of(context).SelectFlightTicket,
//               leading: Icons.arrow_back_ios,
//             ),
//             backgroundColor: Colors.black,
//           ),
//           body: ListView.builder(
//             itemCount: flightTicketCubit.testMultiPoint.length,
//             itemBuilder: (context, index) {
//               var currentLeg = flightTicketCubit.testMultiPoint[index];
//               return Card(
//                   child: ListTile(
//                       title: Text(
//                 '${currentLeg.fares![0].fareAlternativeLegs![0].fareSegments![0].fareBasis!} || ${currentLeg.legs![0].alternativeLegs![0].segments![0].flightNo!} ${currentLeg.legs![0].alternativeLegs![0].segments![0].ticketingAirline!.name!}',
//               )));
//             },
//           ),
//         );
//       },
//     );
//   }
// }

      
  
        
        
        
        
        
        
        
        
        
        
        
        
        
//          Scaffold(
//           appBar: AppBar(
//             toolbarHeight: context.height * 0.06,
//             automaticallyImplyLeading: false,
//             title: AppBarWidget(
//               onPressedLeading: () {},
//               title: S.of(context).SelectFlightTicket,
//               leading: Icons.arrow_back_ios,
//             ),
//             backgroundColor: Colors.black,
//           ),
//           body: ListView.builder(
//             itemCount:
//                 flightTicketCubit.flightSearchResultForMultiPoints.length,
//             itemBuilder: (context, index) {
//               var flightResults =
//                   flightTicketCubit.flightSearchResultForMultiPoints[index];

//               print('Flight Results for Card $index: $flightResults');

//               return Card(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 100,
//                       child: ListView.builder(
//                         itemCount: flightResults.length,
//                         itemBuilder: (context, subIndex) {
//                           var currentLeg = flightResults[subIndex];
//                           print(
//                               'Current Leg for Card $index, SubIndex $subIndex: $currentLeg');

//                           return ListTile(
//                               title: Text(
//                             '${currentLeg.fares![0].fareAlternativeLegs![0].fareSegments![0].fareBasis!} || ${currentLeg.legs![0].alternativeLegs![0].segments![0].flightNo!} || ${currentLeg.legs![0].alternativeLegs![0].segments![0].ticketingAirline!.name!}',
//                           ));
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

