import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-guest-data-enter-widgets/bottom-sheet/hotel_select_birthday_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-guest-data-enter-widgets/hotel_birthday_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-guest-data-enter-widgets/hotel_first_and_last_name_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-guest-data-enter-widgets/hotel_save_button_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-guest-data-enter-widgets/hotel_select_between_male_or_female.dart';
import 'package:bamobile1/widgets/select_value_from_two_text_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/first_and_last_name_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/save_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelGuestDataEnterView extends StatelessWidget {
  const HotelGuestDataEnterView({
    super.key,
  });
  static String id = 'HotelGuestDataEnterView';

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formHotelKeyInGuestDataEnterView =
        GlobalKey<FormState>();
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: context.height * 0.06,
              automaticallyImplyLeading: false,
              title: AppBarWidget(
                onPressedLeading: () {
                  // print(hotelCubit.hotelGuestCardDataList);
                  // print(hotelCubit
                  //     .hotelGuestCardDataList[hotelCubit.arguments!]!
                  //     .firstName);
                  // print(hotelCubit.firstName);
                  Navigator.pop(context);
                },
                title: S.of(context).PassengerInformation,
                leading: Icons.arrow_back_ios,
              ),
              backgroundColor: AppColors.kAppBarColor,
            ),
            bottomSheet: hotelCubit.bottomSheetValue == 'h8'
                ? HotelSelectBirthdayBottomSheet(
                    index: hotelCubit.arguments!,
                    indexSub: hotelCubit.argumentsSub!,
                  )
                : null,
            backgroundColor: Colors.white,
            body: Form(
              key: formHotelKeyInGuestDataEnterView,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: S.of(context).Gender,
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                              const SizedBox(height: 8),
                              HotelSelectBetweenMaleOrFemale(
                                width: 0.91,
                                firstText: S.of(context).Man,
                                secondText: S.of(context).Woman,
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          HotelFirstAndLastNameWidget(
                            index: hotelCubit.arguments!,
                            indexSub: hotelCubit.argumentsSub!,
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                    hotelCubit.title == S.of(context).Adult
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: HotelBirthdayWidget(
                              index: hotelCubit.arguments!,
                              indexSub: hotelCubit.argumentsSub!,
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),
                    HotelSaveButtonWidget(
                      index: hotelCubit.arguments!,
                      indexSub: hotelCubit.argumentsSub!,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
