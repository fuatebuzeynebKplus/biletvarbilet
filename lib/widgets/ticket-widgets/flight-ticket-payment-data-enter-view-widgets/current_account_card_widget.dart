import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrentAccountCardWidget extends StatelessWidget {
  const CurrentAccountCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return ContainerCardWidget(
          onTap: () {
            flightTicketCubit.selectPaymentTypeFunction(
                S.of(context).Current, context);
            flightTicketCubit.bottomSheetValue(type: 6);
            // flightTicketCubit.bottomSheetValue(type: 19);
          },
          borderColor:
              flightTicketCubit.selectPaymentType == S.of(context).Current
                  ? AppColors.kSecondColor
                  : Colors.transparent,
          isShadow: true,
          text: S.of(context).Current,
          leading: const Icon(
            Icons.payments,
            color: Colors.black45,
            size: 25,
          ),
        );
      },
    );
  }
}
