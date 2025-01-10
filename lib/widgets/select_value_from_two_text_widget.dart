import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectValueFromTwoTextWidget extends StatelessWidget {
  const SelectValueFromTwoTextWidget({
    super.key,
    required this.firstText,
    required this.secondText,
    this.width = 1,
  });
  final String firstText;
  final String secondText;
  final double width;
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
          width: context.width * width,
          height: context.height * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.grey.shade200,
          ),
          child: SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  borderCircularValue: 14,
                  title: firstText,
                  height: context.height * 0.049,
                  width: width / 2,
                  fontSize: 14,
                  textColor: Colors.black,
                  color:
                      flightTicketCubit.selectBetweenTwoTextValue == firstText
                          ? Colors.white
                          : Colors.grey.shade200,
                  border:
                      flightTicketCubit.selectBetweenTwoTextValue == firstText
                          ? Border.all(color: AppColors.kSecondColor)
                          : null,
                  onTap: () {
                    if (flightTicketCubit.selectBetweenTwoTextValue !=
                        firstText) {
                      flightTicketCubit.selectBetweenTwoTextFunction(
                          firstText: firstText, secondText: secondText);
                    }
                  },
                ),
                ButtonWidget(
                  borderCircularValue: 14,
                  title: secondText,
                  height: context.height * 0.049,
                  width: width / 2,
                  fontSize: 14,
                  textColor: Colors.black,
                  color:
                      flightTicketCubit.selectBetweenTwoTextValue != firstText
                          ? Colors.white
                          : Colors.grey.shade200,
                  border:
                      flightTicketCubit.selectBetweenTwoTextValue != firstText
                          ? Border.all(color: AppColors.kSecondColor)
                          : null,
                  onTap: () {
                    if (flightTicketCubit.selectBetweenTwoTextValue !=
                        secondText) {
                      flightTicketCubit.selectBetweenTwoTextFunction(
                          firstText: firstText, secondText: secondText);
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
