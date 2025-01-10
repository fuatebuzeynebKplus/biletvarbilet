import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/two_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/multi_point_search_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FlightTicketMultiPointCard extends StatelessWidget {
  const FlightTicketMultiPointCard(
      {super.key,
      required this.index,
      required this.isSelected,
      required this.subIndex});

  final int index;
  final int subIndex;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    var leg = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!;
    var fare = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex].fares!.first;
    dynamic cabinType = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments![0]
        .cabinType;
    var flightCabinClassDetails = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments;

    List<String> cabinClass = [];

    for (var fareSegments in flightCabinClassDetails!) {
      cabinClass.add(fareSegments.classCode!);
    }
    String cabinClassString = cabinClass.join(',');

    var flightDetails = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .legs![0]
        .alternativeLegs![0]
        .segments!;
    List<String> combinedFlightDetails = [];
    List<String> flightNo = [];
    List<String> flightCode = [];
    var classCodeDetails = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
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
    var timeData = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .legs![0]
        .alternativeLegs![0]
        .segments!;
    List<int> flightDuration = [];
    List<int> waitingDuration = [];

    for (var segment in timeData) {
      flightDuration.add(segment.flightDuration!);
      waitingDuration.add(segment.waitingDuration!);
    }
    int totalDuration = flightDuration.fold(0, (sum, item) => sum + item) +
        waitingDuration.fold(0, (sum, item) => sum + item);
    int stopCount = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .legs![0]
        .alternativeLegs![0]
        .segments!
        .length;

    dynamic baggageAllowances;
    dynamic baggageType;
    if (flightTicketCubit.flightSearchResultForMultiPoints[index][subIndex]
                .fares![0].passengerFares![0].baggageAllowances !=
            null &&
        flightTicketCubit.flightSearchResultForMultiPoints[index][subIndex]
            .fares![0].passengerFares![0].baggageAllowances!.isNotEmpty) {
      baggageAllowances = flightTicketCubit
                  .flightSearchResultForMultiPoints[index][subIndex]
                  .fares![0]
                  .passengerFares![0]
                  .baggageAllowances![0]
                  .value ==
              '0'
          ? S.of(context).Handluggage
          : flightTicketCubit.flightSearchResultForMultiPoints[index][subIndex]
              .fares![0].passengerFares![0].baggageAllowances![0].value;

      baggageType = flightTicketCubit
          .flightSearchResultForMultiPoints[index][subIndex]
          .fares![0]
          .passengerFares![0]
          .baggageAllowances![0]
          .type;
    } else {
      baggageAllowances = '';
      baggageType = '';
    }
    dynamic seatCount = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments![0]
        .seatCount;

    // String? groupId = flightTicketCubit
    //     .flightSearchResultForMultiPoints[index][subIndex].groupId;
    // double priceValue;

    // if (flightTicketCubit.selectAirResultForMultiPointList.isNotEmpty) {
    //   if (groupId![0] == 'P') {
    //     priceValue = fare.totalPrice!.totalStrikeAmount -
    //         (flightTicketCubit.selectAirResultForMultiPointList.last.fares!
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
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  flightTicketCubit.calculateTotalPriceMultiPoint(
                      price: BlocProvider.of<CurrencyCodeCubit>(context)
                          .convertToAppCurrency(
                              itemPrice:
                                  fare.totalPrice!.totalStrikeAmount.toDouble(),
                              appCurrencyExchangeRate:
                                  BlocProvider.of<CurrencyCodeCubit>(context)
                                      .currencyRate!,
                              ticketCurrencyCode:
                                  fare.totalPrice!.currencyCode!));
                  flightTicketCubit.selectListIndexForMultiPointFunction(
                      howList: index,
                      index: subIndex,
                      isSelected: !isSelected,
                      airResult: flightTicketCubit
                          .flightSearchResultForMultiPoints[index][subIndex]);
                  flightTicketCubit.saveAlternativeRef(
                      value: fare.fareAlternativeLegs!.first.alternativeRef!);
                  flightTicketCubit.selectGroupIdFlightForMultiPointFunction(
                      value: flightTicketCubit
                          .flightSearchResultForMultiPoints[index][subIndex]
                          .groupId);
                  flightTicketCubit.createList(
                      arrivalDateValue: leg.last.arrivalDate!,
                      departureDateValue: leg.first.departureDate!,
                      flightNoValue: flightNo,
                      flightCabinTypeValue: cabinType,
                      result: flightTicketCubit
                          .flightSearchResultForMultiPoints[index][subIndex],
                      context: context);
                },
                child: Container(
                  height: context.height * 0.24,
                  width: context.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
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
                              leg.first.ticketingAirline!.name!,
                              //'  $subIndex ${flightTicketCubit.flightSearchResultForMultiPoints[index][subIndex].groupId}',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black26),
                            ),
                          ],
                        ),
                        // Text(
                        //   '${fare.fareAlternativeLegs!.first.alternativeRef}',
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
                                              : '${totalDuration ~/ 60}  ${S.of(context).Hour} ${totalDuration % 60}  ${S.of(context).Minimum}',
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
                                  Icon(Icons.airplane_ticket,
                                      color: AppColors.kSecondColor),
                                  const SizedBox(width: 6),
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
                                      baggageAllowances ==
                                              S.of(context).Handluggage
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
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.5)),
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
                                                    index: subIndex);
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
                                            child:
                                                const Icon(Icons.expand_more),
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
                                        '  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}', // عملة وهمية
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
              )
            ],
          ),
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
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/two_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/multi_point_search_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FlightTicketMultiPointCard extends StatelessWidget {
  const FlightTicketMultiPointCard(
      {super.key,
      required this.index,
      required this.isSelected,
      required this.subIndex});

  final int index;
  final int subIndex;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    var leg = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!;
    var fare = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex].fares!.first;
    dynamic cabinType = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments![0]
        .cabinType;
    var flightCabinClassDetails = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments;

    List<String> cabinClass = [];

    for (var fareSegments in flightCabinClassDetails!) {
      cabinClass.add(fareSegments.classCode!);
    }
    String cabinClassString = cabinClass.join(',');

    var flightDetails = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .legs![0]
        .alternativeLegs![0]
        .segments!;
    List<String> combinedFlightDetails = [];
    List<String> flightNo = [];
    List<String> flightCode = [];
    var classCodeDetails = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
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
    var timeData = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .legs![0]
        .alternativeLegs![0]
        .segments!;
    List<int> flightDuration = [];
    List<int> waitingDuration = [];

    for (var segment in timeData) {
      flightDuration.add(segment.flightDuration!);
      waitingDuration.add(segment.waitingDuration!);
    }
    int totalDuration = flightDuration.fold(0, (sum, item) => sum + item) +
        waitingDuration.fold(0, (sum, item) => sum + item);
    int stopCount = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .legs![0]
        .alternativeLegs![0]
        .segments!
        .length;

    dynamic baggageAllowances;
    dynamic baggageType;
    if (flightTicketCubit.flightSearchResultForMultiPoints[index][subIndex]
                .fares![0].passengerFares![0].baggageAllowances !=
            null &&
        flightTicketCubit.flightSearchResultForMultiPoints[index][subIndex]
            .fares![0].passengerFares![0].baggageAllowances!.isNotEmpty) {
      baggageAllowances = flightTicketCubit
                  .flightSearchResultForMultiPoints[index][subIndex]
                  .fares![0]
                  .passengerFares![0]
                  .baggageAllowances![0]
                  .value ==
              '0'
          ? 'El Bagajı'
          : flightTicketCubit.flightSearchResultForMultiPoints[index][subIndex]
              .fares![0].passengerFares![0].baggageAllowances![0].value;

      baggageType = flightTicketCubit
          .flightSearchResultForMultiPoints[index][subIndex]
          .fares![0]
          .passengerFares![0]
          .baggageAllowances![0]
          .type;
    } else {
      baggageAllowances = '';
      baggageType = '';
    }
    dynamic seatCount = flightTicketCubit
        .flightSearchResultForMultiPoints[index][subIndex]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments![0]
        .seatCount;
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 12, left: 12, bottom: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  flightTicketCubit.selectListIndexForMultiPointFunction(
                      howList: index,
                      index: subIndex,
                      isSelected: !isSelected,
                      airResult: flightTicketCubit
                          .flightSearchResultForMultiPoints[index][subIndex]);
                  flightTicketCubit.save(
                      value: fare.fareAlternativeLegs!.first.alternativeRef!);
                  flightTicketCubit.selectGroupIdFlightForMultiPointFunction(
                      value: flightTicketCubit
                          .flightSearchResultForMultiPoints[index][subIndex]
                          .groupId);
                  flightTicketCubit.createList(
                      arrivalDateValue: leg.last.arrivalDate!,
                      departureDateValue: leg.first.departureDate!,
                      flightNoValue: flightNo,
                      flightCabinTypeValue: cabinType,
                      result: flightTicketCubit
                          .flightSearchResultForMultiPoints[index][subIndex],
                      context: context);
                },
                child: Container(
                  height: context.height * 0.24,
                  width: context.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 8, bottom: 8),
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
                              '${leg.first.ticketingAirline!.name!} $subIndex ${flightTicketCubit.flightSearchResultForMultiPoints[index][subIndex].groupId}', // اسم وهمي للشركة
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black26),
                            ),
                          ],
                        ),
                        Text(
                          '${fare.fareAlternativeLegs!.first.alternativeRef}',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black26),
                        ),
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
                          const SizedBox(height: 6),
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
                                  Icon(Icons.airplane_ticket,
                                      color: AppColors.kSecondColor),
                                  const SizedBox(width: 6),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Details', // تفاصيل وهمية
                                style: TextStyle(fontWeight: FontWeight.bold),
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
              )
            ],
          ),
        );
      },
    );
  }
}



*/
