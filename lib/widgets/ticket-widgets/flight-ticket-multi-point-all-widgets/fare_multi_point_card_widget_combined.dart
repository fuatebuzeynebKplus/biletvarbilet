import 'package:bamobile1/common/data/enums/inclusion_type.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_fare_alternative_leg.dart';
import 'package:bamobile1/flight/data/models/air_fare_service.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FareMultiPointCardWidgetCombined extends StatelessWidget {
  const FareMultiPointCardWidgetCombined(
      {super.key, required this.color, required this.index});
  final Color color;
  final int index;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    dynamic result;
    if (flightTicketCubit.isResultTypeForFareMultiPointCombined == false) {
      result = flightTicketCubit.flightFaresMultiPointIfIsCombined![1];
    } else {
      result = flightTicketCubit.flightFaresMultiPointIfIsCombined!.first;
      // .first.fares;
    }

    // Dummy data
    // String fareTitle = result.fares![index].fareAlternativeLegs.first
    //     .fareTitle; // Example fare title

    // List<AirFareAlternativeLeg>? airFareAlternativeLeg = flightTicketCubit
    //         .flightFaresMultiPointIfIsCombined!
    //         .first
    //         .fares![index]
    //         .fareAlternativeLegs ??
    //     [];
    List<List<AirFareService>>? fareServices = [];

    for (int i = 0;
        i <
            flightTicketCubit.flightFaresMultiPointIfIsCombined!.first
                .fares![index].fareAlternativeLegs!.length;
        i++) {
      var item = flightTicketCubit.flightFaresMultiPointIfIsCombined!.first
          .fares![index].fareAlternativeLegs![i];
      fareServices.add(item.fareServices!);
    }

    //   print('fareServices: $fareServices');
    //   print('fareServices.length: ${fareServices.length}');

    List<List<String>> faresList = [];

// Iterate over the outer list (fareServices)
    for (var fareServiceList in fareServices) {
      List<String> titles = [];
      // Iterate over the inner list (each fareService)
      for (var fare in fareServiceList) {
        if (fare.inclusionType == InclusionType.included) {
          titles.add(fare.title ?? '');
        }
// Extract the title, or an empty string if null
      }
      faresList.add(titles); // Add the list of titles to faresList
    }

    // print('faresList: $faresList');
    // print('fareList.length: ${faresList.length}');

// Example fare services

    // for (var itemA in flightTicketCubit.flightFaresMultiPointIfIsCombined!) {
    //   for (var item in itemA.fares!) {
    //     for (var element in item.fareAlternativeLegs!) {
    //       List<String> serviceList = [];
    //       for (var fare in element.fareServices!) {
    //         serviceList.add(fare.title ?? '');
    //       }
    //       allFareServices.add(serviceList);
    //     }
    //   }
    // }

    List<List<String>> allKeys = [];
    for (var element
        in flightTicketCubit.flightFaresMultiPointIfIsCombined!.first.fares!) {
      List<String> keys = []; // إعادة تهيئة القائمة في كل مرة
      for (var element2 in element.fareAlternativeLegs!) {
        keys.add(element2.key!); // إضافة المفتاح
      }
      allKeys.add(keys); // إضافة قائمة المفتاح إلى allKeys
    }

    // print('allKeys: $allKeys');

    dynamic farePrice = flightTicketCubit.flightFaresMultiPointIfIsCombined!
        .first.fares![index].totalPrice!.totalAmount
        .toDouble();
    // List<String> faresList = [
    //   'WiFi',
    //   'Extra Legroom',
    //   'Priority Boarding'
    // ]; // Example fare list
    //   double farePrice = 199.99; // Example fare price
    String fareCurrencyCode = flightTicketCubit
        .flightFaresMultiPointIfIsCombined!
        .first
        .fares![index]
        .totalPrice!
        .currencyCode!; // Example currency code

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: context.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: color, // Example color
                    border: flightTicketCubit
                                .saveIndexFareForCombinedMultiPointValue !=
                            null
                        ? Border.all(
                            width: 2,
                            color: color, // Example color
                          )
                        : null,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                            onTap: () {
                              flightTicketCubit
                                  .selectListFareIndexForMultiPointCombinedFunction(
                                      listKey: allKeys[index], value: index);
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
                              margin: const EdgeInsets.only(left: 10),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(6),
                                    bottomRight: Radius.circular(6)),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  result.fares![index].fareAlternativeLegs
                                      .length, // كما هو
                                  (indexSub) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextWidget(
                                              textAlign: TextAlign.start,
                                              isHaveOverflow: true,
                                              text: result
                                                          .fares![index]
                                                          .fareAlternativeLegs[
                                                              indexSub]
                                                          .fareTitle
                                                          ?.isEmpty ??
                                                      true
                                                  ? 'STANDARD'
                                                  : result
                                                      .fares![index]
                                                      .fareAlternativeLegs[
                                                          indexSub]
                                                      .fareTitle!,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
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
                                                  faresList[indexSub]
                                                      .length, // تعديل هنا
                                                  (serviceIndex) => Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      TextWidget(
                                                        text: faresList[indexSub]
                                                                    .length >
                                                                35
                                                            ? faresList[indexSub]
                                                                            [
                                                                            serviceIndex]
                                                                        .length >
                                                                    35
                                                                ? '${faresList[indexSub][serviceIndex].substring(0, 35)}...'
                                                                : faresList[
                                                                        indexSub]
                                                                    [
                                                                    serviceIndex]
                                                            : '${faresList[indexSub][serviceIndex]} ',
                                                        fontSize: 10,
                                                      ),
                                                      if (serviceIndex !=
                                                          faresList[indexSub]
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
                                            indexSub ==
                                                    flightTicketCubit
                                                            .flightFaresMultiPointIfIsCombined!
                                                            .first
                                                            .fares!
                                                            .first
                                                            .fareAlternativeLegs!
                                                            .length -
                                                        1
                                                ? Expanded(
                                                    flex: 4,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        TextWidget(
                                                          text:
                                                              flightTicketCubit
                                                                  .formatNumber(
                                                            BlocProvider.of<
                                                                        CurrencyCodeCubit>(
                                                                    context)
                                                                .convertToAppCurrency(
                                                              itemPrice:
                                                                  farePrice,
                                                              appCurrencyExchangeRate:
                                                                  BlocProvider.of<
                                                                              CurrencyCodeCubit>(
                                                                          context)
                                                                      .currencyRate!,
                                                              ticketCurrencyCode:
                                                                  fareCurrencyCode,
                                                            ),
                                                          ),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        TextWidget(
                                                          text:
                                                              '  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                                          color: Colors.grey,
                                                          fontSize: 12,
                                                        ),
                                                        const SizedBox(
                                                            width: 4),
                                                        const Icon(
                                                          Icons
                                                              .arrow_forward_ios,
                                                          size: 20,
                                                          color: Colors.green,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ],
                                        ),
                                        indexSub ==
                                                flightTicketCubit
                                                        .flightFaresMultiPointIfIsCombined!
                                                        .first
                                                        .fares!
                                                        .first
                                                        .fareAlternativeLegs!
                                                        .length -
                                                    1
                                            ? const SizedBox()
                                            : const Divider(),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )),
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
