// import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
// import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
// import 'package:bamobile1/widgets/close_and_apply_widget.dart';
// import 'package:bamobile1/widgets/container_card_two_widget.dart';
// import 'package:bamobile1/widgets/save_and_clean_in_bottom_sheet_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AlternativeBottomSheet extends StatelessWidget {
//   const AlternativeBottomSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<FlightTicketCubit, FlightTicketState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         FlightTicketCubit flightTicketCubit =
//             BlocProvider.of<FlightTicketCubit>(context);
//         return BottomSheetWidget(
//           paddingLeftRight: 0,
//           paddingTop: 0,
//           title: SaveAndCleanInBottomSheetWidget(
//             onTopForSave: () {
//               flightTicketCubit.bottomSheetValue(type: 6);
//             },
//             onTopForClean: () {
//               flightTicketCubit.bottomSheetValue(type: 0);
//             },
//           ),
//           height: 0.4,
//           widgetBody: const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 16,
//                 ),
//                 ContainerCardTwoWidget(
//                   text: 'google pay',
//                   image: 'assets/images/googlePay.png',
//                 ),
//                 SizedBox(
//                   height: 6,
//                 ),
//                 ContainerCardTwoWidget(
//                   text: 'apple pay',
//                   image: 'assets/images/applePay.png',
//                 ),
//                 SizedBox(
//                   height: 6,
//                 ),
//                 ContainerCardTwoWidget(
//                   text: 'huawei pay',
//                   image: 'assets/images/huaweiPay.png',
//                 ),
//                 SizedBox(
//                   height: 6,
//                 ),
//               ],
//             ),
//           ),
//           //  closeApply: CloseAndApplyWidget(),
//         );
//       },
//     );
//   }
// }
