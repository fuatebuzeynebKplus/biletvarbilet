import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/close_and_apply_widget.dart';
import 'package:bamobile1/widgets/text_field_other_design_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketPreferredAirLineBottomSheet extends StatelessWidget {
  const TicketPreferredAirLineBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    TextEditingController searchController = TextEditingController();
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // يمكنك إضافة listener إذا احتجت إليه.
      },
      builder: (context, state) {
        return BottomSheet(
          enableDrag: false,
          onClosing: () {
            // قم بإغلاق الـ BottomSheet عند الحاجة
          },
          builder: (BuildContext context) {
            return Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: Colors.white,
              ),
              height: context.height * 0.9,
              width: context.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 12, right: 12),
                child: Column(
                  children: [
                    TextWidget(
                      text: S.of(context).PreferAirline,
                      color: AppColors.kSecondColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    // عرض قائمة شركات الطيران المفضلة
                    if (flightTicketCubit.preferAirlineNameList.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: context.height * 0.05,
                          child: ListView.builder(
                            scrollDirection:
                                Axis.horizontal, // لجعل القائمة أفقية
                            itemCount:
                                flightTicketCubit.preferAirlineNameList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      TextWidget(
                                        text: flightTicketCubit
                                            .preferAirlineNameList[index],
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                      const SizedBox(width: 8),
                                      GestureDetector(
                                        onTap: () {
                                          flightTicketCubit
                                              .removePreferAirlineCodeAndName(
                                                  index: index);
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: AppColors.kSecondColor,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    // واجهة البحث عن شركات الطيران
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextFieldOtherDesignWidget(
                            controller: searchController,
                            width: 0.93,
                            text: S.of(context).Airline,
                            icon: Icons.search,
                            padding: 8,
                            onChanged: (value) {
                              if (value.length >= 2) {
                                flightTicketCubit.searchAirLine(value);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    // عرض نتائج البحث عن شركات الطيران
                    if (state is SearchCityDataLoading)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: context.height * 0.05),
                          CircularProgressIndicator(
                            color: AppColors.kSecondColor,
                          ),
                        ],
                      )
                    else if (state is SearchCityDataSuccess)
                      Expanded(
                        flex: 3,
                        child: ListView.builder(
                          itemCount:
                              flightTicketCubit.searchDataForAirLine?.length ??
                                  0,
                          itemBuilder: (context, index) {
                            final result =
                                flightTicketCubit.searchDataForAirLine[index];
                            return ListTile(
                              title: Text(result['Name']),
                              subtitle: Text(result['Code']),
                              onTap: () {
                                flightTicketCubit.addPreferAirlineCodeAndName(
                                  code: result['Code'],
                                  name: result['Name'],
                                );
                                searchController.clear();
                              },
                            );
                          },
                        ),
                      )
                    else if (state is SearchCityDataFailure)
                      const Center(child: Text('Not Found')),
                    // زر لحفظ البيانات
                    const Spacer(),
                    CloseAndApplyWidget(
                      onTapClose: () {
                        flightTicketCubit.preferAirlineCodeList.clear();
                        flightTicketCubit.preferAirlineNameList.clear();
                        BlocProvider.of<FlightTicketCubit>(context)
                            .bottomSheetValue(type: 0);
                      },
                      onTapApPly: () {
                        BlocProvider.of<FlightTicketCubit>(context)
                            .bottomSheetValue(type: 0);
                      },
                    ),
                    SizedBox(height: context.height * 0.03),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
