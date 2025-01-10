import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/widgets/select_value_from_two_text_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/close_and_apply_widget.dart';
import 'package:bamobile1/widgets/text_spacer_widget_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketAdultChildBabyQuantityBottomSheet extends StatelessWidget {
  const TicketAdultChildBabyQuantityBottomSheet({
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
        return BottomSheetWidget(
          height: 0.5,
          heightBetweenBodyAndClose: 1.3,
          title: TextWidget(
            text: S.of(context).PassengerAndCabinSelection,
            color: AppColors.kSecondColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          //   closeApply: const CloseAndApplyWidget(),
          widgetBody: Column(
            children: [
              SelectValueFromTwoTextWidget(
                width: 0.92,
                firstText: S.of(context).Economy,
                secondText: S.of(context).Business,
              ),
              const SizedBox(
                height: 12,
              ),
              TextSpacerWidgetWidget(
                title: S.of(context).Adult,
                fontSize: 16,
                color: Colors.black,
                widget: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        flightTicketCubit.removeValue(type: 1);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColors.kSecondColor),
                        height: context.height * 0.4,
                        width: context.height * 0.037,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          (flightTicketCubit.adultQuantity).toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        flightTicketCubit.incrementValue(
                          type: 1,
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColors.kSecondColor),
                        height: context.height * 0.4,
                        width: context.height * 0.037,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
              const SizedBox(
                height: 6,
              ),
              TextSpacerWidgetWidget(
                title: S.of(context).Child,
                fontSize: 16,
                color: Colors.black,
                widget: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        flightTicketCubit.removeValue(type: 2);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColors.kSecondColor),
                        height: context.height * 0.4,
                        width: context.height * 0.037,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          (flightTicketCubit.childQuantity).toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        flightTicketCubit.incrementValue(type: 2);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColors.kSecondColor),
                        height: context.height * 0.4,
                        width: context.height * 0.037,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                color: Colors.grey.withOpacity(0.5),
              ),
              const SizedBox(
                height: 6,
              ),
              TextSpacerWidgetWidget(
                title: S.of(context).Baby,
                fontSize: 16,
                color: Colors.black,
                widget: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        flightTicketCubit.removeValue(type: 3);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColors.kSecondColor),
                        height: context.height * 0.4,
                        width: context.height * 0.037,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          (flightTicketCubit.babyQuantity).toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (flightTicketCubit.babyQuantity ==
                            flightTicketCubit.adultQuantity) {
                          SnackbarUtils.showSnackbar(
                              context,
                              S
                                  .of(context)
                                  .TheNumberOfBabiesCannotExceedTheNumberOfAdults);
                        } else {
                          flightTicketCubit.incrementValue(type: 3);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColors.kSecondColor),
                        height: context.height * 0.4,
                        width: context.height * 0.037,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.height * 0.11,
              ),
              CloseAndApplyWidget(
                onTapClose: () {
                  BlocProvider.of<FlightTicketCubit>(context)
                      .bottomSheetValue(type: 0);
                },
                onTapApPly: () {
                  BlocProvider.of<FlightTicketCubit>(context)
                      .bottomSheetValue(type: 0);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
