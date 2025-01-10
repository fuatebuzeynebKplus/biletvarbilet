import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioForPaymentTypeWidget extends StatelessWidget {
  const RadioForPaymentTypeWidget({
    super.key,
    required this.text,
    required this.onChanged,
  });
  final String text;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return SizedBox(
          height: context.height * 0.033,
          child: Radio(
              value: text,
              groupValue: flightTicketCubit.selectPaymentType,
              activeColor: AppColors.kSecondColor,
              onChanged: onChanged),
        );
      },
    );
  }
}
