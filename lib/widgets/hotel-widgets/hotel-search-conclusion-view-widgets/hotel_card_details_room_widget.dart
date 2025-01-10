import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/expansion_tile_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/hotel_room_card_if_no_data_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/hotel_room_card_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelCardDetailsRoomWidget extends StatelessWidget {
  const HotelCardDetailsRoomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state is GetHotelRoomPricesLoading || state is BottomSheetState
            ? const Center(child: LoadingWidget())
            : state is GetHotelRoomPricesFailure
                ? ErrorResultWidget(
                    errorCode: state.errorCode,
                    errorMassage: state.errorMassage,
                  )
                : Container(
                    height: context.height * 0.66,
                    width: context.width * 1,
                    padding: const EdgeInsets.only(
                      bottom: 10,
                    ),
                    color: Colors.grey.shade100,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Container(
                            padding: const EdgeInsets.all(7),
                            width: context.width * 1,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.filter_alt,
                                    color: AppColors.kSecondColor),
                                TextWidget(
                                  text: S.of(context).Filter,
                                  fontSize: 16,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: hotelCubit.selectHotelRoomCard != null
                              ? ListView.builder(
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return hotelCubit.dataIsNull == false
                                        ? HotelRoomCardWidget(
                                            index:
                                                hotelCubit.selectHotelRoomCard!,
                                          )
                                        : HotelRoomCardIfNoDataWidget(
                                            index:
                                                hotelCubit.selectHotelRoomCard!,
                                          );
                                  },
                                )
                              : ListView.builder(
                                  itemCount: hotelCubit.dataIsNull == false
                                      ? hotelCubit.twoList.length
                                      : hotelCubit.twoListIfNoData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return hotelCubit.dataIsNull == false
                                        ? HotelRoomCardWidget(
                                            index: index,
                                          )
                                        : HotelRoomCardIfNoDataWidget(
                                            index: index);
                                  },
                                ),
                        ),
                        // Expanded(
                        //   child: ListView.builder(
                        // itemCount: hotelCubit.dataIsNull == false
                        //     ? hotelCubit.twoList.length
                        //     : hotelCubit.twoListIfNoData.length,
                        //     itemBuilder: (BuildContext context, int index) {
                        //       if (hotelCubit.selectHotelRoomCard != null &&
                        //           hotelCubit.selectHotelRoomCard != index) {
                        //         return Container();
                        //       }
                        //       return Padding(
                        //         padding: const EdgeInsets.only(
                        //           bottom: 8,
                        //           left: 8,
                        //           right: 8,
                        //         ),
                        // child: hotelCubit.dataIsNull == false
                        //     ? HotelRoomCardWidget(
                        //         index: index,
                        //       )
                        //     : HotelRoomCardIfNoDataWidget(index: index),
                        //       );
                        //     },
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const TextWidget(
                                  text: '!',
                                  color: Colors.red,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                TextWidget(
                                  text: S.of(context).NonRefundable,
                                  color: Colors.grey.shade700,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const TextWidget(
                                  text: '!',
                                  color: Colors.green,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                TextWidget(
                                  text: S.of(context).Refundable,
                                  color: Colors.grey.shade700,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TextWidget(
                                  text: '!',
                                  color: AppColors.kSecondColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                TextWidget(
                                  text: S.of(context).PartiallyRefundable,
                                  color: Colors.grey.shade700,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const TextWidget(
                                  text: '!',
                                  color: Colors.grey,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                TextWidget(
                                  text: S.of(context).Unknown,
                                  color: Colors.grey.shade700,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  );
      },
    );
  }
}
