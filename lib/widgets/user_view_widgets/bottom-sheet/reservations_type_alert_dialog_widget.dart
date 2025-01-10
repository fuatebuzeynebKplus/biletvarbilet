import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/check_box_widget.dart';
import 'package:bamobile1/widgets/text_spacer_widget_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_payment_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationsTypeAlertDialogWidget extends StatelessWidget {
  const ReservationsTypeAlertDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            TextWidget(
              text: S.of(context).TransactionType,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.kSecondColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: flightTicketCubit.reservationsTypeList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextSpacerWidgetWidget(
                    color: Colors.black,
                    title: BookingStatusType.fromValue(
                            flightTicketCubit.reservationsTypeList[index].first)
                        .description(context),
                    widget: CheckBoxWidget(
                      value: flightTicketCubit.reservationsTypeList[index].last
                          as bool,
                      onChanged: (bool? value) {
                        flightTicketCubit
                            .checkboxBookingTypeForReservationAlertDialogWidget(
                                value: value!, index: index);
                        flightTicketCubit.reservationFilterFunction();
                        //flightTicketCubit.justForEmitState();
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              onTap: () {
                Navigator.pop(context);
              },
              fontWeight: FontWeight.bold,
              borderCircularValue: 16,
              title: S.of(context).Apply,
              height: 0.05,
              width: 0.5,
              fontSize: 18,
              textColor: Colors.white,
              color: AppColors.kSecondColor,
            )
          ],
        );
      },
    );
  }
}


// Column(
//       mainAxisAlignment = MainAxisAlignment.spaceBetween,
//       children = [
//         TextWidget(
//           text: S.of(context).Sort,
//           fontSize: 20,
//           fontWeight: FontWeight.bold,
//           color: AppColors.kSecondColor,
//         ),
//         // TextSpacerWidgetWidget(
//         //   color: Colors.black,
//         //   title: S.of(context).Default,
//         //   widget: RadioForPaymentTypeWidget(
//         //     onChanged: (value) {
//         //       flightTicketCubit.sortFunc();
//         //       flightTicketCubit.selectPaymentTypeFunction(value);
//         //     },
//         //     text: S.of(context).Default,
//         //   ),
//         // ),

//         TextSpacerWidgetWidget(
//           color: Colors.black,
//           title: S.of(context).LowestPrice,
//           widget: RadioForPaymentTypeWidget(
//             onChanged: (value) {
//               flightTicketCubit.sortPriceLessToHighFunc();
//               flightTicketCubit.selectPaymentTypeFunction(value, context);
//             },
//             text: S.of(context).LowestPrice,
//           ),
//         ),
//         TextSpacerWidgetWidget(
//           color: Colors.black,
//           title: S.of(context).HighestPrice,
//           widget: RadioForPaymentTypeWidget(
//             onChanged: (value) {
//               flightTicketCubit.sortPriceHighToLessFunc();
//               flightTicketCubit.selectPaymentTypeFunction(value, context);
//             },
//             text: S.of(context).HighestPrice,
//           ),
//         ),
//         TextSpacerWidgetWidget(
//           color: Colors.black,
//           title: S.of(context).HighestFlyingTime,
//           widget: RadioForPaymentTypeWidget(
//             onChanged: (value) {
//               flightTicketCubit.sortTripDepartureTimeHighToLessFunc();
//               flightTicketCubit.selectPaymentTypeFunction(value, context);
//             },
//             text: S.of(context).HighestFlyingTime,
//           ),
//         ),
//         TextSpacerWidgetWidget(
//           color: Colors.black,
//           title: S.of(context).LowestFlyingTime,
//           widget: RadioForPaymentTypeWidget(
//             onChanged: (value) {
//               flightTicketCubit.sortTripDepartureTimeLessToHighFunc();
//               flightTicketCubit.selectPaymentTypeFunction(value, context);
//             },
//             text: S.of(context).LowestFlyingTime,
//           ),
//         ),
//         TextSpacerWidgetWidget(
//           color: Colors.black,
//           title: S.of(context).LowestHours,
//           widget: RadioForPaymentTypeWidget(
//             onChanged: (value) {
//               flightTicketCubit.sortTripLessToHighFunc();
//               flightTicketCubit.selectPaymentTypeFunction(value, context);
//             },
//             text: S.of(context).LowestHours,
//           ),
//         ),

//         TextSpacerWidgetWidget(
//           color: Colors.black,
//           title: S.of(context).HighestHours,
//           widget: RadioForPaymentTypeWidget(
//             onChanged: (value) {
//               flightTicketCubit.sortTripHighToLessFunc();
//               flightTicketCubit.selectPaymentTypeFunction(value, context);
//             },
//             text: S.of(context).HighestHours,
//           ),
//         ),

//         const SizedBox(
//           height: 20,
//         ),
//         ButtonWidget(
//           onTap: () {
//             Navigator.pop(context);
//           },
//           fontWeight: FontWeight.bold,
//           borderCircularValue: 16,
//           title: S.of(context).Apply,
//           height: 0.05,
//           width: 0.5,
//           fontSize: 18,
//           textColor: Colors.white,
//           color: AppColors.kSecondColor,
//         )
//       ],
//     );
