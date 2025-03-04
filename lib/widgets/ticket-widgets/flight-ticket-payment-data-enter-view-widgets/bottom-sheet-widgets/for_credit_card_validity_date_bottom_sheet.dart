import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/save_and_clean_in_bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForCreditCardValidityDateBottomSheet extends StatelessWidget {
  const ForCreditCardValidityDateBottomSheet({
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
          paddingTop: 0,
          paddingLeftRight: 0,
          height: 0.4,
          title: SaveAndCleanInBottomSheetWidget(
            onTopForSave: () {
              flightTicketCubit.bottomSheetValue(type: 18);
            },
            onTopForClean: () {
              flightTicketCubit.bottomSheetValue(type: 18);
            },
          ),
          widgetBody: Container(
            color: Colors.white,
            height: context.height * 0.315,
            width: context.width * 1,
            child: Column(
              children: [
                Expanded(
                  child: CupertinoDatePicker(
                    minimumYear: DateTime.now().year,
                    maximumDate: DateTime(2100),
                    mode: CupertinoDatePickerMode.monthYear,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime value) {
                      flightTicketCubit.creditCardMonthAndYear =
                          '${value.month.toString().padLeft(2, '0')}/${value.year}';
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
