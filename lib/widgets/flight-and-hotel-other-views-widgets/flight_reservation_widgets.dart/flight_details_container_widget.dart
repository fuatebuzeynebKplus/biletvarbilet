import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/flight_booking_leg.dart';
import 'package:bamobile1/flight/data/models/flight_booking_pax.dart';
import 'package:bamobile1/flight/data/models/get_booking_model.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FlightDetailsContainerWidget extends StatelessWidget {
  const FlightDetailsContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    List<FlightBookingList> flightBookingList = [];

    flightBookingList =
        flightTicketCubit.getBookingModelDetails!.result!.flightBookingList;

    List<List<Leg>> legList = [];

    for (var elementMain in flightBookingList) {
      legList.add(elementMain.legs);
    }

    print('legList: ${legList.length}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
            text: S.of(context).FlightDetails,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
        SizedBox(height: context.height * 0.01),
        Container(
          height: legList.length >= 2
              ? context.height * 0.3
              : context.height * 0.22,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.kSecondColor)),
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, left: 12, right: 12, bottom: 12),
              child: SizedBox(
                height: context.height * 0.3,
                width: context.width * 0.9,
                child: ListView.builder(
                  itemCount: legList.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int indexMain) {
                    print('index: $indexMain');
                    return Column(
                      children: [
                        // legList.length >= 2
                        //     ? Row(
                        //         children: [
                        //           Expanded(
                        //             child: Divider(
                        //               thickness: 1,
                        //               color: Colors.grey.withOpacity(0.5),
                        //             ),
                        //           ),
                        //           Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 8.0),
                        //             child: TextWidget(
                        //                 text: "${indexMain + 1}.Uçuş Detayları",
                        //                 fontSize: 12,
                        //                 color: Colors.grey),
                        //           ),
                        //           Expanded(
                        //             child: Divider(
                        //               thickness: 1,
                        //               color: Colors.grey.withOpacity(0.5),
                        //             ),
                        //           ),
                        //         ],
                        //       )
                        //     : const SizedBox(),
                        SizedBox(
                          width: context.width * 0.9,
                          child: ListView.builder(
                            itemCount: legList[indexMain].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int indexList) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        legList[indexMain][indexList]
                                            .ticketingAirline!
                                            .logo!,
                                        height: context.height * 0.03,
                                        width: context.width * 0.15,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/no_Image.png',
                                            height: context.height * 0.03,
                                            width: context.width * 0.15,
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      TextWidget(
                                        text:
                                            '${legList[indexMain][indexList].ticketingAirline!.name}', //totalPrice!,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        text:
                                            '${S.of(context).FlightNumber}  ', //totalPrice!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      TextWidget(
                                        text:
                                            '${legList[indexMain][indexList].ticketingAirline!.code}${legList[indexMain][indexList].flightNo}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        text:
                                            '${S.of(context).DepartureDateTime}:   ', //totalPrice!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      TextWidget(
                                        text: flightTicketCubit
                                            .convertArabicNumbersToEnglish(
                                          DateFormat('dd.MM.yyyy HH:mm').format(
                                              legList[indexMain][indexList]
                                                  .departureDate!),
                                        ),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        text:
                                            '${S.of(context).Route}:   ', //totalPrice!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      TextWidget(
                                        text:
                                            '${legList[indexMain][indexList].departureAirport!.cityCode} - ${legList[indexMain][indexList].arrivalAirport!.cityCode}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      TextWidget(
                                        text:
                                            '${S.of(context).FlightTime}:   ', //totalPrice!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      TextWidget(
                                        text:
                                            '${(legList[indexMain][indexList].flightDuration! ~/ 60).toString().padLeft(2, '0')} ${S.of(context).Hour} ${(legList[indexMain][indexList].flightDuration! % 60).toString().padLeft(2, '0')} ${S.of(context).Minimum}', //totalPrice!,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const TextWidget(
                                        text: 'PNR:   ', //totalPrice!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      TextWidget(
                                        text:
                                            '${flightBookingList[indexMain].pnr}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )),
        ),
      ],
    );
  }
}



/*

import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/flight_booking.dart';
import 'package:bamobile1/flight/data/models/flight_booking_leg.dart';
import 'package:bamobile1/flight/data/models/flight_booking_pax.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FlightDetailsContainerWidget extends StatelessWidget {
  const FlightDetailsContainerWidget({
    super.key,
    required this.index,
    this.thisViewIsResultView = false,
  });

  final int index;
  final bool thisViewIsResultView;

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    List<FlightBooking>? flightBookingList;
    if (thisViewIsResultView == false) {
      flightBookingList =
          flightTicketCubit.getReservationsList[index].flightBookingList!;
    } else {
      flightBookingList =
          flightTicketCubit.detailsForResultView!.flightBookingList!;
    }

    List<List<FlightBookingLeg>> legList = [];

    for (var elementMain in flightBookingList) {
      legList.add(elementMain.legs!);
    }

    print('legList: ${legList.length}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
            text: S.of(context).FlightDetails,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
        SizedBox(height: context.height * 0.01),
        Container(
          height: legList.length >= 2
              ? context.height * 0.3
              : context.height * 0.22,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.kSecondColor)),
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, left: 12, right: 12, bottom: 12),
              child: SizedBox(
                height: context.height * 0.3,
                width: context.width * 0.9,
                child: ListView.builder(
                  itemCount: legList.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int indexMain) {
                    print('index: $indexMain');
                    return Column(
                      children: [
                        // legList.length >= 2
                        //     ? Row(
                        //         children: [
                        //           Expanded(
                        //             child: Divider(
                        //               thickness: 1,
                        //               color: Colors.grey.withOpacity(0.5),
                        //             ),
                        //           ),
                        //           Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 8.0),
                        //             child: TextWidget(
                        //                 text: "${indexMain + 1}.Uçuş Detayları",
                        //                 fontSize: 12,
                        //                 color: Colors.grey),
                        //           ),
                        //           Expanded(
                        //             child: Divider(
                        //               thickness: 1,
                        //               color: Colors.grey.withOpacity(0.5),
                        //             ),
                        //           ),
                        //         ],
                        //       )
                        //     : const SizedBox(),
                        SizedBox(
                          width: context.width * 0.9,
                          child: ListView.builder(
                            itemCount: legList[indexMain].length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int indexList) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.network(
                                        legList[indexMain][indexList]
                                            .ticketingAirline!
                                            .logo!,
                                        height: context.height * 0.03,
                                        width: context.width * 0.15,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            'assets/images/no_Image.png',
                                            height: context.height * 0.03,
                                            width: context.width * 0.15,
                                          );
                                        },
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      TextWidget(
                                        text:
                                            '${legList[indexMain][indexList].ticketingAirline!.name}', //totalPrice!,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.flight,
                                          color: AppColors.kSecondColor,
                                          size: 25),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      TextWidget(
                                        text:
                                            '${S.of(context).FlightNumber}:   ', //totalPrice!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      TextWidget(
                                        text:
                                            '${legList[indexMain][indexList].ticketingAirline!.code}${legList[indexMain][indexList].flightNo}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.event,
                                          color: AppColors.kSecondColor,
                                          size: 25),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      TextWidget(
                                        text:
                                            '${S.of(context).DepartureDateTime}:   ', //totalPrice!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      TextWidget(
                                        text: DateFormat('dd.MM.yyyy HH:mm')
                                            .format(DateTime.parse(
                                                legList[indexMain][indexList]
                                                    .departureDate!)),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.move_down,
                                          color: AppColors.kSecondColor,
                                          size: 25),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      TextWidget(
                                        text:
                                            '${S.of(context).Route}:   ', //totalPrice!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      TextWidget(
                                        text:
                                            '${legList[indexMain][indexList].departureAirport!.cityCode} - ${legList[indexMain][indexList].arrivalAirport!.cityCode}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.schedule,
                                          color: AppColors.kSecondColor,
                                          size: 25),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      TextWidget(
                                        text:
                                            '${S.of(context).FlightTime}:   ', //totalPrice!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      TextWidget(
                                        text:
                                            '${(legList[indexMain][indexList].flightDuration! ~/ 60).toString().padLeft(2, '0')} ${S.of(context).Hour} ${(legList[indexMain][indexList].flightDuration! % 60).toString().padLeft(2, '0')} ${S.of(context).Minimum}', //totalPrice!,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.code,
                                          color: AppColors.kSecondColor,
                                          size: 25),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      const TextWidget(
                                        text: 'PNR:   ', //totalPrice!,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      TextWidget(
                                        text:
                                            '${flightBookingList![indexMain].pnr}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )),
        ),
      ],
    );
  }
}



*/
