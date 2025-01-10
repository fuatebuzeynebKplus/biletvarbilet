import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_passenger_fare.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/text_spacer_widget_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatDetailsBottomSheet extends StatelessWidget {
  const SeatDetailsBottomSheet({
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

    List<AirPassengerFare>? passengerDetailsLeaving;
    List<AirPassengerFare>? passengerDetailsReturn;
    if (flightTicketCubit.selectedSeatTypeLeaving == null &&
        flightTicketCubit.selectedSeatTypeReturn == null) {
      passengerDetailsLeaving = flightTicketCubit
          .afterRefreshFlightSearchResultsLeaving[
              flightTicketCubit.sendIndexValue!]
          .fares![0]
          .passengerFares;

      if (flightTicketCubit.searchTypeValue != 'tek') {
        passengerDetailsReturn = flightTicketCubit
            .afterRefreshFlightSearchResultsReturn[
                flightTicketCubit.sendIndexValueReturn!]
            .fares![0]
            .passengerFares;
      }
    } else {
      passengerDetailsLeaving = flightTicketCubit.flightFaresLeaving![0]
          .fares![flightTicketCubit.sendSeatIndexValue!].passengerFares;

      if (flightTicketCubit.searchTypeValue != 'tek') {
        passengerDetailsReturn = flightTicketCubit.flightFaresReturn![0]
            .fares![flightTicketCubit.sendSeatReturnIndexValue!].passengerFares;
      }
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
                itemCount: passengerDetailsLeaving!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      TextSpacerWidgetWidget(
                        title:
                            '${passengerDetailsLeaving![index].passengerType == PaxType.adult ? S.of(context).Adult : passengerDetailsLeaving[index].passengerType == PaxType.child ? S.of(context).Child : S.of(context).Baby}  X ${passengerDetailsLeaving[index].count.toString()}',
                        widget: Row(
                          children: [
                            flightTicketCubit.searchTypeValue != 'tek'
                                ? TextWidget(
                                    text: flightTicketCubit.formatNumber(currencyCodeCubit
                                            .convertToAppCurrency(
                                          itemPrice:
                                              passengerDetailsLeaving[index]
                                                  .totalPrice!
                                                  .totalAmount
                                                  .toDouble(),
                                          appCurrencyExchangeRate:
                                              currencyCodeCubit.currencyRate!,
                                          ticketCurrencyCode:
                                              passengerDetailsLeaving[index]
                                                  .totalPrice!
                                                  .currencyCode!,
                                        ) +
                                        (flightTicketCubit.returnGroupId == null
                                            ? (
                                                // التحقق من عملة رحلة العودة
                                                passengerDetailsReturn![index]
                                                            .totalPrice!
                                                            .currencyCode! ==
                                                        currencyCodeCubit
                                                            .currencyCodeValue
                                                    // إذا كانت العملة متطابقة، خصم السعر مباشرةً
                                                    ? passengerDetailsReturn[index]
                                                            .totalPrice!
                                                            .totalAmount
                                                            .toDouble() -
                                                        passengerDetailsLeaving[index]
                                                            .totalPrice!
                                                            .totalAmount
                                                            .toDouble()
                                                    // إذا كانت العملة مختلفة، نقوم بالتحويل أولاً
                                                    : currencyCodeCubit.convertToAppCurrency(itemPrice: passengerDetailsReturn[index].totalPrice!.totalAmount.toDouble(), appCurrencyExchangeRate: currencyCodeCubit.currencyRate!, ticketCurrencyCode: passengerDetailsReturn[index].totalPrice!.currencyCode!) -
                                                        currencyCodeCubit.convertToAppCurrency(
                                                            itemPrice: passengerDetailsLeaving[index]
                                                                .totalPrice!
                                                                .totalAmount
                                                                .toDouble(),
                                                            appCurrencyExchangeRate: currencyCodeCubit
                                                                .currencyRate!,
                                                            ticketCurrencyCode: passengerDetailsLeaving[index]
                                                                .totalPrice!
                                                                .currencyCode!))
                                            : (
                                                // إذا كان هناك Group ID للعودة، نتحقق من العملة ونحسب السعر
                                                passengerDetailsReturn![index].totalPrice!.currencyCode! == currencyCodeCubit.currencyCodeValue
                                                    ? passengerDetailsReturn[index]
                                                        .totalPrice!
                                                        .totalAmount
                                                        .toDouble()
                                                    : currencyCodeCubit.convertToAppCurrency(
                                                        itemPrice: passengerDetailsReturn[index].totalPrice!.totalAmount.toDouble(),
                                                        appCurrencyExchangeRate: currencyCodeCubit.currencyRate!,
                                                        ticketCurrencyCode: passengerDetailsReturn[index].totalPrice!.currencyCode!)))),
                                    color: Colors.grey,
                                  )
                                : TextWidget(
                                    text: flightTicketCubit.formatNumber(
                                        currencyCodeCubit.convertToAppCurrency(
                                            itemPrice:
                                                passengerDetailsLeaving[index]
                                                    .totalPrice!
                                                    .totalAmount
                                                    .toDouble(),
                                            appCurrencyExchangeRate:
                                                currencyCodeCubit.currencyRate!,
                                            ticketCurrencyCode:
                                                passengerDetailsLeaving[index]
                                                    .totalPrice!
                                                    .currencyCode!)),
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


/*

  // TextSpacerWidgetWidget(
                //   title: flightTicketCubit.childQuantity == 0
                //       ? S.of(context).Child
                //       : '${S.of(context).Child}  X${flightTicketCubit.childQuantity}',
                //   widget: Row(
                //     children: [
                //       TextWidget(
                //         text: flightTicketCubit.childQuantity == 0
                //             ? S.of(context).ThereIsNoChildren
                //             : '22.141,56  ',
                //         color: Colors.grey,
                //       ),
                //       TextWidget(
                //         fontSize: 12,
                //         text: flightTicketCubit.childQuantity == 0 ? '' : 'TRY',
                //         color: Colors.grey,
                //       ),
                //     ],
                //   ),
                // ),
                // Divider(
                //   thickness: 1,
                //   color: Colors.grey.withOpacity(0.5),
                // ),
                // TextSpacerWidgetWidget(
                //   title: flightTicketCubit.babyQuantity == 0
                //       ? S.of(context).Baby
                //       : '${S.of(context).Baby}  X${flightTicketCubit.babyQuantity}',
                //   widget: Row(
                //     children: [
                //       TextWidget(
                //         text: flightTicketCubit.babyQuantity == 0
                //             ? S.of(context).ThereIsNoBaby
                //             : '7.647,99  ',
                //         color: Colors.grey,
                //       ),
                //       TextWidget(
                //         fontSize: 12,
                //         text: flightTicketCubit.babyQuantity == 0 ? '' : 'TRY',
                //         color: Colors.grey,
                //       ),
                //     ],
                //   ),
                // ),

*/
