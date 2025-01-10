import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_validate_request.dart';
import 'package:bamobile1/flight/data/models/validate_request.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_passenger_data_enter_view.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/fare_card_combined_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/new_fare_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/new_fare_card_leaving.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_passenger_details_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/flight_details_bottom_sheet_leaving_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/flight_details_bottom_sheet_return_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/price_and_continue_bottom_sheet.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/seat_details_bottom_sheet.dart';

import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/title_for_list_card_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/title_of_select_seat_type_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightTicketSelectSeatView extends StatelessWidget {
  const FlightTicketSelectSeatView({super.key});
  static String id = 'FlightTicketSelectSeatView';
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        if (state is FlightFaresSuccess) {}
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            flightTicketCubit.selectedCardLeavingFunction(value: null);
            flightTicketCubit.selectedCardReturnFunction(value: null);
            flightTicketCubit.selectedSeatTypeLeaving = null;
            flightTicketCubit.selectedSeatTypeReturn = null;
            flightTicketCubit.isVisibilitySeatType = false;
            flightTicketCubit.isVisibility = false;
            flightTicketCubit.bottomSheetValue(type: 0);
            flightTicketCubit.totalPrice = 0;
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.kAppBarColor,
              toolbarHeight: context.height * 0.06,
              automaticallyImplyLeading: false,
              title: AppBarWidget(
                onPressedLeading: () {
                  if (flightTicketCubit.bottomSheetType == 5 ||
                      flightTicketCubit.bottomSheetType == 22) {
                    flightTicketCubit.bottomSheetValue(type: 0);
                  } else {
                    flightTicketCubit.selectedCardLeavingFunction(value: null);
                    flightTicketCubit.selectedCardReturnFunction(value: null);

                    flightTicketCubit.selectedSeatTypeLeaving = null;
                    flightTicketCubit.selectedSeatTypeReturn = null;
                    flightTicketCubit.isVisibilitySeatType = false;
                    flightTicketCubit.isVisibility = false;
                    flightTicketCubit.bottomSheetValue(type: 0);
                    flightTicketCubit.totalPrice = 0;

                    Navigator.pop(context);
                  }

                  // print('-------------------------');
                  // print(flightTicketCubit.bottomSheetType);
                },
                title: S.of(context).SelectFlightTicketPackage,
                leading: Icons.arrow_back_ios,
              ),
            ),
            bottomSheet: flightTicketCubit.bottomSheetType == 5
                ? const FlightDetailsBottomSheetLeavingCard()
                : flightTicketCubit.bottomSheetType == 22
                    ? const FlightDetailsBottomSheetReturnCard()
                    : flightTicketCubit.bottomSheetType == 4
                        ? const SeatDetailsBottomSheet()
                        : flightTicketCubit.searchTypeValue == 'tek'
                            ? flightTicketCubit.selectedSeatTypeLeaving != null
                                ? PriceAndContinueBottomSheet(
                                    onTap: () {
                                      dynamic keyOne = flightTicketCubit
                                          .flightFaresLeaving![0]
                                          .fares![flightTicketCubit
                                              .sendSeatIndexValue!]
                                          .fareAlternativeLegs![0]
                                          .key;

                                      // print(key);
                                      List<String> fareKeysList = [];
                                      fareKeysList.add(keyOne);
                                      //    print('fareKeysList : $fareKeysList');
                                      flightTicketCubit.getValidate(
                                          ValidateRequestJson(
                                            request: ValidateRequest(
                                              air: AirValidateRequest(
                                                  fareAlternativeLegKeys:
                                                      fareKeysList),
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

                                      flightTicketCubit.bottomSheetValue(
                                          type: 6);
                                      Navigator.pushNamed(
                                          context,
                                          FlightTicketPassengerDataEnterView
                                              .id);
                                      keyOne = null;
                                      fareKeysList = [];
                                    },
                                  )
                                : const SizedBox()
                            : flightTicketCubit.selectedSeatTypeReturn !=
                                            null &&
                                        flightTicketCubit
                                                .selectedSeatTypeLeaving !=
                                            null ||
                                    flightTicketCubit
                                            .saveIndexFareForCombinedPackage !=
                                        null
                                ? PriceAndContinueBottomSheet(
                                    onTap: () {
                                      dynamic keyOne;
                                      dynamic keyTwo;
                                      List<String> fareKeysList = [];
                                      if (flightTicketCubit
                                              .isResultReturnAndPackage ==
                                          false) {
                                        keyOne = flightTicketCubit
                                            .flightFaresLeaving![0]
                                            .fares![flightTicketCubit
                                                .sendSeatIndexValue!]
                                            .fareAlternativeLegs![0]
                                            .key;
                                        keyTwo = flightTicketCubit
                                            .flightFaresReturn![0]
                                            .fares![flightTicketCubit
                                                .sendSeatReturnIndexValue!]
                                            .fareAlternativeLegs!
                                            .last
                                            .key;
                                      } else {
                                        fareKeysList.addAll(flightTicketCubit
                                            .fareKeyListForCombinedPackage);
                                      }

                                      if (flightTicketCubit
                                              .isResultReturnAndPackage ==
                                          false) {
                                        fareKeysList.add(keyOne);
                                        fareKeysList.add(keyTwo);
                                      }

                                      flightTicketCubit.getValidate(
                                          ValidateRequestJson(
                                            request: ValidateRequest(
                                              air: AirValidateRequest(
                                                  fareAlternativeLegKeys:
                                                      fareKeysList),
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
                                      flightTicketCubit.bottomSheetValue(
                                          type: 6);
                                      Navigator.pushNamed(
                                          context,
                                          FlightTicketPassengerDataEnterView
                                              .id);
                                      keyOne = null;
                                      keyTwo = null;
                                      fareKeysList = [];
                                    },
                                  )
                                : const SizedBox(),
            backgroundColor: Colors.grey.shade200,
            body: state is FlightFaresLoading
                ? const Center(
                    child: LoadingWidget(),
                  )
                : state is FlightFaresFailure
                    ? ErrorResultWidget(
                        errorCode: state.errorCode,
                        errorMassage: state.errorMassage)
                    : flightTicketCubit.isResultReturnAndPackage == true
                        ? CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: Column(
                                  children: [
                                    const TitleForListCardWidget(
                                      isShow: false,
                                      itIsReturnOrOneWay: 0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        flightTicketCubit.bottomSheetValue(
                                            type: 5);
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 10),
                                            TextWidget(
                                              text: S.of(context).Details,
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                            const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Column(
                                      children: [
                                        const TitleForListCardWidget(
                                          isShow: false,
                                          itIsReturnOrOneWay: 1,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            flightTicketCubit.bottomSheetValue(
                                                type: 22);
                                          },
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(30),
                                                bottomRight:
                                                    Radius.circular(30),
                                              ),
                                            ),
                                            width: context.width * 0.25,
                                            height: context.height * 0.025,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const SizedBox(width: 10),
                                                TextWidget(
                                                  text: S.of(context).Details,
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                                const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    if (flightTicketCubit
                                                .saveIndexFareForCombinedPackage !=
                                            null &&
                                        flightTicketCubit
                                                .saveIndexFareForCombinedPackage !=
                                            index) {
                                      return Container();
                                    }

                                    return FareCardCombinedWidget(
                                      index: index,
                                      color: flightTicketCubit.colors[index],
                                    );
                                  },
                                  childCount: flightTicketCubit
                                      .flightFaresLeaving![0].fares!.length,
                                ),
                              ),
                            ],
                          )
                        : CustomScrollView(
                            //    physics: const NeverScrollableScrollPhysics(),
                            slivers: [
                              SliverToBoxAdapter(
                                child: Column(
                                  children: [
                                    const TitleForListCardWidget(
                                      isShow: false,
                                      itIsReturnOrOneWay: 0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        flightTicketCubit.bottomSheetValue(
                                            type: 5);
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const SizedBox(width: 10),
                                            TextWidget(
                                              text: S.of(context).Details,
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                            const Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    flightTicketCubit.returnGroupId == null &&
                                            flightTicketCubit.searchTypeValue !=
                                                'tek'
                                        ? Column(children: [
                                            const TitleForListCardWidget(
                                              isShow: false,
                                              itIsReturnOrOneWay: 1,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                flightTicketCubit
                                                    .bottomSheetValue(type: 22);
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30),
                                                  ),
                                                ),
                                                width: context.width * 0.25,
                                                height: context.height * 0.025,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(width: 10),
                                                    TextWidget(
                                                      text:
                                                          S.of(context).Details,
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                    const Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.grey,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 12,
                                            ),
                                          ])
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    if (flightTicketCubit
                                                .selectedSeatTypeLeaving !=
                                            null &&
                                        flightTicketCubit
                                                .selectedSeatTypeLeaving !=
                                            index) {
                                      return Container();
                                    }
                                    return NewFareCardLeaving(
                                      index: index,
                                      color: flightTicketCubit.colors[index],
                                    );
                                  },
                                  childCount: flightTicketCubit
                                      .flightFaresLeaving![0].fares!.length,
                                ),
                              ),
                              if (flightTicketCubit.searchTypeValue != 'tek' &&
                                  flightTicketCubit.selectedSeatTypeLeaving !=
                                      null)
                                if (flightTicketCubit.isVisibilitySeatType ==
                                    true)
                                  if (flightTicketCubit.returnGroupId != null)
                                    SliverToBoxAdapter(
                                      child: NotificationListener<
                                          ScrollNotification>(
                                        onNotification: (scrollNotification) {
                                          // العودة false لتجنب تحريك السكرول في الـ CustomScrollView
                                          return false;
                                        },
                                        child: Column(
                                          children: [
                                            const TitleForListCardWidget(
                                              isShow: false,
                                              itIsReturnOrOneWay: 1,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                flightTicketCubit
                                                    .bottomSheetValue(type: 22);
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(30),
                                                    bottomRight:
                                                        Radius.circular(30),
                                                  ),
                                                ),
                                                width: context.width * 0.25,
                                                height: context.height * 0.025,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    const SizedBox(width: 10),
                                                    TextWidget(
                                                      text:
                                                          S.of(context).Details,
                                                      fontSize: 12,
                                                      color: Colors.grey,
                                                    ),
                                                    const Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.grey,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: flightTicketCubit
                                                          .isVisibilitySeatType ==
                                                      true
                                                  ? 12
                                                  : 0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              if (flightTicketCubit.searchTypeValue != 'tek' &&
                                  flightTicketCubit.selectedSeatTypeLeaving !=
                                      null &&
                                  flightTicketCubit.returnGroupId != null)
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      if (flightTicketCubit
                                                  .selectedSeatTypeReturn !=
                                              null &&
                                          flightTicketCubit
                                                  .selectedSeatTypeReturn !=
                                              index) {
                                        return Container();
                                      }
                                      return NewFareCard(
                                        index: index,
                                        color: flightTicketCubit.colors[index],
                                      );
                                    },
                                    childCount: flightTicketCubit
                                        .flightFaresReturn![0].fares!.length,
                                  ),
                                ),
                            ],
                          ),

            // Column(
            //   children: [
            // const TitleForListCardWidget(
            //   isShow: false,
            //   itIsReturnOrOneWay: 0,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     flightTicketCubit.bottomSheetValue(type: 5);
            //   },
            //   child: Container(
            //     decoration: const BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.only(
            //         bottomLeft: Radius.circular(30),
            //         bottomRight: Radius.circular(30),
            //       ),
            //     ),
            //     width: context.width * 0.25,
            //     height: context.height * 0.025,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         const SizedBox(
            //           width: 10,
            //         ),
            //         TextWidget(
            //           text: S.of(context).Details,
            //           fontSize: 12,
            //           color: Colors.grey,
            //         ),
            //         const Icon(
            //           Icons.arrow_drop_down,
            //           color: Colors.grey,
            //         )
            //       ],
            //     ),
            //   ),
            // )
            //   ],
            // ),
            // const SizedBox(
            //   height: 12,
            // ),

            //----------------------------

            // flightTicketCubit.returnGroupId == null &&
            //         flightTicketCubit.searchTypeValue != 'tek'
            //     ? Column(
            //         children: [
            //           const TitleForListCardWidget(
            //             isShow: false,
            //             itIsReturnOrOneWay: 1,
            //           ),
            //           GestureDetector(
            //             onTap: () {

            //               flightTicketCubit.bottomSheetValue(
            //                   type: 22);
            //             },
            //             child: Container(
            //               decoration: const BoxDecoration(
            //                 color: Colors.white,
            //                 borderRadius: BorderRadius.only(
            //                   bottomLeft: Radius.circular(30),
            //                   bottomRight: Radius.circular(30),
            //                 ),
            //               ),
            //               width: context.width * 0.25,
            //               height: context.height * 0.025,
            //               child: Row(
            //                 mainAxisAlignment:
            //                     MainAxisAlignment.center,
            //                 children: [
            //                   const SizedBox(
            //                     width: 10,
            //                   ),
            //                   TextWidget(
            //                     text: S.of(context).Details,
            //                     fontSize: 12,
            //                     color: Colors.grey,
            //                   ),
            //                   const Icon(
            //                     Icons.arrow_drop_down,
            //                     color: Colors.grey,
            //                   )
            //                 ],
            //               ),
            //             ),
            //           )
            //         ],
            //       )
            //     : const SizedBox(),
          ),
        );
      },
    );
  }
}
