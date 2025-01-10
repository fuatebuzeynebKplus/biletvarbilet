import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MultiPointSearchCardWidget extends StatelessWidget {
  const MultiPointSearchCardWidget({
    super.key,
    required this.index,
  });

  final int index;
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
          padding: const EdgeInsets.only(bottom: 8),
          child: Stack(
            children: [
              Container(
                height: context.height * 0.15,
                width: context.width * 1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 32, left: 12, right: 12, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              flightTicketCubit
                                  .saveIndexForMultiPointSelectLegAndDateFunction(
                                      index: index);
                              flightTicketCubit.bottomSheetValue(type: 1);
                              flightTicketCubit
                                  .selectBetweenArriveAndDeparture = 0;
                            },
                            child: SizedBox(
                              width: context.width * 0.35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textAlign: TextAlign.start,
                                    isHaveOverflow: true,
                                    text: flightTicketCubit
                                            .listMultiPoint[index]
                                            .departureCityName ??
                                        'Nereden',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  TextWidget(
                                    text: flightTicketCubit
                                            .listMultiPoint[index]
                                            .departureCode ??
                                        S.of(context).DeparturePoint,
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 6,
                            ),
                            child: AnimatedRotation(
                              turns:
                                  flightTicketCubit.listMultiPoint[index].turns,
                              duration: const Duration(milliseconds: 500),
                              child: GestureDetector(
                                onTap: () {
                                  flightTicketCubit.toggleTextsForMultiPoint(
                                      index: index);
                                },
                                child: CircularIconWidget(
                                  size: 0.035,
                                  iconColor: AppColors.kSecondColor,
                                  borderColor: AppColors.kSecondColor,
                                  icon: Icons.swap_horiz,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              flightTicketCubit
                                  .saveIndexForMultiPointSelectLegAndDateFunction(
                                      index: index);
                              flightTicketCubit.bottomSheetValue(type: 1);
                              flightTicketCubit
                                  .selectBetweenArriveAndDeparture = 1;
                            },
                            child: SizedBox(
                              width: context.width * 0.35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextWidget(
                                    textAlign: TextAlign.end,
                                    isHaveOverflow: true,
                                    text: flightTicketCubit
                                            .listMultiPoint[index]
                                            .arrivalCityName ??
                                        'Nereye',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  TextWidget(
                                    text: flightTicketCubit
                                            .listMultiPoint[index]
                                            .arrivalCode ??
                                        S.of(context).Destination,
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          flightTicketCubit.selectDateTimeMultiPoint =
                              await showDatePicker(
                            helpText: S
                                .of(context)
                                .SelectDate, // Can be used as title
                            cancelText: S.of(context).Close,
                            confirmText: S.of(context).Select,
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(3000),
                            builder: (BuildContext context, Widget? child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme:
                                      Theme.of(context).colorScheme.copyWith(
                                            primary: AppColors
                                                .kSecondColor, // Set the select color
                                          ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          flightTicketCubit.datePickerForMultiPoint(
                              index: index);
                        },
                        child: flightTicketCubit
                                    .listMultiPoint[index].departureDate ==
                                null
                            ? TextWidget(
                                text: S.of(context).DepartureDate,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )
                            : TextWidget(
                                text: DateFormat('dd-MM-yyy').format(
                                    flightTicketCubit
                                        .listMultiPoint[index].departureDate!),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                    ),
                    color: Colors.black,
                  ),
                  height: 25,
                  width: 100,
                  child: Center(
                      child: TextWidget(
                    text: '${index + 1}.${S.of(context).Flight}',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
