import 'dart:async';

import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveButtonWidget extends StatelessWidget {
  const SaveButtonWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return ButtonWidget(
          title: S.of(context).Continue,
          color: AppColors.kSecondColor,
          height: 0.06,
          width: 0.8,
          fontSize: 18,
          textColor: Colors.white,
          onTap: () {
            FocusScope.of(context).unfocus();

            print('nationality: ${flightTicketCubit.nationality.toString()}');

            if (RegExp(r'^[a-zA-ZÇçĞğİıÖöŞşÜü\s]+$')
                    .hasMatch(flightTicketCubit.firstName ?? 'p') &&
                RegExp(r'^[a-zA-ZÇçĞğİıÖöŞşÜü\s]+$')
                    .hasMatch(flightTicketCubit.lastName ?? 'p')) {
              print('*//*//*/*/*//*');
              bool allNotNull = flightTicketCubit.passengerCardDataList
                  .every((element) => element != null);

              if (allNotNull) {
                flightTicketCubit.bottomSheetValue(type: 7);
              } else {
                flightTicketCubit.bottomSheetValue(type: 0);
              }

              if (flightTicketCubit.selectBetweenTwoTextValue !=
                      S.of(context).Man &&
                  flightTicketCubit.selectBetweenTwoTextValue !=
                      S.of(context).Woman) {
                flightTicketCubit.selectBetweenTwoTextValue =
                    S.of(context).Woman;
              }

              flightTicketCubit.processFlightTicket(context, index);
            } else {
              SnackbarUtils.showSnackbar(
                  context, S.of(context).EmptySpaceCannotBeLeft);
            }
          },
        );
      },
    );
  }
}


//function for add name-lastName-birthday-gender-itIsOk maybe we want used;


            // if (flightTicketCubit.firstName == null &&
            //     flightTicketCubit.cardDataList[index] == null) {
            //   SnackbarUtils.showSnackbar(
            //       context, S.of(context).TheNameMustNotBeLeftBlank);
            // } else if (flightTicketCubit.lastName == null &&
            //     flightTicketCubit.cardDataList[index] == null) {
              // SnackbarUtils.showSnackbar(
              //     context, S.of(context).TheLastNameMustNotBeLeftBlank);
            // } else if (flightTicketCubit.birthday == null &&
            //     flightTicketCubit.cardDataList[index] == null) {
            //   SnackbarUtils.showSnackbar(context, S.of(context).Man);
            // } else if (flightTicketCubit.firstName == null &&
            //     flightTicketCubit.firstName !=
            //         flightTicketCubit.cardDataList[index]?.firstName) {
            //   print('1111111111111');

            //   flightTicketCubit.firstName ??=
            //       flightTicketCubit.cardDataList[index]?.firstName;
            //   flightTicketCubit.lastName ??=
            //       flightTicketCubit.cardDataList[index]?.lastName;
            //   flightTicketCubit.cardDataList[index]?.firstName =
            //       flightTicketCubit.firstName;
            //   flightTicketCubit.cardDataList[index]?.lastName =
            //       flightTicketCubit.lastName;
            //   flightTicketCubit.cardDataList[index]!.itIsOk = true;
            //   flightTicketCubit.cardDataList[index]!.gender =
            //       flightTicketCubit.selectBetweenTwoTextValue;
            //   flightTicketCubit.clearAllFields(index: index);
            //   Navigator.pop(context);
            // }

            // else if (flightTicketCubit.firstName != null &&
            //     flightTicketCubit.cardDataList[index] != null &&
            //     flightTicketCubit.cardDataList[index]?.firstName !=
            //         flightTicketCubit.firstName) {
            //   print('333333333333');
            //   flightTicketCubit.firstName ??=
            //       flightTicketCubit.cardDataList[index]?.firstName;
            //   flightTicketCubit.lastName ??=
            //       flightTicketCubit.cardDataList[index]?.lastName;
            //   flightTicketCubit.cardDataList[index]?.firstName =
            //       flightTicketCubit.firstName;
            //   flightTicketCubit.cardDataList[index]?.lastName =
            //       flightTicketCubit.lastName;
            //   flightTicketCubit.cardDataList[index]!.itIsOk = true;
            //   flightTicketCubit.cardDataList[index]!.gender =
            //       flightTicketCubit.selectBetweenTwoTextValue;
            //   flightTicketCubit.clearAllFields(index: index);

            //   Navigator.pop(context);
            // }


     
            // else {
            //   flightTicketCubit.upDataTest(index: index);
            //   Navigator.pop(context);
            //   print('------BOS First*-*-*-');
            // }
