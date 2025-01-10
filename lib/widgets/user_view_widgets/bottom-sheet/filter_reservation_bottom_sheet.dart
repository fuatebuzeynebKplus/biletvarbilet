import 'dart:ui';

import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/alert_dialog_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/close_and_apply_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_field_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/buttons_for_fliter_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/middle_for_filter_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/select_price_hour_duration_for_filter_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/sort_alert_dialog_widget.dart';
import 'package:bamobile1/widgets/user_view_widgets/bottom-sheet/reservat%C4%B1on_sort__alert_dialog_widget.dart';
import 'package:bamobile1/widgets/user_view_widgets/bottom-sheet/reservations_type_alert_dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:bamobile1/widgets/text_spacer_widget_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FilterReservationBottomSheet extends StatelessWidget {
  const FilterReservationBottomSheet({super.key});

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
                  child: Column(children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 0, right: 0, top: 8.0),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Container(
                              height: context.height * 0.06,
                              width: context.width * 0.46,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    AppImages.calendarIcon,
                                    color: AppColors.kSecondColor,
                                    height: context.height * 0.04,
                                    width: context.height * 0.04,
                                  ),
                                  TextWidget(
                                    text: flightTicketCubit
                                        .convertArabicNumbersToEnglish(DateFormat(
                                                'dd.MM.yyy')
                                            .format(flightTicketCubit
                                                .selectDateTimeRangeReservation
                                                .start)),
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: context.height * 0.06,
                            width: context.width * 0.46,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  AppImages.calendarIcon,
                                  color: AppColors.kSecondColor,
                                  height: context.height * 0.04,
                                  width: context.height * 0.04,
                                ),
                                TextWidget(
                                  text: flightTicketCubit
                                      .convertArabicNumbersToEnglish(DateFormat(
                                              'dd.MM.yyy')
                                          .format(flightTicketCubit
                                              .selectDateTimeRangeReservation
                                              .end)),
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 8, right: 8),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        width: context.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: AppColors.kSecondColor, width: 1),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                Image.network(
                                  'https://via.placeholder.com/150', // صورة الشعار الوهمية
                                  height: context.width * 0.06,
                                  width: context.width * 0.09,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/no_Image.png',
                                      height: context.width * 0.06,
                                      width: context.width * 0.09,
                                    );
                                  },
                                ),
                                SizedBox(
                                  width: context.width * 0.02,
                                ),
                                const Row(
                                  children: [
                                    TextWidget(
                                      text: '---', // كود مطار المغادرة
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                    TextWidget(
                                      text: ' 10:30', // وقت المغادرة
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: context.width * 0.01,
                                ),
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    NonStopDesignWidget(
                                      dividerWidth: 0.05,
                                      text: false,
                                    ), // حالة التوقف: بدون توقف
                                  ],
                                ),
                                SizedBox(
                                  width: context.width * 0.01,
                                ),
                                const Row(
                                  children: [
                                    TextWidget(
                                      text: '02:45', // وقت الوصول
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                    TextWidget(
                                      text: ' ---', // كود مطار الوصول
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
                                    const TextWidget(
                                      text: '25', // يوم الوصول
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                    SizedBox(
                                      width: context.width * 0.01,
                                    ),
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: '---', // الشهر
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                        ),
                                        TextWidget(
                                          text: '20--', // السنة
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
                            const SizedBox(
                              height: 10,
                            ),
                            Table(
                              columnWidths: {
                                0: FixedColumnWidth(context.width * 0.47),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: TextWidget(
                                        text:
                                            '${S.of(context).Name} ${S.of(context).LastName}:',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const TextWidget(
                                        text: '-- ---', // الاسم الكامل
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: TextWidget(
                                        text: S.of(context).ReservationNumber,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const TextWidget(
                                        text: 'ABC123', // رقم الحجز
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: TextWidget(
                                        text: S.of(context).TotalCharge,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const TextWidget(
                                        text: '----.- TRY', // السعر
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: TextWidget(
                                        text: '${S.of(context).Reservation}:',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const TextWidget(
                                        text: '-------', // حالة الحجز
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: TextWidget(
                                        text:
                                            '${S.of(context).TransactionDate}:',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: const TextWidget(
                                        text: '30-12-20-- 16:00',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonWidget(
                              title: S.of(context).ReservationDetails,
                              onTap: () {},
                              height: 0.04,
                              width: 0.6,
                              fontSize: 14,
                              textColor: Colors.white,
                              color: AppColors.kSecondColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    )
                  ]),
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
                  ],
                ),
                noScroll: false,
                height: 0.45,

                widgetBody: Column(children: [
                  // GestureDetector(
                  //   onTap: () {},
                  //   child: Container(
                  //     color: Colors.white,
                  //     child: TextSpacerWidgetWidget(
                  //       title: 'Hizmet Tipi',
                  //       color: Colors.grey.shade500,
                  //       widget: Padding(
                  //         padding: const EdgeInsets.only(right: 6),
                  //         child: Icon(
                  //           Icons.arrow_right,
                  //           color: AppColors.kSecondColor,
                  //           size: 30,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // const Divider(
                  //   thickness: 1,
                  //   color: Colors.black,
                  // ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return const AlertDialogWidget(
                              isHaveBorder: true,
                              heightTest: 0.4,
                              widthTest: 0.61,
                              widget: ReservationsTypeAlertDialogWidget(),
                            );
                          });
                    },
                    child: Container(
                      color: Colors.white,
                      child: TextSpacerWidgetWidget(
                        title: S.of(context).TransactionType,
                        color: Colors.grey.shade500,
                        widget: Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.arrow_right,
                            color: AppColors.kSecondColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) {
                            return const AlertDialogWidget(
                              isHaveBorder: true,
                              heightTest: 0.32,
                              widthTest: 0.6,
                              widget: ReservationsSortAlertDialogWidget(),
                            );
                          });
                    },
                    child: Container(
                      color: Colors.white,
                      child: TextSpacerWidgetWidget(
                        title: S.of(context).Sort,
                        color: Colors.grey.shade500,
                        widget: Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: Icon(
                            Icons.arrow_right,
                            color: AppColors.kSecondColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 35,
                    child: TextFieldWidget(
                      controller: flightTicketCubit.firstNameController,
                      fontSizeForHintStyle: 14,
                      suffixIcon: Icons.close,
                      onTapSuffixIcon: () {
                        flightTicketCubit.clearTextFieldReservation(value: 0);
                      },
                      textInputType: TextInputType.name,
                      colorSuffixIcon: AppColors.kSecondColor,
                      onChanged: (value) {
                        flightTicketCubit.firstNameReservation = value;
                      },
                      hint: S.of(context).Name,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 35,
                    child: TextFieldWidget(
                      controller: flightTicketCubit.lastNameController,
                      fontSizeForHintStyle: 14,
                      suffixIcon: Icons.close,
                      textInputType: TextInputType.name,
                      colorSuffixIcon: AppColors.kSecondColor,
                      onTapSuffixIcon: () {
                        flightTicketCubit.clearTextFieldReservation(value: 1);
                      },
                      onChanged: (value) {
                        flightTicketCubit.lastNameReservation = value;
                      },
                      hint: S.of(context).LastName,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 35,
                    child: TextFieldWidget(
                      controller: flightTicketCubit.systemPNRController,
                      fontSizeForHintStyle: 14,
                      suffixIcon: Icons.close,
                      textInputType: TextInputType.name,
                      colorSuffixIcon: AppColors.kSecondColor,
                      onTapSuffixIcon: () {
                        flightTicketCubit.clearTextFieldReservation(value: 2);
                      },
                      onChanged: (value) {
                        flightTicketCubit.systemPNRReservation = value;
                      },
                      hint: S.of(context).ReservationNumber,
                    ),
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  CloseAndApplyWidget(
                    onTapApPly: () {
                      flightTicketCubit.reservationFilterFunction();
                      flightTicketCubit.bottomSheetValue(type: 0);
                    },
                    onTapClose: () {
                      flightTicketCubit.bottomSheetValue(type: 0);
                    },
                  )
                ]),
              ),
            ),
          ],
        );
      },
    );
  }
}
