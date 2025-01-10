import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/models/passenger_model.dart';
import 'package:bamobile1/widgets/text_field_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelFirstAndLastNameWidget extends StatelessWidget {
  const HotelFirstAndLastNameWidget({
    super.key,
    required this.index,
    required this.indexSub,
  });
  final int index;
  final int indexSub;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
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
                      initialValue: hotelCubit.hotelGuestCardDataList[index]
                                  [indexSub] !=
                              null
                          ? hotelCubit.hotelGuestCardDataList[index][indexSub]!
                              .firstName
                          : '',
                      textInputType: TextInputType.name,
                      onChanged: (value) {
                        hotelCubit.firstName = value;
                      }),
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
                    initialValue: hotelCubit.hotelGuestCardDataList[index]
                                [indexSub] !=
                            null
                        ? hotelCubit
                            .hotelGuestCardDataList[index][indexSub]!.lastName
                        : '',
                    textInputType: TextInputType.name,
                    onChanged: (value) {
                      hotelCubit.lastName = value;
                    },
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
