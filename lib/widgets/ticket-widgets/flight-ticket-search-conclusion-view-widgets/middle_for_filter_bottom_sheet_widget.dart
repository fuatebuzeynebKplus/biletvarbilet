import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/views/other-views/flight-other-views/filter_views/airline_filter_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/filter_views/airports_filter_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/filter_views/cabin_filter_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/filter_views/flight_providers_filter_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/filter_views/luggage_filter_view.dart';
import 'package:bamobile1/widgets/text_spacer_widget_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MiddleForFilterBottomSheetWidget extends StatelessWidget {
  const MiddleForFilterBottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return Column(
          children: [
            // BlocProvider.of<FlightTicketCubit>(context).searchTypeValue == 'tek'
            //     ? const SizedBox()
            //     : Divider(
            //         thickness: 1,
            //         color: Colors.grey.withOpacity(0.5),
            //       ),
            GestureDetector(
              onTap: () {
                if (flightTicketCubit.searchTypeValue != 'cok') {
                  flightTicketCubit.saveOriginalList();
                  flightTicketCubit.getFlightProviderNameAndLogo();
                } else {
                  flightTicketCubit.searchLeavingOrReturnListFunction(
                      searchType: 'cok');
                  print('99999999999999999999999999999999999');
                  flightTicketCubit.getFlightProviderNameAndLogoMultiPoint();
                }

                Navigator.pushNamed(context, FlightProvidersFilterView.id);
              },
              child: Container(
                color: Colors.white,
                child: TextSpacerWidgetWidget(
                  title: S.of(context).Providers,
                  widget: Icon(
                    Icons.arrow_right,
                    color: AppColors.kSecondColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            GestureDetector(
              onTap: () {
                if (flightTicketCubit.searchTypeValue != 'cok') {
                  flightTicketCubit.saveOriginalList();
                  flightTicketCubit.getAirlineNameAndLogo();
                } else {
                  flightTicketCubit.searchLeavingOrReturnListFunction(
                      searchType: 'cok');
                  print('99999999999999999999999999999999999');
                  flightTicketCubit.getAirlineNameAndLogoMultiPoint();
                }
                Navigator.pushNamed(context, AirLineFilterView.id);
              },
              child: Container(
                color: Colors.white,
                child: TextSpacerWidgetWidget(
                  title: S.of(context).Airlines,
                  widget: Icon(
                    Icons.arrow_right,
                    color: AppColors.kSecondColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            GestureDetector(
              onTap: () {
                if (flightTicketCubit.searchTypeValue != 'cok') {
                  flightTicketCubit.saveOriginalList();
                  flightTicketCubit.getLuggagesTypes();
                } else {
                  flightTicketCubit.searchLeavingOrReturnListFunction(
                      searchType: 'cok');
                  print('99999999999999999999999999999999999');
                  flightTicketCubit.getLuggagesTypesMultipoint();
                }

                Navigator.pushNamed(context, LuggageFilterView.id);
              },
              child: Container(
                color: Colors.white,
                child: TextSpacerWidgetWidget(
                  title: S.of(context).Luggages,
                  widget: Icon(
                    Icons.arrow_right,
                    color: AppColors.kSecondColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            // Divider(
            //   thickness: 1,
            //   color: Colors.grey.withOpacity(0.5),
            // ),
            // TextSpacerWidgetWidget(
            //   title: S.of(context).Pauses,
            //   widget: Icon(
            //     Icons.arrow_right,
            //     color: AppColors.kSecondColor,
            //     size: 30,
            //   ),
            // ),Navigator.pushNamed(context, LuggageFilterView.id);
            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            GestureDetector(
              onTap: () {
                if (flightTicketCubit.searchTypeValue != 'cok') {
                  flightTicketCubit.saveOriginalList();
                  flightTicketCubit.getAirportNameAndLogo();
                } else {
                  flightTicketCubit.searchLeavingOrReturnListFunction(
                      searchType: 'cok');
                  print('99999999999999999999999999999999999');
                  flightTicketCubit.getAirportNameAndLogoMultiPoint();
                }

                Navigator.pushNamed(context, AirPortFilterView.id);
              },
              child: Container(
                color: Colors.white,
                child: TextSpacerWidgetWidget(
                  title: S.of(context).Airports,
                  widget: Icon(
                    Icons.arrow_right,
                    color: AppColors.kSecondColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            GestureDetector(
              onTap: () {
                if (flightTicketCubit.searchTypeValue != 'cok') {
                  flightTicketCubit.saveOriginalList();
                  flightTicketCubit.getCabinType();
                } else {
                  flightTicketCubit.searchLeavingOrReturnListFunction(
                      searchType: 'cok');
                  print('99999999999999999999999999999999999');
                  flightTicketCubit.getCabinTypeMultiPoint();
                }

                Navigator.pushNamed(context, CabinTypeFilterView.id);
              },
              child: Container(
                color: Colors.white,
                child: TextSpacerWidgetWidget(
                  title: S.of(context).Cabins,
                  widget: Icon(
                    Icons.arrow_right,
                    color: AppColors.kSecondColor,
                    size: 30,
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
          ],
        );
      },
    );
  }
}
