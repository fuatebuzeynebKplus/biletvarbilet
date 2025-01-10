import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/check_box_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CabinTypeFilterView extends StatelessWidget {
  const CabinTypeFilterView({super.key});

  static String id = 'CabinTypeFilterView';

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    dynamic howComeCabinLeavingOrReturn;
    if (flightTicketCubit.searchTypeForListInFilter == 'tek') {
      howComeCabinLeavingOrReturn = flightTicketCubit.cabinTypeListLeaving;
    } else if (flightTicketCubit.searchTypeForListInFilter == 'cok') {
      print('444444');
      howComeCabinLeavingOrReturn = flightTicketCubit.cabinTypeListMultiPoint;
    } else {
      howComeCabinLeavingOrReturn = flightTicketCubit.cabinTypeListReturn;
    }

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.grey.shade100,
            appBar: AppBar(
              toolbarHeight: context.height * 0.06,
              automaticallyImplyLeading: false,
              title: AppBarWidget(
                onPressedLeading: () {
                  Navigator.pop(context);
                },
                title: S.of(context).CabinFilter,
                leading: Icons.arrow_back_ios,
              ),
              backgroundColor: AppColors.kAppBarColor,
            ),
            bottomSheet: BottomSheetWidget(
              paddingTop: 8,
              height: 0.1,
              widgetBody: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonWidget(
                      title: S.of(context).Clear,
                      height: 0.06,
                      width: 0.4,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textColor: Colors.white,
                      color: AppColors.kSecondColor,
                      onTap: () {
                        Navigator.pop(context);
                        flightTicketCubit.clearAll(type: 'cabinType');
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ButtonWidget(
                      title: S.of(context).Apply,
                      height: 0.06,
                      width: 0.4,
                      fontSize: 16,
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kSecondColor,
                      onTap: () {
                        Navigator.pop(context);
                        if (flightTicketCubit.searchTypeForListInFilter ==
                            'cok') {
                          flightTicketCubit.filterCabinTypeMultiPoint();
                        } else {
                          flightTicketCubit.filterCabinType();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                  left: 12, right: 12, top: 8, bottom: context.height * 0.1),
              child: ListView.builder(
                itemCount: howComeCabinLeavingOrReturn.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      final cabinType =
                          howComeCabinLeavingOrReturn[index]['type']!;
                      final currentValue =
                          flightTicketCubit.searchTypeForListInFilter == 'tek'
                              ? flightTicketCubit
                                  .isSelectedCabinTypeLeaving(cabinType)
                              : flightTicketCubit.searchTypeForListInFilter ==
                                      'cok'
                                  ? flightTicketCubit
                                      .isSelectedCabinTypeMultiPoint(cabinType)
                                  : flightTicketCubit
                                      .isSelectedCabinTypeReturn(cabinType);
                      flightTicketCubit.checkboxCabinType(
                        cabinType: cabinType,
                        value: !currentValue,
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          CheckBoxWidget(
                            value: flightTicketCubit
                                        .searchTypeForListInFilter ==
                                    'tek'
                                ? flightTicketCubit.isSelectedCabinTypeLeaving(
                                    howComeCabinLeavingOrReturn[index]['type'])
                                : flightTicketCubit.searchTypeForListInFilter ==
                                        'cok'
                                    ? flightTicketCubit
                                        .isSelectedCabinTypeMultiPoint(
                                            howComeCabinLeavingOrReturn[index]
                                                ['type'])
                                    : flightTicketCubit
                                        .isSelectedCabinTypeReturn(
                                            howComeCabinLeavingOrReturn[index]
                                                ['type']),
                            onChanged: (value) {
                              flightTicketCubit.searchTypeForListInFilter ==
                                      'cok'
                                  ? flightTicketCubit
                                      .checkboxCabinTypeMultiPoint(
                                      cabinType:
                                          howComeCabinLeavingOrReturn[index]
                                              ['type']!,
                                      value: value!,
                                    )
                                  : flightTicketCubit.checkboxCabinType(
                                      cabinType:
                                          howComeCabinLeavingOrReturn[index]
                                              ['type']!,
                                      value: value!,
                                    );
                            },
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextWidget(
                            text:
                                howComeCabinLeavingOrReturn[index]['type']! == 3
                                    ? 'Business'
                                    : 'Economy',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ));
      },
    );
  }
}
