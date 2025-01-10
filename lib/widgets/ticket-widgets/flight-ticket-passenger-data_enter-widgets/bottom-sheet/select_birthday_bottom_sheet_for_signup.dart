import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/save_and_clean_in_bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectBirthdayBottomSheetSignUp extends StatelessWidget {
  const SelectBirthdayBottomSheetSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BottomSheetWidget(
          paddingLeftRight: 0,
          paddingTop: 0,
          height: 0.4,
          title: SaveAndCleanInBottomSheetWidget(
            onTopForSave: () {
              BlocProvider.of<AuthCubit>(context).showSelectDate(value: false);
            },
            onTopForClean: () {
              BlocProvider.of<AuthCubit>(context).showSelectDate(value: false);
            },
          ),
          widgetBody: Container(
            height: context.height * 0.315,
            color: Colors.white,
            width: context.width * 1,
            child: Column(
              children: [
                Expanded(
                  child: CupertinoDatePicker(
                    maximumYear: DateTime.now().year,
                    minimumDate: DateTime(1900),
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime value) {
                      BlocProvider.of<AuthCubit>(context).birthday = value;
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
