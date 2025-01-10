import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/hotel/data/models/hotel_room_price_result_model.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/expansion_tile_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelRoomCardIfNoDataWidget extends StatelessWidget {
  const HotelRoomCardIfNoDataWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 12, left: 12, bottom: 8),
          child: GestureDetector(
            onTap: () {
              hotelCubit.selectHotelRoomCardFunction(value: index);
              if (hotelCubit.selectHotelCard == null) {
                hotelCubit.selectHotelCardFunction(
                    value: hotelCubit.hotelIndex!);
              } else if (hotelCubit.selectHotelRoomCard != null &&
                  hotelCubit.selectHotelCard == null) {
                hotelCubit.selectHotelCardFunction(
                    value: hotelCubit.hotelIndex!);
              }
              if (hotelCubit.selectHotelRoomCard != null) {
                hotelCubit.getTotalRoomPrice(
                    currencyCode:
                        hotelCubit.twoListIfNoData[index].currencyCode!,
                    value: hotelCubit.twoListIfNoData[index].totalAmount
                        .toDouble());
              }
            },
            child: Container(
                // height: context.height * 0.13,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: hotelCubit.selectHotelRoomCard == null
                          ? Colors.transparent
                          : AppColors.kSecondColor,
                      width: hotelCubit.selectHotelRoomCard == null ? 0 : 2),
                  borderRadius: BorderRadius.circular(12),
                  color: hotelCubit.twoListIfNoData[index].hotelRateType == 5
                      ? Colors.grey
                      : hotelCubit.twoListIfNoData[index].hotelRateType == 1
                          ? Colors.red
                          : Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Center(
                        child: TextWidget(
                      text: '!',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: context.height * 0.12,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                constraints: BoxConstraints(
                                                    maxWidth:
                                                        context.width * 0.6),
                                                child: TextWidget(
                                                  text:
                                                      '${hotelCubit.twoListIfNoData[index].roomName}',
                                                  fontSize: 14,
                                                  isHaveOverflow: true,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                              TextWidget(
                                                text:
                                                    '  ${hotelCubit.twoListIfNoData[index].boardCode}  $index',
                                                fontSize: 14,
                                                color: AppColors.kSecondColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              const Spacer(),
                                              const Icon(Icons.more_horiz,
                                                  color: Colors.grey)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextWidget(
                                                text:
                                                    '${hotelCubit.twoListIfNoData[index].boardName}',
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Icon(Icons.man,
                                                  color:
                                                      AppColors.kSecondColor),
                                              TextWidget(
                                                text: hotelCubit.roomFilterList
                                                    .first.paxes.first.count
                                                    .toString(),
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              hotelCubit.roomFilterList.first
                                                          .paxes.length ==
                                                      1
                                                  ? const SizedBox()
                                                  : Icon(Icons.boy,
                                                      color: AppColors
                                                          .kSecondColor),
                                              hotelCubit.roomFilterList.first
                                                          .paxes.length ==
                                                      1
                                                  ? const SizedBox()
                                                  : TextWidget(
                                                      text: hotelCubit
                                                          .roomFilterList
                                                          .first
                                                          .paxes
                                                          .last
                                                          .count
                                                          .toString(),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    Row(
                                      children: [
                                        const TextWidget(
                                          text: 'Toplam',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        const Spacer(),
                                        Row(
                                          children: [
                                            TextWidget(
                                              text: hotelCubit.formatNumber(BlocProvider
                                                      .of<CurrencyCodeCubit>(
                                                          context)
                                                  .convertToAppCurrency(
                                                      itemPrice: hotelCubit
                                                          .twoListIfNoData[
                                                              index]
                                                          .totalAmount
                                                          .toDouble(),
                                                      appCurrencyExchangeRate:
                                                          BlocProvider.of<CurrencyCodeCubit>(context)
                                                              .currencyRate!,
                                                      ticketCurrencyCode: hotelCubit
                                                          .twoListIfNoData[index]
                                                          .currencyCode!)),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            TextWidget(
                                              text:
                                                  ' ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}
