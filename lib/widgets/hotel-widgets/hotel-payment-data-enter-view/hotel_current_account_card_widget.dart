import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelCurrentAccountCardWidget extends StatelessWidget {
  const HotelCurrentAccountCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
        return ContainerCardWidget(
          onTap: () {
            hotelCubit.selectPaymentTypeFunction(
                S.of(context).Current, context);

            hotelCubit.bottomSheetValueFunction(type: 'h9');
          },
          borderColor: hotelCubit.selectPaymentType == S.of(context).Current
              ? AppColors.kSecondColor
              : Colors.transparent,
          isShadow: true,
          text: S.of(context).Current,
          leading: const Icon(
            Icons.payments,
            color: Colors.black45,
            size: 25,
          ),
        );
      },
    );
  }
}
