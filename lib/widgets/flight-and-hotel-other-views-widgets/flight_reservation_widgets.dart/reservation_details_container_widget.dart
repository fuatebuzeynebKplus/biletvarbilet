import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReservationDetailsContainerWidget extends StatelessWidget {
  const ReservationDetailsContainerWidget({
    super.key,
    required this.index,
    this.thisViewIsResultView = false,
  });
  final int index;
  final bool thisViewIsResultView;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
            text: S.of(context).ReservationDetails,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
        SizedBox(height: context.height * 0.01),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.kSecondColor)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    TextWidget(
                      text:
                          '${S.of(context).ReservationNumber}:   ', //totalPrice!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text:
                          '${thisViewIsResultView == true ? flightTicketCubit.detailsForResultView!.systemPnr : flightTicketCubit.getReservationsList[index ?? 0].systemPnr}', //totalPrice!,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextWidget(
                      text: '${S.of(context).Reservation}:   ', //totalPrice!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text: thisViewIsResultView == true
                          ? BookingStatusType.fromValue(flightTicketCubit
                                  .detailsForResultView!.bookingStatusType!)
                              .description(context)
                          : BookingStatusType.fromValue(flightTicketCubit
                                  .getReservationsList[index]
                                  .bookingStatusType!)
                              .description(context), //totalPrice!,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextWidget(
                      text:
                          '${S.of(context).TransactionDate}:   ', //totalPrice!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text: flightTicketCubit.convertArabicNumbersToEnglish(
                          DateFormat('dd.MM.yyyy HH:mm').format(DateTime.parse(
                              thisViewIsResultView == true
                                  ? flightTicketCubit
                                      .detailsForResultView!.bookingDate!
                                  : flightTicketCubit.getReservationsList[index]
                                      .bookingDate!))), //totalPrice!,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextWidget(
                      text:
                          '${S.of(context).ExpirationDate}:   ', //totalPrice!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text: flightTicketCubit.convertArabicNumbersToEnglish(
                          DateFormat('dd.MM.yyyy HH:mm').format(DateTime.parse(
                                  thisViewIsResultView == true
                                      ? flightTicketCubit
                                          .detailsForResultView!.expirationDate!
                                      : flightTicketCubit
                                          .getReservationsList[index]
                                          .expirationDate!)
                              .toLocal())), //totalPrice!,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


/*
import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReservationDetailsContainerWidget extends StatelessWidget {
  const ReservationDetailsContainerWidget({
    super.key,
    required this.index,
    this.thisViewIsResultView = false,
  });
  final int index;
  final bool thisViewIsResultView;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
            text: S.of(context).ReservationDetails,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
        SizedBox(height: context.height * 0.01),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.kSecondColor)),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.code, color: AppColors.kSecondColor, size: 25),
                    const SizedBox(
                      width: 4,
                    ),
                    TextWidget(
                      text:
                          '${S.of(context).ReservationNumber}:   ', //totalPrice!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text:
                          '${thisViewIsResultView == true ? flightTicketCubit.detailsForResultView!.systemPnr : flightTicketCubit.getReservationsList[index ?? 0].systemPnr}', //totalPrice!,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.currency_lira,
                        color: AppColors.kSecondColor, size: 25),
                    const SizedBox(
                      width: 4,
                    ),
                    TextWidget(
                      text: '${S.of(context).Reservation}:   ', //totalPrice!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text:
                          '${thisViewIsResultView == true ? flightTicketCubit.detailsForResultView?.bookingStatusType : flightTicketCubit.getReservationsList[index].bookingStatusType}', //totalPrice!,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month,
                        color: AppColors.kSecondColor, size: 25),
                    const SizedBox(
                      width: 4,
                    ),
                    TextWidget(
                      text:
                          '${S.of(context).TransactionDate}:   ', //totalPrice!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text: DateFormat('dd.MM.yyyy HH:mm').format(
                          DateTime.parse(thisViewIsResultView == true
                              ? flightTicketCubit
                                  .detailsForResultView!.bookingDate!
                              : flightTicketCubit.getReservationsList[index]
                                  .bookingDate!)), //totalPrice!,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.calendar_month,
                        color: AppColors.kSecondColor, size: 25),
                    const SizedBox(
                      width: 4,
                    ),
                    TextWidget(
                      text:
                          '${S.of(context).ExpirationDate}:   ', //totalPrice!,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    TextWidget(
                      text: DateFormat('dd.MM.yyyy HH:mm').format(
                          DateTime.parse(thisViewIsResultView == true
                                  ? flightTicketCubit
                                      .detailsForResultView!.expirationDate!
                                  : flightTicketCubit.getReservationsList[index]
                                      .expirationDate!)
                              .toLocal()), //totalPrice!,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


*/
