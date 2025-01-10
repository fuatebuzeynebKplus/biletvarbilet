import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/models/passenger_model.dart';
import 'package:bamobile1/widgets/text_field_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstAndLastNameWidget extends StatelessWidget {
  const FirstAndLastNameWidget({
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
        //  TextEditingController firstNameController = TextEditingController();
        // CardData cardData = CardData();
        // List<String> firstNameList = [];
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: S.of(context).Name,
                  fontSize: 14,
                  color: Colors.black54,
                ),
                SizedBox(
                  height: 35,
                  child: TextFieldWidget(
                      contentPadding: const EdgeInsets.only(bottom: 4),
                      weHaveInputFormatters: true,
                      initialValue: flightTicketCubit
                                  .passengerCardDataList.isNotEmpty &&
                              index <
                                  flightTicketCubit
                                      .passengerCardDataList.length &&
                              flightTicketCubit.passengerCardDataList[index] !=
                                  null
                          ? flightTicketCubit
                              .passengerCardDataList[index]!.firstName
                          : '',
                      textInputType: TextInputType.name,
                      onChanged: (value) {
                        flightTicketCubit.firstName = value;
                      }
                      // controller:
                      //     flightTicketCubit.textEditingControllerList![index],
                      // onChanged: (value) {
                      //   cardData.firstName = value;
                      //   firstNameList.add(value);
                      // },
                      //hint: flightTicketCubit.firstName ?? S.of(context).Name,
                      ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: S.of(context).LastName,
                  fontSize: 14,
                  color: Colors.black54,
                ),
                SizedBox(
                  height: 35,
                  child: TextFieldWidget(
                    contentPadding: const EdgeInsets.only(bottom: 4),
                    weHaveInputFormatters: true,
                    initialValue: flightTicketCubit
                                .passengerCardDataList.isNotEmpty &&
                            index <
                                flightTicketCubit
                                    .passengerCardDataList.length &&
                            flightTicketCubit.passengerCardDataList[index] !=
                                null
                        ? flightTicketCubit
                            .passengerCardDataList[index]!.lastName
                        : '',
                    textInputType: TextInputType.name,
                    onChanged: (value) {
                      flightTicketCubit.lastName = value;
                    },
                  ),
                )
              ],
            ),
          ],
        );

        //  Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     TextFieldOtherDesignWidget(
        //       textInputType: TextInputType.name,
        //       text: flightTicketCubit.firstName ?? 'Ad',
        //       onChanged: (value) {
        //         flightTicketCubit.firstName = value;
        //       },
        //     ),
        //     const SizedBox(
        //       width: 4,
        //     ),
        //     TextFieldOtherDesignWidget(
        //       textInputType: TextInputType.name,
        //       text: flightTicketCubit.lastName ?? 'Soyad',
        //       onChanged: (value) {
        //         flightTicketCubit.lastName = value;
        //       },
        //     ),
        //   ],
        // );
      },
    );
  }
}
