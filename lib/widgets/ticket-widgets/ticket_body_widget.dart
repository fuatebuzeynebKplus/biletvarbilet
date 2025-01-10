import 'package:bamobile1/common/data/enums/air_result_type.dart';
import 'package:bamobile1/common/data/enums/air_search_type.dart';
import 'package:bamobile1/common/data/enums/calculation_type.dart';
import 'package:bamobile1/common/data/enums/hotpoint_type.dart';
import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/settings-app/settings_cubit.dart';
import 'package:bamobile1/flight/data/models/corporate.dart';
import 'package:bamobile1/flight/data/models/markup.dart';
import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/advanced_options.dart';
import 'package:bamobile1/flight/data/models/air_advanced_search.dart';
import 'package:bamobile1/flight/data/models/air_search_leg.dart';
import 'package:bamobile1/flight/data/models/air_search_request.dart';
import 'package:bamobile1/flight/data/models/hotpoint.dart';
import 'package:bamobile1/flight/data/models/pax_definition.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/models/multi_point_model.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_search_conclusion_view.dart';
import 'package:bamobile1/views/ticket-views/multi_point_views/flight_ticket_search_conclusion_multi_point_view.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/multi_point_search_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:bamobile1/widgets/ticket-widgets/ticket_type_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/ticket_check_boxes_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/ticket_details_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/ticket_search_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TicketBodyWidget extends StatelessWidget {
  const TicketBodyWidget({
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
        List<PaxDefinition> passengers =
            selectedPassengers.map((passengerData) {
          return PaxDefinition(
            count: passengerData["Count"],
            paxType: PaxType.values[int.parse(passengerData["PaxType"])],
          );
        }).toList();
        return Padding(
          padding: const EdgeInsets.only(right: 12, left: 12, top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TicketTypeWidget(),
                const SizedBox(
                  height: 8,
                ),
                flightTicketCubit.searchTypeValue == 'cok'
                    ? Column(
                        children: [
                          SizedBox(
                            height: context.height *
                                flightTicketCubit.listMultiPoint.length *
                                0.16,
                            width: context.width * 1,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:
                                  flightTicketCubit.listMultiPoint.length,
                              itemBuilder: (BuildContext context, int index) {
                                return MultiPointSearchCardWidget(
                                  index: index,
                                );
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  flightTicketCubit
                                      .addOrRemovePointToMultiPointList(
                                          itIsAdd: true);
                                },
                                child: CircularIconWidget(
                                  iconColor: Colors.white,
                                  borderColor: AppColors.kSecondColor,
                                  size: 0.04,
                                  circularColor: AppColors.kSecondColor,
                                  icon: Icons.add,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              GestureDetector(
                                onTap: () {
                                  flightTicketCubit
                                      .addOrRemovePointToMultiPointList(
                                          itIsAdd: false);
                                },
                                child: CircularIconWidget(
                                  iconColor: Colors.white,
                                  borderColor: AppColors.kSecondColor,
                                  size: 0.04,
                                  circularColor: AppColors.kSecondColor,
                                  icon: Icons.remove,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    : const TicketSearchWidget(),
                const SizedBox(
                  height: 8,
                ),
                const TicketDetailsWidget(),
                const SizedBox(
                  height: 8,
                ),
                const TicketCheckBoxesWidget(),
                flightTicketCubit.detailedSearchCheckBoxValue == false
                    ? const SizedBox()
                    : Column(
                        children: [
                          const SizedBox(
                            height: 6,
                          ),
                          ButtonWidget(
                            theTextISLeft: true,
                            title: S.of(context).CorporateCode,
                            height: 0.075,
                            width: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            textColor: Colors.black,
                            onTap: () {
                              flightTicketCubit.bottomSheetValue(type: 10);
                            },
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          ButtonWidget(
                            theTextISLeft: true,
                            title: flightTicketCubit
                                    .preferAirlineCodeList.isNotEmpty
                                ? "${S.of(context).PreferAirline} : ${flightTicketCubit.preferAirlineCodeList.join(', ')}"
                                : S.of(context).PreferAirline,
                            height: 0.075,
                            width: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            textColor: Colors.black,
                            onTap: () {
                              flightTicketCubit.bottomSheetValue(type: 11);
                            },
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 8,
                ),
                ButtonWidget(
                  title: S.of(context).SearchFlights,
                  height: 0.075,
                  width: 1,
                  fontSize: 18,
                  textColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kSecondColor,
                  onTap: () {
                    if (flightTicketCubit.percent == 0 ||
                        flightTicketCubit.amount == 0) {
                      flightTicketCubit.percent = null;
                      flightTicketCubit.amount = null;
                    }
                    if (flightTicketCubit.searchTypeValue == 'cok') {
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
                                amount: flightTicketCubit.typeIsAmount == true
                                    ? flightTicketCubit.amount
                                    : flightTicketCubit.percent,
                                currencyCode:
                                    BlocProvider.of<CurrencyCodeCubit>(context)
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
                    } else if (flightTicketCubit.searchTypeValue == 'tek') {
                      flightTicketCubit.searchAvailability(
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
                                amount: flightTicketCubit.typeIsAmount == true
                                    ? flightTicketCubit.amount
                                    : flightTicketCubit.percent,
                                currencyCode:
                                    BlocProvider.of<CurrencyCodeCubit>(context)
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
                            legs: [
                              AirSearchLeg(
                                  arrivalPoint: Hotpoint(
                                    cityCode:
                                        flightTicketCubit.secondSearchCity,
                                    code: flightTicketCubit.secondCityCode,
                                    hotpointType: flightTicketCubit
                                        .arrivalHotpointTypeEnum, // write the error
                                  ),
                                  date: //"12.06.2023",
                                      flightTicketCubit.dateTime == null
                                          ? flightTicketCubit
                                              .convertArabicNumbersToEnglish(
                                                  DateFormat('dd.MM.yyy')
                                                      .format(flightTicketCubit
                                                          .dateTimeRange!.start)
                                                      .toString())
                                          : flightTicketCubit
                                              .convertArabicNumbersToEnglish(
                                                  DateFormat('dd.MM.yyy')
                                                      .format(flightTicketCubit
                                                          .dateTime!)
                                                      .toString()),
                                  departurePoint: Hotpoint(
                                      cityCode:
                                          flightTicketCubit.firstSearchCity,
                                      code: flightTicketCubit.firstCityCode,
                                      hotpointType: flightTicketCubit
                                          .departureHotpointTypeEnum))
                            ],
                            passengers: passengers,
                            searchType: AirSearchType.oneway,
                            token: Token(
                              channelCode: "kplusmobile",
                              tokenCode: getIt<CacheHelper>()
                                      .getDataString(key: 'token') ??
                                  "",
                            ),
                          )),
                          context);
                    } else {
                      print(
                          '${getIt<CacheHelper>().getDataString(key: 'Lang')}');
                      flightTicketCubit.searchAvailability(
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
                                  amount: flightTicketCubit.typeIsAmount == true
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
                                  onlyBestFares: true,
                                  onlyRefundableFlights: flightTicketCubit
                                      .onlyRefundableFlightsCheckBoxValue,
                                ),
                              ),
                              legs: [
                                AirSearchLeg(
                                    arrivalPoint: Hotpoint(
                                      cityCode:
                                          flightTicketCubit.secondSearchCity,
                                      code: flightTicketCubit.secondCityCode,
                                      hotpointType: flightTicketCubit
                                          .arrivalHotpointTypeEnum, // write the error
                                    ),
                                    date: flightTicketCubit
                                        .convertArabicNumbersToEnglish(
                                            DateFormat('dd.MM.yyy')
                                                .format(flightTicketCubit
                                                    .dateTimeRange!.start)
                                                .toString()),
                                    departurePoint: Hotpoint(
                                        cityCode:
                                            flightTicketCubit.firstSearchCity,
                                        code: flightTicketCubit.firstCityCode,
                                        hotpointType: flightTicketCubit
                                            .departureHotpointTypeEnum)),
                                AirSearchLeg(
                                    arrivalPoint: Hotpoint(
                                      cityCode:
                                          flightTicketCubit.firstSearchCity,
                                      code: flightTicketCubit.firstCityCode,
                                      hotpointType: flightTicketCubit
                                          .arrivalHotpointTypeEnum, // write the error
                                    ),
                                    date: flightTicketCubit
                                        .convertArabicNumbersToEnglish(
                                            DateFormat('dd.MM.yyy')
                                                .format(flightTicketCubit
                                                    .dateTimeRange!.end)
                                                .toString()),
                                    departurePoint: Hotpoint(
                                        cityCode:
                                            flightTicketCubit.secondSearchCity,
                                        code: flightTicketCubit.secondCityCode,
                                        hotpointType: flightTicketCubit
                                            .departureHotpointTypeEnum))
                              ],
                              passengers: passengers,
                              searchType: AirSearchType.roundtrip,
                              token: Token(
                                channelCode: "kplusmobile",
                                tokenCode: getIt<CacheHelper>()
                                        .getDataString(key: 'token') ??
                                    "",
                              ),
                            ),
                          ),
                          context);
                    }
                    if (flightTicketCubit.searchTypeValue != 'cok') {
                      if (flightTicketCubit.firstCityCode == null ||
                          flightTicketCubit.secondCityCode == null) {
                        SnackbarUtils.showSnackbar(
                            context,
                            S
                                .of(context)
                                .TheDepartureOrReturnPointMustNotBeEmpty);
                      } else if (flightTicketCubit.firstCityCode ==
                          flightTicketCubit.secondCityCode) {
                        SnackbarUtils.showSnackbar(
                            context,
                            S
                                .of(context)
                                .TheStartingAndReturningPointShouldNotBeTheSame);
                      } else {
                        Navigator.pushNamed(
                            context, FlightTicketSearchConclusionView.id,
                            arguments: passengers);
                        flightTicketCubit.sortPriceLessToHighFunc(context);
                      }
                    } else {
                      Navigator.pushNamed(context,
                          FlightTicketSearchConclusionMultiPointView.id);
                    }
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/*
List<Map<String, dynamic>> selectedPassengers = [
{"Count": 1, "PaxType": "0"}
];

   List<PaxDefinition> passengers = selectedPassengers.map((passengerData) {
      return PaxDefinition(
        count: passengerData["Count"],
        paxType: PaxType.values[int.parse(passengerData["PaxType"])],
      );
    }).toList();
*/
