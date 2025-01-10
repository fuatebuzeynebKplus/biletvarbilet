import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_branded_fare_request.dart';
import 'package:bamobile1/flight/data/models/air_result.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_select_seat_view.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/price_and_continue_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/bottom-sheet_widgets/seat_details_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControllerForPriceAndContinueBottomSheetWidget extends StatelessWidget {
  const ControllerForPriceAndContinueBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    String? keyOneForAllValue;
    String? keyTwoForAllValue;
    if (flightTicketCubit.searchTypeValue != 'tek') {
      if (flightTicketCubit.returnGroupId![0] == 's') {
        keyOneForAllValue = flightTicketCubit
            .afterRefreshFlightSearchResultsLeaving[
                flightTicketCubit.sendIndexValue!]
            .fares![0]
            .fareAlternativeLegs!
            .first
            .key;
        keyTwoForAllValue = flightTicketCubit
            .afterRefreshFlightSearchResultsReturn[
                flightTicketCubit.sendIndexValueReturn!]
            .fares![0]
            .fareAlternativeLegs!
            .last
            .key;
      } else if (flightTicketCubit.returnGroupId!.length >= 6) {
        keyOneForAllValue = flightTicketCubit
            .afterRefreshFlightSearchResultsLeaving[
                flightTicketCubit.sendIndexValue!]
            .fares![0]
            .fareAlternativeLegs!
            .first
            .key;
        keyTwoForAllValue = flightTicketCubit
            .afterRefreshFlightSearchResultsReturn[
                flightTicketCubit.sendIndexValueReturn!]
            .fares![0]
            .fareAlternativeLegs!
            .last
            .key;
      } else {
        keyOneForAllValue = flightTicketCubit
            .afterRefreshFlightSearchResultsReturn[
                flightTicketCubit.sendIndexValueReturn!]
            .fares![0]
            .fareAlternativeLegs!
            .first
            .key;
        for (var fare in flightTicketCubit
            .afterRefreshFlightSearchResultsReturn[
                flightTicketCubit.sendIndexValueReturn!]
            .fares![0]
            .fareAlternativeLegs!) {
          // قارن AlternativeRef مع saveAlternativeRefforReturn من داخل flightTicketCubit
          if (fare.alternativeRef ==
              flightTicketCubit.saveAlternativeRefforReturn) {
            // إذا كان متساويًا، احصل على الـ key الخاص به
            keyTwoForAllValue = fare.key;
            break; // أخرج من الحلقة عند العثور على التطابق
          }
        }
      }
    } else {
      keyOneForAllValue = flightTicketCubit
          .afterRefreshFlightSearchResultsLeaving[
              flightTicketCubit.sendIndexValue!]
          .fares![0]
          .fareAlternativeLegs!
          .first
          .key;
    }
    List<String> keysForAllList = [];

    keysForAllList.addAll([
      if (keyOneForAllValue != null) keyOneForAllValue,
      if (keyTwoForAllValue != null) keyTwoForAllValue,
    ]);

    // var departureAirportName = flightTicketCubit
    //       .flightSearchResults![flightTicketCubit.sendIndexValue!]
    //       .legs![0]
    //       .alternativeLegs![0]
    //       .segments!;
    //          List<dynamic> departureAirportNameList = [];

    //   for (var segment in departureAirportName) {
    //     departureAirportNameList.add(segment.departureAirport!.name!);
    //   }
    return BlocBuilder<FlightTicketCubit, FlightTicketState>(
      builder: (context, state) {
        return flightTicketCubit.selectedCardLeaving != null &&
                flightTicketCubit.selectedCardReturn == null
            ? flightTicketCubit.bottomSheetType == 4
                ? const SeatDetailsBottomSheet()
                : PriceAndContinueBottomSheet(
                    onTap: () {
                      flightTicketCubit.totalPrice = 0.0;
                      flightTicketCubit.paxTypeListCountFunction();

                      print(
                          'hhhhhhhhhon1111111111111111111111111111111111111111111111111111111111111   ');

                      //flightTicketCubit.keysForAllFunction();

                      flightTicketCubit.getBrandedFares(
                          AirBrandedFareRequestJson(
                            request: AirBrandedFareRequest(
                              fareAlternativeLegKeys:
                                  flightTicketCubit.searchTypeValue == 'tek'
                                      ? ['${flightTicketCubit.keyForLeaving}']
                                      : keysForAllList,
                              token: Token(
                                channelCode: "kplusmobile",
                                tokenCode: getIt<CacheHelper>()
                                        .getDataString(key: 'token') ??
                                    "",
                              ),
                            ),
                          ),
                          context);
                      Navigator.pushNamed(
                          context, FlightTicketSelectSeatView.id);
                    },
                  )
            : flightTicketCubit.selectedCardReturn == null ||
                    flightTicketCubit.selectedCardLeaving == null
                ? const SizedBox()
                : flightTicketCubit.bottomSheetType == 4
                    ? const SeatDetailsBottomSheet()
                    : PriceAndContinueBottomSheet(
                        onTap: () {
                          flightTicketCubit.totalPrice = 0.0;
                          flightTicketCubit.paxTypeListCountFunction();
                          //      flightTicketCubit.keysForAllFunction();
                          flightTicketCubit.getBrandedFares(
                              AirBrandedFareRequestJson(
                                request: AirBrandedFareRequest(
                                  fareAlternativeLegKeys: keysForAllList,
                                  token: Token(
                                    channelCode: "kplusmobile",
                                    tokenCode: getIt<CacheHelper>()
                                            .getDataString(key: 'token') ??
                                        "",
                                  ),
                                ),
                              ),
                              context);
                          Navigator.pushNamed(
                              context, FlightTicketSelectSeatView.id);
                        },
                      );
      },
    );
  }
}



/*

    if (flightTicketCubit.searchTypeValue != 'tek') {
      if (flightTicketCubit.leavingGroupId == 'Fsp') {
        if (flightTicketCubit.returnGroupId == null) {
          keyOneForAllValue = flightTicketCubit
              .afterRefreshFlightSearchResultsReturn[
                  flightTicketCubit.sendIndexValueReturn!]
              .fares![0]
              .fareAlternativeLegs!
              .first
              .key;
          keyTwoForAllValue = flightTicketCubit
              .afterRefreshFlightSearchResultsReturn[
                  flightTicketCubit.sendIndexValueReturn!]
              .fares![0]
              .fareAlternativeLegs!
              .last
              .key;
        } else if (flightTicketCubit.returnGroupId![0] == 's') {
          keyOneForAllValue = flightTicketCubit
              .afterRefreshFlightSearchResultsLeaving[
                  flightTicketCubit.sendIndexValue!]
              .fares![0]
              .fareAlternativeLegs!
              .first
              .key;
          keyTwoForAllValue = flightTicketCubit
              .afterRefreshFlightSearchResultsReturn[
                  flightTicketCubit.sendIndexValueReturn!]
              .fares![0]
              .fareAlternativeLegs!
              .last
              .key;
        }
      } else if (flightTicketCubit.leavingGroupId![0] == 'p') {
        keyTwoForAllValue = flightTicketCubit
            .afterRefreshFlightSearchResultsLeaving[
                flightTicketCubit.sendIndexValue!]
            .fares![0]
            .fareAlternativeLegs!
            .last
            .key;
        keyOneForAllValue = flightTicketCubit
            .afterRefreshFlightSearchResultsLeaving[
                flightTicketCubit.sendIndexValue!]
            .fares![0]
            .fareAlternativeLegs!
            .first
            .key;
      } else {
        keyOneForAllValue = flightTicketCubit
            .afterRefreshFlightSearchResultsLeaving[
                flightTicketCubit.sendIndexValue!]
            .fares![0]
            .fareAlternativeLegs!
            .first
            .key;
        keyTwoForAllValue = flightTicketCubit
            .afterRefreshFlightSearchResultsReturn[
                flightTicketCubit.sendIndexValueReturn!]
            .fares![0]
            .fareAlternativeLegs!
            .last
            .key;
      }
    } else {
      keyOneForAllValue = flightTicketCubit
          .afterRefreshFlightSearchResultsLeaving[
              flightTicketCubit.sendIndexValue!]
          .fares![0]
          .fareAlternativeLegs!
          .first
          .key;
    }

*/