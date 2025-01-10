import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/text_spacer_widget_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_payment_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortAlertDialogWidget extends StatelessWidget {
  const SortAlertDialogWidget({
    super.key,
    this.thisIsMultiPoint = false,
  });
  final bool thisIsMultiPoint;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: S.of(context).Sort,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.kSecondColor,
        ),
        // TextSpacerWidgetWidget(
        //   color: Colors.black,
        //   title: S.of(context).Default,
        //   widget: RadioForPaymentTypeWidget(
        //     onChanged: (value) {
        //       flightTicketCubit.sortFunc();
        //       flightTicketCubit.selectPaymentTypeFunction(value);
        //     },
        //     text: S.of(context).Default,
        //   ),
        // ),

        TextSpacerWidgetWidget(
          color: Colors.black,
          title: S.of(context).LowestPrice,
          widget: RadioForPaymentTypeWidget(
            onChanged: (value) {
              if (thisIsMultiPoint) {
                flightTicketCubit.sortPriceLessToHighMultiPointFunc();
                flightTicketCubit.selectPaymentTypeFunction(value, context);
              } else {
                flightTicketCubit.sortPriceLessToHighFunc(context);
                flightTicketCubit.selectPaymentTypeFunction(value, context);
              }
            },
            text: S.of(context).LowestPrice,
          ),
        ),
        TextSpacerWidgetWidget(
          color: Colors.black,
          title: S.of(context).HighestPrice,
          widget: RadioForPaymentTypeWidget(
            onChanged: (value) {
              if (thisIsMultiPoint) {
                flightTicketCubit.sortPriceHighToLessMultiPointFunc();
                flightTicketCubit.selectPaymentTypeFunction(value, context);
              } else {
                flightTicketCubit.sortPriceHighToLessFunc(context);
                flightTicketCubit.selectPaymentTypeFunction(value, context);
              }
            },
            text: S.of(context).HighestPrice,
          ),
        ),
        TextSpacerWidgetWidget(
          color: Colors.black,
          title: S.of(context).HighestFlyingTime,
          widget: RadioForPaymentTypeWidget(
            onChanged: (value) {
              if (thisIsMultiPoint) {
                flightTicketCubit.selectPaymentTypeFunction(value, context);
                flightTicketCubit
                    .sortTripDepartureTimeLessToHighMultiPointFunc();
              } else {
                flightTicketCubit.sortTripDepartureTimeLessToHighFunc();
                flightTicketCubit.selectPaymentTypeFunction(value, context);
              }
            },
            text: S.of(context).HighestFlyingTime,
          ),
        ),
        TextSpacerWidgetWidget(
          color: Colors.black,
          title: S.of(context).LowestFlyingTime,
          widget: RadioForPaymentTypeWidget(
            onChanged: (value) {
              if (thisIsMultiPoint) {
                flightTicketCubit.selectPaymentTypeFunction(value, context);
                flightTicketCubit
                    .sortTripDepartureTimeHighToLessMultiPointFunc();
              } else {
                flightTicketCubit.sortTripDepartureTimeHighToLessFunc();

                flightTicketCubit.selectPaymentTypeFunction(value, context);
              }
            },
            text: S.of(context).LowestFlyingTime,
          ),
        ),
        TextSpacerWidgetWidget(
          color: Colors.black,
          title: S.of(context).LowestHours,
          widget: RadioForPaymentTypeWidget(
            onChanged: (value) {
              if (thisIsMultiPoint) {
                flightTicketCubit.sortTripLessToHighMultiPointFunc();
                flightTicketCubit.selectPaymentTypeFunction(value, context);
              } else {
                flightTicketCubit.sortTripLessToHighFunc();
                flightTicketCubit.selectPaymentTypeFunction(value, context);
              }
            },
            text: S.of(context).LowestHours,
          ),
        ),

        TextSpacerWidgetWidget(
          color: Colors.black,
          title: S.of(context).HighestHours,
          widget: RadioForPaymentTypeWidget(
            onChanged: (value) {
              if (thisIsMultiPoint) {
                flightTicketCubit.sortTripHighToLessMultiPointFunc();
                flightTicketCubit.selectPaymentTypeFunction(value, context);
              } else {
                flightTicketCubit.sortTripHighToLessFunc();
                flightTicketCubit.selectPaymentTypeFunction(value, context);
              }
            },
            text: S.of(context).HighestHours,
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
  }
}
