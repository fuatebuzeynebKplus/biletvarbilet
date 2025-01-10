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

class PassengersDetailsContainerWidget extends StatelessWidget {
  const PassengersDetailsContainerWidget({
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

    List<List<FlightBookingPax>> paxList = [];

    for (var elementMain in flightBookingList) {
      paxList.add(elementMain.paxList!);
    }
    print('paxList: $paxList');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
            text: S.of(context).SeatDetails,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
        SizedBox(height: context.height * 0.01),
        Container(
          height: paxList.first.length == 1
              ? paxList.first.first.pax!.passportNumber?.isEmpty ?? true
                  ? context.height * 0.155
                  : context.height * 0.18
              : context.height * 0.3,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.kSecondColor)),
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, left: 12, right: 12, bottom: 12),
              child: ListView.builder(
                itemCount: paxList.first.length,
                itemBuilder: (BuildContext context, int indexList) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            text:
                                '${S.of(context).Name} ${S.of(context).LastName}:   ', //totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextWidget(
                            text:
                                '${paxList.first[indexList].pax!.firstName} ${paxList.first[indexList].pax!.lastName}', //totalPrice!,
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
                                '${S.of(context).BirthDay}:   ', //totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextWidget(
                            text:
                                '${paxList.first[indexList].pax!.dateOfBirth}', //totalPrice!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      paxList.first.first.pax!.passportNumber?.isEmpty ?? true
                          ? Row(
                              children: [
                                TextWidget(
                                  text:
                                      '${S.of(context).IdentityNumber}:   ', //totalPrice!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text:
                                      '${paxList.first[indexList].pax!.identityNumber}', //totalPrice!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                TextWidget(
                                  text:
                                      '${S.of(context).PassportNumber}:   ', //totalPrice!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text:
                                      '${paxList.first[indexList].pax!.passportNumber}', //totalPrice!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                      paxList.first.first.pax!.passportNumber?.isEmpty ?? true
                          ? const SizedBox()
                          : Row(
                              children: [
                                TextWidget(
                                  text:
                                      '${S.of(context).ValidityDate}:   ', //totalPrice!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text:
                                      '${paxList.first[indexList].pax!.passportValidityDate}', //totalPrice!,
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
                                '${S.of(context).Nationality}:   ', //totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextWidget(
                            text:
                                '${paxList.first[indexList].pax!.nationalityCode}', //totalPrice!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      paxList.first.length == 1
                          ? const SizedBox()
                          : const Divider()
                    ],
                  );
                },
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

class PassengersDetailsContainerWidget extends StatelessWidget {
  const PassengersDetailsContainerWidget({
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

    List<List<FlightBookingPax>> paxList = [];

    for (var elementMain in flightBookingList) {
      paxList.add(elementMain.paxList!);
    }
    print('paxList: $paxList');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
            text: S.of(context).SeatDetails,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
        SizedBox(height: context.height * 0.01),
        Container(
          height: paxList.first.length == 1
              ? paxList.first.first.pax!.passportNumber?.isEmpty
                  ? context.height * 0.155
                  : context.height * 0.18
              : context.height * 0.3,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.kSecondColor)),
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, left: 12, right: 12, bottom: 12),
              child: ListView.builder(
                itemCount: paxList.first.length,
                itemBuilder: (BuildContext context, int indexList) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person,
                              color: AppColors.kSecondColor, size: 25),
                          const SizedBox(
                            width: 4,
                          ),
                          TextWidget(
                            text:
                                '${S.of(context).Name} ${S.of(context).LastName}:   ', //totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextWidget(
                            text:
                                '${paxList.first[indexList].pax!.firstName} ${paxList.first[indexList].pax!.lastName}', //totalPrice!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.calendar_month,
                              color: AppColors.kSecondColor, size: 25),
                          const SizedBox(
                            width: 4,
                          ),
                          TextWidget(
                            text:
                                '${S.of(context).BirthDay}:   ', //totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextWidget(
                            text:
                                '${paxList.first[indexList].pax!.dateOfBirth}', //totalPrice!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      paxList.first[indexList].pax!.passportNumber?.isEmpty
                          ? Row(
                              children: [
                                Icon(Icons.numbers,
                                    color: AppColors.kSecondColor, size: 25),
                                const SizedBox(
                                  width: 4,
                                ),
                                TextWidget(
                                  text:
                                      '${S.of(context).IdentityNumber}:   ', //totalPrice!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text:
                                      '${paxList.first[indexList].pax!.identityNumber}', //totalPrice!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Icon(Icons.numbers,
                                    color: AppColors.kSecondColor, size: 25),
                                const SizedBox(
                                  width: 4,
                                ),
                                TextWidget(
                                  text:
                                      '${S.of(context).PassportNumber}:   ', //totalPrice!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text:
                                      '${paxList.first[indexList].pax!.passportNumber}', //totalPrice!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                      paxList.first[indexList].pax!.passportNumber?.isEmpty
                          ? const SizedBox()
                          : Row(
                              children: [
                                Icon(Icons.calendar_month,
                                    color: AppColors.kSecondColor, size: 25),
                                const SizedBox(
                                  width: 4,
                                ),
                                TextWidget(
                                  text:
                                      '${S.of(context).ValidityDate}:   ', //totalPrice!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                TextWidget(
                                  text:
                                      '${paxList.first[indexList].pax!.passportValidityDate}', //totalPrice!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                      Row(
                        children: [
                          Icon(Icons.flag,
                              color: AppColors.kSecondColor, size: 25),
                          const SizedBox(
                            width: 4,
                          ),
                          TextWidget(
                            text:
                                '${S.of(context).Nationality}:   ', //totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          TextWidget(
                            text:
                                '${paxList.first[indexList].pax!.nationalityCode}', //totalPrice!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      paxList.first.length == 1
                          ? const SizedBox()
                          : const Divider()
                    ],
                  );
                },
              )),
        ),
      ],
    );
  }
}


/*

Row(
                        children: [
                     
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextWidget(
                                text: "${indexList + 1}.passenger",
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),

*/

*/
