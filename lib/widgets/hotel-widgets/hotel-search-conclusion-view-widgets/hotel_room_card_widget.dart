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

class HotelRoomCardWidget extends StatelessWidget {
  const HotelRoomCardWidget({
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
                    currencyCode: hotelCubit
                        .hotelSearchResults[hotelCubit.hotelIndex!]
                        .rooms
                        .first
                        .roomAlternatives
                        .first
                        .currencyCode!,
                    value: hotelCubit.totalPriceList[index]);
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
                  color: hotelCubit.twoList[index].first.hotelRateType == 5
                      ? Colors.grey
                      : hotelCubit.twoList[index].first.hotelRateType == 1
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
                                height: (hotelCubit.twoList.first.length *
                                        context.height *
                                        0.065) +
                                    context.height * 0.05,
                                child: ListView.builder(
                                  itemCount: hotelCubit.twoList.first.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int indexSub) {
                                    return Column(
                                      children: [
                                        HotelRoomCardInsideDetailsWidget(
                                          indexSub: indexSub,
                                          index: index,
                                        ),
                                        if (indexSub ==
                                            hotelCubit.twoList[index].length -
                                                1)
                                          Column(
                                            children: [
                                              const Divider(),
                                              Row(
                                                children: [
                                                  TextWidget(
                                                    text:
                                                        '${S.of(context).Total}:',
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  const Spacer(),
                                                  TextWidget(
                                                    text: hotelCubit.formatNumber(BlocProvider
                                                            .of<CurrencyCodeCubit>(
                                                                context)
                                                        .convertToAppCurrency(
                                                            itemPrice: hotelCubit
                                                                    .totalPriceList[
                                                                index],
                                                            appCurrencyExchangeRate:
                                                                BlocProvider.of<
                                                                            CurrencyCodeCubit>(
                                                                        context)
                                                                    .currencyRate!,
                                                            ticketCurrencyCode:
                                                                hotelCubit.currencyCodeList[
                                                                    index])),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: TextWidget(
                                                      text:
                                                          ' ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                      ],
                                    );
                                  },
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

class HotelRoomCardInsideDetailsWidget extends StatelessWidget {
  const HotelRoomCardInsideDetailsWidget({
    super.key,
    required this.indexSub,
    required this.index,
  });

  final int indexSub;
  final int index;

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: context.width * 0.6),
                child: TextWidget(
                  text: '${hotelCubit.twoList[index][indexSub].roomName}',
                  fontSize: 14,
                  isHaveOverflow: true,
                  textAlign: TextAlign.start,
                ),
              ),
              TextWidget(
                text:
                    '  ${hotelCubit.twoList[index][indexSub].boardCode}  $index',
                fontSize: 14,
                color: AppColors.kSecondColor,
                fontWeight: FontWeight.bold,
              ),
              const Spacer(),
              indexSub == 0
                  ? const Icon(Icons.more_horiz, color: Colors.grey)
                  : const SizedBox(),
            ],
          ),
          Row(
            children: [
              TextWidget(
                text: '${hotelCubit.twoList[index][indexSub].boardName}',
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(Icons.man, color: AppColors.kSecondColor),
              TextWidget(
                text: hotelCubit.roomFilterList[indexSub].paxes.first.count
                    .toString(),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              hotelCubit.roomFilterList[indexSub].paxes.length == 1
                  ? const SizedBox()
                  : Icon(Icons.boy, color: AppColors.kSecondColor),
              hotelCubit.roomFilterList[indexSub].paxes.length == 1
                  ? const SizedBox()
                  : TextWidget(
                      text: hotelCubit.roomFilterList[indexSub].paxes.last.count
                          .toString(),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
              const Spacer(),
              Row(
                children: [
                  TextWidget(
                    text: hotelCubit.formatNumber(
                        BlocProvider.of<CurrencyCodeCubit>(context)
                            .convertToAppCurrency(
                                itemPrice: hotelCubit
                                    .twoList[index][indexSub].totalAmount
                                    .toDouble(),
                                appCurrencyExchangeRate:
                                    BlocProvider.of<CurrencyCodeCubit>(context)
                                        .currencyRate!,
                                ticketCurrencyCode: hotelCubit
                                    .twoList[index][indexSub].currencyCode!)),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  TextWidget(
                    text:
                        '  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(width: context.width * 0.05),
            ],
          ),
        ],
      ),
    );
  }
}
