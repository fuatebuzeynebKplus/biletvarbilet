import 'package:bamobile1/bottom_nav_bar.dart';
import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/main_views/home_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/flight_reservation_details_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_payment_data_enter_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/transaction_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlightTicketBookResult extends StatelessWidget {
  const FlightTicketBookResult({super.key});
  static String id = 'FlightTicketBookResult';
  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: context.height * 0.06,
            automaticallyImplyLeading: false,
            title: AppBarWidget(
              onPressedLeading: () {},
              title: S.of(context).ResultScreen,
              leading: Icons.arrow_back_ios,
            ),
            backgroundColor: AppColors.kAppBarColor,
          ),
          backgroundColor: Colors.grey.shade200,
          body: state is FlightBookLoading || state is GetReservationsLoading
              ? const LoadingWidget()
              : state is FlightBookFailure
                  ? TransactionResultWidget(
                      image: AppImages.errorIcon,
                      title: S.of(context).PaymentFailed,
                      subTitle: state.errorMassage,
                      code: state.errorCode,
                      buttonText: S.of(context).TryAgain,
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          FlightTicketPaymentDataEnterView.id,
                        );
                      },
                    )
                  : TransactionResultWidget(
                      image: AppImages.doneIcon,
                      title: S
                          .of(context)
                          .YourTransactionHasBeenSuccessfullyCompleted,
                      buttonText: S.of(context).ReservationDetails,
                      onTap: () async {
                        // if (BlocProvider.of<FlightTicketCubit>(context)
                        //         .paymentType ==
                        //     PaymentType.preBooking) {
                        //   {
                        flightTicketCubit.paxInfoList.clear();
                        flightTicketCubit
                                .checkIsAnyOneNullOrNotCompleatForReservationValue =
                            false;
                        flightTicketCubit.selectedPaymentTypeForReservation =
                            null;
                        flightTicketCubit.paymentTypesShow = false;
                        flightTicketCubit.bottomSheetValue(type: 0);
                        flightTicketCubit.clearAll(type: 'sdfs');
                        flightTicketCubit.selectedCardLeaving = null;
                        flightTicketCubit.selectedCardReturn = null;
                        flightTicketCubit.selectedSeatTypeLeaving = null;
                        flightTicketCubit.selectedSeatTypeReturn = null;
                        flightTicketCubit.isVisibilitySeatType = false;
                        flightTicketCubit.isVisibility = false;
                        flightTicketCubit.validateKeyOneWay = null;
                        flightTicketCubit.validateKeyReturn = null;
                        flightTicketCubit.validateKeyList = [];
                        flightTicketCubit.passengerCardDataList = [];
                        flightTicketCubit.selectPaymentType = null;
                        flightTicketCubit.email = null;
                        flightTicketCubit.phoneNo = null;
                        flightTicketCubit.totalPrice = 0.0;
                        flightTicketCubit.priceValue = 0.0;
                        flightTicketCubit.flightSearchResultGo = [];
                        flightTicketCubit.flightSearchResultsMainList = [];
                        flightTicketCubit
                            .afterRefreshFlightSearchResultsLeaving = [];
                        flightTicketCubit
                            .afterRefreshFlightSearchResultsReturn = [];

                        flightTicketCubit.firstCityCode =
                            flightTicketCubit.fromAirportCode;
                        flightTicketCubit.secondCityCode =
                            flightTicketCubit.toAirportCode;
                        flightTicketCubit.firstSearchCity =
                            flightTicketCubit.fromCityCode;
                        flightTicketCubit.secondSearchCity =
                            flightTicketCubit.toCityCode;

                        flightTicketCubit.dateTime = DateTime.now();
                        flightTicketCubit.dateTimeRange = DateTimeRange(
                            start: DateTime.now(),
                            end: DateTime.now().add(const Duration(days: 7)));
                        flightTicketCubit.binCode = null;
                        flightTicketCubit.creditCardName = null;
                        flightTicketCubit.creditCardNumber = null;
                        flightTicketCubit.creditCardCvv = null;
                        flightTicketCubit.creditCardMonthAndYear = null;
                        if (authCubit.thisUserIsAgent == false) {
                        } else {
                          await BlocProvider.of<FlightTicketCubit>(context)
                              .getReservations(context);
                          print(
                              '444getReservations: ${flightTicketCubit.getReservationsList.length}');
                          print(
                              'flightTicketCubit.pnrSystemForResultView: ${flightTicketCubit.pnrSystemForReservationCard}');
                          for (var item
                              in flightTicketCubit.getReservationsList) {
                            print(item
                                .systemPnr); // لطباعة قيمة systemPnr لكل عنصر
                          }
                          int index = flightTicketCubit.getReservationsList
                              .indexWhere((item) =>
                                  item.systemPnr ==
                                  flightTicketCubit
                                      .pnrSystemForReservationCard);
                          //    print('index: $index');
                          flightTicketCubit.saveReservationIndexFunction(
                              index: index);
                          // print(
                          //     'flightTicketCubit.saveReservationIndexValue: ${flightTicketCubit.saveReservationIndexValue}');
                          Navigator.pushReplacementNamed(
                              context, FlightReservationDetailsView.id);
                        }
                        //   }
                        // } else {
                        //   BlocProvider.of<FlightTicketCubit>(context)
                        //       .getBookingDetails();
                        //   Navigator.pushReplacementNamed(
                        //     context,
                        //     FlightTicketResultView.id,
                        //   );
                        // }
                      },
                    ),
        );
      },
    );
  }
}
