import 'package:bamobile1/bottom_nav_bar.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_search_leg.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/models/multi_point_model.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/bottom-sheet/ticket_corporate_code_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/bottom-sheet/ticket_markup_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/bottom-sheet/ticket_preferred_airline_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/bottom-sheet/ticket_search_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/bottom-sheet/ticket_adult_child_baby_quantity_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/ticket_body_widget.dart';
import 'package:bamobile1/utils/app_sizes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightTicketView extends StatelessWidget {
  const FlightTicketView({super.key});

  static String id = 'FlightTicketView';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return PopScope(
          // onPopInvoked: (didPop) {
          //   flightTicketCubit.bottomSheetType = 0;
          //   flightTicketCubit.dateTime = null;
          //   flightTicketCubit.dateTimeRange = null;
          // },
          canPop: false,
          child: Scaffold(
              backgroundColor: Colors.grey.shade200,
              appBar: AppBar(
                surfaceTintColor: Colors.white,
                toolbarHeight: context.height * 0.06,
                automaticallyImplyLeading: false,
                title: AppBarWidget(
                  title: S.of(context).SearchFlight,
                  onPressedLeading: () {
                    flightTicketCubit.dateTime = DateTime.now();
                    flightTicketCubit.dateTimeRange = DateTimeRange(
                        start: DateTime.now(),
                        end: DateTime.now().add(const Duration(days: 7)));
                    // flightTicketCubit.selectDateTimeRange = DateTimeRange(
                    //     start: DateTime.now(),
                    //     end: DateTime.now().add(const Duration(days: 1)));

                    flightTicketCubit.firstCityCode =
                        flightTicketCubit.fromAirportCode;
                    flightTicketCubit.secondCityCode =
                        flightTicketCubit.toAirportCode;
                    flightTicketCubit.firstSearchCity =
                        flightTicketCubit.fromCityCode;
                    flightTicketCubit.secondSearchCity =
                        flightTicketCubit.toCityCode;
                    if (flightTicketCubit.bottomSheetType != 0) {
                      flightTicketCubit.bottomSheetValue(type: 0);
                    } else if (flightTicketCubit.bottomSheetType == 0) {
                      Navigator.pushReplacementNamed(context, BottomNavBar.id);
                    }
                  },
                  leading: Icons.arrow_back_ios,
                ),
                backgroundColor: AppColors.kAppBarColor,
              ),
              body: const TicketBodyWidget(),
              bottomSheet: flightTicketCubit.bottomSheetType == 1
                  ? const TicketSearchBottomSheet()
                  : flightTicketCubit.bottomSheetType == 2
                      ? const TicketAdultChildBabyQuantityBottomSheet()
                      : flightTicketCubit.bottomSheetType == 3
                          ? const TicketMarkupBottomSheet()
                          : flightTicketCubit.bottomSheetType == 10
                              ? const TicketCorporateCodeBottomSheet()
                              : flightTicketCubit.bottomSheetType == 11
                                  ? const TicketPreferredAirLineBottomSheet()
                                  : flightTicketCubit.bottomSheetType == 0
                                      ? null
                                      : null),
        );
      },
    );
  }
}
