import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/buttons_for_fliter_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/middle_for_filter_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/select_price_hour_duration_for_filter_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui';

import 'package:intl/intl.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 1.0, sigmaY: 1.0), // تعيين قوة البلور
              child: Opacity(
                opacity: 0.3,
                child: Container(
                  // لون الخلفية مع الشفافية
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.swap_vert,
                                      color: AppColors.kSecondColor,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    TextWidget(
                                      text: S.of(context).Sort,
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                width: 10.0,
                                thickness: 1,
                                color: Colors.grey,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      color: AppColors.kSecondColor,
                                      Icons.filter_alt,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    TextWidget(
                                      text: S.of(context).Filter,
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                                const CircularIconWidget(
                                  circularColor: Colors.white,
                                  borderColor: Colors.black54,
                                  iconColor: Colors.black87,
                                  icon: Icons.keyboard_double_arrow_left,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                TextWidget(
                                  text: S.of(context).DeparturePoint,
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                flightTicketCubit.searchTypeValue != 'tek'
                                    ? TextWidget(
                                        text: DateFormat('dd-MM-yyy').format(
                                            flightTicketCubit
                                                .dateTimeRange!.start),
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )
                                    : TextWidget(
                                        text: DateFormat('dd-MM-yyy').format(
                                            flightTicketCubit.dateTime!),
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                const SizedBox(
                                  width: 8,
                                ),
                                //--------------------------
                                const CircularIconWidget(
                                  circularColor: Colors.white,
                                  borderColor: Colors.black54,
                                  iconColor: Colors.black87,
                                  icon: Icons.keyboard_double_arrow_right,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: context.height * 0.26,
                        width: context.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(
                              color: Colors.grey, width: 1), // بدون اختيار محدد
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/no_Image.png',
                                    height: 30,
                                    width: 70,
                                  ),
                                  const SizedBox(width: 12),
                                  const Text(
                                    '', // اسم وهمي للشركة
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black26),
                                  ),
                                ],
                              ),
                              const Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '12:00',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'ABC',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '1h 30m',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            ),
                                            NonStopDesignWidget(),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '14:30',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'XYZ', // رمز مطار وهمي للوصول
                                              style: TextStyle(
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
                                  Text(
                                    'Economy', // نوع الكابينة وهمي
                                    style: TextStyle(
                                        color: AppColors.kSecondColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.airplane_ticket,
                                          color: AppColors.kSecondColor),
                                      const SizedBox(width: 6),
                                      const Text(
                                        'Economy Class', // نص وهمي لدرجة الرحلة
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.luggage,
                                          color: AppColors.kSecondColor),
                                      const SizedBox(width: 2),
                                      const Text(
                                        '20kg', // وهمي لتحديد الوزن المسموح به للأمتعة
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.event_seat,
                                          color: AppColors.kSecondColor),
                                      const SizedBox(width: 6),
                                      const Text(
                                        '5', // عدد مقاعد وهمي
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Divider(
                                  thickness: 1,
                                  color: Colors.grey.withOpacity(0.5)),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Details', // تفاصيل وهمية
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '2.154,57', // سعر وهمي
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        ' TRY', // عملة وهمية
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0, // يجعل الـ BottomSheet يبدأ من أسفل الشاشة
              left: 0,
              right: 0,

              child: BottomSheetWidget(
                paddingLeftRight: 12,
                paddingTop: 12,
                //closeApply: const CloseAndApplyWidget(),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: S.of(context).Filter,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kSecondColor,
                    ),
                    GestureDetector(
                      child: const Icon(Icons.close),
                      onTap: () {
                        if (flightTicketCubit.searchTypeForListInFilter ==
                            'tek') {
                          if (flightTicketCubit.selectedCardLeaving == null) {
                            flightTicketCubit.resultApplyForLeaving(context);
                          }
                        } else if (flightTicketCubit
                                .searchTypeForListInFilter ==
                            'cok') {
                          flightTicketCubit.resultApplyForMultiPoint(context);
                        } else {
                          print(
                              '56asd4a65s4da56s4da5sdasdasdakjlkjlkjlk*-/*--**-/-/-**-');
                          if (flightTicketCubit.selectedCardReturn == null) {
                            flightTicketCubit.resultApplyForReturn(context);
                          }
                        }
                        flightTicketCubit.bottomSheetValue(type: 0);
                        if (flightTicketCubit.selectedCardLeaving != null &&
                            flightTicketCubit.selectedCardReturn != null) {
                          flightTicketCubit.bottomSheetValue(type: 7);
                        }
                      },
                    )
                  ],
                ),
                height: 0.58,
                // BlocProvider.of<FlightTicketCubit>(context)
                //             .searchTypeValue ==
                //         'tek'
                //     ? 0.58
                //     : 0.64,
                widgetBody: const Column(
                  children: [
                    // BlocProvider.of<FlightTicketCubit>(context)
                    //             .searchTypeValue ==
                    //         'tek'
                    //     ? const SizedBox()
                    //     : const ButtonsForFilterBottomSheetWidget(),
                    // SizedBox(
                    //   height: BlocProvider.of<FlightTicketCubit>(context)
                    //               .searchTypeValue ==
                    //           'tek'
                    //       ? 0
                    //       : 8,
                    // ),
                    MiddleForFilterBottomSheetWidget(),
                    SizedBox(
                      height: 4,
                    ),
                    SelectPriceHourDurationForFilterBottomSheetWidget()
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
