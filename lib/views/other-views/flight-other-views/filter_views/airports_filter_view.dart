import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/check_box_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AirPortFilterView extends StatelessWidget {
  const AirPortFilterView({super.key});

  static String id = 'AirPortFilterView';

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    dynamic howComeAirportsLeavingOrReturn;
    if (flightTicketCubit.searchTypeForListInFilter == 'tek') {
      howComeAirportsLeavingOrReturn = flightTicketCubit.airportListLeaving;
    } else if (flightTicketCubit.searchTypeForListInFilter == 'cok') {
      print('444444');
      howComeAirportsLeavingOrReturn = flightTicketCubit.airportListMultiPoint;
    } else {
      howComeAirportsLeavingOrReturn = flightTicketCubit.airportListReturn;
    }
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.grey.shade100,
            appBar: AppBar(
              toolbarHeight: context.height * 0.06,
              automaticallyImplyLeading: false,
              title: AppBarWidget(
                onPressedLeading: () {
                  Navigator.pop(context);
                },
                title: S.of(context).AirportFilter,
                leading: Icons.arrow_back_ios,
              ),
              backgroundColor: AppColors.kAppBarColor,
            ),
            bottomSheet: BottomSheetWidget(
              paddingTop: 8,
              height: 0.1,
              widgetBody: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      title: S.of(context).Clear,
                      height: 0.06,
                      width: 0.4,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textColor: Colors.white,
                      color: AppColors.kSecondColor,
                      onTap: () {
                        Navigator.pop(context);
                        flightTicketCubit.clearAll(type: 'port');
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ButtonWidget(
                      title: S.of(context).Apply,
                      height: 0.06,
                      width: 0.4,
                      fontSize: 16,
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kSecondColor,
                      onTap: () {
                        Navigator.pop(context);
                        if (flightTicketCubit.searchTypeForListInFilter ==
                            'cok') {
                          flightTicketCubit.filterAirportsMultiPoint();
                        } else {
                          flightTicketCubit.filterAirports();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                  left: 12, right: 12, top: 8, bottom: context.height * 0.1),
              child: ListView.builder(
                itemCount: howComeAirportsLeavingOrReturn.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      final portCode =
                          howComeAirportsLeavingOrReturn[index]['code']!;
                      final currentValue = flightTicketCubit
                                  .searchTypeForListInFilter ==
                              'tek'
                          ? flightTicketCubit.isSelectedAirportLeaving(portCode)
                          : flightTicketCubit.searchTypeForListInFilter == 'cok'
                              ? flightTicketCubit
                                  .isSelectedAirportMultiPoint(portCode)
                              : flightTicketCubit
                                  .isSelectedAirportReturn(portCode);
                      flightTicketCubit.checkboxAirportNameAndLogo(
                        portCode: portCode,
                        value: !currentValue,
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          CheckBoxWidget(
                            value: flightTicketCubit
                                        .searchTypeForListInFilter ==
                                    'tek'
                                ? flightTicketCubit.isSelectedAirportLeaving(
                                    howComeAirportsLeavingOrReturn[index]
                                        ['code']!,
                                  )
                                : flightTicketCubit.searchTypeForListInFilter ==
                                        'cok'
                                    ? flightTicketCubit
                                        .isSelectedAirportMultiPoint(
                                        howComeAirportsLeavingOrReturn[index]
                                            ['code']!,
                                      )
                                    : flightTicketCubit.isSelectedAirportReturn(
                                        howComeAirportsLeavingOrReturn[index]
                                            ['code']!,
                                      ),
                            onChanged: (value) {
                              flightTicketCubit.searchTypeForListInFilter ==
                                      'cok'
                                  ? flightTicketCubit
                                      .checkboxAirportNameAndLogoMultiPoint(
                                      portCode:
                                          howComeAirportsLeavingOrReturn[index]
                                              ['code']!,
                                      value: value!,
                                    )
                                  : flightTicketCubit
                                      .checkboxAirportNameAndLogo(
                                      portCode:
                                          howComeAirportsLeavingOrReturn[index]
                                              ['code']!,
                                      value: value!,
                                    );
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextWidget(
                            text: howComeAirportsLeavingOrReturn[index]
                                ['name']!,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          TextWidget(
                            text:
                                '(${howComeAirportsLeavingOrReturn[index]['code']!})',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kSecondColor,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ));
      },
    );
  }
}
