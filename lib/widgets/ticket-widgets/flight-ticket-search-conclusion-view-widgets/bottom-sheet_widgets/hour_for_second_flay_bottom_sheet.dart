import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/save_and_clean_in_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HourForSecondFlyBottomSheet extends StatelessWidget {
  const HourForSecondFlyBottomSheet({
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
        return BottomSheetWidget(
          paddingLeftRight: 0,
          paddingTop: 0,
          height: 0.42,
          title: Column(
            children: [
              SaveAndCleanInBottomSheetWidget(
                onTopForSave: () {
                  flightTicketCubit.bottomSheetValue(type: 12);
                  flightTicketCubit.filterByTimesRange();
                },
                onTopForClean: () {
                  flightTicketCubit.flyingSecondHourInFilter = null;

                  flightTicketCubit.bottomSheetValue(type: 12);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    TextWidget(
                      text: S.of(context).ChooseTheCorrectTimeForYourFlight,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kSecondColor,
                    ),
                  ],
                ),
              )
            ],
          ),
          widgetBody: Container(
            height: context.height * 0.27,
            color: Colors.white,
            width: context.width * 1,
            child: Column(
              children: [
                Expanded(
                  child: CupertinoDatePicker(
                    minimumDate: flightTicketCubit.flyingFirstHourInFilter,
                    use24hFormat: true,
                    mode: CupertinoDatePickerMode.time,
                    initialDateTime: flightTicketCubit.flyingSecondHourInFilter,
                    onDateTimeChanged: (DateTime value) {
                      flightTicketCubit.flyingSecondHourInFilter = value;
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
