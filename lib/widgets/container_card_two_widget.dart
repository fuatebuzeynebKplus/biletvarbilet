import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_alternative_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerCardTwoWidget extends StatelessWidget {
  const ContainerCardTwoWidget({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return GestureDetector(
          onTap: () {
            flightTicketCubit.selectRadioForAlternativeTypeFunction(
              text,
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: context.height * 0.04,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 0.2,
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 2,
                  color: flightTicketCubit.radioForAlternativeType == text
                      ? AppColors.kSecondColor
                      : Colors.transparent,
                ),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  image,
                  height: 20,
                ),
                Row(
                  children: [
                    const TextWidget(
                      text: '5.488,49  TRY',
                      color: Colors.black45,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    RadioForAlternativeTypeWidget(
                      text: text,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
