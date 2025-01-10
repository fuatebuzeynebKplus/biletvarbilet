import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
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

class HotelSearchBottomSheet extends StatelessWidget {
  const HotelSearchBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKeyForSearchHotel = GlobalKey();
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {},
      builder: (context, state) {
        HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
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
                  text: 'Hotel Search',
                  color: AppColors.kSecondColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      hotelCubit.bottomSheetValueFunction(type: 'h0');
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
                  key: formKeyForSearchHotel,
                  child: SizedBox(
                    height: context.height * 0.05,
                    child: TextFieldOtherDesignWidget(
                      width: 1,
                      text: S.of(context).Search,
                      icon: Icons.search,
                      padding: 8,
                      onChanged: (value) {
                        if (value.length >= 3) {
                          hotelCubit.searchDestination(value);
                          hotelCubit.searchHotelName(value);
                        }
                      },
                    ),
                  ),
                ),
                if (state is SearchHotelDataLoading)
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
                else if (state is SearchHotelDataSuccess)
                  Column(children: [
                    if (hotelCubit.searchDataForCity != null)
                      for (final result in hotelCubit.searchDataForCity)
                        ListTile(
                          title: Text('${result['FullName']}'),
                          subtitle: Text(
                              '${result['CountryName']} (${result['CountryCode']})'),
                          trailing: Icon(
                            Icons.location_pin,
                            color: AppColors.kSecondColor,
                          ),
                          onTap: () {
                            // if (hotelCubit
                            //         .selectBetweenArriveAndDeparture ==
                            //     0) {
                            //   flightTicketCubit.firstCityCode = result['Code'];

                            //   flightTicketCubit.firstSearchCity =
                            //       result['Name'];
                            // } else {
                            hotelCubit.searchHotelFullName = result['FullName'];

                            hotelCubit.searchHotelCountryName =
                                result['CountryName'];
                            hotelCubit.searchHotelCountryCode =
                                result['CountryCode'];

                            hotelCubit.searchDestinationCode =
                                result['DestinationId'];

                            print(hotelCubit.searchDestinationCode);
                            hotelCubit.bottomSheetValueFunction(type: 'h0');
                          },
                        )
                    else
                      const Center(child: Text('')),
                    if (hotelCubit.searchDataForCityTow != null)
                      for (final result in hotelCubit.searchDataForCityTow)
                        ListTile(
                          title: Text('${result['HotelName']}'),
                          subtitle: Text(
                              '${result['Location']} (${result['CountryCode']})'),
                          trailing: Icon(
                            Icons.hotel,
                            color: AppColors.kSecondColor,
                          ),
                          onTap: () {
                            // if (hotelCubit
                            //         .selectBetweenArriveAndDeparture ==
                            //     0) {
                            //   flightTicketCubit.firstCityCode = result['Code'];

                            //   flightTicketCubit.firstSearchCity =
                            //       result['Name'];
                            // } else {
                            hotelCubit.searchHotelFullName =
                                result['HotelName'];

                            hotelCubit.searchHotelCountryName =
                                result['Location'];
                            hotelCubit.searchHotelCountryCode =
                                result['CountryCode'];

                            hotelCubit.searchHotelCode = result['HotelCode'];

                            hotelCubit.bottomSheetValueFunction(type: 'h0');
                          },
                        )
                    else
                      const Center(child: Text('')),
                  ])
                else if (state is SearchHotelDataFailure)
                  const Center(child: Text('Not Found'))
              ],
            ));
      },
    );
  }
}
