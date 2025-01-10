import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/title_for_list_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleOfSelectSeatTypeWidget extends StatelessWidget {
  const TitleOfSelectSeatTypeWidget({
    super.key,
    required this.flightTypeReturnOrOneWay,
  });
  final int flightTypeReturnOrOneWay;

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            flightTicketCubit.searchTypeValue == 'tek'
                ? SizedBox(
                    height: context.height * 0.1,
                    child: TitleForListCardWidget(
                      isShow: true,
                      itIsReturnOrOneWay: flightTypeReturnOrOneWay,
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: context.height * 0.13,
                        child: PageView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            TitleForListCardWidget(
                              itIsReturnOrOneWay: 0,
                              cuticularColorOne: AppColors.kSecondColor,
                              cuticularColorTwo: Colors.grey.shade600,
                              isShow: true,
                            ),
                            TitleForListCardWidget(
                              itIsReturnOrOneWay: 1,
                              cuticularColorOne: Colors.grey.shade600,
                              cuticularColorTwo: AppColors.kSecondColor,
                              isShow: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ],
        );
      },
    );
  }
}


        // Positioned(
        //   top: -12,
        //   left: 0,
        //   child: Container(
        //     height: 30,
        //     width: 100,
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         begin: Alignment.bottomRight,
        //         end: Alignment.topLeft,
        //         colors: [AppColors.kSecondColor, AppColors.kMainColor],
        //       ),
        //     ),
        //     child: const Padding(
        //       padding: EdgeInsets.only(top: 10),
        //       child: TextWidget(
        //         text: 'Gidiş Nokta',
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // ),




          //    Container(
          //   height: 60,
          //   width: 50,
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //       begin: Alignment.bottomRight,
          //       end: Alignment.topLeft,
          //       colors: [AppColors.kSecondColor, AppColors.kMainColor],
          //     ),
          //   ),
          //   child: Center(
          //     child: TextWidget(
          //       text: text,
          //       color: Colors.white,
          //       fontSize: 14,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),