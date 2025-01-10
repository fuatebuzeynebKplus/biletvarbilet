import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BirthdayWidget extends StatelessWidget {
  const BirthdayWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            flightTicketCubit.bottomSheetValue(type: 8);

            if ((flightTicketCubit.firstName == null &&
                    flightTicketCubit.passengerCardDataList[index] != null) ||
                (flightTicketCubit.lastName == null &&
                    flightTicketCubit.passengerCardDataList[index]?.lastName !=
                        null)) {
              flightTicketCubit.firstName =
                  flightTicketCubit.passengerCardDataList[index]!.firstName;
              flightTicketCubit.lastName =
                  flightTicketCubit.passengerCardDataList[index]!.lastName;
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
                              flightTicketCubit
                                          .passengerCardDataList.isNotEmpty &&
                                      index <
                                          flightTicketCubit
                                              .passengerCardDataList.length &&
                                      flightTicketCubit
                                              .passengerCardDataList[index] !=
                                          null &&
                                      flightTicketCubit
                                              .passengerCardDataList[index]!
                                              .birthday !=
                                          null
                                  ? DateFormat('dd/MM/yyyy').format(
                                      flightTicketCubit
                                          .passengerCardDataList[index]!
                                          .birthday!)
                                  : flightTicketCubit.birthday != null
                                      ? DateFormat('dd/MM/yyyy')
                                          .format(flightTicketCubit.birthday!)
                                      : '',
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
