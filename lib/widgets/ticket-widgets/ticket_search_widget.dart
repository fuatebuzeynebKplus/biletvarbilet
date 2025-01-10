import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketSearchWidget extends StatelessWidget {
  const TicketSearchWidget({
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
        return Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Stack(
            children: [
              Container(
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: context.height * 0.12,
                      width: context.width * 0.455,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 12, right: 12, bottom: 8),
                        child: GestureDetector(
                          onTap: () {
                            flightTicketCubit.bottomSheetValue(type: 1);
                            flightTicketCubit.selectBetweenArriveAndDeparture =
                                0;
                          },
                          child: Container(
                            width: context.width * 0.35,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  textAlign: TextAlign.center,
                                  isHaveOverflow: true,
                                  text: flightTicketCubit.firstSearchCity ??
                                      S.of(context).From,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextWidget(
                                  text: flightTicketCubit.firstCityCode ??
                                      S.of(context).DeparturePoint,
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Expanded widget around the middle Container
                    Expanded(
                      child: Container(
                        height: context.height * 0.04,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: context.height * 0.12,
                      width: context.width * 0.455,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 8, left: 12, right: 12, bottom: 8),
                        child: GestureDetector(
                          onTap: () {
                            flightTicketCubit.bottomSheetValue(type: 1);
                            flightTicketCubit.selectBetweenArriveAndDeparture =
                                1;
                          },
                          child: Container(
                            width: context.width * 0.35,
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  textAlign: TextAlign.center,
                                  isHaveOverflow: true,
                                  text: flightTicketCubit.secondSearchCity ??
                                      S.of(context).To,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                TextWidget(
                                  text: flightTicketCubit.secondCityCode ??
                                      S.of(context).Destination,
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: context.height * 0.0425,
                left: context.width * 0.435,
                child: Container(
                  child: AnimatedRotation(
                    turns: flightTicketCubit.turns,
                    duration: const Duration(milliseconds: 500),
                    child: GestureDetector(
                      onTap: () {
                        if (flightTicketCubit.firstSearchCity == null ||
                            flightTicketCubit.secondSearchCity == null) {
                          null;
                        } else {
                          flightTicketCubit.toggleTexts();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CircularIconWidget(
                          size: 0.024,
                          iconColor: AppColors.kSecondColor,
                          borderColor: AppColors.kSecondColor,
                          icon: Icons.swap_horiz,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
