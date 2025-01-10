import 'package:bamobile1/common/data/enums/inclusion_type.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_fare_service.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewFareCard extends StatelessWidget {
  const NewFareCard({super.key, required this.color, required this.index});
  final Color color;
  final int index;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    dynamic fareTitle =
        flightTicketCubit.flightFaresReturn![0].fares![index].title;

    dynamic farePrice = flightTicketCubit
        .flightFaresReturn![0].fares![index].totalPrice!.totalAmount
        .toDouble();

    String fareCurrencyCode = flightTicketCubit
        .flightFaresReturn![0].fares![index].totalPrice!.currencyCode!;
    List<AirFareService>? fareServices;

    fareServices = flightTicketCubit.flightFaresReturn!.last.fares![index]
            .fareAlternativeLegs![0].fareServices ??
        [];

    List<AirFareService> filteredFareServices = fareServices.where((service) {
      return service.inclusionType == InclusionType.included;
    }).toList();
    List<String> faresList = [];

    for (var fare in fareServices) {
      if (fare.inclusionType == InclusionType.included) {
        faresList.add(fare.title ?? '');
      }
    }
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 12, right: 12),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: context.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: color,
                    border: flightTicketCubit.selectedSeatTypeReturn == index
                        ? Border.all(
                            width: 2,
                            color: color,
                          )
                        : null,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            flightTicketCubit.sendSeatReturnIndexFunction(
                              index: index,
                            );
                            // dynamic key2 = flightTicketCubit.flightSearchResultsReturn![0]
                            //     .fares![index].fareAlternativeLegs![0].key;
                            // print('key2: $key2');
                            flightTicketCubit.selectedSeatTypeReturnFunction(
                                value: index);
                            flightTicketCubit.priceAmountFunction(
                                context: context,
                                priceTwo: farePrice,
                                priceOne: flightTicketCubit.priceValueForFare,
                                currencyCodeOne:
                                    flightTicketCubit.currencyCodeForOneValue,
                                currencyCodeTwo: fareCurrencyCode);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 8, bottom: 8),
                            width: context.width * 0.1,
                            //height: 84,
                            margin: const EdgeInsets.only(left: 10),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    bottomRight: Radius.circular(6)),
                                color: Colors.white),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          textAlign: TextAlign.start,
                                          isHaveOverflow: true,
                                          text: fareTitle == '' ||
                                                  fareTitle == null
                                              ? 'STANDARD'
                                              : fareTitle,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                    text: faresList[index]
                                                                .length >
                                                            35
                                                        ? '${faresList[index].substring(0, 35)}...'
                                                        : faresList[index],
                                                    fontSize: 10,
                                                  ),
                                                  if (index !=
                                                      filteredFareServices
                                                              .length -
                                                          1)
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextWidget(
                                                text: flightTicketCubit.formatNumber(BlocProvider
                                                        .of<CurrencyCodeCubit>(
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
              ),
            ],
          ),
        );
      },
    );
  }
}
