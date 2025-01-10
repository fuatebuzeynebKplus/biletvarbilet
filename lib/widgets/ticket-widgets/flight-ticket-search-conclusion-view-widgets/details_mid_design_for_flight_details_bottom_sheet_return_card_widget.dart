import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_result.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DetailsMidDesignForFlightDetailsBottomSheetReturnCardWidget
    extends StatelessWidget {
  const DetailsMidDesignForFlightDetailsBottomSheetReturnCardWidget({
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

    var componyName = results[flightTicketCubit.sendIndexValueReturn!]
        .legs![0]
        .alternativeLegs![0]
        .segments!;
    var operatComponyName = results[flightTicketCubit.sendIndexValueReturn!]
        .legs![0]
        .alternativeLegs![0]
        .segments!;
    var logo = results[flightTicketCubit.sendIndexValueReturn!]
        .legs![0]
        .alternativeLegs![0]
        .segments!;

    String? departureAirportCode =
        results[flightTicketCubit.sendIndexValueReturn!]
            .legs![0]
            .alternativeLegs![0]
            .segments![index]
            .departureAirport!
            .code;

    String? arrivalAirportCode =
        results[flightTicketCubit.sendIndexValueReturn!]
            .legs![0]
            .alternativeLegs![0]
            .segments![index]
            .arrivalAirport!
            .code;
    String? firstCodeForFlight =
        results[flightTicketCubit.sendIndexValueReturn!]
            .legs![0]
            .alternativeLegs![0]
            .segments![index]
            .flightNo;
    String? secondeCodeForFlight =
        results[flightTicketCubit.sendIndexValueReturn!]
            .legs![0]
            .alternativeLegs![0]
            .segments![index]
            .ticketingAirline!
            .code;

    String? departureAirportCityName =
        results[flightTicketCubit.sendIndexValueReturn!]
            .legs![0]
            .alternativeLegs![0]
            .segments![index]
            .departureAirport!
            .cityName;

    String? arrivalAirportCityName =
        results[flightTicketCubit.sendIndexValueReturn!]
            .legs![0]
            .alternativeLegs![0]
            .segments![index]
            .arrivalAirport!
            .cityName;

    String? departureAirportName =
        results[flightTicketCubit.sendIndexValueReturn!]
            .legs![0]
            .alternativeLegs![0]
            .segments![index]
            .departureAirport!
            .name;

    String? arrivalAirportName =
        results[flightTicketCubit.sendIndexValueReturn!]
            .legs![0]
            .alternativeLegs![0]
            .segments![index]
            .arrivalAirport!
            .name;

    dynamic cabinType = results[flightTicketCubit.sendIndexValueReturn!]
        .fares![0]
        .fareAlternativeLegs![0]
        .fareSegments![0]
        .cabinType;
    var flightCabinClassDetails =
        results[flightTicketCubit.sendIndexValueReturn!]
            .fares![0]
            .fareAlternativeLegs![0]
            .fareSegments;

    List<String> cabinClass = [];

    for (var fareSegments in flightCabinClassDetails!) {
      cabinClass.add(fareSegments.classCode!);
    }
    String cabinClassString = cabinClass.join(',');

    var timeData = results[flightTicketCubit.sendIndexValueReturn!]
        .legs![0]
        .alternativeLegs![0]
        .segments!;

    bool? isSameAirport;

    if (index <
        results[flightTicketCubit.sendIndexValueReturn!]
                .legs![0]
                .alternativeLegs![0]
                .segments!
                .length -
            1) {
      isSameAirport = results[flightTicketCubit.sendIndexValueReturn!]
                  .legs![0]
                  .alternativeLegs![0]
                  .segments![index + 1]
                  .departureAirport!
                  .name ==
              results[flightTicketCubit.sendIndexValueReturn!]
                  .legs![0]
                  .alternativeLegs![0]
                  .segments![index]
                  .arrivalAirport!
                  .name
          ? true
          : false;
    } else {
      // إذا كان العنصر الحالي هو الأخير، يمكن تعيين القيمة إلى null أو false
      isSameAirport = true; // أو null حسب حاجتك
    }

    // List<String> arrivalDates = [];
    // List<String> departureDates = [];

    // for (int i = 0; i < test.length; i++) {
    //   var segment = test[i];
    // arrivalDates.add(segment.arrivalDate!);
    // departureDates.add(segment.departureDate!);

    //   print("${flightTicketCubit.sendIndexValueReturn}");
    // }

    List<String> arrivalDates = [];
    List<String> departureDates = [];

    for (var segment in timeData) {
      arrivalDates.add(segment.arrivalDate!);
      departureDates.add(segment.departureDate!);
    }

    List<int> flightDuration = [];
    List<int> waitingDuration = [];

    for (var segment in timeData) {
      flightDuration.add(segment.flightDuration!);
      waitingDuration.add(segment.waitingDuration!);
    }

    int totalDuration = flightDuration.fold(0, (sum, item) => sum + item) +
        waitingDuration.fold(0, (sum, item) => sum + item);

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    TextWidget(
                      text: flightTicketCubit.convertArabicNumbersToEnglish(
                              DateFormat.Hm().format(
                                  DateTime.parse(departureDates[index]))) ??
                          'null',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    SizedBox(
                      height: context.height * 0.035,
                    ),
                    Image.network(
                      '${logo[index].ticketingAirline!.logo}',
                      height: 30,
                      width: 60,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/no_Image.png',
                          width: 60,
                          height: 30,
                        );
                      },
                    ),
                    SizedBox(
                      height: context.height * 0.17,
                    ),
                    TextWidget(
                        text: flightTicketCubit.convertArabicNumbersToEnglish(
                                DateFormat.Hm().format(
                                    DateTime.parse(arrivalDates[index]))) ??
                            'null',
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.05,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    Image.asset(
                      AppImages.flightIcon,
                      height: context.height * 0.025,
                      width: context.height * 0.025,
                    ),
                    //  const Icon(Icons.flight),
                    SizedBox(
                      height: context.height * 0.19,
                      child: VerticalDivider(
                        thickness: 1,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    results[flightTicketCubit.sendIndexValueReturn!]
                                .legs![0]
                                .alternativeLegs!
                                .first
                                .segments!
                                .length !=
                            1
                        ? index ==
                                results[flightTicketCubit.sendIndexValueReturn!]
                                        .legs![0]
                                        .alternativeLegs!
                                        .length -
                                    1
                            ? Container(
                                height: 6,
                                width: 6,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                ),
                              )
                            : Image.asset(
                                AppImages.placeIcon,
                                height: 18,
                                width: 18,
                              )
                        : Image.asset(
                            AppImages.placeIcon,
                            height: 18,
                            width: 18,
                          ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: departureAirportCityName!,
                          fontSize: 16,
                        ),
                        TextWidget(
                          text:
                              '$departureAirportName ${'($departureAirportCode)'}',
                          fontSize: 16,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      // height: context.height * 0.09,
                      width: 250,
                      color: Colors.grey.shade200,
                      child: ExpansionTile(
                        onExpansionChanged: (value) {
                          print(value);
                          flightTicketCubit.showContainer(value: value);
                        },
                        shape: const StadiumBorder(side: BorderSide.none),
                        tilePadding: const EdgeInsets.only(left: 12, right: 12),
                        childrenPadding:
                            const EdgeInsets.only(left: 12, bottom: 12),
                        iconColor: AppColors.kSecondColor,
                        collapsedIconColor: AppColors.kSecondColor,
                        //  trailing: const SizedBox(),

                        title: Row(
                          children: [
                            Expanded(
                              child: TextWidget(
                                isHaveOverflow: true,
                                textAlign: TextAlign.left,
                                text:
                                    componyName[index].ticketingAirline!.name!,
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          children: [
                            TextWidget(
                                text:
                                    S.of(context).TimeOfFlight), //TimeOfJourney
                            TextWidget(
                              text: getIt<CacheHelper>()
                                          .getDataString(key: 'Lang') ==
                                      'ar'
                                  ? ':  ${flightDuration[index] ~/ 60} ${S.of(context).Hour} ${flightDuration[index] % 60} ${S.of(context).Minimum}'
                                  : ':  ${flightDuration[index] ~/ 60} ${S.of(context).Minimum} ${flightDuration[index] % 60} ${S.of(context).Hour}',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                height: 2,
                                child: Divider(),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                      text: S
                                          .of(context)
                                          .FlightNumber), //FlightNumber
                                  TextWidget(
                                    text: firstCodeForFlight!.length > 4
                                        ? firstCodeForFlight
                                        : '$secondeCodeForFlight$firstCodeForFlight',
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  TextWidget(
                                      text: S
                                          .of(context)
                                          .OperatedCompany), //OperatedCompany
                                  Expanded(
                                    child: TextWidget(
                                      isHaveOverflow: true,
                                      textAlign: TextAlign.left,
                                      text: operatComponyName[index]
                                          .operatingAirline!
                                          .name!,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  TextWidget(text: S.of(context).Cabin), //Cabin
                                  TextWidget(
                                      text: cabinType == 3
                                          ? 'Business ($cabinClassString)'
                                          : 'Economy ($cabinClassString)'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    ///------------------------------
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: arrivalAirportCityName!,
                          fontSize: 16,
                        ),
                        TextWidget(
                          text:
                              '$arrivalAirportName ${'($arrivalAirportCode)'}',
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            isSameAirport == true
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.red.shade700),
                        color: Colors.red.shade100,
                      ),
                      child: Center(
                        child: TextWidget(
                          fontSize: 10,
                          text: S.of(context).NotSameAirportMassage,
                          color: Colors.black,
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


/*

                GestureDetector(
                  onTap: () {
                    flightTicketCubit.showContainer(value: true);
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    height:
                        flightTicketCubit.flightDetailsShowContainer == false
                            ? context.height * 0.085
                            : context.height * 0.18,
                    width: 260,
                    color: Colors.grey.shade200,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const TextWidget(
                              text: 'Turkish Airlines',
                              fontWeight: FontWeight.bold,
                            ),
                            Icon(flightTicketCubit.flightDetailsShowContainer ==
                                    false
                                ? Icons.expand_more
                                : Icons.expand_less),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Row(
                          children: [
                            TextWidget(text: 'Seyahat Süresi: '),
                            TextWidget(
                              text: '1h 10m',
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        Visibility(
                          visible: flightTicketCubit.flightDetailsShowContainer,
                          child: const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Divider(),
                                Row(
                                  children: [
                                    TextWidget(text: 'Uçuş no: '),
                                    TextWidget(
                                      text: 'XY247',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    TextWidget(text: 'İşletilen şirket: '),
                                    TextWidget(
                                      text: 'Turkish Airlines',
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    TextWidget(text: 'Kabin: '),
                                    TextWidget(
                                      text: 'Economy',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

*/
