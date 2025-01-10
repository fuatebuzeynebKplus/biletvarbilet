import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonsForFilterBottomSheetWidget extends StatelessWidget {
  const ButtonsForFilterBottomSheetWidget({
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
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonWidget(
              border: Border.all(
                  color: flightTicketCubit.searchTypeForListInFilter == 'tek'
                      ? AppColors.kSecondColor
                      : Colors.black45),
              title: '1.ucuç',
              height: 0.04,
              width: 0.4,
              fontSize: 14,
              textColor: Colors.black,
              onTap: () {
                if (flightTicketCubit.selectedCardLeaving != null) {
                  flightTicketCubit.selectedCardLeaving = null;
                  flightTicketCubit.isVisibility = false;
                  flightTicketCubit.searchLeavingOrReturnListFunction(
                      searchType: 'tek');
                } else {
                  flightTicketCubit.searchLeavingOrReturnListFunction(
                      searchType: 'tek');
                }
              },
            ),
            ButtonWidget(
              border: Border.all(
                  color: flightTicketCubit.searchTypeForListInFilter == 'donus'
                      ? AppColors.kSecondColor
                      : Colors.black45),
              title: '2.ucuç',
              height: 0.04,
              width: 0.4,
              fontSize: 14,
              textColor: Colors.black,
              onTap: () {
                flightTicketCubit.searchLeavingOrReturnListFunction(
                    searchType: 'donus');
              },
            ),
          ],
        );
      },
    );
  }
}
