import 'package:bamobile1/common/data/enums/inclusion_type.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_fare_service.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/two_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FareMultiPointSelectedCardWidget extends StatelessWidget {
  const FareMultiPointSelectedCardWidget(
      {super.key, required this.color, required this.index});
  final Color color;
  final int index;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    String? logo = flightTicketCubit
        .flightFaresMultiPointSelectedForSeparated![index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .first
        .ticketingAirline!
        .logo!; // رابط وهمي للوغو شركة الطيران
    String arriveTime = flightTicketCubit
        .flightFaresMultiPointSelectedForSeparated![index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .last
        .arrivalDate!; // وقت وهمي للوصول
    String departureTime = flightTicketCubit
        .flightFaresMultiPointSelectedForSeparated![index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .first
        .departureDate!; // وقت وهمي للمغادرة
    DateTime dateDepartureTime =
        DateTime.parse(departureTime); // تحويل وقت المغادرة إلى DateTime
    String formattedDepartureTime =
        DateFormat.Hm().format(dateDepartureTime); // 15:00
    DateTime dateArriveTime =
        DateTime.parse(arriveTime); // تحويل وقت الوصول إلى DateTime
    String formattedArriveTime =
        DateFormat.Hm().format(dateArriveTime); // 18:30

    String formattedDepartureForStringMonth =
        DateFormat.MMM().format(dateDepartureTime); // Nov

    String? departureAirportCode = flightTicketCubit
        .flightFaresMultiPointSelectedForSeparated![index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .first
        .departureAirport!
        .code!; // كود مطار المغادرة (مطار إسطنبول)
    String? arrivalAirportCode = flightTicketCubit
        .flightFaresMultiPointSelectedForSeparated![index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .last
        .arrivalAirport!
        .code!; // كود مطار الوصول (مطار جون إف كينيدي)

    int stopCount = flightTicketCubit
        .flightFaresMultiPointSelectedForSeparated![index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .length;

    // Dummy data
    dynamic fareTitle = flightTicketCubit
        .flightFaresMultiPointSelectedForSeparated![index].fares!.first.title;

    List<AirFareService>? fareServices;

    fareServices = flightTicketCubit
            .flightFaresMultiPointSelectedForSeparated![index]
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
    }
    dynamic farePrice = flightTicketCubit
        .flightFaresMultiPointSelectedForSeparated![index]
        .fares![0]
        .totalPrice!
        .totalAmount
        .toDouble();
    // Example fare price
    dynamic fareCurrencyCode = flightTicketCubit
        .flightFaresMultiPointSelectedForSeparated![index]
        .fares![0]
        .totalPrice!
        .currencyCode;
    // Example currency code

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            Column(
              children: [
                Container(
                  width: context.width * 1,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Image.network(
                            logo,
                            height: 40,
                            width: 40,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/no_Image.png',
                                width: 40,
                                height: 40,
                              );
                            },
                          ),
                          // const SizedBox(
                          //   width: 8,
                          // ),
                          SizedBox(
                            width: context.width * 0.02,
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: departureAirportCode,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                              TextWidget(
                                text: ' $formattedDepartureTime',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: context.width * 0.01,
                          ),

                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              stopCount == 1
                                  ? const NonStopDesignWidget(
                                      dividerWidth: 0.07,
                                      text: false,
                                    )
                                  : stopCount == 2
                                      ? const OneStopDesignWidget(
                                          dividerWidth: 0.07,
                                          text: false,
                                        )
                                      : const TwoStopDesignWidget(
                                          dividerWidth: 0.06,
                                          text: false,
                                        ),
                            ],
                          ),
                          SizedBox(
                            width: context.width * 0.01,
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: formattedArriveTime,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              TextWidget(
                                text: ' $arrivalAirportCode',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: context.width * 0.02,
                          ),

                          Row(
                            children: [
                              TextWidget(
                                text: dateDepartureTime.day.toString(),
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                              SizedBox(
                                width: context.width * 0.01,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextWidget(
                                    text: formattedDepartureForStringMonth,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                  TextWidget(
                                    text: dateDepartureTime.year.toString(),
                                    fontSize: 10,
                                    color: Colors.black54,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    flightTicketCubit.saveIndexForMultiPointFunction(
                        index: index, isSelectedCard: true);
                    flightTicketCubit.bottomSheetValue(type: 51);
                    // print('${flightTicketCubit.sendIndexValueReturn!}');
                    // print('${flightTicketCubit.sendIndexValue!}');
                    // flightTicketCubit.sendIndexFunction(
                    //     index: flightTicketCubit.sendIndexValueReturn!);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    width: context.width * 0.25,
                    height: context.height * 0.025,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                          text: S.of(context).Details,
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: context.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: color, // Example color
                    border: Border.all(
                      width: 2,
                      color: color, // Example color
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            flightTicketCubit
                                .removeFareCardFromSelectedMultiPointListFunction(
                                    price: BlocProvider.of<CurrencyCodeCubit>(
                                            context)
                                        .convertToAppCurrency(
                                            itemPrice: flightTicketCubit
                                                .flightFaresMultiPointSelectedForSeparated!
                                                .last
                                                .fares![0]
                                                .totalPrice!
                                                .totalAmount
                                                .toDouble(),
                                            appCurrencyExchangeRate:
                                                BlocProvider.of<CurrencyCodeCubit>(
                                                        context)
                                                    .currencyRate!,
                                            ticketCurrencyCode: flightTicketCubit
                                                .flightFaresMultiPointSelectedForSeparated!
                                                .last
                                                .fares![0]
                                                .totalPrice!
                                                .currencyCode!),
                                    index);
                            // flightTicketCubit.sendSeatReturnIndexFunction(
                            //   index: 0,
                            // );
                            // flightTicketCubit.selectedSeatTypeReturnFunction(
                            //     value: 0);
                            // // flightTicketCubit.priceAmountFunction(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                    text: filteredFareServices[
                                                                    index]
                                                                .length >
                                                            35
                                                        ? '${filteredFareServices[index].substring(0, 35)}...'
                                                        : filteredFareServices[
                                                            index],
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
            ),
          ],
        );
      },
    );
  }
}
