import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/pax_definition.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/two_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:bamobile1/common/data/enums/air_search_type.dart';
import 'package:bamobile1/common/data/enums/calculation_type.dart';

import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';

import 'package:bamobile1/flight/data/models/corporate.dart';
import 'package:bamobile1/flight/data/models/markup.dart';

import 'package:bamobile1/flight/data/models/advanced_options.dart';
import 'package:bamobile1/flight/data/models/air_advanced_search.dart';

import 'package:bamobile1/flight/data/models/air_search_request.dart';

import 'package:bamobile1/models/multi_point_model.dart';

class FlightTicketMultiPointSelectedCard extends StatelessWidget {
  const FlightTicketMultiPointSelectedCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    List<Map<String, dynamic>> selectedPassengers = [
      {"Count": flightTicketCubit.adultQuantity, "PaxType": "0"},
    ];
    if (flightTicketCubit.childQuantity > 0) {
      selectedPassengers
          .add({"Count": flightTicketCubit.childQuantity, "PaxType": "1"});
    }

    if (flightTicketCubit.babyQuantity > 0) {
      selectedPassengers
          .add({"Count": flightTicketCubit.babyQuantity, "PaxType": "2"});
    }
    List<PaxDefinition> passengers = selectedPassengers.map((passengerData) {
      return PaxDefinition(
        count: passengerData["Count"],
        paxType: PaxType.values[int.parse(passengerData["PaxType"])],
      );
    }).toList();
    print('index: $index');
    print('listMultiPoint: ${flightTicketCubit.listMultiPoint.length}');
    print('--------------------------');
    var leg = flightTicketCubit.selectAirResultForMultiPointList[index].legs!
        .first.alternativeLegs!.first.segments!;
    var fare =
        flightTicketCubit.selectAirResultForMultiPointList[index].fares!.first;
    dynamic seatCount = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments![0]
        .seatCount;

    dynamic cabinType = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments![0]
        .cabinType;
    var flightCabinClassDetails = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments;

    List<String> cabinClass = [];

    for (var fareSegments in flightCabinClassDetails!) {
      cabinClass.add(fareSegments.classCode!);
    }
    String cabinClassString = cabinClass.join(',');

    var flightDetails = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .legs![0]
        .alternativeLegs![0]
        .segments!;
    List<String> combinedFlightDetails = [];
    List<String> flightNo = [];
    List<String> flightCode = [];
    var classCodeDetails = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .fares!
        .first
        .fareAlternativeLegs!
        .first
        .fareSegments;

    List<String> classCode = [];

    for (var code in classCodeDetails!) {
      classCode.add(code.classCode!);
    }
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
    if (flightTicketCubit.selectAirResultForMultiPointList[index].fares![0]
                .passengerFares![0].baggageAllowances !=
            null &&
        flightTicketCubit.selectAirResultForMultiPointList[index].fares![0]
            .passengerFares![0].baggageAllowances!.isNotEmpty) {
      baggageAllowances = flightTicketCubit
                  .selectAirResultForMultiPointList[index]
                  .fares![0]
                  .passengerFares![0]
                  .baggageAllowances![0]
                  .value ==
              '0'
          ? 'El Bagajı'
          : flightTicketCubit.selectAirResultForMultiPointList[index].fares![0]
              .passengerFares![0].baggageAllowances![0].value;

      baggageType = flightTicketCubit.selectAirResultForMultiPointList[index]
          .fares![0].passengerFares![0].baggageAllowances![0].type;
    } else {
      baggageAllowances = '';
      baggageType = '';
    }

    // dynamic baggageType =
    //     flightTicketCubit.selectAirResultForMultiPointList[index].fares![0].passengerFares![0].baggageAllowances![0].type;

    var timeData = flightTicketCubit.selectAirResultForMultiPointList[index]
        .legs![0].alternativeLegs![0].segments!;
    List<int> flightDuration = [];
    List<int> waitingDuration = [];

    for (var segment in timeData) {
      flightDuration.add(segment.flightDuration!);
      waitingDuration.add(segment.waitingDuration!);
    }

    int totalDuration = flightDuration.fold(0, (sum, item) => sum + item) +
        waitingDuration.fold(0, (sum, item) => sum + item);

    // Duration duration = dateArriveTime.difference(dateDepartureTime);

    int stopCount = flightTicketCubit.selectAirResultForMultiPointList[index]
        .legs![0].alternativeLegs![0].segments!.length;

    // String? groupId =
    //     flightTicketCubit.selectAirResultForMultiPointList[index].groupId;
    // double priceValue;

    // if (flightTicketCubit.selectAirResultForMultiPointList.length > 1) {
    //   // ابحث عن الفهرس بناءً على العنصر الذي يحتوي على `fare`
    //   int index = flightTicketCubit.selectAirResultForMultiPointList
    //       .indexWhere((result) => result.fares!.contains(fare));

    //   if (groupId![0] == 'P' && index != 0) {
    //     priceValue = fare.totalPrice!.totalStrikeAmount -
    //         (flightTicketCubit.selectAirResultForMultiPointList.first.fares!
    //                 .first.totalPrice!.totalStrikeAmount)
    //             .toDouble()!;
    //   } else {
    //     priceValue = fare.totalPrice!.totalStrikeAmount.toDouble()!;
    //   }
    // } else {
    //   priceValue = fare.totalPrice!.totalStrikeAmount.toDouble()!;
    // }

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            Container(
              height: context.height * 0.045,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColors.kSecondColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          flightTicketCubit.addOrRemoveDay(
                            index: flightTicketCubit.currentListIndex,
                            isAddOneDay: false,
                          );
                          flightTicketCubit.searchAvailabilityForMultiPoint(
                              RequestModel(
                                  request: AirSearchRequest(
                                advancedOptions: AdvancedOptions(
                                  corporate: Corporate(
                                      discounts: flightTicketCubit
                                          .corporateAirlineCodeList),
                                  languageCode: getIt<CacheHelper>()
                                          .getDataString(key: 'Lang') ??
                                      'en',
                                  markup: Markup(
                                    calculationType:
                                        flightTicketCubit.typeIsAmount == true
                                            ? CalculationType.amount
                                            : CalculationType.percent,
                                    amount:
                                        flightTicketCubit.typeIsAmount == true
                                            ? flightTicketCubit.amount
                                            : flightTicketCubit.percent,
                                    currencyCode:
                                        BlocProvider.of<CurrencyCodeCubit>(
                                                context)
                                            .currencyCodeValue,
                                  ),
                                  air: AirAdvancedSearch(
                                    permittedAirlineCodes:
                                        flightTicketCubit.preferAirlineCodeList,
                                    onlyDirectFlights: flightTicketCubit
                                        .onlyDirectFlightsCheckBoxValue,
                                    onlyRefundableFlights: flightTicketCubit
                                        .onlyRefundableFlightsCheckBoxValue,
                                    onlyBestFares: true,
                                  ),
                                ),
                                legs: convertMultiPointToAirSearchLeg(
                                    flightTicketCubit.listMultiPoint, context),
                                passengers: passengers,
                                searchType: AirSearchType.multiple,
                                token: Token(
                                  channelCode: "kplusmobile",
                                  tokenCode: getIt<CacheHelper>()
                                          .getDataString(key: 'token') ??
                                      "",
                                ),
                              )),
                              context);
                        },
                        child: const CircularIconWidget(
                          circularColor: Colors.white,
                          borderColor: Colors.black54,
                          iconColor: Colors.black87,
                          icon: Icons.keyboard_double_arrow_left,
                        ),
                      ),
                      const SizedBox(width: 4),
                      TextWidget(
                        text:
                            '${flightTicketCubit.listMultiPoint[index].departureCityName} - ${flightTicketCubit.listMultiPoint[index].arrivalCityName}',
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextWidget(
                        text: DateFormat('dd-MM-yyy').format(flightTicketCubit
                            .listMultiPoint[index].departureDate!),
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          flightTicketCubit.addOrRemoveDay(
                            index: flightTicketCubit.currentListIndex,
                            isAddOneDay: true,
                          );
                          flightTicketCubit.searchAvailabilityForMultiPoint(
                              RequestModel(
                                  request: AirSearchRequest(
                                advancedOptions: AdvancedOptions(
                                  corporate: Corporate(
                                      discounts: flightTicketCubit
                                          .corporateAirlineCodeList),
                                  languageCode: getIt<CacheHelper>()
                                          .getDataString(key: 'Lang') ??
                                      'en',
                                  markup: Markup(
                                    calculationType:
                                        flightTicketCubit.typeIsAmount == true
                                            ? CalculationType.amount
                                            : CalculationType.percent,
                                    amount:
                                        flightTicketCubit.typeIsAmount == true
                                            ? flightTicketCubit.amount
                                            : flightTicketCubit.percent,
                                    currencyCode:
                                        BlocProvider.of<CurrencyCodeCubit>(
                                                context)
                                            .currencyCodeValue,
                                  ),
                                  air: AirAdvancedSearch(
                                    permittedAirlineCodes:
                                        flightTicketCubit.preferAirlineCodeList,
                                    onlyDirectFlights: flightTicketCubit
                                        .onlyDirectFlightsCheckBoxValue,
                                    onlyRefundableFlights: flightTicketCubit
                                        .onlyRefundableFlightsCheckBoxValue,
                                    onlyBestFares: true,
                                  ),
                                ),
                                legs: convertMultiPointToAirSearchLeg(
                                    flightTicketCubit.listMultiPoint, context),
                                passengers: passengers,
                                searchType: AirSearchType.multiple,
                                token: Token(
                                  channelCode: "kplusmobile",
                                  tokenCode: getIt<CacheHelper>()
                                          .getDataString(key: 'token') ??
                                      "",
                                ),
                              )),
                              context);
                        },
                        child: const CircularIconWidget(
                          circularColor: Colors.white,
                          borderColor: Colors.black54,
                          iconColor: Colors.black87,
                          icon: Icons.keyboard_double_arrow_right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: context.height * 0.012,
            ),
            GestureDetector(
              onTap: () {
                flightTicketCubit.removeCardFromSelectedMultiPointListFunction(
                    index, context);
                // flightTicketCubit.calculateTotalPriceMultiPoint(
                //     price: -flightTicketCubit
                //         .selectAirResultForMultiPointList[index]
                //         .fares!
                //         .first
                //         .totalPrice!
                //         .totalStrikeAmount);
              },
              child: Container(
                height: context.height * 0.24,
                width: context.width * 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  border: Border.all(color: AppColors.kSecondColor, width: 3),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 0, bottom: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            leg.first.ticketingAirline!.logo!,
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
                          const SizedBox(width: 6),
                          Text(
                            '${leg.first.ticketingAirline!.name!} ', // اسم وهمي للشركة
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black26),
                          ),
                        ],
                      ),
                      // Text(
                      //   '${fare.fareAlternativeLegs!.first.alternativeRef}', // اسم وهمي للشركة
                      //   style: const TextStyle(
                      //       fontSize: 14, color: Colors.black26),
                      // ),
                      Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        DateFormat.Hm().format(DateTime.parse(
                                            leg.first.departureDate!)),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        leg.first.departureAirport!.code!,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      TextWidget(
                                        text: getIt<CacheHelper>()
                                                    .getDataString(
                                                        key: 'Lang') ==
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
                                      leg.first.ticketingAirline!.name! ==
                                              leg.first.operatingAirline!.name
                                          ? const SizedBox()
                                          : TextWidget(
                                              text:
                                                  '${S.of(context).OperatedCompany}${leg.first.operatingAirline!.name}',
                                              color: Colors.green,
                                              fontSize: 10,
                                            ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      //
                                      Text(
                                        DateFormat.Hm().format(DateTime.parse(
                                            leg.last.arrivalDate!)),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        leg.last.arrivalAirport!.code!,
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: '$displayText ' ?? '111111111',
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
                                      ? 'Business ($cabinClassString)'
                                      : 'Economy ($cabinClassString)',
                                  fontSize: 10,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                baggageAllowances == ''
                                    ? const SizedBox()
                                    : Icon(
                                        size: context.height * 0.025,
                                        Icons.luggage,
                                        color: AppColors.kSecondColor,
                                      ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Row(
                                  children: [
                                    TextWidget(
                                      text: '$baggageAllowances ',
                                      fontSize: 10,
                                    ),
                                    baggageAllowances == 'El Bagajı'
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
                                  text: '$seatCount',
                                  fontSize: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Divider(
                            thickness: 1, color: Colors.grey.withOpacity(0.5)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            leg.length > 1
                                ? Row(
                                    children: [
                                      Text(
                                        S.of(context).Details,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          flightTicketCubit
                                              .saveIndexForMultiPointFunction(
                                                  index: index,
                                                  isSelectedCard: true);
                                          flightTicketCubit.bottomSheetValue(
                                              type: 51);
                                        },
                                        child: Container(
                                          height: 25,
                                          width: 35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
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
                                  )
                                : const SizedBox(),
                            Row(
                              children: [
                                TextWidget(
                                    text: flightTicketCubit.formatNumber(
                                        BlocProvider.of<CurrencyCodeCubit>(
                                                context)
                                            .convertToAppCurrency(
                                                itemPrice: fare.totalPrice!
                                                    .totalStrikeAmount
                                                    .toDouble(),
                                                appCurrencyExchangeRate:
                                                    BlocProvider.of<
                                                                CurrencyCodeCubit>(
                                                            context)
                                                        .currencyRate!,
                                                ticketCurrencyCode: fare
                                                    .totalPrice!
                                                    .currencyCode!)),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                                TextWidget(
                                  text:
                                      '  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                  fontSize: 12,
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ],
                        ),
                      ])
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.height * 0.012,
            ),
          ],
        );
      },
    );
  }
}




/*



import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/two_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FlightTicketMultiPointSelectedCard extends StatelessWidget {
  const FlightTicketMultiPointSelectedCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    var leg = flightTicketCubit.selectAirResultForMultiPointList[index].legs!
        .first.alternativeLegs!.first.segments!;
    var fare =
        flightTicketCubit.selectAirResultForMultiPointList[index].fares!.first;
    dynamic seatCount = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments![0]
        .seatCount;

    dynamic cabinType = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments![0]
        .cabinType;
    var flightCabinClassDetails = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments;

    List<String> cabinClass = [];

    for (var fareSegments in flightCabinClassDetails!) {
      cabinClass.add(fareSegments.classCode!);
    }
    String cabinClassString = cabinClass.join(',');

    var flightDetails = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .legs![0]
        .alternativeLegs![0]
        .segments!;
    List<String> combinedFlightDetails = [];
    List<String> flightNo = [];
    List<String> flightCode = [];
    var classCodeDetails = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .fares!
        .first
        .fareAlternativeLegs!
        .first
        .fareSegments;

    List<String> classCode = [];

    for (var code in classCodeDetails!) {
      classCode.add(code.classCode!);
    }
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
    if (flightTicketCubit.selectAirResultForMultiPointList[index].fares![0]
                .passengerFares![0].baggageAllowances !=
            null &&
        flightTicketCubit.selectAirResultForMultiPointList[index].fares![0]
            .passengerFares![0].baggageAllowances!.isNotEmpty) {
      baggageAllowances = flightTicketCubit
                  .selectAirResultForMultiPointList[index]
                  .fares![0]
                  .passengerFares![0]
                  .baggageAllowances![0]
                  .value ==
              '0'
          ? 'El Bagajı'
          : flightTicketCubit.selectAirResultForMultiPointList[index].fares![0]
              .passengerFares![0].baggageAllowances![0].value;

      baggageType = flightTicketCubit.selectAirResultForMultiPointList[index]
          .fares![0].passengerFares![0].baggageAllowances![0].type;
    } else {
      baggageAllowances = '';
      baggageType = '';
    }

    // dynamic baggageType =
    //     flightTicketCubit.selectAirResultForMultiPointList[index].fares![0].passengerFares![0].baggageAllowances![0].type;

    var timeData = flightTicketCubit.selectAirResultForMultiPointList[index]
        .legs![0].alternativeLegs![0].segments!;
    List<int> flightDuration = [];
    List<int> waitingDuration = [];

    for (var segment in timeData) {
      flightDuration.add(segment.flightDuration!);
      waitingDuration.add(segment.waitingDuration!);
    }

    int totalDuration = flightDuration.fold(0, (sum, item) => sum + item) +
        waitingDuration.fold(0, (sum, item) => sum + item);

    // Duration duration = dateArriveTime.difference(dateDepartureTime);

    int stopCount = flightTicketCubit.selectAirResultForMultiPointList[index]
        .legs![0].alternativeLegs![0].segments!.length;
    String? idGroup;
    if (flightTicketCubit.searchTypeValue != 'tek') {
      idGroup =
          flightTicketCubit.selectAirResultForMultiPointList[index].groupId;
    }
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(height: context.height * 0.015),
            Container(
              height: context.height * 0.045,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: AppColors.kSecondColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: const CircularIconWidget(
                          circularColor: Colors.white,
                          borderColor: Colors.black54,
                          iconColor: Colors.black87,
                          icon: Icons.keyboard_double_arrow_left,
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextWidget(
                        text: S.of(context).DestinationPoint,
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const TextWidget(
                        text: '',
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: const CircularIconWidget(
                          circularColor: Colors.white,
                          borderColor: Colors.black54,
                          iconColor: Colors.black87,
                          icon: Icons.keyboard_double_arrow_right,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: context.height * 0.015),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    flightTicketCubit
                        .removeCardFromSelectedMultiPointListFunction(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      height: context.height * 0.24,
                      width: context.width * 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border:
                            Border.all(color: AppColors.kSecondColor, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 24, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.network(
                                  leg.first.ticketingAirline!.logo!,
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
                                const SizedBox(width: 6),
                                Text(
                                  '${leg.first.ticketingAirline!.name!} ', // اسم وهمي للشركة
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black26),
                                ),
                              ],
                            ),
                            // Text(
                            //   '${fare.fareAlternativeLegs!.first.alternativeRef}', // اسم وهمي للشركة
                            //   style: const TextStyle(
                            //       fontSize: 14, color: Colors.black26),
                            // ),
                            Column(children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              DateFormat.Hm().format(
                                                  DateTime.parse(leg
                                                      .first.departureDate!)),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              leg.first.departureAirport!.code!,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            TextWidget(
                                              text:
                                                  '${totalDuration ~/ 60} Sa ${totalDuration % 60} Dk',
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
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            //
                                            Text(
                                              DateFormat.Hm().format(
                                                  DateTime.parse(
                                                      leg.last.arrivalDate!)),
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              leg.last.arrivalAirport!.code!,
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextWidget(
                                    text: '$displayText ' ?? '111111111',
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
                                            ? 'Business ($cabinClassString)'
                                            : 'Economy ($cabinClassString)',
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      baggageAllowances == ''
                                          ? const SizedBox()
                                          : Icon(
                                              size: context.height * 0.025,
                                              Icons.luggage,
                                              color: AppColors.kSecondColor,
                                            ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      Row(
                                        children: [
                                          TextWidget(
                                            text: '$baggageAllowances ',
                                            fontSize: 10,
                                          ),
                                          baggageAllowances == 'El Bagajı'
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
                                      Icon(
                                        Icons.event_seat,
                                        color: AppColors.kSecondColor,
                                        size: context.height * 0.025,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      TextWidget(
                                        text: '$seatCount',
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                  thickness: 1,
                                  color: Colors.grey.withOpacity(0.5)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Details', // تفاصيل وهمية
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '${fare.totalPrice!.totalStrikeAmount!.toDouble().toStringAsFixed(2)}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        '  TRY', // عملة وهمية
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ])
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                      ),
                      color: Colors.black,
                    ),
                    height: 20,
                    width: 80,
                    child: Center(
                        child: TextWidget(
                      text: '${index + 1}.Uçuş',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    )),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}


*/
