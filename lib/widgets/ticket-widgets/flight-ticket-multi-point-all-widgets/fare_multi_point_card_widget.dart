import 'package:bamobile1/common/data/enums/inclusion_type.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_fare_service.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FareMultiPointCardWidget extends StatelessWidget {
  const FareMultiPointCardWidget(
      {super.key,
      required this.color,
      required this.index,
      required this.isSelected,
      required this.subIndex});
  final Color color;
  final int index;
  final bool isSelected;
  final int subIndex;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    dynamic farePrice = flightTicketCubit
        .flightFaresMultiPointIfIsSeparated![index][subIndex]
        .fares![0]
        .totalPrice!
        .totalAmount
        .toDouble();
    // Example fare price
    dynamic fareCurrencyCode = flightTicketCubit
        .flightFaresMultiPointIfIsSeparated![index][subIndex]
        .fares![0]
        .totalPrice!
        .currencyCode;
    // Dummy data
    dynamic fareTitle = flightTicketCubit
        .flightFaresMultiPointIfIsSeparated![index][subIndex]
        .fares!
        .first
        .title;

    List<AirFareService>? fareServices;

    fareServices = flightTicketCubit
            .flightFaresMultiPointIfIsSeparated![index][subIndex]
            .fares!
            .first
            .fareAlternativeLegs![0]
            .fareServices ??
        [];

    List<String> filteredFareServices = [];

    for (var fare in fareServices) {
      if (fare.inclusionType == InclusionType.included) {
        filteredFareServices.add(fare.title ?? '');
      }
    } // Example fare list
// Example currency code

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            width: context.width * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: color, // Example color
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      flightTicketCubit.saveIndexForList(
                          selectedIndex: subIndex);
                      print(
                          'flightFaresMultiPointIfIsSeparated ${flightTicketCubit.flightFaresMultiPointIfIsSeparated![1].length}');
                      flightTicketCubit
                          .selectListFareIndexForMultiPointFunction(
                              price: BlocProvider.of<CurrencyCodeCubit>(context)
                                  .convertToAppCurrency(
                                      itemPrice: farePrice,
                                      appCurrencyExchangeRate:
                                          BlocProvider.of<CurrencyCodeCubit>(
                                                  context)
                                              .currencyRate!,
                                      ticketCurrencyCode: fareCurrencyCode),
                              howList: index,
                              index: subIndex,
                              isSelected: isSelected,
                              airResult: flightTicketCubit
                                      .flightFaresMultiPointIfIsSeparated![
                                  index][subIndex]);
                      // flightTicketCubit.sendSeatReturnIndexFunction(
                      //   index: 0,
                      // );
                      // flightTicketCubit.selectedSeatTypeReturnFunction(
                      //     value: 0);
                      // flightTicketCubit.priceAmountFunction(
                      //   context: context,
                      //   priceTwo: farePrice,
                      //   priceOne: flightTicketCubit.priceValueForFare,
                      //   currencyCodeOne:
                      //       flightTicketCubit.currencyCodeForOneValue,
                      //   currencyCodeTwo: fareCurrencyCode,
                      // );
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 8, bottom: 8),
                      width: context.width * 0.1,
                      margin: const EdgeInsets.only(left: 10),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(6),
                            bottomRight: Radius.circular(6)),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    textAlign: TextAlign.start,
                                    isHaveOverflow: true,
                                    text: (fareTitle?.isEmpty ?? true)
                                        ? 'STANDARD'
                                        : fareTitle!,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Wrap(
                                      spacing: 2.0,
                                      children: List.generate(
                                        filteredFareServices.length,
                                        (index) => Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextWidget(
                                              text: filteredFareServices[index]
                                                          .length >
                                                      35
                                                  ? '${filteredFareServices[index].substring(0, 35)}...'
                                                  : filteredFareServices[index],
                                              fontSize: 10,
                                            ),
                                            if (index !=
                                                filteredFareServices.length - 1)
                                              const TextWidget(
                                                text: ' | ',
                                                fontSize: 12,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextWidget(
                                          text: flightTicketCubit.formatNumber(
                                              BlocProvider.of<
                                                          CurrencyCodeCubit>(
                                                      context)
                                                  .convertToAppCurrency(
                                                      itemPrice: farePrice,
                                                      appCurrencyExchangeRate:
                                                          BlocProvider.of<
                                                                      CurrencyCodeCubit>(
                                                                  context)
                                                              .currencyRate!,
                                                      ticketCurrencyCode:
                                                          fareCurrencyCode)),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        TextWidget(
                                          text:
                                              '  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 20,
                                          color: Colors.green,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
