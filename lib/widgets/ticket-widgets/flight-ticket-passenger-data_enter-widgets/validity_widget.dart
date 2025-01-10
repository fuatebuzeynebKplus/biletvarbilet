import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ValidityWidget extends StatelessWidget {
  const ValidityWidget({
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
            flightTicketCubit.bottomSheetValue(type: 9);
          },
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: S.of(context).ValidityDate,
                  fontSize: 14,
                  color: Colors.black54,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(

                        // text: flightTicketCubit.passengerCardDataList[index] !=
                        //         null
                        //     ? DateFormat('dd/MM/yyy').format(flightTicketCubit
                        //             .passengerCardDataList[index]!
                        //             .validityDate! ??
                        //         flightTicketCubit.validityDate!)
                        //     : S.of(context).ValidityDate,
                        text: flightTicketCubit
                                    .passengerCardDataList.isNotEmpty &&
                                index <
                                    flightTicketCubit
                                        .passengerCardDataList.length &&
                                flightTicketCubit
                                        .passengerCardDataList[index] !=
                                    null &&
                                flightTicketCubit.passengerCardDataList[index]!
                                        .validityDate !=
                                    null
                            ? DateFormat('dd.MM.yyyy').format(flightTicketCubit
                                .passengerCardDataList[index]!.validityDate!)
                            : (flightTicketCubit.validityDate == null
                                ? ''
                                : DateFormat('dd.MM.yyyy')
                                    .format(flightTicketCubit.validityDate!)),
                        color: AppColors.kGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                    Icon(
                      Icons.date_range,
                      color: AppColors.kGrey,
                    )
                  ],
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
