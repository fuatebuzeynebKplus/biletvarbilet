import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelSaveButtonWidget extends StatelessWidget {
  const HotelSaveButtonWidget({
    super.key,
    required this.index,
    required this.indexSub,
  });
  final int index;
  final int indexSub;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
        return ButtonWidget(
          title: S.of(context).Save,
          color: AppColors.kSecondColor,
          height: 0.05,
          width: 0.8,
          fontSize: 18,
          textColor: Colors.white,
          onTap: () {
            hotelCubit.upDataTestForBarthDay(
                index: index, indexSub: indexSub, context: context);

            print(hotelCubit.firstName);
            print(hotelCubit.lastName);
            if (RegExp(r'^[a-zA-ZÇçĞğİıÖöŞşÜü\s]+$')
                    .hasMatch(hotelCubit.firstName ?? 'p') &&
                RegExp(r'^[a-zA-ZÇçĞğİıÖöŞşÜü\s]+$')
                    .hasMatch(hotelCubit.lastName ?? 'p')) {
              print('*//*//*/*/*//*');
              bool allNotNull = hotelCubit.hotelGuestCardDataList
                  .every((element) => element != null);

              if (allNotNull) {
                print('****************************************');
                hotelCubit.bottomSheetValueFunction(type: 'h6');
              } else {
                print('-------------------------------------------');
                hotelCubit.bottomSheetValueFunction(type: 'h0');
              }

              if (hotelCubit.selectBetweenTwoTextValue != S.of(context).Man &&
                  hotelCubit.selectBetweenTwoTextValue != S.of(context).Woman) {
                hotelCubit.selectBetweenTwoTextValue = S.of(context).Woman;
              }

              hotelCubit.processFlightTicket(context, index, indexSub);
              //Navigator.pop(context);
            } else {
              SnackbarUtils.showSnackbar(
                  context, S.of(context).YouCanOnlyWriteLetters);
            }
          },
        );
      },
    );
  }
}
