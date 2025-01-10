import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_segment.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/two_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TitleForListCardWidget extends StatelessWidget {
  const TitleForListCardWidget({
    super.key,
    this.cuticularColorOne,
    this.cuticularColorTwo,
    required this.itIsReturnOrOneWay,
    required this.isShow,
  });
  final Color? cuticularColorOne;
  final Color? cuticularColorTwo;
  final int itIsReturnOrOneWay;
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    List<AirSegment>? itIsReturnOrOneWayFlitter = [];

    if (flightTicketCubit.searchTypeValue == 'tek') {
      if (flightTicketCubit.afterRefreshFlightSearchResultsLeaving.isNotEmpty) {
        itIsReturnOrOneWayFlitter = flightTicketCubit
            .afterRefreshFlightSearchResultsLeaving[
                flightTicketCubit.sendIndexValue!]
            .legs![0]
            .alternativeLegs![0]
            .segments!;
      }
    } else {
      if (flightTicketCubit.afterRefreshFlightSearchResultsLeaving.isNotEmpty &&
          flightTicketCubit.afterRefreshFlightSearchResultsReturn.isNotEmpty) {
        if (itIsReturnOrOneWay == 0) {
          itIsReturnOrOneWayFlitter = flightTicketCubit
              .afterRefreshFlightSearchResultsLeaving[
                  flightTicketCubit.sendIndexValue!]
              .legs![0]
              .alternativeLegs![0]
              .segments!;
        } else {
          itIsReturnOrOneWayFlitter = flightTicketCubit
              .afterRefreshFlightSearchResultsReturn[
                  flightTicketCubit.sendIndexValueReturn!]
              .legs![0]
              .alternativeLegs![0]
              .segments!;
        }
      }
    }
// تعريف المتغيرات
    String? logo;
    String arriveTime = '';
    String departureTime = '';
    DateTime? dateDepartureTime;
    String formattedDepartureTime = '';
    DateTime? dateArriveTime;
    String formattedArriveTime = '';
    String formattedDepartureForStringMonth = '';
    String? departureAirportCode;
    String? arrivalAirportCode;
    int stopCount = 0;

// التحقق من أن القائمة ليست فارغة
    if (itIsReturnOrOneWayFlitter.isNotEmpty) {
      // إسناد القيم داخل الشرط
      logo = itIsReturnOrOneWayFlitter.first.ticketingAirline?.logo;

      arriveTime = itIsReturnOrOneWayFlitter.last.arrivalDate!;
      departureTime = itIsReturnOrOneWayFlitter.first.departureDate!;

      dateDepartureTime = DateTime.parse(departureTime);
      formattedDepartureTime = DateFormat.Hm().format(dateDepartureTime);

      dateArriveTime = DateTime.parse(arriveTime);
      formattedArriveTime = DateFormat.Hm().format(dateArriveTime);

      formattedDepartureForStringMonth =
          DateFormat.MMM().format(dateDepartureTime);

      departureAirportCode =
          itIsReturnOrOneWayFlitter.first.departureAirport?.code;
      arrivalAirportCode = itIsReturnOrOneWayFlitter.last.arrivalAirport?.code;

      stopCount = itIsReturnOrOneWayFlitter.length;
    }

    return Column(
      children: [
        Container(
          width: context.width * 1,
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Image.network(
                    logo ?? '',
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
                        text: departureAirportCode ?? '',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      TextWidget(
                        text:
                            ' ${flightTicketCubit.convertArabicNumbersToEnglish(formattedDepartureTime)}',
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
                        text: flightTicketCubit
                            .convertArabicNumbersToEnglish(formattedArriveTime),
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
                        text: '${dateDepartureTime?.day}',
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
                            text: '${dateDepartureTime?.year}',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(1),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: cuticularColorOne,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(1),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: cuticularColorTwo,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        isShow == true
            ? GestureDetector(
                onTap: () {
                  print(
                      'flightTicketCubit.bottomSheetType: ${flightTicketCubit.bottomSheetType}');
                  // print('${flightTicketCubit.sendIndexValueReturn!}');
                  // print('${flightTicketCubit.sendIndexValue!}');
                  // flightTicketCubit.sendIndexFunction(
                  //     index: flightTicketCubit.sendIndexValueReturn!);

                  if (itIsReturnOrOneWay == 0) {
                    flightTicketCubit.bottomSheetValue(type: 5);
                  } else if (itIsReturnOrOneWay == 1) {
                    flightTicketCubit.bottomSheetValue(type: 22);
                  } else {
                    null;
                  }
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
            : const SizedBox()
      ],
    );
  }
}
