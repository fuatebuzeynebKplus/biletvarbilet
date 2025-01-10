import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_field_other_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FFNWidget extends StatelessWidget {
  const FFNWidget({
    super.key,
    required this.index,
    required this.ffnIndex,
  });
  final int index;
  final int ffnIndex;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        getIt<CacheHelper>().getDataString(key: 'Lang') == 'ar'
                            ? const BorderRadius.only(
                                topRight: Radius.circular(4),
                                bottomRight: Radius.circular(4),
                              )
                            : const BorderRadius.only(
                                topLeft: Radius.circular(4),
                                bottomLeft: Radius.circular(4),
                              ),
                    color: AppColors.kSecondColor,
                  ),
                  height: context.height * 0.05,
                  width: context.width * 0.09,
                  child: Center(
                    child: TextWidget(
                      text: flightTicketCubit.mile[index][ffnIndex].airlineCode,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: TextFieldOtherDesignWidget(
                    initialValue: flightTicketCubit
                                .passengerCardDataList.isNotEmpty &&
                            index <
                                flightTicketCubit
                                    .passengerCardDataList.length &&
                            flightTicketCubit.passengerCardDataList[index] !=
                                null &&
                            flightTicketCubit
                                    .passengerCardDataList[index]!.mileMM !=
                                null &&
                            flightTicketCubit.passengerCardDataList[index]!
                                .mileMM!.isNotEmpty &&
                            ffnIndex <
                                flightTicketCubit.passengerCardDataList[index]!
                                    .mileMM!.length
                        ? flightTicketCubit.passengerCardDataList[index]!
                            .mileMM![ffnIndex].mileageNumber
                        : '',
                    text: 'Miles & Smiles',
                    circularLeftTopAndBottom:
                        getIt<CacheHelper>().getDataString(key: 'Lang') == 'ar'
                            ? 0
                            : 4,
                    circularRightTopAndBottom:
                        getIt<CacheHelper>().getDataString(key: 'Lang') == 'ar'
                            ? 4
                            : 0,
                    onChanged: (value) {
                      flightTicketCubit.mile[index][ffnIndex].mileageNumber =
                          value;
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
