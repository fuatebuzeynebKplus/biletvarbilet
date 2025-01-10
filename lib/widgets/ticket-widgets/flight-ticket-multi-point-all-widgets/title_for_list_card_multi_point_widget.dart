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

class TitleForListCardMultiPointWidget extends StatelessWidget {
  const TitleForListCardMultiPointWidget({
    super.key,
    required this.index,
    required this.weHaveSlider,
  });
  final int index;
  final bool weHaveSlider;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    String? logo = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .first
        .ticketingAirline!
        .logo!; // رابط وهمي للوغو شركة الطيران
    String arriveTime = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .last
        .arrivalDate!; // وقت وهمي للوصول
    String departureTime = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .first
        .departureDate!; // وقت وهمي للمغادرة
    DateTime dateDepartureTime =
        DateTime.parse(departureTime); // تحويل وقت المغادرة إلى DateTime
    String formattedDepartureTime =
        DateFormat.Hm().format(dateDepartureTime); // 15:00
    DateTime dateArriveTime =
        DateTime.parse(arriveTime); // تحويل وقت الوصول إلى DateTime
    String formattedArriveTime =
        DateFormat.Hm().format(dateArriveTime); // 18:30

    String formattedDepartureForStringMonth =
        DateFormat.MMM().format(dateDepartureTime); // Nov

    String? departureAirportCode = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .first
        .departureAirport!
        .code!; // كود مطار المغادرة (مطار إسطنبول)
    String? arrivalAirportCode = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .last
        .arrivalAirport!
        .code!; // كود مطار الوصول (مطار جون إف كينيدي)

    int stopCount = flightTicketCubit
        .selectAirResultForMultiPointList[index]
        .legs!
        .first
        .alternativeLegs!
        .first
        .segments!
        .length; // عدد محطات التوقف الوهمي

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
                    logo,
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
                        text: departureAirportCode,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      TextWidget(
                        text: ' $formattedDepartureTime',
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
                        text: formattedArriveTime,
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
                        text: dateDepartureTime.day.toString(),
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
                            text: dateDepartureTime.year.toString(),
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
              weHaveSlider == false
                  ? const SizedBox()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                          width: 12.0 * flightTicketCubit.listMultiPoint.length,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: flightTicketCubit.listMultiPoint.length,
                            itemBuilder: (BuildContext context, int indexx) {
                              return Container(
                                margin: const EdgeInsets.all(1),
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: index == indexx
                                      ? AppColors.kSecondColor
                                      : AppColors.kGrey,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            flightTicketCubit.saveIndexForMultiPointFunction(
                index: index, isSelectedCard: true);

            flightTicketCubit.bottomSheetValue(type: 51);
            print(
                'flightTicketCubit.bottomSheetType: ${flightTicketCubit.bottomSheetType}');
            // print('${flightTicketCubit.sendIndexValueReturn!}');
            // print('${flightTicketCubit.sendIndexValue!}');
            // flightTicketCubit.sendIndexFunction(
            //     index: flightTicketCubit.sendIndexValueReturn!);
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
      ],
    );
  }
}
