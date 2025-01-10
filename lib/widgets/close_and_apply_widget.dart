import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CloseAndApplyWidget extends StatelessWidget {
  const CloseAndApplyWidget({
    super.key,
    required this.onTapClose,
    required this.onTapApPly,
  });

  final Function() onTapClose;
  final Function() onTapApPly;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(
              title: S.of(context).Close,
              height: 0.07,
              width: 0.44,
              fontSize: 16,
              textColor: AppColors.kSecondColor,
              fontWeight: FontWeight.bold,
              border: Border.all(color: AppColors.kSecondColor),
              onTap: onTapClose,
            ),
            ButtonWidget(
              onTap: onTapApPly,
              title: S.of(context).Apply,
              height: 0.07,
              width: 0.44,
              fontSize: 16,
              textColor: Colors.white,
              fontWeight: FontWeight.bold,
              color: AppColors.kSecondColor,
            ),
          ],
        );
      },
    );
  }
}
