import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlternativeCardWidget extends StatelessWidget {
  const AlternativeCardWidget({super.key});

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
                S.of(context).AlternativePayment, context);
            flightTicketCubit.bottomSheetValue(type: 21);
          },
          borderColor: flightTicketCubit.selectPaymentType ==
                  S.of(context).AlternativePayment
              ? AppColors.kSecondColor
              : Colors.transparent,
          isShadow: true,
          text: S.of(context).AlternativePayment,
          leading: const Icon(
            Icons.wallet,
            color: Colors.black45,
            size: 25,
          ),
        );
      },
    );
  }
}
