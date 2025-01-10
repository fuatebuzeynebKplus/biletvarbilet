import 'package:bamobile1/bottom_nav_bar.dart';
import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/alert_dialog_widget.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/hotel_reservations_card_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';

import 'package:bamobile1/widgets/user_view_widgets/bottom-sheet/filter_reservation_bottom_sheet.dart';

import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/get_reservations_card_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/two_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-search-conclusion-view-widgets/sort_alert_dialog_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/title_for_list_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class GetReservationsView extends StatelessWidget {
  const GetReservationsView({super.key});
  static String id = 'GetReservationsView';
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    flightTicketCubit.isCanceled = false;
    if (BlocProvider.of<AuthCubit>(context).thisUserIsAgent == true) {
      if (flightTicketCubit.getReservationsList.isEmpty) {
        BlocProvider.of<FlightTicketCubit>(context).getReservations(context);
      }
    }
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialogWidget(
                      isHaveBorder: false,
                      heightTest: 0.13,
                      widthTest: 1,
                      widget: Column(
                        children: [
                          TextWidget(
                            textAlign: TextAlign.left,
                            text: S.of(context).AppCloseMessage,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: TextWidget(
                                  color: AppColors.kSecondColor,
                                  text: S.of(context).No,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              GestureDetector(
                                onTap: () {
                                  SystemNavigator.pop();
                                },
                                child: TextWidget(
                                  color: AppColors.kSecondColor,
                                  text: S.of(context).Yes,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        ],
                      ));
                });
          },
          child: Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    transform: Matrix4.skewX(-0.15),
                    child: const TextWidget(
                      text: 'bilet',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                  Transform(
                    transform: Matrix4.skewX(-0.2),
                    child: TextWidget(
                      text: 'Var',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kSecondColor,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                  Transform(
                    transform: Matrix4.skewX(-0.15),
                    child: const TextWidget(
                      text: 'bilet',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                ],
              ),
              backgroundColor: AppColors.kAppBarColor,
            ),
            bottomSheet: flightTicketCubit.bottomSheetType == 23
                ? const FilterReservationBottomSheet()
                : null,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      flightTicketCubit.getReservationsList = [];
                      flightTicketCubit.getReservationsList
                          .addAll(flightTicketCubit.savedGetReservationsList);
                      flightTicketCubit.bottomSheetValue(type: 23);
                      print(
                          'bottomSheetValue=${flightTicketCubit.bottomSheetType}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 8.0),
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
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            flightTicketCubit.dateTimeRangeReservation =
                                await showDateRangePicker(
                              context: context,
                              firstDate: DateTime(2022),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme:
                                        Theme.of(context).colorScheme.copyWith(
                                              primary: AppColors
                                                  .kSecondColor, // Set the select color
                                              //onPrimary: Colors.white,
                                            ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (flightTicketCubit.dateTimeRangeReservation !=
                                null) {
                              DateTime startDate = flightTicketCubit
                                  .dateTimeRangeReservation!.start;

                              // إضافة 23:59:59 للنهاية
                              DateTime endDate = flightTicketCubit
                                  .dateTimeRangeReservation!.end
                                  .add(
                                const Duration(
                                    hours: 23, minutes: 59, seconds: 59),
                              );

                              flightTicketCubit.dateTimeRangeReservation =
                                  DateTimeRange(
                                start: startDate,
                                end: endDate,
                              );
                            }

                            flightTicketCubit
                                .dateRangePickerReservation(context);
                            if (flightTicketCubit
                                .isSelectedDateRangeReservationJustOneMonth) {
                              BlocProvider.of<FlightTicketCubit>(context)
                                  .getReservations(context);
                            }
                          },
                          child: Container(
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
                                  text: DateFormat('dd-MM-yyy').format(
                                      flightTicketCubit
                                          .selectDateTimeRangeReservation
                                          .start),
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            flightTicketCubit.dateTimeRangeReservation =
                                await showDateRangePicker(
                              context: context,
                              firstDate: DateTime(2022),
                              lastDate: DateTime.now(),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme:
                                        Theme.of(context).colorScheme.copyWith(
                                              primary: AppColors
                                                  .kSecondColor, // Set the select color
                                              //onPrimary: Colors.white,
                                            ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (flightTicketCubit.dateTimeRangeReservation !=
                                null) {
                              DateTime startDate = flightTicketCubit
                                  .dateTimeRangeReservation!.start;

                              // إضافة 23:59:59 للنهاية
                              DateTime endDate = flightTicketCubit
                                  .dateTimeRangeReservation!.end
                                  .add(
                                const Duration(
                                    hours: 23, minutes: 59, seconds: 59),
                              );

                              flightTicketCubit.dateTimeRangeReservation =
                                  DateTimeRange(
                                start: startDate,
                                end: endDate,
                              );
                            }

                            flightTicketCubit
                                .dateRangePickerReservation(context);
                            if (flightTicketCubit
                                .isSelectedDateRangeReservationJustOneMonth) {
                              BlocProvider.of<FlightTicketCubit>(context)
                                  .getReservations(context);
                            }
                          },
                          child: Container(
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
                                  text: DateFormat('dd-MM-yyy').format(
                                      flightTicketCubit
                                          .selectDateTimeRangeReservation.end),
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  state is GetReservationsLoading
                      ? Column(
                          children: [
                            SizedBox(
                              height: context.height * 0.1,
                            ),
                            const LoadingWidget(),
                          ],
                        )
                      : state is GetReservationsFailure
                          ? ErrorResultWidget(
                              errorCode: state.errorCode,
                              errorMassage: state.errorMassage,
                            )
                          : Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: SizedBox(
                                width: context.width * 1,
                                height: context.height * 0.69,
                                child: ListView.builder(
                                  itemCount: flightTicketCubit
                                      .getReservationsList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var flightBookingList = flightTicketCubit
                                        .getReservationsList[index]
                                        .flightBookingList;

                                    return flightBookingList == null ||
                                            flightBookingList.isEmpty
                                        ? HotelReservationsCardWidget(
                                            index: index,
                                          )
                                        : GetReservationsCardWidget(
                                            index: index,
                                          );
                                  },
                                ),
                              ),
                            ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
