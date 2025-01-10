import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_images.dart';

import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/icon_button_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TicketDetailsWidget extends StatelessWidget {
  const TicketDetailsWidget({
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
        return Column(
          children: [
            flightTicketCubit.searchTypeValue == 'cok'
                ? const SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButtonWidget(
                        height: 0.09,
                        width: 0.46,
                        iconColor: AppColors.kSecondColor,
                        widgetButton: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            flightTicketCubit.isSelectOneWay == true
                                ? TextWidget(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    text: DateFormat('dd-MM-yyy').format(
                                        flightTicketCubit.dateTime ??
                                            DateTime.now()))
                                : TextWidget(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    text: DateFormat('dd-MM-yyy').format(
                                        flightTicketCubit
                                            .dateTimeRange!.start)),
                            TextWidget(
                              text: S.of(context).DepartureDate,
                              fontSize: 12,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        onTap: () async {
                          flightTicketCubit.searchTypeValue == 'tek'
                              ? flightTicketCubit.dateTime =
                                  await showDatePicker(
                                  helpText: S
                                      .of(context)
                                      .SelectDate, // Can be used as title
                                  cancelText: S.of(context).Close,
                                  confirmText: S.of(context).Select,
                                  context: context,
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(3000),
                                  builder:
                                      (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: Theme.of(context)
                                            .colorScheme
                                            .copyWith(
                                              primary: AppColors
                                                  .kSecondColor, // Set the select color
                                            ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                )
                              : flightTicketCubit.searchTypeValue == 'gidis'
                                  ? flightTicketCubit.dateTimeRange =
                                      await showDateRangePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                      helpText: S
                                          .of(context)
                                          .SelectDate, // Can be used as title
                                      cancelText: S.of(context).Close,
                                      confirmText: S.of(context).Select,
                                      //  flightTicketCubit.selectDateTimeRange.start,
                                      lastDate: DateTime(3000),
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return Theme(
                                          data: Theme.of(context).copyWith(
                                            colorScheme: Theme.of(context)
                                                .colorScheme
                                                .copyWith(
                                                  primary: AppColors
                                                      .kSecondColor, // Set the select color
                                                  //onPrimary: Colors.white,
                                                ),
                                          ),
                                          child: child!,
                                        );
                                      },
                                    )
                                  : null;
                          if (flightTicketCubit.dateTimeRange != null &&
                              flightTicketCubit.searchTypeValue == 'gidis') {
                            flightTicketCubit.isSelectOneWay = false;
                            flightTicketCubit.dateRangePicker();
                          } else if (flightTicketCubit.dateTime != null) {
                            flightTicketCubit.isSelectOneWay = true;
                            flightTicketCubit.datePicker();
                          }
                        },
                      ),
                      IconButtonWidget(
                        height: 0.09,
                        width: 0.46,
                        iconColor: flightTicketCubit.searchTypeValue == 'gidis'
                            ? AppColors.kSecondColor
                            : flightTicketCubit.searchTypeValue == 'cok'
                                ? AppColors.kSecondColor
                                : Colors.grey,
                        widgetButton: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            flightTicketCubit.dateTimeRange == null
                                ? const TextWidget(
                                    text: '--- -- ----',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  )
                                : TextWidget(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    text: flightTicketCubit.searchTypeValue ==
                                            'tek'
                                        ? '--- -- ----'
                                        : flightTicketCubit.dateTimeRange ==
                                                null
                                            ? '--- -- ----'
                                            : DateFormat('dd-MM-yyy').format(
                                                flightTicketCubit
                                                    .dateTimeRange!.end),
                                  ),
                            TextWidget(
                              text: S.of(context).ReturnDate,
                              fontSize: 12,
                              color: Colors.grey,
                            )
                          ],
                        ),
                        onTap: () async {
                          flightTicketCubit.searchType(value: 'gidis');
                          flightTicketCubit.dateTimeRange =
                              await showDateRangePicker(
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
                                            //onPrimary: Colors.white,
                                          ),
                                ),
                                child: child!,
                              );
                            },
                          );

                          if (flightTicketCubit.dateTimeRange != null) {
                            flightTicketCubit.isSelectOneWay = false;
                            flightTicketCubit.dateRangePicker();
                          }
                        },
                      ),
                    ],
                  ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtonWidget(
                  icon: AppImages.userIcon,
                  iconSize: 28,
                  iconColor: AppColors.kSecondColor,
                  height: 0.09,
                  width: 0.46,
                  widgetButton: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextWidget(
                        text:
                            '${flightTicketCubit.adultQuantity + flightTicketCubit.childQuantity + flightTicketCubit.babyQuantity}'
                            ' ${S.of(context).Passenger}',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      TextWidget(
                        text: S.of(context).PassengerAndCabin,
                        fontSize: 12,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  onTap: () {
                    flightTicketCubit.bottomSheetValue(type: 2);
                  },
                ),
                Center(
                  child: IconButtonWidget(
                    icon: null,
                    iconSize: 45,
                    iconColor: Colors.white,
                    height: 0.09,
                    width: 0.46,
                    widgetButton: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: S.of(context).Markup,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        TextWidget(
                          text: flightTicketCubit.typeIsAmount == true
                              ? (flightTicketCubit.amount != null &&
                                      flightTicketCubit.amount != ''
                                  ? '${flightTicketCubit.amount} ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}'
                                  : '')
                              : (flightTicketCubit.percent != null &&
                                      flightTicketCubit.percent != ''
                                  ? '${flightTicketCubit.percent} %'
                                  : ''),
                          fontSize: 12,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    onTap: () {
                      flightTicketCubit.bottomSheetValue(type: 3);
                    },
                  ),
                ),
                // ButtonWidget(
                //   title: S.of(context).Markup,
                //   height: 0.09,
                //   width: 0.46,
                //   fontSize: 16,
                //   fontWeight: FontWeight.bold,
                //   textColor: Colors.black,
                //   onTap: () {
                //     flightTicketCubit.bottomSheetValue(type: 3);
                //   },

                // ),
              ],
            ),
          ],
        );
      },
    );
  }
}

// first calendar method very important

/*
flightTicketCubit.searchTypeValue == 'tek'
                          ? TextWidget(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              text: flightTicketCubit.dateTime == null
                                  ? '--- -- ----'
                                  : flightTicketCubit.dateTimeRange != null
                                      ? DateFormat('MMM-dd-yyy').format(
                                          flightTicketCubit
                                              .dateTimeRange!.start)
                                      : DateFormat('MMM-dd-yyy')
                                          .format(flightTicketCubit.dateTime!),
                            )
                          : flightTicketCubit.searchTypeValue == 'gidis'
                              ? TextWidget(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  text:
                                      flightTicketCubit.dateTimeRange?.start ==
                                              null
                                          ? '--- -- ----'
                                          : DateFormat('MMM-dd-yyy').format(
                                              flightTicketCubit
                                                  .dateTimeRange!.start),
                                )
                              : const TextWidget(
                                  text: '//////',
                                ),
                      const TextWidget(
                        text: 'Gidiş Tarihi',
                        fontSize: 12,
                        color: Colors.grey,
                      )













                         onTap: () async {
                    flightTicketCubit.searchTypeValue == 'tek'
                        ? flightTicketCubit.dateTime = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(3000),
                          )
                        : flightTicketCubit.searchTypeValue == 'gidis'
                            ? flightTicketCubit.dateTimeRange =
                                await showDateRangePicker(
                                context: context,
                                firstDate:
                                    flightTicketCubit.selectDateTimeRange.start,
                                lastDate: DateTime(3000),
                              )
                            : null;
                    if (flightTicketCubit.dateTimeRange != null) {
                      flightTicketCubit.dateRangePicker();
                    } else if (flightTicketCubit.dateTime != null) {
                      flightTicketCubit.datePicker();
                    }
                  },
*/


/*
flightTicketCubit.dateTimeRange == null
                          ? const TextWidget(
                              text: '--- -- ----',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )
                          : TextWidget(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              text: flightTicketCubit.searchTypeValue == 'tek'
                                  ? '--- -- ----'
                                  : flightTicketCubit.dateTimeRange == null
                                      ? '--- -- ----'
                                      : DateFormat('MMM-dd-yyy').format(
                                          flightTicketCubit.dateTimeRange!.end),
                            ),
                      const TextWidget(
                        text: 'Dönüş Tarihi',
                        fontSize: 12,
                        color: Colors.grey,
                      )








                             onTap: () async {
                    flightTicketCubit.searchTypeValue == 'tek'
                        ? null
                        : flightTicketCubit.dateTimeRange =
                            await showDateRangePicker(
                            context: context,
                            firstDate:
                                flightTicketCubit.selectDateTimeRange.start,
                            lastDate: DateTime(3000),
                          );
                    if (flightTicketCubit.dateTimeRange != null) {
                      flightTicketCubit.dateRangePicker();
                    }
                  },


*/