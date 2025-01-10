import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_passenger_fare.dart';
import 'package:bamobile1/flight/data/models/air_result.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/text_spacer_widget_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatDetailsForMultiPointBottomSheet extends StatelessWidget {
  const SeatDetailsForMultiPointBottomSheet({
    super.key,
    this.itIsPaymentView = false,
  });
  final bool itIsPaymentView;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    CurrencyCodeCubit currencyCodeCubit =
        BlocProvider.of<CurrencyCodeCubit>(context);
    List<AirResult> tt = [];
    if (flightTicketCubit.flightFaresMultiPointSelectedForSeparated != null &&
        flightTicketCubit
            .flightFaresMultiPointSelectedForSeparated!.isNotEmpty) {
      tt = flightTicketCubit.flightFaresMultiPointSelectedForSeparated!;
    } else {
      tt = flightTicketCubit.selectAirResultForMultiPointList;
    }

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BottomSheetWidget(
          height: 0.25,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: S.of(context).SeatDetails,
                  color: AppColors.kSecondColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                GestureDetector(
                  child: const Icon(Icons.close),
                  onTap: () {
                    //  flightTicketCubit.bottomSheetValue(type: 0);
                    if (itIsPaymentView == true) {
                      flightTicketCubit.bottomSheetValue(type: 6);
                    } else {
                      flightTicketCubit.bottomSheetValue(type: 7);
                    }
                  },
                )
              ],
            ),
          ),
          paddingTop: 14,
          paddingLeftRight: 14,
          widgetBody: Padding(
            padding: const EdgeInsets.only(
              left: 14,
              right: 14,
            ),
            child: SizedBox(
              height: context.height * 0.2,
              width: context.width * 1,
              child: ListView.builder(
                itemCount: flightTicketCubit.passengerDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      TextSpacerWidgetWidget(
                        title: 'X${flightTicketCubit.passengerDetails[index]} ',
                        widget: Row(
                          children: [
                            flightTicketCubit.listMultiPoint.length == 4
                                ? TextWidget(
                                    fontSize: 12,
                                    text: flightTicketCubit.formatNumber(flightTicketCubit
                                                .saveIndexFareForCombinedMultiPointValue ==
                                            null
                                        ? flightTicketCubit
                                                    .selectAirResultForMultiPointList
                                                    .last
                                                    .groupId![0] ==
                                                'P'
                                            ? currencyCodeCubit
                                                .convertToAppCurrency(
                                                itemPrice: tt
                                                    .first
                                                    .fares!
                                                    .first
                                                    .passengerFares![index]
                                                    .totalPrice!
                                                    .totalAmount
                                                    .toDouble(),
                                                appCurrencyExchangeRate:
                                                    currencyCodeCubit
                                                        .currencyRate!,
                                                ticketCurrencyCode: tt
                                                    .first
                                                    .fares!
                                                    .first
                                                    .passengerFares![index]
                                                    .totalPrice!
                                                    .currencyCode!,
                                              )
                                            : currencyCodeCubit
                                                    .convertToAppCurrency(
                                                  itemPrice: tt
                                                      .first
                                                      .fares!
                                                      .first
                                                      .passengerFares![index]
                                                      .totalPrice!
                                                      .totalAmount
                                                      .toDouble(),
                                                  appCurrencyExchangeRate:
                                                      currencyCodeCubit
                                                          .currencyRate!,
                                                  ticketCurrencyCode: tt
                                                      .first
                                                      .fares!
                                                      .first
                                                      .passengerFares![index]
                                                      .totalPrice!
                                                      .currencyCode!,
                                                ) +
                                                currencyCodeCubit
                                                    .convertToAppCurrency(
                                                  itemPrice: tt[1]
                                                      .fares!
                                                      .first
                                                      .passengerFares![index]
                                                      .totalPrice!
                                                      .totalAmount
                                                      .toDouble(),
                                                  appCurrencyExchangeRate:
                                                      currencyCodeCubit
                                                          .currencyRate!,
                                                  ticketCurrencyCode: tt[1]
                                                      .fares!
                                                      .first
                                                      .passengerFares![index]
                                                      .totalPrice!
                                                      .currencyCode!,
                                                ) +
                                                currencyCodeCubit
                                                    .convertToAppCurrency(
                                                  itemPrice: tt[2]
                                                      .fares!
                                                      .first
                                                      .passengerFares![index]
                                                      .totalPrice!
                                                      .totalAmount
                                                      .toDouble(),
                                                  appCurrencyExchangeRate:
                                                      currencyCodeCubit
                                                          .currencyRate!,
                                                  ticketCurrencyCode: tt[2]
                                                      .fares!
                                                      .first
                                                      .passengerFares![index]
                                                      .totalPrice!
                                                      .currencyCode!,
                                                ) +
                                                currencyCodeCubit
                                                    .convertToAppCurrency(
                                                  itemPrice: tt[3]
                                                      .fares!
                                                      .first
                                                      .passengerFares![index]
                                                      .totalPrice!
                                                      .totalAmount
                                                      .toDouble(),
                                                  appCurrencyExchangeRate:
                                                      currencyCodeCubit
                                                          .currencyRate!,
                                                  ticketCurrencyCode: tt[3]
                                                      .fares!
                                                      .first
                                                      .passengerFares![index]
                                                      .totalPrice!
                                                      .currencyCode!,
                                                )
                                        : currencyCodeCubit.convertToAppCurrency(
                                            itemPrice: flightTicketCubit
                                                .flightFaresMultiPointIfIsCombined!
                                                .first
                                                .fares![flightTicketCubit
                                                    .saveIndexFareForCombinedMultiPointValue!]
                                                .passengerFares![index]
                                                .totalPrice!
                                                .totalAmount
                                                .toDouble(),
                                            appCurrencyExchangeRate:
                                                currencyCodeCubit.currencyRate!,
                                            ticketCurrencyCode: flightTicketCubit
                                                .flightFaresMultiPointIfIsCombined!
                                                .first
                                                .fares![flightTicketCubit
                                                    .saveIndexFareForCombinedMultiPointValue!]
                                                .passengerFares![index]
                                                .totalPrice!
                                                .currencyCode!)),
                                    color: Colors.grey,
                                  )
                                : flightTicketCubit.listMultiPoint.length == 3
                                    ? TextWidget(
                                        fontSize: 12,
                                        text: flightTicketCubit.formatNumber(flightTicketCubit
                                                    .saveIndexFareForCombinedMultiPointValue ==
                                                null
                                            ? flightTicketCubit
                                                        .selectAirResultForMultiPointList
                                                        .last
                                                        .groupId![0] ==
                                                    'P'
                                                ? currencyCodeCubit
                                                    .convertToAppCurrency(
                                                    itemPrice: tt
                                                        .first
                                                        .fares!
                                                        .first
                                                        .passengerFares![index]
                                                        .totalPrice!
                                                        .totalAmount
                                                        .toDouble(),
                                                    appCurrencyExchangeRate:
                                                        currencyCodeCubit
                                                            .currencyRate!,
                                                    ticketCurrencyCode: tt
                                                        .first
                                                        .fares!
                                                        .first
                                                        .passengerFares![index]
                                                        .totalPrice!
                                                        .currencyCode!,
                                                  )
                                                : currencyCodeCubit
                                                        .convertToAppCurrency(
                                                      itemPrice: tt
                                                          .first
                                                          .fares!
                                                          .first
                                                          .passengerFares![
                                                              index]
                                                          .totalPrice!
                                                          .totalAmount
                                                          .toDouble(),
                                                      appCurrencyExchangeRate:
                                                          currencyCodeCubit
                                                              .currencyRate!,
                                                      ticketCurrencyCode: tt
                                                          .first
                                                          .fares!
                                                          .first
                                                          .passengerFares![
                                                              index]
                                                          .totalPrice!
                                                          .currencyCode!,
                                                    ) +
                                                    currencyCodeCubit
                                                        .convertToAppCurrency(
                                                      itemPrice: tt[1]
                                                          .fares!
                                                          .first
                                                          .passengerFares![
                                                              index]
                                                          .totalPrice!
                                                          .totalAmount
                                                          .toDouble(),
                                                      appCurrencyExchangeRate:
                                                          currencyCodeCubit
                                                              .currencyRate!,
                                                      ticketCurrencyCode: tt[1]
                                                          .fares!
                                                          .first
                                                          .passengerFares![
                                                              index]
                                                          .totalPrice!
                                                          .currencyCode!,
                                                    ) +
                                                    currencyCodeCubit
                                                        .convertToAppCurrency(
                                                      itemPrice: tt[2]
                                                          .fares!
                                                          .first
                                                          .passengerFares![
                                                              index]
                                                          .totalPrice!
                                                          .totalAmount
                                                          .toDouble(),
                                                      appCurrencyExchangeRate:
                                                          currencyCodeCubit
                                                              .currencyRate!,
                                                      ticketCurrencyCode: tt[2]
                                                          .fares!
                                                          .first
                                                          .passengerFares![
                                                              index]
                                                          .totalPrice!
                                                          .currencyCode!,
                                                    )
                                            : currencyCodeCubit.convertToAppCurrency(
                                                itemPrice: flightTicketCubit
                                                    .flightFaresMultiPointIfIsCombined!
                                                    .first
                                                    .fares![flightTicketCubit
                                                        .saveIndexFareForCombinedMultiPointValue!]
                                                    .passengerFares![index]
                                                    .totalPrice!
                                                    .totalAmount
                                                    .toDouble(),
                                                appCurrencyExchangeRate:
                                                    currencyCodeCubit
                                                        .currencyRate!,
                                                ticketCurrencyCode: flightTicketCubit
                                                    .flightFaresMultiPointIfIsCombined!
                                                    .first
                                                    .fares![flightTicketCubit
                                                        .saveIndexFareForCombinedMultiPointValue!]
                                                    .passengerFares![index]
                                                    .totalPrice!
                                                    .currencyCode!)),
                                        color: Colors.grey,
                                      )
                                    : TextWidget(
                                        fontSize: 12,
                                        text: flightTicketCubit.formatNumber(flightTicketCubit.saveIndexFareForCombinedMultiPointValue ==
                                                null
                                            ? flightTicketCubit.selectAirResultForMultiPointList.last.groupId![0] ==
                                                    'P'
                                                ? currencyCodeCubit.convertToAppCurrency(
                                                    itemPrice: tt
                                                        .first
                                                        .fares![0]
                                                        .passengerFares![index]
                                                        .totalPrice!
                                                        .totalAmount
                                                        .toDouble(),
                                                    appCurrencyExchangeRate:
                                                        currencyCodeCubit
                                                            .currencyRate!,
                                                    ticketCurrencyCode: tt
                                                        .first
                                                        .fares!
                                                        .first
                                                        .passengerFares![index]
                                                        .totalPrice!
                                                        .currencyCode!)
                                                : currencyCodeCubit.convertToAppCurrency(itemPrice: tt.first.fares![0].passengerFares![index].totalPrice!.totalAmount.toDouble(), appCurrencyExchangeRate: currencyCodeCubit.currencyRate!, ticketCurrencyCode: tt.first.fares!.first.passengerFares![index].totalPrice!.currencyCode!) +
                                                    currencyCodeCubit.convertToAppCurrency(
                                                        itemPrice: tt[1].fares!.first.passengerFares![index].totalPrice!.totalAmount.toDouble(),
                                                        appCurrencyExchangeRate: currencyCodeCubit.currencyRate!,
                                                        ticketCurrencyCode: tt[1].fares!.first.passengerFares![index].totalPrice!.currencyCode!)
                                            : currencyCodeCubit.convertToAppCurrency(itemPrice: flightTicketCubit.flightFaresMultiPointIfIsCombined!.first.fares![flightTicketCubit.saveIndexFareForCombinedMultiPointValue!].passengerFares![index].totalPrice!.totalAmount.toDouble(), appCurrencyExchangeRate: currencyCodeCubit.currencyRate!, ticketCurrencyCode: flightTicketCubit.flightFaresMultiPointIfIsCombined!.first.fares![flightTicketCubit.saveIndexFareForCombinedMultiPointValue!].passengerFares![index].totalPrice!.currencyCode!)),
                                        color: Colors.grey,
                                      ),
                            TextWidget(
                              fontSize: 12,
                              text: '  ${currencyCodeCubit.currencyCodeValue}',
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
