import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/widgets/check_box_widget.dart';
import 'package:bamobile1/widgets/text_spacer_widget_widget.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketCheckBoxesWidget extends StatelessWidget {
  const TicketCheckBoxesWidget({
    super.key,
    this.text,
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return Container(
          height: context.height * 0.12,
          width: context.width * 1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextSpacerWidgetWidget(
                  title: S.of(context).DirectFlights,
                  widget: CheckBoxWidget(
                    value: flightTicketCubit.onlyDirectFlightsCheckBoxValue,
                    onChanged: (value) {
                      flightTicketCubit.checkBoxesInFlightTicketView(
                          type: 0, newValue: value);
                      print(
                          'onlyDirectFlightsCheckBoxValue: ${flightTicketCubit.onlyDirectFlightsCheckBoxValue}');
                    },
                  ),
                ),
                // Divider(
                //   thickness: 1,
                //   color: Colors.grey.withOpacity(0.5),
                // ),
                // TextSpacerWidgetWidget(
                //   title: S.of(context).Returnable,
                //   widget: CheckBoxWidget(
                //     value: flightTicketCubit.onlyRefundableFlightsCheckBoxValue,
                //     onChanged: (value) {
                //       flightTicketCubit.checkBoxesInFlightTicketView(
                //           type: 'iade', newValue: value);
                //     },
                //   ),
                // ),

                Divider(
                  thickness: 1,
                  color: Colors.grey.withOpacity(0.5),
                ),
                TextSpacerWidgetWidget(
                  title: S.of(context).DetailedSearch,
                  widget: CheckBoxWidget(
                    value: flightTicketCubit.detailedSearchCheckBoxValue,
                    onChanged: (value) {
                      flightTicketCubit.checkBoxesInFlightTicketView(
                          type: 3, newValue: value);
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
