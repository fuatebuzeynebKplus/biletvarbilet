import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/save_and_clean_in_bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelSelectBirthdayBottomSheet extends StatelessWidget {
  const HotelSelectBirthdayBottomSheet(
      {super.key, required this.index, required this.indexSub});

  final int index;
  final int indexSub;
  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return BlocConsumer<HotelCubit, HotelState>(
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
              // if (flightTicketCubit.cardDataList[index] != null) {
              //   flightTicketCubit.upDataTest(index: index);
              // } else {
              hotelCubit.upDataTestForBarthDay(
                  index: index, indexSub: indexSub, context: context);
              // }

              hotelCubit.bottomSheetValueFunction(type: 'h0');
            },
            onTopForClean: () {
              // if (flightTicketCubit.birthday != null) {
              //   flightTicketCubit.upDataTestForBarthDay(index: index);
              // }
              hotelCubit.bottomSheetValueFunction(type: 'h0');
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
                    initialDateTime: hotelCubit.hotelGuestCardDataList[index]
                                [indexSub] !=
                            null
                        ? hotelCubit
                            .hotelGuestCardDataList[index][indexSub]!.birthday
                        : DateTime.now(),
                    onDateTimeChanged: (DateTime value) {
                      hotelCubit.birthday = value;
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
