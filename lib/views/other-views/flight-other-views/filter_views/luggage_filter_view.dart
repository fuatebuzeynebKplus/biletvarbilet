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

class LuggageFilterView extends StatelessWidget {
  const LuggageFilterView({super.key});

  static String id = 'LuggageFilterView';

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    dynamic howComeLuggageLeavingOrReturn;
    if (flightTicketCubit.searchTypeForListInFilter == 'tek') {
      howComeLuggageLeavingOrReturn = flightTicketCubit.luggagesListLeaving;
    } else if (flightTicketCubit.searchTypeForListInFilter == 'cok') {
      print('444444');
      howComeLuggageLeavingOrReturn = flightTicketCubit.luggagesListMultipoint;
    } else {
      howComeLuggageLeavingOrReturn = flightTicketCubit.luggagesListReturn;
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
                title: S.of(context).LuggageFilter,
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
                        flightTicketCubit.clearAll(type: 'luggage');
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
                          flightTicketCubit.filterLuggagesTypesMultipoint();
                        } else {
                          flightTicketCubit.filterLuggagesTypes();
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
                itemCount: howComeLuggageLeavingOrReturn.length,
                itemBuilder: (BuildContext context, int index) {
                  final baggageName =
                      howComeLuggageLeavingOrReturn[index]['baggageType']!;
                  return GestureDetector(
                    onTap: () {
                      final currentValue = flightTicketCubit
                                  .searchTypeForListInFilter ==
                              'tek'
                          ? flightTicketCubit
                              .isSelectedLuggagesTypesLeaving(baggageName)
                          : flightTicketCubit.searchTypeForListInFilter == 'cok'
                              ? flightTicketCubit
                                  .isSelectedLuggagesTypesMultipoint(
                                      baggageName)
                              : flightTicketCubit
                                  .isSelectedLuggagesTypesReturn(baggageName);
                      flightTicketCubit.searchTypeForListInFilter != 'cok'
                          ? flightTicketCubit.checkboxLuggagesType(
                              baggageName: baggageName,
                              value: !currentValue,
                            )
                          : flightTicketCubit.checkboxLuggagesTypeMultipoint(
                              baggageName: baggageName,
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
                                ? flightTicketCubit
                                    .isSelectedLuggagesTypesLeaving(
                                    howComeLuggageLeavingOrReturn[index]
                                        ['baggageType']!,
                                  )
                                : flightTicketCubit.searchTypeForListInFilter ==
                                        'cok'
                                    ? flightTicketCubit
                                        .isSelectedLuggagesTypesMultipoint(
                                        howComeLuggageLeavingOrReturn[index]
                                            ['baggageType']!,
                                      )
                                    : flightTicketCubit
                                        .isSelectedLuggagesTypesReturn(
                                        howComeLuggageLeavingOrReturn[index]
                                            ['baggageType']!,
                                      ),
                            onChanged: (value) {
                              flightTicketCubit.searchTypeForListInFilter ==
                                      'cok'
                                  ? flightTicketCubit.checkboxLuggagesType(
                                      baggageName:
                                          howComeLuggageLeavingOrReturn[index]
                                              ['baggageType']!,
                                      value: value!,
                                    )
                                  : flightTicketCubit
                                      .checkboxLuggagesTypeMultipoint(
                                      baggageName:
                                          howComeLuggageLeavingOrReturn[index]
                                              ['baggageType']!,
                                      value: value!,
                                    );
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextWidget(
                            text:
                                '${baggageName.toString() == '0' ? '  El Bagajı' : baggageName.toString().length >= 2 ? baggageName + '  KG' : baggageName + '  Piece'} ',
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
/*

dynamic airportListLeaving = [];
  List<String> selectedAirportList = [];
  Map<String, bool> selectedAirportMap = {};
  List<AirResult>? listFilterAirport = [];

  void getAirportNameAndLogo() {
    final Set<String> uniqueAirport = {};

    for (int i = 0; i < flightSearchResultsLeaving!.length; i++) {
      final segments =
          flightSearchResultsLeaving![i].legs![0].alternativeLegs![0].segments!;

      for (var segment in segments) {
        final airportName = segment.arrivalAirport!.cityName;
        final airportCode = segment.arrivalAirport!.code;
        final airportsToRemove = ['$firstCityCode', '$secondCityCode'];
        if (airportName != null && uniqueAirport.add(airportName)) {
          airportListLeaving.add({'name': airportName, 'code': airportCode});
        }
        airportListLeaving.removeWhere((airport) {
          return airportsToRemove.contains(airport['code']);
        });
        // Do something with airportName
      }
    }

    print('lineListLeaving: $airportListLeaving');
    print('lineListLeaving length: ${airportListLeaving.length}');
  }

  void checkboxAirportNameAndLogo(
      {required String portCode, required bool value}) {
    if (value) {
      if (!selectedAirportList.contains(portCode)) {
        selectedAirportList.add(portCode);
      }
    } else {
      selectedAirportList.remove(portCode);
    }

    selectedAirportMap[portCode] = value;
    print('Selected lines: $selectedAirportMap');
    emit(AirportsFilterState());
  }

  bool isSelectedAirport(String portCode) {
    return selectedAirportMap[portCode] ?? false;
  }

  void filterAirports() {
    listFilterAirport =
        originalFlightSearchResultsLeaving.where((airportResult) {
      return selectedAirportList.contains(airportResult
          .legs![0].alternativeLegs![0].segments![0].arrivalAirport!.code);
    }).toList();

    print('Filtered flightSearchResultsLeaving:');
    for (var airline in flightSearchResultsLeaving!) {
      print(
          'code: ${airline.legs![0].alternativeLegs![0].segments![0].arrivalAirport!.code} ');
    }
  }



*/