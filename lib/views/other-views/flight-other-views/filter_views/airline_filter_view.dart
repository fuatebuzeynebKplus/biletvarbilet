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

class AirLineFilterView extends StatelessWidget {
  const AirLineFilterView({super.key});

  static String id = 'AirLineFilterView';

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    print(flightTicketCubit.searchTypeValue);
    dynamic howComeAirlineLeavingOrReturn;
    if (flightTicketCubit.searchTypeForListInFilter == 'tek') {
      print('888888888888');
      howComeAirlineLeavingOrReturn = flightTicketCubit.airlineListLeaving;
    } else if (flightTicketCubit.searchTypeForListInFilter == 'cok') {
      print('444444');
      howComeAirlineLeavingOrReturn = flightTicketCubit.airlineListMultiPoint;
    } else {
      print('66666666');
      howComeAirlineLeavingOrReturn = flightTicketCubit.airlineListReturn;
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
                title: S.of(context).AirlineFilter,
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
                        flightTicketCubit.clearAll(type: 'airline');
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
                          flightTicketCubit.filterAirlinesMultiPoint();
                        } else {
                          flightTicketCubit.filterAirlines();
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
                itemCount: howComeAirlineLeavingOrReturn.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      final lineName =
                          howComeAirlineLeavingOrReturn[index]['name']!;
                      final currentValue = flightTicketCubit
                                  .searchTypeForListInFilter ==
                              'tek'
                          ? flightTicketCubit.isSelectedAirlineLeaving(lineName)
                          : flightTicketCubit.searchTypeForListInFilter == 'cok'
                              ? flightTicketCubit
                                  .isSelectedAirlineMultiPoint(lineName)
                              : flightTicketCubit
                                  .isSelectedAirlineReturn(lineName);
                      flightTicketCubit.searchTypeForListInFilter != 'cok'
                          ? flightTicketCubit.checkboxAirlineNameAndLogo(
                              lineName: lineName, value: !currentValue)
                          : flightTicketCubit
                              .checkboxAirlineNameAndLogoMultiPoint(
                                  lineName: lineName, value: !currentValue);
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          CheckBoxWidget(
                            value: flightTicketCubit
                                        .searchTypeForListInFilter ==
                                    'tek'
                                ? flightTicketCubit.isSelectedAirlineLeaving(
                                    howComeAirlineLeavingOrReturn[index]
                                        ['name']!,
                                  )
                                : flightTicketCubit.searchTypeForListInFilter ==
                                        'cok'
                                    ? flightTicketCubit
                                        .isSelectedAirlineMultiPoint(
                                        howComeAirlineLeavingOrReturn[index]
                                            ['name']!,
                                      )
                                    : flightTicketCubit.isSelectedAirlineReturn(
                                        howComeAirlineLeavingOrReturn[index]
                                            ['name']!,
                                      ),
                            onChanged: (value) {
                              flightTicketCubit.searchTypeForListInFilter !=
                                      'cok'
                                  ? flightTicketCubit
                                      .checkboxAirlineNameAndLogo(
                                      lineName:
                                          howComeAirlineLeavingOrReturn[index]
                                              ['name']!,
                                      value: value!,
                                    )
                                  : flightTicketCubit
                                      .checkboxAirlineNameAndLogoMultiPoint(
                                      lineName:
                                          howComeAirlineLeavingOrReturn[index]
                                              ['name']!,
                                      value: value!,
                                    );
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.network(
                            howComeAirlineLeavingOrReturn[index]['logo']!,
                            height: 50,
                            width: 60,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/no_Image.png',
                                width: 60,
                                height: 50,
                              );
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextWidget(
                            text: howComeAirlineLeavingOrReturn[index]['name']!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
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
