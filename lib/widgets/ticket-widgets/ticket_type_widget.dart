import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-multi-point-all-widgets/flight_ticket_multi_point_card.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketTypeWidget extends StatelessWidget {
  const TicketTypeWidget({
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
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonWidget(
              title: S.of(context).OneDirection,
              height: 0.04,
              width: 0.3,
              fontSize: 12,
              textColor: flightTicketCubit.searchTypeValue == 'tek'
                  ? AppColors.kSecondColor
                  : Colors.black54,
              border: flightTicketCubit.searchTypeValue == 'tek'
                  ? Border.all(color: AppColors.kSecondColor)
                  : null,
              onTap: () {
                flightTicketCubit.searchType(value: 'tek');
              },
            ),
            ButtonWidget(
              horizontalPadding: 10,
              title: S.of(context).DepartureReturn,
              height: 0.04,
              width: 0.3,
              fontSize: 12,
              textColor: flightTicketCubit.searchTypeValue == 'gidis'
                  ? AppColors.kSecondColor
                  : Colors.black54,
              border: flightTicketCubit.searchTypeValue == 'gidis'
                  ? Border.all(color: AppColors.kSecondColor)
                  : null,
              onTap: () {
                flightTicketCubit.searchType(value: 'gidis');
              },
            ),
            ButtonWidget(
              title: S.of(context).MultiPoint,
              height: 0.04,
              width: 0.3,
              fontSize: 12,
              textColor: flightTicketCubit.searchTypeValue == 'cok'
                  ? AppColors.kSecondColor
                  : Colors.black54,
              border: flightTicketCubit.searchTypeValue == 'cok'
                  ? Border.all(color: AppColors.kSecondColor)
                  : null,
              onTap: () {
                flightTicketCubit.searchType(value: 'cok');
                // Navigator.pushNamed(context, MultiPointView.id);
              },
            ),
          ],
        );
      },
    );
  }
}
