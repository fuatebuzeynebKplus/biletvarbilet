import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveAndCleanInBottomSheetWidget extends StatelessWidget {
  const SaveAndCleanInBottomSheetWidget({
    super.key,
    this.onTopForClean,
    this.onTopForSave,
    this.borderRadius = 30,
  });
  final Function()? onTopForClean;
  final Function()? onTopForSave;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: context.height * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius!),
              topRight: Radius.circular(borderRadius!),
            ),
            color: AppColors.kSecondColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: onTopForClean,
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: context.height * 0.035,
                ),
              ),
              GestureDetector(
                onTap: onTopForSave,
                child: TextWidget(
                  text: S.of(context).Apply,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              // GestureDetector(
              //   onTap: onTopForClean,
              //   child: TextWidget(
              //     text: S.of(context).Close,
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.white,
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
