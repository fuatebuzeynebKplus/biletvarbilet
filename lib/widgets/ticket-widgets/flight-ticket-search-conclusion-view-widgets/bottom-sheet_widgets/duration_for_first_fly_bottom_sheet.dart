import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/save_and_clean_in_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DurationForFirstFlyBottomSheet extends StatelessWidget {
  const DurationForFirstFlyBottomSheet({
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
                  //flightTicketCubit.bottomSheetValue(type: 17);
                  flightTicketCubit.filterByDurationsRange();
                  flightTicketCubit.bottomSheetValue(type: 12);
                },
                onTopForClean: () {
                  flightTicketCubit.flyingDurationFirstInFilter = null;

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
                      text: S.of(context).ChooseTheDurationTimeForYourFlight,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kSecondColor,
                    ),
                  ],
                ),
              )
            ],
          ), //
          widgetBody: Container(
            height: context.height * 0.275,
            color: Colors.white,
            width: context.width * 1,
            child: Row(
              children: [
                // Picker for hours (0-49 hours)
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 32.0,
                    scrollController: FixedExtentScrollController(
                      initialItem: flightTicketCubit
                              .flyingDurationFirstInFilter?.inHours ??
                          0,
                    ),
                    onSelectedItemChanged: (int newHour) {
                      flightTicketCubit.flyingDurationFirstInFilter = Duration(
                        hours: newHour,
                        minutes: flightTicketCubit
                                .flyingDurationFirstInFilter?.inMinutes
                                .remainder(60) ??
                            0,
                      );
                    },
                    children: List<Widget>.generate(50, (int index) {
                      return Center(
                          child: Text('$index ${S.of(context).Hour}'));
                    }),
                  ),
                ),
                // Picker for minutes (0-59 minutes)
                Expanded(
                  child: CupertinoPicker(
                    itemExtent: 32.0,
                    scrollController: FixedExtentScrollController(
                      initialItem: flightTicketCubit
                              .flyingDurationFirstInFilter?.inMinutes
                              .remainder(60) ??
                          0,
                    ),
                    onSelectedItemChanged: (int newMinute) {
                      flightTicketCubit.flyingDurationFirstInFilter = Duration(
                        hours: flightTicketCubit
                                .flyingDurationFirstInFilter?.inHours ??
                            0,
                        minutes: newMinute,
                      );
                    },
                    children: List<Widget>.generate(60, (int index) {
                      return Center(
                          child: Text('$index ${S.of(context).Minimum}'));
                    }),
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
