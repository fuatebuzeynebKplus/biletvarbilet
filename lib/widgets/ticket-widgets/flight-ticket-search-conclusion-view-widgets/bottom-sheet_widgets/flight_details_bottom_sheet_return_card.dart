import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_fare_service.dart';
import 'package:bamobile1/flight/data/models/air_result.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/bottom_sheet_for_flight_details_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/container_inside_icon_and_text_for_details_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/details_mid_design_for_flight_details_bottom_sheet_leaving_card_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/details_mid_design_for_flight_details_bottom_sheet_return_card_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/icon_and_tow_text_for_details_bottom_sheet_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../helper/shared-preferences/cache_hekper.dart';

class FlightDetailsBottomSheetReturnCard extends StatelessWidget {
  const FlightDetailsBottomSheetReturnCard({
    super.key,
    this.itIsSearchConclusionView = false,
  });

  final bool itIsSearchConclusionView;

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    List<AirResult>? results =
        flightTicketCubit.afterRefreshFlightSearchResultsReturn;

    List<AirFareService>? listdata =
        results[flightTicketCubit.sendIndexValueReturn!]
            .fares![0]
            .fareAlternativeLegs![0]
            .fareServices;
    // String dayName = DateFormat('EEEE').format(
    //     flightTicketCubit.dateTime ?? flightTicketCubit.dateTimeRange!.end);
    // String date = DateFormat('dd MMM yyy').format(
    //     flightTicketCubit.dateTime ?? flightTicketCubit.dateTimeRange!.end);
    String arriveTime = results[flightTicketCubit.sendIndexValueReturn!]
        .legs![0]
        .alternativeLegs![0]
        .segments!
        .last
        .arrivalDate!;
    String departureTime = results[flightTicketCubit.sendIndexValueReturn!]
        .legs![0]
        .alternativeLegs![0]
        .segments!
        .first
        .departureDate!;

    String arriveDate = results[flightTicketCubit.sendIndexValueReturn!]
        .legs![0]
        .alternativeLegs![0]
        .segments!
        .last
        .arrivalDate!;
    String departureDate = results[flightTicketCubit.sendIndexValueReturn!]
        .legs![0]
        .alternativeLegs![0]
        .segments!
        .first
        .departureDate!;
    DateTime dateDepartureDate = DateTime.parse(departureDate);
    String formattedDepartureDate =
        DateFormat('MMM-dd-yyy').format(dateDepartureDate);
    String formattedDepartureDay = DateFormat('EEEE').format(dateDepartureDate);
    DateTime dateArriveDate = DateTime.parse(arriveDate);

    String formattedArriveDate =
        DateFormat('MMM-dd-yyy').format(dateArriveDate);
    String formattedArriveDay = DateFormat('EEEE').format(dateArriveDate);
    DateTime dateDepartureTime = DateTime.parse(departureTime);

    DateTime dateArriveTime = DateTime.parse(arriveTime);

    var timeData = results[flightTicketCubit.sendIndexValueReturn!]
        .legs![0]
        .alternativeLegs![0]
        .segments!;

    List<dynamic> waitTime = [];
    for (var segment in timeData) {
      waitTime.add(segment.waitingDuration!);
    }

    String formatDuration(int totalMinutes) {
      int hours = totalMinutes ~/ 60;
      int remainingMinutes = totalMinutes % 60;
      return '$hours ${S.of(context).Hour} $remainingMinutes ${S.of(context).Minimum}';
    }

    List<int> flightDuration = [];
    List<int> waitingDuration = [];

    for (var segment in timeData) {
      flightDuration.add(segment.flightDuration!);
      waitingDuration.add(segment.waitingDuration!);
    }

    int totalDuration = flightDuration.fold(0, (sum, item) => sum + item) +
        waitingDuration.fold(0, (sum, item) => sum + item);

    // ///---------------------------
    var departureAirportName = results[flightTicketCubit.sendIndexValueReturn!]
        .legs![0]
        .alternativeLegs![0]
        .segments!;

    List<dynamic> departureAirportNameList = [];

    for (var segment in departureAirportName) {
      departureAirportNameList.add(segment.departureAirport!.name!);
    }

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BottomSheetForFlightDetailsWidget(
          paddingLeftRight: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: S.of(context).FlightDetails,
                  color: AppColors.kSecondColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                GestureDetector(
                  child: const Icon(Icons.close),
                  onTap: () {
                    flightTicketCubit.bottomSheetValue(type: 0);

                    if (flightTicketCubit.selectedCardLeaving != null &&
                        flightTicketCubit.searchTypeValue == 'tek') {
                      flightTicketCubit.bottomSheetValue(type: 7);
                    } else if (flightTicketCubit.selectedCardReturn != null &&
                        flightTicketCubit.searchTypeValue != 'tek') {
                      flightTicketCubit.bottomSheetValue(type: 7);
                    }
                  },
                )
              ],
            ),
          ),
          widgetBody: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey.shade300,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text: flightTicketCubit.secondSearchCity ??
                                    'kdjs',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              const Icon(Icons.trending_flat),
                              TextWidget(
                                text:
                                    flightTicketCubit.firstSearchCity ?? 'kdjs',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: '', //$dayName, $date |'
                                fontSize: 14,
                                color: Colors.grey.shade500,
                              ),
                              TextWidget(
                                text:
                                    ' ${results[flightTicketCubit.sendIndexValueReturn!].legs![0].alternativeLegs![0].segments!.length - 1} ${S.of(context).Stop}',
                                fontSize: 14,
                                color: Colors.grey.shade500,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.update,
                            size: 17,
                            color: Colors.grey.shade500,
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          TextWidget(
                            text: getIt<CacheHelper>()
                                        .getDataString(key: 'Lang') ==
                                    'ar'
                                ? '${totalDuration ~/ 60} ${S.of(context).Hour} ${totalDuration % 60} ${S.of(context).Minimum}'
                                : '${totalDuration ~/ 60} ${S.of(context).Minimum} ${totalDuration % 60} ${S.of(context).Hour}', //${duration.inHours} s ${duration.inMinutes.remainder(60)} d
                            color: Colors.grey.shade700,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    listdata == null || listdata == [] || listdata.isEmpty
                        ? const SizedBox()
                        : SizedBox(
                            height: listdata.length >= 3
                                ? context.height * 0.099
                                : context.height * listdata.length * 0.033,
                            width: context.width * 0.9,
                            child: ListView.builder(
                                itemCount: listdata.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child:
                                        ContainerInsideIconAndTextForFlightDetailsBottomSheetWidget(
                                      title: listdata[index].title!.length > 45
                                          ? '${listdata[index].title?.substring(0, 45)}...'
                                          : listdata[index].title,
                                    ),
                                  );
                                }),
                          )
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
              Row(
                children: [
                  SizedBox(
                    width: context.width * 0.05,
                  ),
                  IconAndTwoTextForFlightDetailsBottomSheetWidget(
                    day: formattedDepartureDay,
                    date: formattedDepartureDate,
                    image: AppImages.calendarIcon,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: listdata == null || listdata == [] || listdata.isEmpty
                    ? context.height * 0.6
                    : context.height * 0.5,
                width: context.width * 1,
                child: ListView.builder(
                    itemCount: results[flightTicketCubit.sendIndexValueReturn!]
                        .legs![0]
                        .alternativeLegs![0]
                        .segments!
                        .length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            DetailsMidDesignForFlightDetailsBottomSheetReturnCardWidget(
                                  index: index,
                                ) ??
                                const Text('data'),
                            index ==
                                    results[flightTicketCubit
                                                .sendIndexValueReturn!]
                                            .legs![0]
                                            .alternativeLegs![0]
                                            .segments!
                                            .length -
                                        1
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      height: context.height * 0.05,
                                      width: context.width * 1,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Colors.grey.shade500),
                                        color: Colors.grey.shade100,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.update,
                                            size: 20,
                                            color: Colors.grey.shade500,
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          TextWidget(
                                            text: getIt<CacheHelper>()
                                                        .getDataString(
                                                            key: 'Lang') ==
                                                    'ar'
                                                ? '${waitingDuration[index] ~/ 60} ${S.of(context).Hour} ${waitingDuration[index] % 60} ${S.of(context).Minimum}'
                                                : '${waitingDuration[index] ~/ 60} ${S.of(context).Minimum} ${waitingDuration[index] % 60} ${S.of(context).Hour}',
                                            color: Colors.grey.shade700,
                                          ),
                                          TextWidget(
                                            text:
                                                ' ${departureAirportNameList[index + 1]}',
                                            color: Colors.grey.shade700,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                            results[flightTicketCubit.sendIndexValueReturn!]
                                        .legs![0]
                                        .alternativeLegs![0]
                                        .segments!
                                        .length !=
                                    1
                                ? const SizedBox(
                                    height: 10,
                                  )
                                : IconAndTwoTextForFlightDetailsBottomSheetWidget(
                                    day: formattedArriveDay,
                                    date: formattedArriveDate,
                                    image: AppImages.calendarIcon,
                                  ),
                          ],
                        ),
                      );
                    }),
              ),

              results[flightTicketCubit.sendIndexValueReturn!]
                          .legs![0]
                          .alternativeLegs![0]
                          .segments!
                          .length ==
                      1
                  ? const SizedBox()
                  : const SizedBox(
                      height: 12,
                    ),

              results[flightTicketCubit.sendIndexValueReturn!]
                          .legs![0]
                          .alternativeLegs![0]
                          .segments!
                          .length ==
                      1
                  ? const SizedBox()
                  : Row(
                      children: [
                        SizedBox(
                          width: context.width * 0.05,
                        ),
                        IconAndTwoTextForFlightDetailsBottomSheetWidget(
                          day: formattedArriveDay,
                          date: formattedArriveDate,
                          image: AppImages.calendarIcon,
                        ),
                      ],
                    ),
              itIsSearchConclusionView == false
                  ? const SizedBox()
                  : const SizedBox(
                      height: 12,
                    ),
              // itIsSearchConclusionView == false
              //     ? const SizedBox()
              //     : ButtonWidget(
              //         color: AppColors.kSecondColor,
              //         title: S.of(context).SelectFlight,
              //         height: 0.05,
              //         width: 0.8,
              //         fontSize: 16,
              //         textColor: Colors.white,
              //         onTap: () {
              //           flightTicketCubit.bottomSheetValue(type: 0);
              //           flightTicketCubit.selectedCardReturnFunction(
              //               value: flightTicketCubit.sendIndexValueReturn);
              //           flightTicketCubit.bottomSheetType = 7;

              //           print('ttt=${flightTicketCubit.selectedCardReturn}');

              //           if (flightTicketCubit.bottomSheetType == 5) {
              //             flightTicketCubit.bottomSheetType = 0;
              //           } else if (flightTicketCubit.selectedCardReturn ==
              //               null) {
              //             ///
              //             flightTicketCubit.bottomSheetType = 0;
              //           }
              //         },
              //       ),
            ],
          ),
        );
      },
    );
  }
}
