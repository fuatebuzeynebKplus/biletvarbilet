// import 'package:bamobile1/bottom_nav_bar.dart';
// import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
// import 'package:bamobile1/utils/app_colors.dart';
// import 'package:bamobile1/utils/app_sizes.dart';
// import 'package:bamobile1/views/main_views/home_view.dart';
// import 'package:bamobile1/views/ticket-views/flight_ticket_view.dart';
// import 'package:bamobile1/widgets/app_bar_widget.dart';
// import 'package:bamobile1/widgets/error_result_widget.dart';
// import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/flight_details_container_widget.dart';
// import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/passengers_details_container_widget.dart';
// import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/reservation_details_container_widget.dart';
// import 'package:bamobile1/widgets/loading_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class FlightTicketResultView extends StatelessWidget {
//   const FlightTicketResultView({super.key});

//   static String id = 'FlightTicketResultView';
//   @override
//   Widget build(BuildContext context) {
//     FlightTicketCubit flightTicketCubit =
//         BlocProvider.of<FlightTicketCubit>(context);
//     return BlocConsumer<FlightTicketCubit, FlightTicketState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: Colors.grey.shade200,
//           appBar: AppBar(
//             toolbarHeight: context.height * 0.06,
//             automaticallyImplyLeading: false,
//             title: AppBarWidget(
//               onPressedLeading: () {
//                 flightTicketCubit.selectedPaymentTypeForReservation = null;
//                 flightTicketCubit
//                     .checkIsAnyOneNullOrNotCompleatForReservationValue = false;
//                 flightTicketCubit.clearAll(type: 'sdfs');
//                 flightTicketCubit.selectedCardLeaving = null;
//                 flightTicketCubit.selectedCardReturn = null;
//                 flightTicketCubit.selectedSeatTypeLeaving = null;
//                 flightTicketCubit.selectedSeatTypeReturn = null;
//                 flightTicketCubit.isVisibilitySeatType = false;
//                 flightTicketCubit.isVisibility = false;
//                 flightTicketCubit.validateKeyOneWay = null;
//                 flightTicketCubit.validateKeyReturn = null;
//                 flightTicketCubit.validateKeyList = [];
//                 flightTicketCubit.passengerCardDataList = [];
//                 flightTicketCubit.selectPaymentType = null;
//                 flightTicketCubit.email = null;
//                 flightTicketCubit.phoneNo = null;
//                 flightTicketCubit.totalPrice = 0.0;
//                 flightTicketCubit.priceValue = 0.0;
//                 flightTicketCubit.flightSearchResultGo = [];
//                 flightTicketCubit.flightSearchResultsMainList = [];
//                 flightTicketCubit.afterRefreshFlightSearchResultsLeaving = [];
//                 flightTicketCubit.afterRefreshFlightSearchResultsReturn = [];
//                 flightTicketCubit.firstSearchCity = null;
//                 flightTicketCubit.firstCityCode = null;
//                 flightTicketCubit.secondSearchCity = null;
//                 flightTicketCubit.secondCityCode = null;

//                 flightTicketCubit.binCode = null;
//                 flightTicketCubit.creditCardName = null;
//                 flightTicketCubit.creditCardNumber = null;
//                 flightTicketCubit.creditCardCvv = null;
//                 flightTicketCubit.creditCardMonthAndYear = null;
//                 Navigator.pushReplacementNamed(context, BottomNavBar.id);
//               },
//               title: 'Reservations Details View',
//               leading: Icons.arrow_back_ios,
//             ),
//             backgroundColor: AppColors.kAppBarColor,
//           ),
//           body: state is GetDetailsResultViewLoading
//               ? const LoadingWidget()
//               : state is GetDetailsResultViewLoading
//                   ? const ErrorResultWidget(
//                       errorCode: '',
//                       errorMassage: '',
//                     )
//                   : const Padding(
//                       padding: EdgeInsets.only(
//                           top: 12, left: 8, right: 8, bottom: 12),
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             ReservationDetailsContainerWidget(
//                               index: 0,
//                               thisViewIsResultView: true,
//                             ),
//                             SizedBox(
//                               height: 6,
//                             ),
//                             PassengersDetailsContainerWidget(
//                               index: 0,
//                               thisViewIsResultView: true,
//                             ),
//                             SizedBox(
//                               height: 6,
//                             ),
//                             FlightDetailsContainerWidget(
//                               index: 0,
//                               thisViewIsResultView: true,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//         );
//       },
//     );
//   }
// }
