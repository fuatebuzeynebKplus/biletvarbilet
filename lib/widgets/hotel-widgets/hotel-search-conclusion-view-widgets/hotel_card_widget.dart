import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/hotel/data/models/hotel_details.dart';
import 'package:bamobile1/hotel/data/models/room_offers.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelCardWidget extends StatelessWidget {
  const HotelCardWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);

    double price = 0.0;

    for (var element in hotelCubit.hotelSearchResults[index].rooms) {
      price += element.roomAlternatives.first.totalAmount.toDouble();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              hotelCubit.sendHotelIndex(value: index);
              hotelCubit.selectHotelCardFunction(value: index);
              if (hotelCubit.selectHotelRoomCard != null) {
                hotelCubit.selectHotelRoomCardFunction(
                    value: hotelCubit.selectHotelRoomCard!);
                hotelCubit.getTotalRoomPrice(
                    value: 0.0,
                    currencyCode: hotelCubit.hotelSearchResults[index].rooms
                        .first.roomAlternatives.first.currencyCode!);
              } else if (hotelCubit.selectHotelRoomCard == null) {
                hotelCubit.selectHotelRoomCardFunction(
                    value: hotelCubit.selectHotelCard!);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              height: context.height * 0.3,
              width: context.width * 1,
              child: Column(
                children: [
                  Container(
                    height: context.height * 0.13,
                    width: context.width * 1,
                    decoration: BoxDecoration(
                      border: hotelCubit.selectHotelCard == index
                          ? Border(
                              top: BorderSide(
                                  color: AppColors.kSecondColor, width: 2.0),
                              left: BorderSide(
                                  color: AppColors.kSecondColor, width: 2.0),
                              right: BorderSide(
                                  color: AppColors.kSecondColor, width: 2.0),
                            )
                          : null,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                            '${hotelCubit.hotelSearchResults[index].hotel!.hotelImageUrl ?? 'https://cdn.kplus.com.tr/?url=Y2RuLm9zdHJvdm9rLnJ1L3QvMTAyNHg3NjgvY29udGVudC9mNS9jOS9mNWM5MmJmNTZjYzAxZmFiMTE4MWI2ZTJjZWFlMzNlZTMyMTc0YjljLmpwZWc=&w=400'} '),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: context.height * 0.17,
                    width: context.width * 1,
                    decoration: BoxDecoration(
                      border: hotelCubit.selectHotelCard == index
                          ? Border(
                              bottom: BorderSide(
                                  color: AppColors.kSecondColor, width: 2.0),
                              left: BorderSide(
                                  color: AppColors.kSecondColor, width: 2.0),
                              right: BorderSide(
                                  color: AppColors.kSecondColor, width: 2.0),
                            )
                          : null,
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        top: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(
                            text:
                                '${hotelCubit.hotelSearchResults[index].hotel!.hotelName}  $index',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                            textAlign: TextAlign.start,
                            isHaveOverflow: true,
                          ),
                          Wrap(
                            children: List.generate(
                                hotelCubit.hotelSearchResults[index].hotel!
                                    .star!, (index) {
                              return Icon(Icons.star,
                                  color: AppColors.kSecondColor, size: 16);
                            }),
                          ),
                          TextWidget(
                            text: hotelCubit
                                    .hotelSearchResults[index].hotel!.address
                                    ?.replaceAll('\n', ' ') ??
                                '',
                            fontSize: 10,
                            color: Colors.black45,
                            textAlign: TextAlign.start,
                            isHaveOverflow: true,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 0,
                                    width: hotelCubit.selectHotelCard == null
                                        ? context.width * 0.598
                                        : context.width * 0.5875,
                                    child: const Divider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    height: context.height * 0.012,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          TextWidget(
                                            text: hotelCubit.formatNumber(BlocProvider
                                                    .of<CurrencyCodeCubit>(
                                                        context)
                                                .convertToAppCurrency(
                                                    itemPrice: price,
                                                    appCurrencyExchangeRate:
                                                        BlocProvider.of<
                                                                    CurrencyCodeCubit>(
                                                                context)
                                                            .currencyRate!,
                                                    ticketCurrencyCode:
                                                        hotelCubit
                                                            .hotelSearchResults[
                                                                index]
                                                            .rooms
                                                            .first
                                                            .roomAlternatives
                                                            .first
                                                            .currencyCode!)),
                                            fontSize: 18,
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          TextWidget(
                                            text:
                                                ' ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                            fontSize: 14,
                                            color: Colors.black45,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: context.width * 0.02,
                                          ),
                                          TextWidget(
                                            text: S
                                                .of(context)
                                                .PricesStartingFrom,
                                            fontSize: 12,
                                            color: Colors.black45,
                                            //fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: context.height * 0.012,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  hotelCubit.selectHotelCardDetailsValue = 1;

                                  hotelCubit.sendHotelIndex(value: index);

                                  print(
                                      'hotelCubit.hotelSearchResults[index].hotel!.hotelCode:${hotelCubit.hotelSearchResults[index].hotel!.hotelCode}');

                                  hotelCubit.getHotelRoomPrices(
                                      RoomOffersJson(
                                        request: RoomOffers(
                                          languageCode: 'en',
                                          productCode:
                                              '${hotelCubit.hotelSearchResults[index].hotel!.hotelCode}',
                                          tokenCode: getIt<CacheHelper>()
                                                  .getDataString(
                                                      key: 'token') ??
                                              "",
                                          searchKey: hotelCubit.searchKey!,
                                        ),
                                      ),
                                      context);
                                  hotelCubit.getHotelDetailsFunctions(
                                      HotelDetailsJson(
                                        request: HotelDetails(
                                          productCode:
                                              '${hotelCubit.hotelSearchResults[index].hotel!.hotelCode}',
                                          tokenCode: getIt<CacheHelper>()
                                                  .getDataString(
                                                      key: 'token') ??
                                              "",
                                        ),
                                      ),
                                      context);

                                  hotelCubit.bottomSheetValueFunction(
                                      type: 'h3');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.kSecondColor,
                                    borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(18),
                                    ),
                                  ),
                                  height: context.height * 0.079,
                                  width: context.width * 0.3,
                                  child: Center(
                                    child: TextWidget(
                                      text: S.of(context).ShowDetails,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Positioned(
            right: 10,
            top: 6,
            child: Row(
              children: [
                CircularIconWidget(
                  iconColor: Colors.grey,
                  borderColor: Colors.black,
                  title: TextWidget(
                    text: '5.0',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  circularColor: Colors.black,
                  size: 0.04,
                  borderRadius: 8,
                ),
                SizedBox(
                  width: 5,
                ),
                CircularIconWidget(
                  iconColor: Colors.white,
                  borderColor: Colors.black,
                  icon: Icons.share,
                  circularColor: Colors.black,
                  size: 0.04,
                  borderRadius: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
