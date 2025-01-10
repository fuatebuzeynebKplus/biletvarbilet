import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/common/data/models/booking.dart';
import 'package:bamobile1/common/data/models/hotel_room_pax.dart';
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

class GuestDetailsContainerWidget extends StatelessWidget {
  const GuestDetailsContainerWidget({
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
    List<Booking> howListIsComing = [];

    howListIsComing = flightTicketCubit.getReservationsList;
    List<dynamic>? hotelBookingList;
    DateTime? checkInDate;
    DateTime? checkOutDate;
    String? logo;
    String? hotelName;

    checkOutDate = (DateTime.parse(
        howListIsComing[index].hotelBookingList?.first["CheckOutDate"]));
    checkInDate = DateTime.parse(
        howListIsComing[index].hotelBookingList?.first["CheckInDate"]);

    logo = howListIsComing[index].hotelBookingList?.first["HotelInfo"]
        ["HotelImageURL"];
    hotelName = howListIsComing[index].hotelBookingList?.first["HotelInfo"]
        ["HotelName"];

    if (thisViewIsResultView == false) {
      hotelBookingList =
          flightTicketCubit.getReservationsList[index].hotelBookingList!;
    } else {
      hotelBookingList =
          flightTicketCubit.detailsForResultView!.hotelBookingList!;
    }
    // List<List<dynamic>> guestList = [];

    List<dynamic> guestList = [];

    for (var elementA in hotelBookingList) {
      for (var elementB in elementA["Rooms"]) {
        for (var elementC in elementB["PaxList"]) {
          guestList.add(elementC["Pax"]);
        }
      }
    }

    // for (var elementMain in hotelBookingList) {
    //   if (elementMain is Map<String, dynamic> && elementMain["Rooms"] is List) {
    //     for (var elementA in elementMain["Rooms"]) {
    //       if (elementA is Map<String, dynamic> && elementA["PaxList"] is List) {
    //         guestList.add(elementA["PaxList"]);
    //       }
    //     }
    //   }
    // }

    print('guestList: $guestList');
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
          height: guestList.length > 3
              ? context.height * 0.32
              : guestList.length * context.height * 0.11,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.kSecondColor)),
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, left: 12, right: 12, bottom: 12),
              child: ListView.builder(
                itemCount: guestList.length,
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
                                '${guestList[indexList]["FirstName"].toString()} ${guestList[indexList]["LastName"].toString()}', //totalPrice!,
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
                            text: guestList[indexList]["DateOfBirth"]
                                .toString(), //totalPrice!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      // guestList[indexList]["PassportNumber"].isEmpty ?? true
                      //     ? Row(
                      //         children: [
                      //           TextWidget(
                      //             text:
                      //                 '${S.of(context).IdentityNumber}:   ', //totalPrice!,
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.black,
                      //           ),
                      //           TextWidget(
                      //             text: guestList[indexList]["IdentityNumber"]
                      //                 .toString(), //totalPrice!,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.grey,
                      //           ),
                      //         ],
                      //       )
                      //     : Row(
                      //         children: [
                      //           TextWidget(
                      //             text:
                      //                 '${S.of(context).PassportNumber}:   ', //totalPrice!,
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.black,
                      //           ),
                      //           TextWidget(
                      //             text: guestList[indexList]["PassportNumber"]
                      //                 .toString(), //totalPrice!,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.grey,
                      //           ),
                      //         ],
                      //       ),
                      // paxList.first.first.pax!.passportNumber?.isEmpty ?? true
                      //     ? const SizedBox()
                      //     : Row(
                      //         children: [
                      //           TextWidget(
                      //             text:
                      //                 '${S.of(context).ValidityDate}:   ', //totalPrice!,
                      //             fontSize: 16,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.black,
                      //           ),
                      //           TextWidget(
                      //             text:
                      //                 '${paxList.first[indexList].pax!.passportValidityDate}', //totalPrice!,
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.bold,
                      //             color: Colors.grey,
                      //           ),
                      //         ],
                      //       ),
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
                            text: guestList[indexList]["NationalityCode"]
                                .toString(), //totalPrice!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      guestList[indexList].length == 1
                          ? const SizedBox()
                          : const Divider()
                    ],
                  );
                },
              )),
        ),
        const SizedBox(
          height: 6,
        ),
        TextWidget(
            text: S.of(context).HotelInfo,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black54),
        SizedBox(height: context.height * 0.01),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.kSecondColor)),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, left: 12, right: 12, bottom: 12),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(8.0), // درجة انحناء الحواف
                    child: Image.network(
                      logo ?? '',
                      height: context.width * 0.22,
                      width: context.width * 0.22,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/no_Image.png',
                          height: context.width * 0.2,
                          width: context.width * 0.2,
                        );
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: context.width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: hotelName!.length > 26
                            ? '${hotelName.substring(0, 26)}...'
                            : hotelName,
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          TextWidget(
                              text: '${S.of(context).CheckInDate}:  ',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          TextWidget(
                              text: DateFormat('dd.MM.yyyy')
                                  .format(checkInDate ?? DateTime.now()),
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                      Row(
                        children: [
                          TextWidget(
                              text: '${S.of(context).CheckOutDate}:  ',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          TextWidget(
                              text: DateFormat('dd.MM.yyyy')
                                  .format(checkInDate ?? DateTime.now()),
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                        ],
                      ),
                      Row(
                        children: [
                          TextWidget(
                              text: '${S.of(context).RoomCount}:  ',
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          TextWidget(
                              text:
                                  '${howListIsComing[index].hotelBookingList?.first["Rooms"].length}',
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
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
    );
  }
}
