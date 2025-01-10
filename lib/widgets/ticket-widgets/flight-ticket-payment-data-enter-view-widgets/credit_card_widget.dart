import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({
    super.key,
  });

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
          borderColor:
              flightTicketCubit.selectPaymentType == S.of(context).CreditCard
                  ? AppColors.kSecondColor
                  : Colors.transparent,
          onTap: () {
            flightTicketCubit.selectPaymentTypeFunction(
                S.of(context).CreditCard, context);
            flightTicketCubit.bottomSheetValue(type: 18);
          },
          // height: flightTicketCubit.radioForPaymentType ==
          //         S.of(context).CreditCard
          //     ? 0.735
          //     : 0.07,
          isShadow: true,
          text: S.of(context).CreditCard,
          leading: const Icon(
            Icons.credit_card,
            color: Colors.black45,
            size: 25,
          ),
        );
      },
    );
  }
}


/*





*/