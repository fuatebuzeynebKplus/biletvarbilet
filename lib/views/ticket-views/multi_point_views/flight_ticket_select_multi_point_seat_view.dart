import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_validate_request.dart';
import 'package:bamobile1/flight/data/models/validate_request.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_passenger_data_enter_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_payment_data_enter_view.dart';
import 'package:bamobile1/views/ticket-views/multi_point_views/flight_ticket_search_conclusion_multi_point_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/fare_multi_point_card_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/fare_multi_point_card_widget_combined.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/fare_multi_point_selected_card_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/flight_details_bottom_sheet_multi_point.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/seat_details_for_multi_point_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/title_for_list_card_multi_point_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/price_and_continue_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/new_fare_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/new_fare_card_leaving.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/title_for_list_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightTicketSelectMultiPointSeatView extends StatelessWidget {
  const FlightTicketSelectMultiPointSeatView({super.key});
  static String id = 'FlightTicketSelectMultiPointSeatView';
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    flightTicketCubit.bottomSheetType = 0;

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        if (state is FlightFaresSuccess) {
          // flightTicketCubit.checkIfGlobalFlyOrNot();
        }
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          child: Scaffold(
              appBar: AppBar(
                toolbarHeight: context.height * 0.06,
                automaticallyImplyLeading: false,
                title: AppBarWidget(
                  onPressedLeading: () {
                    flightTicketCubit.selectAirResultForMultiPointList = [];
                    flightTicketCubit.saveIndexFareForCombinedMultiPointValue =
                        null;
                    flightTicketCubit
                        .flightFaresMultiPointSelectedForSeparated = [];
                    flightTicketCubit.totalPriceMultiPoint = 0.0;
                    flightTicketCubit.totalPriceFareMultiPoint = 0.0;

                    Navigator.pushReplacementNamed(
                        context, FlightTicketSearchConclusionMultiPointView.id);
                  },
                  title: S.of(context).SelectFlightTicketPackage,
                  leading: Icons.arrow_back_ios,
                ),
                backgroundColor: AppColors.kAppBarColor,
              ),
              backgroundColor: Colors.grey.shade200,
              bottomSheet: flightTicketCubit.bottomSheetType == 53
                  ? const SeatDetailsForMultiPointBottomSheet()
                  : flightTicketCubit.bottomSheetType == 51
                      ? const FlightDetailsBottomSheetMultiPoint(
                          isSelectedCard: true,
                        )
                      : flightTicketCubit
                                      .saveIndexFareForCombinedMultiPointValue !=
                                  null ||
                              flightTicketCubit.listMultiPoint.length ==
                                  flightTicketCubit
                                      .flightFaresMultiPointSelectedForSeparated!
                                      .length
                          ? PriceAndContinueBottomSheet(
                              //fareKeyListForMultiPoint
                              onTap: () {
                                if (flightTicketCubit
                                        .isResultTypeForFareMultiPointCombined ==
                                    true) {
                                  flightTicketCubit.getValidate(
                                      ValidateRequestJson(
                                        request: ValidateRequest(
                                          air: AirValidateRequest(
                                              fareAlternativeLegKeys:
                                                  flightTicketCubit
                                                      .fareKeyListForMultiPoint),
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
                                } else {
                                  List<String> keysForAllList = [];

                                  for (var element in flightTicketCubit
                                      .flightFaresMultiPointSelectedForSeparated!) {
                                    keysForAllList.add(element.fares!.first
                                        .fareAlternativeLegs!.first.key!);
                                  }
                                  flightTicketCubit.getValidate(
                                      ValidateRequestJson(
                                        request: ValidateRequest(
                                          air: AirValidateRequest(
                                              fareAlternativeLegKeys:
                                                  keysForAllList),
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
                                }
                                Navigator.pushNamed(
                                  context,
                                  FlightTicketPassengerDataEnterView.id,
                                );
                              },
                            )
                          : null,
              body: state is FlightFaresLoading
                  ? Column(
                      children: [
                        SizedBox(
                          height: context.height * 0.2,
                        ),
                        const LoadingWidget(),
                      ],
                    )
                  : state is FlightFaresFailure
                      ? ErrorResultWidget(
                          errorCode: state.errorCode,
                          errorMassage: state.errorMassage,
                        )
                      : CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: flightTicketCubit
                                          .isResultTypeForFareMultiPointCombined ==
                                      true
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: context.height *
                                              0.093 *
                                              flightTicketCubit
                                                  .flightFaresMultiPointIfIsCombined!
                                                  .first
                                                  .fares!
                                                  .first
                                                  .fareAlternativeLegs!
                                                  .length,
                                          width: context.width * 1,
                                          child: ListView.builder(
                                            itemCount: flightTicketCubit
                                                .flightFaresMultiPointIfIsCombined!
                                                .first
                                                .fares!
                                                .first
                                                .fareAlternativeLegs!
                                                .length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8),
                                                child:
                                                    TitleForListCardMultiPointWidget(
                                                  weHaveSlider: false,
                                                  index: index,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 4),
                                          child: Column(
                                            children: flightTicketCubit
                                                        .saveIndexFareForCombinedMultiPointValue ==
                                                    null
                                                ? List.generate(
                                                    flightTicketCubit
                                                        .flightFaresMultiPointIfIsCombined!
                                                        .first
                                                        .fares!
                                                        .length,
                                                    (index) =>
                                                        FareMultiPointCardWidgetCombined(
                                                      index: index,
                                                      color: flightTicketCubit
                                                          .colors[index],
                                                    ),
                                                  )
                                                : List.generate(
                                                    1,
                                                    (index) =>
                                                        FareMultiPointCardWidgetCombined(
                                                      index: flightTicketCubit
                                                          .saveIndexFareForCombinedMultiPointValue!,
                                                      color: flightTicketCubit
                                                              .colors[
                                                          flightTicketCubit
                                                              .saveIndexFareForCombinedMultiPointValue!],
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        flightTicketCubit
                                                        .flightFaresMultiPointSelectedForSeparated ==
                                                    null ||
                                                flightTicketCubit
                                                    .flightFaresMultiPointSelectedForSeparated!
                                                    .isEmpty
                                            ? const SizedBox()
                                            : Column(
                                                children: List.generate(
                                                    flightTicketCubit
                                                        .flightFaresMultiPointSelectedForSeparated!
                                                        .length, (index) {
                                                  return FareMultiPointSelectedCardWidget(
                                                    index: index,
                                                    color: flightTicketCubit
                                                        .colors[flightTicketCubit
                                                            .selectedIndexes[
                                                        index]],
                                                  );
                                                }),
                                              ),
                                        //for  combined

                                        Column(
                                          children: List.generate(
                                            1,
                                            (index) {
                                              return Column(
                                                children: [
                                                  flightTicketCubit
                                                              .listMultiPoint
                                                              .length ==
                                                          flightTicketCubit
                                                              .flightFaresMultiPointSelectedForSeparated!
                                                              .length
                                                      ? const SizedBox()
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 8),
                                                          child:
                                                              TitleForListCardMultiPointWidget(
                                                            weHaveSlider: false,
                                                            index: flightTicketCubit
                                                                .currentFareListIndex,
                                                          ),
                                                        ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8),
                                                    child: flightTicketCubit
                                                                .listMultiPoint
                                                                .length ==
                                                            flightTicketCubit
                                                                .flightFaresMultiPointSelectedForSeparated!
                                                                .length
                                                        ? const SizedBox()
                                                        : Column(
                                                            children:
                                                                List.generate(
                                                              flightTicketCubit
                                                                  .flightFaresMultiPointIfIsSeparated![
                                                                      flightTicketCubit
                                                                          .currentFareListIndex]
                                                                  .length,
                                                              (innerIndex) {
                                                                return Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          bottom:
                                                                              8),
                                                                  child:
                                                                      FareMultiPointCardWidget(
                                                                    index: flightTicketCubit
                                                                        .currentFareListIndex,
                                                                    subIndex:
                                                                        innerIndex,
                                                                    isSelected: flightTicketCubit
                                                                            .selectListFareIndexForMultiPointValue[
                                                                        flightTicketCubit
                                                                            .currentFareListIndex][innerIndex],
                                                                    color: flightTicketCubit
                                                                            .colors[
                                                                        innerIndex],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
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



















/*
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/new_fare_card.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/new_fare_card_leaving.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/title_for_list_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightTicketSelectMultiPointSeatView extends StatelessWidget {
  const FlightTicketSelectMultiPointSeatView({super.key});
  static String id = 'FlightTicketSelectMultiPointSeatView';
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        if (state is FlightFaresSuccess) {
          flightTicketCubit.checkIfGlobalFlyOrNot();
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: context.height * 0.06,
              automaticallyImplyLeading: false,
              title: AppBarWidget(
                onPressedLeading: () {},
                title: S.of(context).SelectFlightTicket,
                leading: Icons.arrow_back_ios,
              ),
              backgroundColor: Colors.black,
            ),
            backgroundColor: Colors.grey.shade200,
            body: CustomScrollView(
              slivers: [
                // إضافة العنوان الأول وزر التفاصيل
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const TitleForListCardWidget(
                        isShow: false,
                        itIsReturnOrOneWay: 0,
                      ),
                      GestureDetector(
                        onTap: () {
                          flightTicketCubit.bottomSheetValue(type: 5);
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
                  ),
                ),

                // بناء القوائم الديناميكية لـ flightFaresLeaving
                ...flightTicketCubit.flightFaresLeaving!.map((fareData) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (flightTicketCubit.selectedSeatTypeLeaving != null &&
                            flightTicketCubit.selectedSeatTypeLeaving !=
                                index) {
                          return Container();
                        }
                        return NewFareCardLeaving(
                          index: index,
                          color: flightTicketCubit.colors[index],
                        );
                      },
                      childCount: fareData.fares!.length,
                    ),
                  );
                }).toList(),

                // إضافة العنوان الثاني وزر التفاصيل
                if (flightTicketCubit.searchTypeValue != 'tek' &&
                    flightTicketCubit.selectedSeatTypeLeaving != null)
                  if (flightTicketCubit.isVisibilitySeatType == true)
                    if (flightTicketCubit.returnGroupId != null)
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            const TitleForListCardWidget(
                              isShow: false,
                              itIsReturnOrOneWay: 1,
                            ),
                            GestureDetector(
                              onTap: () {
                                flightTicketCubit.bottomSheetValue(type: 22);
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
                            SizedBox(
                              height:
                                  flightTicketCubit.isVisibilitySeatType == true
                                      ? 12
                                      : 0,
                            ),
                          ],
                        ),
                      ),

                // بناء القوائم الديناميكية لـ flightFaresReturn
                if (flightTicketCubit.searchTypeValue != 'tek' &&
                    flightTicketCubit.selectedSeatTypeLeaving != null &&
                    flightTicketCubit.returnGroupId != null)
                  ...flightTicketCubit.flightFaresReturn!.map((fareData) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (flightTicketCubit.selectedSeatTypeReturn !=
                                  null &&
                              flightTicketCubit.selectedSeatTypeReturn !=
                                  index) {
                            return Container();
                          }
                          return NewFareCard(
                            index: index,
                            color: flightTicketCubit.colors[index],
                          );
                        },
                        childCount: fareData.fares!.length,
                      ),
                    );
                  }).toList(),
              ],
            ));
      },
    );
  }
}


*/
