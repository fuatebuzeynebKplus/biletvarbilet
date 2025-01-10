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

class ReservationsSortAlertDialogWidget extends StatelessWidget {
  const ReservationsSortAlertDialogWidget({
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
              text: S.of(context).Sort,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.kSecondColor,
            ),
            const SizedBox(
              height: 20,
            ),
            TextSpacerWidgetWidget(
              color: Colors.black,
              title: S.of(context).TransactionDate,
              widget: RadioForPaymentTypeWidget(
                onChanged: (value) {
                  flightTicketCubit.reservationSortFunction(value: 0);
                  flightTicketCubit.selectPaymentTypeFunction(value, context);
                },
                text: S.of(context).TransactionDate,
              ),
            ),
            TextSpacerWidgetWidget(
              color: Colors.black,
              title: S.of(context).BookingDate,
              widget: RadioForPaymentTypeWidget(
                onChanged: (value) {
                  flightTicketCubit.reservationSortFunction(value: 1);
                  flightTicketCubit.selectPaymentTypeFunction(value, context);
                },
                text: S.of(context).BookingDate,
              ),
            ),
            TextSpacerWidgetWidget(
              color: Colors.black,
              title: S.of(context).FlightDate,
              widget: RadioForPaymentTypeWidget(
                onChanged: (value) {
                  flightTicketCubit.reservationSortFunction(value: 2);
                  flightTicketCubit.selectPaymentTypeFunction(value, context);
                },
                text: S.of(context).FlightDate,
              ),
            ),
            TextSpacerWidgetWidget(
              color: Colors.black,
              title: S.of(context).ExpirationDate,
              widget: RadioForPaymentTypeWidget(
                onChanged: (value) {
                  flightTicketCubit.reservationSortFunction(value: 3);
                  flightTicketCubit.selectPaymentTypeFunction(value, context);
                },
                text: S.of(context).ExpirationDate,
              ),
            ),
            const Spacer(),
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
