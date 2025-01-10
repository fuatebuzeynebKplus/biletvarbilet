import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/widgets/text_field_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IdentityNumberWidget extends StatelessWidget {
  const IdentityNumberWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: S.of(context).IdentityNumber,
              fontSize: 14,
              color: Colors.black54,
            ),
            SizedBox(
              height: 35,
              child: TextFieldWidget(
                  contentPadding: const EdgeInsets.only(bottom: 4),
                  initialValue: flightTicketCubit
                              .passengerCardDataList.isNotEmpty &&
                          index <
                              flightTicketCubit.passengerCardDataList.length &&
                          flightTicketCubit.passengerCardDataList[index] != null
                      ? flightTicketCubit
                              .passengerCardDataList[index]!.identityNumber ??
                          ''
                      : '',
                  textInputType: TextInputType.number,
                  onChanged: (value) {
                    flightTicketCubit.identityNo = value;
                  }),
            )
          ],
        );
      },
    );
  }
}
