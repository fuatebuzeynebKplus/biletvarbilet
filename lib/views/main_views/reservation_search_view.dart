import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/hotel/data/models/cancel_reservation.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/get_reservations_card_widget.dart';
import 'package:bamobile1/widgets/get-booking-widgets/get_booking_card.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/text_field_other_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationSearchView extends StatelessWidget {
  const ReservationSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        state is GetReservationsFailure
            ? SnackbarUtils.showSnackbar(context, state.errorMassage, 2)
            : null;
      },
      builder: (context, state) {
        return Scaffold(
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
            body: state is GetReservationsLoading
                ? const LoadingWidget()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Column(
                      children: [
                        TextFieldOtherDesignWidget(
                          autofocus: false,
                          text: 'PNR Number',
                          height: 0.055,
                          width: 1,
                          circularRightTopAndBottom: 6,
                          circularLeftTopAndBottom: 6,
                          onChanged: (value) {
                            flightTicketCubit.systemPnrForGetBook = value;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFieldOtherDesignWidget(
                          autofocus: false,
                          text: S.of(context).LastName,
                          height: 0.055,
                          width: 1,
                          circularRightTopAndBottom: 6,
                          circularLeftTopAndBottom: 6,
                          onChanged: (value) {
                            flightTicketCubit.lastNameForGetBook = value;
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        ButtonWidget(
                          title: S.of(context).Search,
                          height: 0.05,
                          width: 0.6,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                          color: AppColors.kSecondColor,
                          onTap: () async {
                            if (flightTicketCubit.systemPnrForGetBook == null ||
                                flightTicketCubit.lastNameForGetBook == null) {
                              SnackbarUtils.showSnackbar(
                                  context, S.of(context).pleaseFillAllFields);
                            } else {
                              await flightTicketCubit.getBooking(
                                  CancelReservationJson(
                                      request: CancelReservation(
                                          tokenCode: getIt<CacheHelper>()
                                                  .getDataString(
                                                      key: 'token') ??
                                              "",
                                          SystemPnr: flightTicketCubit
                                              .systemPnrForGetBook!,
                                          LastName: flightTicketCubit
                                              .lastNameForGetBook!)),
                                  context);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 36,
                        ),
                        flightTicketCubit.getBookingModelDetails != null
                            ? const GetBookingCard()
                            : const SizedBox()
                      ],
                    ),
                  ));
      },
    );
  }
}
