import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_passenger_details_view.dart';
import 'package:bamobile1/widgets/alert_dialog_widget.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/select_value_from_two_text_widget.dart';
import 'package:bamobile1/widgets/text_field_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/birthday_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/bottom-sheet/select_birthday_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/bottom-sheet/select_validity_date_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/ffn_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/first_and_last_name_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/identity_number_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/passport_number_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/save_button_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/select_nationality_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/validity_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class FlightTicketPassengerDataEnterView extends StatelessWidget {
  const FlightTicketPassengerDataEnterView({super.key});
  static String id = 'FlightTicketPassengerDataEnterView';

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKeyInPassengerDataEnterView = GlobalKey();
    //  final int? index = ModalRoute.of(context)?.settings.arguments as int?;
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    flightTicketCubit.passengerCardDataList.length =
        flightTicketCubit.adultQuantity +
            flightTicketCubit.childQuantity +
            flightTicketCubit.babyQuantity;
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            bottomSheet: flightTicketCubit.bottomSheetType == 8
                ? SelectBirthdayBottomSheet(
                    index: flightTicketCubit.arguments,
                  )
                : flightTicketCubit.bottomSheetType == 10
                    ? SelectValidityDateBottomSheet(
                        index: flightTicketCubit.arguments,
                      )
                    : flightTicketCubit.bottomSheetType == 9
                        ? SelectValidityDateBottomSheet(
                            index: flightTicketCubit.arguments,
                          )
                        : const SizedBox(),
            appBar: AppBar(
              backgroundColor: AppColors.kAppBarColor,
              toolbarHeight: context.height * 0.06,
              automaticallyImplyLeading: false,
              title: AppBarWidget(
                onPressedLeading: () {
                  Navigator.pushNamed(
                      context, FlightTicketPassengerDetailsView.id);
                  // showDialog(
                  //     barrierDismissible: false,
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialogWidget(
                  //           isHaveBorder: true,
                  //           heightTest: 0.13,
                  //           widthTest: 1,
                  //           widget: Column(
                  //             children: [
                  //               const TextWidget(
                  //                 textAlign: TextAlign.left,
                  //                 text:
                  //                     'kullanıcı bilgilerini Kaydetmeden bu sayfadan çıkmak istediginizden emin misiniz?',
                  //                 fontSize: 14,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //               const Spacer(),
                  //               Row(
                  //                 children: [
                  //                   const Spacer(),
                  //                   GestureDetector(
                  //                     onTap: () {
                  //                       Navigator.pop(context);
                  //                     },
                  //                     child: TextWidget(
                  //                       color: AppColors.kSecondColor,
                  //                       text: 'Kapat',
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   const SizedBox(
                  //                     width: 40,
                  //                   ),
                  //                   GestureDetector(
                  //                     onTap: () {
                  //                       // flightTicketCubit.passengerCardDataList
                  //                       //     .removeAt(
                  //                       //         flightTicketCubit.arguments!);
                  //                       flightTicketCubit.bottomSheetValue(
                  //                           type: 0);

                  // Navigator.pushNamed(
                  //     context,
                  //     FlightTicketPassengerDetailsView
                  //         .id);
                  //                     },
                  //                     child: TextWidget(
                  //                       color: AppColors.kSecondColor,
                  //                       text: 'Evet',
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               )
                  //             ],
                  //           ));
                  //     });
                },
                title: S.of(context).PassengerInformation,
                leading: Icons.arrow_back_ios,
              ),
            ),
            backgroundColor: Colors.white,
            body: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Form(
                key: formKeyInPassengerDataEnterView,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: S.of(context).Gender,
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              SelectValueFromTwoTextWidget(
                                  width: 0.91,
                                  firstText: S.of(context).Man,
                                  secondText: S.of(context).Woman),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          FirstAndLastNameWidget(
                            index: flightTicketCubit.arguments,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          BirthdayWidget(
                            index: flightTicketCubit.arguments,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      ),
                    ),
                    SelectNationalityWidget(
                      index: flightTicketCubit.arguments,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: List.generate(
                        flightTicketCubit.mile[0].length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: FFNWidget(
                              index: flightTicketCubit.arguments,
                              ffnIndex: index,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Divider(
                      thickness: 6,
                      color: Colors.grey.shade100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              TextWidget(
                                text: S.of(context).PassportAndIDDetails,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.kSecondColor,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          flightTicketCubit.theFlyInTheTurkey == true &&
                                  flightTicketCubit.nationality == 'TR'
                              ? IdentityNumberWidget(
                                  index: flightTicketCubit.arguments,
                                )
                              : PassportNumberWidget(
                                  index: flightTicketCubit.arguments,
                                ),
                          const SizedBox(
                            height: 12,
                          ),
                          flightTicketCubit.theFlyInTheTurkey == true &&
                                  flightTicketCubit.nationality == 'TR'
                              ? const SizedBox()
                              : ValidityWidget(
                                  index: flightTicketCubit.arguments,
                                ),
                          const SizedBox(
                            height: 50,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 5),
                      child: SaveButtonWidget(
                        index: flightTicketCubit.arguments,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
