import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SelectPriceHourDurationForFilterBottomSheetWidget
    extends StatelessWidget {
  const SelectPriceHourDurationForFilterBottomSheetWidget({
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
            GestureDetector(
              onTap: () {
                flightTicketCubit.bottomSheetValue(type: 13);
              },
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: S.of(context).PriceRange,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    Container(
                      //  color: Colors.red,
                      child: Row(
                        children: [
                          TextWidget(
                              text: flightTicketCubit.highestPriceInFilter == 0
                                  ? flightTicketCubit.lowestPriceInFilter == 0
                                      ? '${S.of(context).Select} ${S.of(context).PriceRange}'
                                      : '${flightTicketCubit.lowestPriceInFilter} ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue} - ${flightTicketCubit.highestPriceInFilter} ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue} '
                                  : '${flightTicketCubit.lowestPriceInFilter} ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}  - ${flightTicketCubit.highestPriceInFilter} ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue} ',
                              color: AppColors.kSecondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              flightTicketCubit.clearAll(type: 'price');
                            },
                            child: TextWidget(
                              text: 'clear',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kSecondColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                flightTicketCubit.bottomSheetValue(type: 14);
              },
              child: Container(
                width: context.width * 1,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: S.of(context).Hours,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    Row(
                      //  crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              //  width: context.width * 0.45,
                              child: TextWidget(
                                  text: flightTicketCubit
                                              .flyingFirstHourInFilter !=
                                          null
                                      ? DateFormat('HH:mm').format(DateTime.parse(
                                          '${flightTicketCubit.flyingFirstHourInFilter!}'))
                                      : '${S.of(context).Select} ${S.of(context).Hours}',
                                  color: AppColors.kSecondColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(
                          // width: context.width * 0.45,
                          child: TextWidget(
                              text: flightTicketCubit.flyingFirstHourInFilter !=
                                      null
                                  ? DateFormat(' - HH:mm').format(
                                      flightTicketCubit
                                          .flyingSecondHourInFilter!)
                                  : '',
                              color: AppColors.kSecondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            flightTicketCubit.clearAll(type: 'time');
                          },
                          child: TextWidget(
                            text: 'clear',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kSecondColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                flightTicketCubit.bottomSheetValue(type: 16);
              },
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: S.of(context).TimeOfFlight,
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          child: TextWidget(
                            text: flightTicketCubit
                                        .flyingDurationFirstInFilter !=
                                    null
                                ? '${flightTicketCubit.flyingDurationFirstInFilter!.inHours} ${S.of(context).HourAnd} '
                                    '${(flightTicketCubit.flyingDurationFirstInFilter!.inMinutes % 60)} ${S.of(context).Min}'
                                : '${S.of(context).Select} ${S.of(context).TimeOfFlight}',
                            color: AppColors.kSecondColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            flightTicketCubit.clearAll(type: 'time');
                          },
                          child: TextWidget(
                            text: 'clear',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kSecondColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    const Divider()
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
