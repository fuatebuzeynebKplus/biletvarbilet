import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HotelBirthdayWidget extends StatelessWidget {
  const HotelBirthdayWidget({
    super.key,
    required this.index,
    required this.indexSub,
  });
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
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            hotelCubit.bottomSheetValueFunction(type: 'h8');

            if ((hotelCubit.firstName == null &&
                    hotelCubit.hotelGuestCardDataList[index][indexSub] !=
                        null) ||
                (hotelCubit.lastName == null &&
                    hotelCubit.hotelGuestCardDataList[index][indexSub]
                            ?.lastName !=
                        null)) {
              hotelCubit.firstName =
                  hotelCubit.hotelGuestCardDataList[index][indexSub]!.firstName;
              hotelCubit.lastName =
                  hotelCubit.hotelGuestCardDataList[index][indexSub]!.lastName;
            }
          },
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: S.of(context).BirthDay,
                  fontSize: 14,
                  color: Colors.black54,
                ),
                Container(
                  //  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                          text:
                              //  flightTicketCubit.cardDataList[index] == null
                              //     ? flightTicketCubit.birthday == null
                              //         ? S.of(context).BirthDay
                              //         : DateFormat('dd/MM/yyy')
                              //             .format(flightTicketCubit.birthday!)
                              //     : DateFormat('dd/MM/yyy').format(flightTicketCubit
                              //         .cardDataList[index]!.birthday!),
                              hotelCubit.hotelGuestCardDataList[index]
                                          [indexSub] !=
                                      null
                                  ? DateFormat('dd/MM/yyy').format(hotelCubit
                                          .hotelGuestCardDataList[index]
                                              [indexSub]!
                                          .birthday ??
                                      hotelCubit.birthday!)
                                  : S.of(context).BirthDay,
                          color: AppColors.kGrey,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      Icon(
                        Icons.date_range,
                        color: AppColors.kGrey,
                      )
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
