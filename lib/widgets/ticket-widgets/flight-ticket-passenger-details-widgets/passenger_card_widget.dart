import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/models/passenger_model.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_passenger_data_enter_view.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class PassengerCardWidget extends StatelessWidget {
  const PassengerCardWidget({
    super.key,
    required this.text,
    required this.index,
  });
  final String text;
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
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            if (flightTicketCubit.passengerCardDataList[index] == null) {
              flightTicketCubit.nationality = 'TR';
            } else {
              flightTicketCubit.nationality =
                  flightTicketCubit.passengerCardDataList[index]!.nationality;
            }
            // flightTicketCubit.lastNameController.clear;
            // if (index >= 0 && index < flightTicketCubit.cardDataList.length) {
            //   print('-------yes------------');
            //   flightTicketCubit.cardDataList[index].firstName = null;
            // }
            // if (flightTicketCubit.deneme == true) {
            //   flightTicketCubit.addTest();
            //   flightTicketCubit.deneme = false;
            // }
            // print('------index: $index');
            // print(
            //     '------flightTicketCubit.cardDataList.length: ${flightTicketCubit.passengerCardDataList.length}');
            flightTicketCubit.sendArguments(argument: index);
            Navigator.pushNamed(
              context,
              FlightTicketPassengerDataEnterView.id,
            );

            // for (var element
            //     in flightTicketCubit.passengerCardDataList[index]!.mileMM!) {
            //   print('airlineCode ${element.airlineCode}');
            //   print('mileageNumber ${element.mileageNumber}');
            // }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 6),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              height: context.height * 0.08,
              width: context.width * 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: text,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        flightTicketCubit.passengerCardDataList[index] !=
                                    null &&
                                flightTicketCubit
                                        .passengerCardDataList[index]!.itIsOk ==
                                    true
                            ? const Icon(Icons.done, color: Colors.green)
                            : const Icon(
                                Icons.info,
                                color: Colors.red,
                              )
                      ],
                    ),
                    flightTicketCubit.passengerCardDataList[index] != null
                        ? Row(
                            children: [
                              flightTicketCubit.passengerCardDataList[index]!
                                          .birthday !=
                                      null
                                  ? TextWidget(
                                      color: Colors.grey.shade600,
                                      text:
                                          '${flightTicketCubit.passengerCardDataList[index]!.firstName ?? ''} ${flightTicketCubit.passengerCardDataList[index]!.lastName ?? ''} ${(flightTicketCubit.passengerCardDataList[index]?.birthday) != null && flightTicketCubit.passengerCardDataList[index]?.firstName != null ? flightTicketCubit.convertArabicNumbersToEnglish(DateFormat('dd/MM/yyyy').format(flightTicketCubit.passengerCardDataList[index]!.birthday!)) : ''}${flightTicketCubit.passengerCardDataList[index]?.firstName != null && flightTicketCubit.passengerCardDataList[index]?.gender != null ? flightTicketCubit.passengerCardDataList[index]!.gender == S.of(context).Man ? ' Mr' : ' Ms' : ''}')
                                  : const TextWidget(text: ''),
                            ],
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}




/*





*/



/*

class PassengerCardDataEnterWidget extends StatelessWidget {
  const PassengerCardDataEnterWidget({
    super.key,
    required this.text,
    required this.index,
  });
  final String text;
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
        return GestureDetector(
          onTap: () {
            flightTicketCubit.test2(index);
            print('index= $index');
            print('selectIndexDeneme= ${flightTicketCubit.selectIndexDeneme}');
            flightTicketCubit.isContainerTrue == true
                ? null
                : flightTicketCubit.test(true);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
            child: Container(
              height: flightTicketCubit.selectIndexDeneme == index
                  ? flightTicketCubit.isContainerTrue == true
                      ? context.height * 0.415
                      : context.height * 0.08
                  : context.height * 0.08,
              width: context.width * 1,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: flightTicketCubit.isContainerTrue == true
                              ? context.height * 0.01
                              : flightTicketCubit.firstName == null
                                  ? context.height * 0.015
                                  : context.height * 0.005,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: text,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            flightTicketCubit.firstName == null
                                ? const SizedBox()
                                : Row(
                                    children: [
                                      const CircularIconWidget(
                                          size: 0.035,
                                          circularColor: Colors.green,
                                          iconColor: Colors.white,
                                          borderColor: Colors.transparent,
                                          icon: Icons.search),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      CircularIconWidget(
                                          size: 0.035,
                                          circularColor: AppColors.kSecondColor,
                                          iconColor: Colors.white,
                                          borderColor: Colors.transparent,
                                          icon: Icons.save),
                                      const Icon(
                                        Icons.done,
                                        color: Colors.green,
                                      )
                                    ],
                                  )
                          ],
                        ),
                        Visibility(
                          visible: flightTicketCubit.isContainerTrue,
                          child: flightTicketCubit.birthday == null
                              ? flightTicketCubit.lastName == null
                                  ? flightTicketCubit.firstName == null
                                      ? flightTicketCubit.isContainerTrue ==
                                              false
                                          ? Row(
                                              children: [
                                                TextWidget(
                                                    color: Colors.grey.shade600,
                                                    text:
                                                        '${flightTicketCubit.firstName ?? ''} ${flightTicketCubit.lastName ?? ''} | ${DateFormat('dd/MM/yyy').format(flightTicketCubit.birthday!)} |'),
                                                Icon(
                                                  flightTicketCubit
                                                              .selectBetweenTwoTextValue ==
                                                          'Erkek'
                                                      ? Icons.male
                                                      : Icons.female,
                                                  size: 20,
                                                  color: Colors.grey.shade600,
                                                )
                                              ],
                                            )
                                          : const SizedBox()
                                      : const SizedBox()
                                  : const SizedBox()
                              : const SizedBox(),
                        )
                      ],
                    ),
                    Visibility(
                      visible: flightTicketCubit.selectIndexDeneme == index
                          ? true
                          : false,
                      child: const Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          SelectValueFromTwoTextWidget(
                            width: 0.87,
                            firstText: 'Erkek',
                            secondText: 'Kadın',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          FirstAndLastNameWidget(),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              SelectNationalityOrPhoneWidget(),
                              SizedBox(
                                width: 4,
                              ),
                              BirthdayWidget()
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          PassportNumberWidget(),
                          SizedBox(
                            height: 8,
                          ),
                          FFNWidget(),
                          SizedBox(
                            height: 6,
                          ),
                          SaveButtonWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}


*/