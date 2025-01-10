// import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
// import 'package:bamobile1/generated/l10n.dart';
// import 'package:bamobile1/utils/app_colors.dart';
// import 'package:bamobile1/utils/app_sizes.dart';
// import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
// import 'package:bamobile1/widgets/close_and_apply_widget.dart';
// import 'package:bamobile1/widgets/save_and_clean_in_bottom_sheet_widget.dart';
// import 'package:bamobile1/widgets/text_field_other_design_widget.dart';
// import 'package:bamobile1/widgets/text_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CurrentAccountBottomSheet extends StatelessWidget {
//   const CurrentAccountBottomSheet({super.key});

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
//           height: 0.4,
//           paddingTop: 0,
//           title: SaveAndCleanInBottomSheetWidget(
//             onTopForSave: () {
//               flightTicketCubit.bottomSheetValue(type: 6);
//             },
//             onTopForClean: () {
//               flightTicketCubit.bottomSheetValue(type: 0);
//             },
//           ),
//           widgetBody: const SizedBox(),
//         );
//       },
//     );
//   }
// }
