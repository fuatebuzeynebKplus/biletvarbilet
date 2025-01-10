import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/models/passenger_model.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/hotel-views/hotel_guest_data_enter_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_passenger_data_enter_view.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HotelGuestCardWidget extends StatelessWidget {
  const HotelGuestCardWidget({
    super.key,
    required this.index,
    required this.title,
    required this.indexSub,
  });
  final String title;
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
        return GestureDetector(
          onTap: () {
            hotelCubit.firstName =
                hotelCubit.hotelGuestCardDataList[index][indexSub]?.firstName;
            hotelCubit.lastName =
                hotelCubit.hotelGuestCardDataList[index][indexSub]?.lastName;
            hotelCubit.birthday =
                hotelCubit.hotelGuestCardDataList[index][indexSub]?.birthday;
            hotelCubit.sendHotelArguments(
                argument: index, argumentSub: indexSub);
            print('index: $index');
            print('Argument: ${hotelCubit.arguments}');
            hotelCubit.saveTitle(value: title);
            Navigator.pushNamed(
              context,
              HotelGuestDataEnterView.id,
            );
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
                          text: '${index + 1}.$title',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        hotelCubit.hotelGuestCardDataList[index][indexSub] !=
                                    null &&
                                hotelCubit
                                        .hotelGuestCardDataList[index]
                                            [indexSub]!
                                        .itIsOk ==
                                    true
                            ? const Icon(
                                Icons.done,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.info,
                                color: Colors.red,
                              )
                      ],
                    ),
                    hotelCubit.hotelGuestCardDataList[index][indexSub] != null
                        ? Row(
                            children: [
                              TextWidget(
                                  color: Colors.grey.shade600,
                                  text:
                                      '${hotelCubit.hotelGuestCardDataList[index][indexSub]!.firstName ?? ''} ${hotelCubit.hotelGuestCardDataList[index][indexSub]!.lastName ?? ''} ${hotelCubit.hotelGuestCardDataList[index][indexSub]?.birthday != null && hotelCubit.hotelGuestCardDataList[index][indexSub]?.firstName != null ? DateFormat('dd/MM/yyyy').format(hotelCubit.hotelGuestCardDataList[index][indexSub]!.birthday!) : ''} ${hotelCubit.hotelGuestCardDataList[index][indexSub]?.firstName != null && hotelCubit.hotelGuestCardDataList[index][indexSub]?.gender != null ? hotelCubit.hotelGuestCardDataList[index][indexSub]!.gender == S.of(context).Man ? 'Mr' : 'Ms' : ''}')
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
