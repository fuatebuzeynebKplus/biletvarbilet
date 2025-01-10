import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_fare_service.dart';
import 'package:bamobile1/flight/data/models/air_result.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/two_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TicketCardReturnWidget extends StatelessWidget {
  const TicketCardReturnWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    List<AirResult>? results =
        flightTicketCubit.afterRefreshFlightSearchResultsReturn;

    String? componyName = results[index]
        .legs!
        .last
        .alternativeLegs![0]
        .segments!
        .first
        .ticketingAirline!
        .name;

    String? componyNameOperator = results[index]
        .legs!
        .last
        .alternativeLegs![0]
        .segments!
        .first
        .operatingAirline!
        .name;

    String? logo = results[index]
        .legs!
        .last
        .alternativeLegs![0]
        .segments!
        .first
        .ticketingAirline!
        .logo;
    String? idGroup = results[index].groupId;
    double price = idGroup == 'p'
        ? (results[index].fares![0].totalPrice!.totalStrikeAmount -
                flightTicketCubit.priceValue)
            .toDouble()
        : results[index].fares![0].totalPrice!.totalStrikeAmount.toDouble();

    String currencyCode = results[index].fares![0].totalPrice!.currencyCode!;
    String arriveTime = results[index]
        .legs!
        .last
        .alternativeLegs![0]
        .segments!
        .last
        .arrivalDate!;
    String departureTime = results[index]
        .legs!
        .last
        .alternativeLegs![0]
        .segments!
        .first
        .departureDate!;

    String? departureAirportCode = results[index]
        .legs!
        .last
        .alternativeLegs![0]
        .segments!
        .first
        .departureAirport!
        .code;

    String? arrivalAirportCode = results[index]
        .legs!
        .last
        .alternativeLegs![0]
        .segments!
        .last
        .arrivalAirport!
        .code;

    dynamic seatCount = results[index]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments![0]
        .seatCount;

    dynamic cabinType = results[index]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments![0]
        .cabinType;
    var flightCabinClassDetails =
        results[index].fares![0].fareAlternativeLegs!.last.fareSegments;

    List<String> cabinClass = [];

    for (var fareSegments in flightCabinClassDetails!) {
      cabinClass.add(fareSegments.classCode!);
    }
    String cabinClassString = cabinClass.join(',');

    var flightDetails = results[index].legs!.last.alternativeLegs![0].segments!;
    List<String> combinedFlightDetails = [];
    List<String> flightNo = [];
    List<String> flightCode = [];
    for (var segment in flightDetails) {
      flightNo.add(segment.flightNo!);
      flightCode.add(segment.ticketingAirline!.code!);
      if (segment.flightNo!.length > 4) {
        combinedFlightDetails.add(segment.flightNo!);
      } else {
        combinedFlightDetails
            .add('${segment.ticketingAirline!.code!}${segment.flightNo!}');
      }
    }

    String displayText = combinedFlightDetails.join(',');

    dynamic baggageAllowances;
    dynamic baggageType;
    if (results[index].fares![0].passengerFares![0].baggageAllowances != null &&
        results[index]
            .fares![0]
            .passengerFares![0]
            .baggageAllowances!
            .isNotEmpty) {
      baggageAllowances = results[index]
                  .fares![0]
                  .passengerFares![0]
                  .baggageAllowances![0]
                  .value ==
              '0'
          ? S.of(context).Handluggage
          : results[index]
              .fares![0]
              .passengerFares![0]
              .baggageAllowances![0]
              .value;

      baggageType = results[index]
          .fares![0]
          .passengerFares![0]
          .baggageAllowances![0]
          .type;
    } else {
      baggageAllowances = '';
      baggageType = '';
    }

    DateTime dateDepartureTime = DateTime.parse(departureTime);
    String formattedDepartureTime = DateFormat.Hm().format(dateDepartureTime);
    DateTime dateArriveTime = DateTime.parse(arriveTime);
    String formattedArriveTime = DateFormat.Hm().format(dateArriveTime);

    var timeData = results[index].legs!.last.alternativeLegs![0].segments!;
    List<int> flightDuration = [];
    List<int> waitingDuration = [];

    for (var segment in timeData) {
      flightDuration.add(segment.flightDuration!);
      waitingDuration.add(segment.waitingDuration!);
    }

    int totalDuration = flightDuration.fold(0, (sum, item) => sum + item) +
        waitingDuration.fold(0, (sum, item) => sum + item);

    int stopCount =
        results[index].legs!.last.alternativeLegs![0].segments!.length;

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: GestureDetector(
            onTap: () {
              flightTicketCubit.saveFunctionForAlternativeRefReturn(
                returning: results[index]
                    .legs!
                    .last
                    .alternativeLegs![0]
                    .alternativeRef!,
              );
              flightTicketCubit.priceAmountFunction(
                  priceTwo: price,
                  priceOne: flightTicketCubit.priceValue,
                  currencyCodeOne: flightTicketCubit.currencyCodeForOneValue,
                  currencyCodeTwo: currencyCode,
                  context: context);
              flightTicketCubit.selectedCardReturnFunction(value: index);
              flightTicketCubit.bottomSheetType = 7;
              print('index=$index');

              print('ttt=${flightTicketCubit.selectedCardReturn}');

              if (flightTicketCubit.bottomSheetType == 5) {
                flightTicketCubit.bottomSheetType = 0;
              } else if (flightTicketCubit.selectedCardReturn == null) {
                ///
                flightTicketCubit.bottomSheetType = 0;
              }
              flightTicketCubit.sendReturnIndexFunction(index: index);
              flightTicketCubit.returnGroupId = idGroup;

              // flightTicketCubit.keysForTwoFunction(key: keyTwo);
              // print('keyTwoForAllValue=${flightTicketCubit.keyTwoForAllValue}');

              //  flightTicketCubit.totalPriceFunction();
            },
            child: Container(
              height: context.height * 0.24,
              width: context.width * 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: (flightTicketCubit.selectedCardReturn) == index
                      ? Border.all(color: AppColors.kSecondColor, width: 3)
                      : Border.all(
                          color: Colors.grey,
                        )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          logo!,
                          height: 30,
                          width: 70,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/no_Image.png',
                              width: 70,
                              height: 30,
                            );
                          },
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        TextWidget(
                          text: '$componyName',

                          //'$componyName $index  ${idGroup![0] == 'p' ? 'P' : idGroup[0] == 's' ? 'S' : 'W'}',
                          fontSize: 14,
                          color: Colors.black26,
                        ),
                        // const Spacer(),
                        // SizedBox(
                        //   height: 20,
                        //   width: 20,
                        //   child: Radio(
                        //     value: index,
                        //     groupValue: flightTicketCubit.radioGroup,
                        //     activeColor: AppColors.kSecondColor,
                        //     onChanged: (value) {
                        //       flightTicketCubit.radioFunctionValue(
                        //           value: value);
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  TextWidget(
                                    text: flightTicketCubit
                                        .convertArabicNumbersToEnglish(
                                            formattedDepartureTime),
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  TextWidget(
                                    fontSize: 14,
                                    text: departureAirportCode!,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  TextWidget(
                                    text: getIt<CacheHelper>()
                                                .getDataString(key: 'Lang') ==
                                            'ar'
                                        ? '${totalDuration ~/ 60} ${S.of(context).Hour} ${totalDuration % 60} ${S.of(context).Minimum}'
                                        : '${totalDuration ~/ 60} ${S.of(context).Minimum} ${totalDuration % 60} ${S.of(context).Hour}',
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                  stopCount == 1
                                      ? const NonStopDesignWidget(
                                          dividerWidth: 0.18,
                                        )
                                      : stopCount == 2
                                          ? const OneStopDesignWidget(
                                              dividerWidth: 0.18,
                                            )
                                          : const TwoStopDesignWidget(
                                              dividerWidth: 0.18,
                                            ),
                                  componyName == componyNameOperator
                                      ? const SizedBox()
                                      : TextWidget(
                                          text:
                                              '${S.of(context).OperatedCompany}$componyNameOperator',
                                          color: Colors.green,
                                          fontSize: 10,
                                        ),
                                ],
                              ),
                              Column(
                                children: [
                                  TextWidget(
                                    text: flightTicketCubit
                                        .convertArabicNumbersToEnglish(
                                            formattedArriveTime),
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  TextWidget(
                                    text: arrivalAirportCode!,
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: displayText ?? '',
                          color: AppColors.kSecondColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.airplane_ticket,
                              color: AppColors.kSecondColor,
                              size: context.height * 0.025,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            TextWidget(
                              text: cabinType == 3
                                  ? '${S.of(context).Business} ($cabinClassString)'
                                  : '${S.of(context).Economy} ($cabinClassString)',
                              fontSize: 10,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            baggageAllowances == ''
                                ? const SizedBox()
                                : Icon(
                                    Icons.luggage,
                                    color: AppColors.kSecondColor,
                                    size: context.height * 0.025,
                                  ),
                            const SizedBox(
                              width: 2,
                            ),
                            Row(
                              children: [
                                TextWidget(
                                  text: '$baggageAllowances',
                                  fontSize: 10,
                                ),
                                baggageAllowances == S.of(context).Handluggage
                                    ? const Text('')
                                    : TextWidget(
                                        text: '$baggageType',
                                        fontSize: 10,
                                      ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/icons/seat.png',
                              height: context.height * 0.025,
                              width: context.height * 0.025,
                              color: AppColors.kSecondColor,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            TextWidget(
                              text: seatCount.toString(),
                              fontSize: 10,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        flightTicketCubit
                                    .afterRefreshFlightSearchResultsReturn[
                                        index]
                                    .legs![0]
                                    .alternativeLegs![0]
                                    .segments!
                                    .length ==
                                1
                            ? const SizedBox()
                            : Row(
                                children: [
                                  TextWidget(
                                    text: S.of(context).Details,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      flightTicketCubit.sendReturnIndexFunction(
                                          index: index);
                                      flightTicketCubit.bottomSheetValue(
                                          type: 22);
                                    },
                                    child: Container(
                                      height: 25,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.grey.shade100,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0.0, 1.0),
                                            blurRadius: 1.0,
                                          ),
                                        ],
                                      ),
                                      child: const Icon(Icons.expand_more),
                                    ),
                                  ),
                                ],
                              ),
                        Row(
                          children: [
                            TextWidget(
                              text: flightTicketCubit.formatNumber(
                                  BlocProvider.of<CurrencyCodeCubit>(context)
                                      .convertToAppCurrency(
                                          itemPrice: price,
                                          appCurrencyExchangeRate: BlocProvider
                                                  .of<CurrencyCodeCubit>(
                                                      context)
                                              .currencyRate!,
                                          ticketCurrencyCode: currencyCode)),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            TextWidget(
                              text:
                                  '  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                              color: Colors.grey,
                              fontSize: 12,
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
