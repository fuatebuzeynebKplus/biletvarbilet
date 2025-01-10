import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_view.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/close_and_apply_widget.dart';
import 'package:bamobile1/widgets/text_field_other_design_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketSearchBottomSheet extends StatelessWidget {
  const TicketSearchBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKeyForSearchPoint = GlobalKey();
    Widget getIconForHotpointType(int hotpointType) {
      if (hotpointType == 0) {
        return Icon(
          Icons.location_city,
          color: AppColors.kSecondColor,
        ); // Şehir ikonu
      } else if (hotpointType == 1) {
        return Icon(
          Icons.airplanemode_active,
          color: AppColors.kSecondColor,
        ); // Havalimanı ikonu
      } else {
        return Icon(
          Icons.place,
          color: AppColors.kSecondColor,
        ); // Diğer durumlar için varsayılan ikon
      }
    }

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {},
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return BottomSheetWidget(
            height: 1,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 30,
                ),
                const Spacer(),
                TextWidget(
                  text: flightTicketCubit.selectBetweenArriveAndDeparture == 0
                      ? S.of(context).DeparturePoint
                      : S.of(context).Destination, //
                  color: AppColors.kSecondColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      flightTicketCubit.bottomSheetValue(type: 0);
                    },
                    icon: Icon(
                      Icons.close,
                      color: AppColors.kSecondColor,
                    ))
              ],
            ),
            widgetBody: Column(
              children: [
                Form(
                  key: formKeyForSearchPoint,
                  child: SizedBox(
                    height: context.height * 0.05,
                    child: TextFieldOtherDesignWidget(
                      width: 1,
                      text: S.of(context).Search,
                      icon: Icons.search,
                      padding: 8,
                      onChanged: (value) {
                        if (value.length >= 3) {
                          flightTicketCubit.theTextLengthIs3AndMoreFunction(
                              value: true);
                          flightTicketCubit.searchAirport(value);
                        } else {
                          flightTicketCubit.theTextLengthIs3AndMoreFunction(
                              value: false);
                        }
                        // You may want to trigger the search here
                      },
                    ),
                  ),
                ),
                if (state is SearchCityDataLoading)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: context.height * 0.2,
                      ),
                      CircularProgressIndicator(
                        color: AppColors.kSecondColor,
                      ),
                    ],
                  )
                else if (state is SearchCityDataSuccess)
                  flightTicketCubit.theTextLengthIs3AndMore == true
                      ? Column(children: [
                          if (flightTicketCubit.searchDataForCity != null)
                            for (final result
                                in flightTicketCubit.searchDataForCity)
                              ListTile(
                                title: Text(result['Name']),
                                subtitle: Text(
                                    '${result['CountryName']} - ${result['Code']}'),
                                trailing: getIconForHotpointType(
                                    result['HotpointType']),
                                onTap: () {
                                  if (flightTicketCubit
                                          .selectBetweenArriveAndDeparture ==
                                      0) {
                                    flightTicketCubit.firstCityCode =
                                        result['Code'];

                                    flightTicketCubit.firstSearchCity =
                                        result['Name'];
                                    flightTicketCubit.firstSearchCountryCode =
                                        result['CountryCode'];
                                    if (flightTicketCubit.searchTypeValue ==
                                        'cok') {
                                      flightTicketCubit
                                          .listMultiPoint[flightTicketCubit
                                              .saveIndexForMultiPointSelectLegAndDateValue!]
                                          .departureCode = result['Code'];
                                      flightTicketCubit
                                          .listMultiPoint[flightTicketCubit
                                              .saveIndexForMultiPointSelectLegAndDateValue!]
                                          .departureCityName = result['Name'];
                                    }
                                  } else {
                                    flightTicketCubit.secondCityCode =
                                        result['Code'];

                                    flightTicketCubit.secondSearchCity =
                                        result['Name'];
                                    flightTicketCubit.secondSearchCountryCode =
                                        result['CountryCode'];
                                    if (flightTicketCubit.searchTypeValue ==
                                        'cok') {
                                      flightTicketCubit
                                          .listMultiPoint[flightTicketCubit
                                              .saveIndexForMultiPointSelectLegAndDateValue!]
                                          .arrivalCode = result['Code'];
                                      flightTicketCubit
                                          .listMultiPoint[flightTicketCubit
                                              .saveIndexForMultiPointSelectLegAndDateValue!]
                                          .arrivalCityName = result['Name'];
                                    }
                                  }
                                  flightTicketCubit.bottomSheetValue(type: 0);
                                },
                              )
                          else
                            const Center(child: Text('')),
                        ])
                      : const Center(child: Text(''))
                else if (state is SearchCityDataFailure)
                  const Center(child: Text('Not Found'))
              ],
            ));
      },
    );
  }
}
