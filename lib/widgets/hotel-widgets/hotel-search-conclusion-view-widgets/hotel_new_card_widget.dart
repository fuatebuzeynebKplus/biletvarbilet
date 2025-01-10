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

class HotelNewCardWidget extends StatelessWidget {
  const HotelNewCardWidget({
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
      child: GestureDetector(
          onTap: () {
            hotelCubit.sendHotelIndex(value: index);
            hotelCubit.selectHotelCardFunction(value: index);
            if (hotelCubit.selectHotelRoomCard != null) {
              hotelCubit.selectHotelRoomCardFunction(
                  value: hotelCubit.selectHotelRoomCard!);
              hotelCubit.getTotalRoomPrice(
                  value: 0.0,
                  currencyCode: hotelCubit.hotelSearchResults[index].rooms.first
                      .roomAlternatives.first.currencyCode!);
            } else if (hotelCubit.selectHotelRoomCard == null) {
              hotelCubit.selectHotelRoomCardFunction(
                  value: hotelCubit.selectHotelCard!);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: hotelCubit.selectHotelCard == index
                  ? Border.all(color: AppColors.kSecondColor, width: 2)
                  : null,
            ),
            height: context.height * 0.15,
            width: context.width * 1,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.height * 0.01,
                vertical: context.height * 0.012,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // صورة الفندق
                  Container(
                    height: context.height * 0.14,
                    width: context.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                          hotelCubit.hotelSearchResults[index].hotel!
                                  .hotelImageUrl ??
                              'https://cdn.kplus.com.tr/...', // صورة بديلة في حال عدم وجود رابط
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // باقي العناصر
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // اسم الفندق
                              Expanded(
                                child: TextWidget(
                                  text: hotelCubit.hotelSearchResults[index]
                                      .hotel!.hotelName!,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  isHaveOverflow: true,
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              const Row(
                                children: [
                                  CircularIconWidget(
                                    iconColor: Colors.grey,
                                    borderColor: Colors.black,
                                    title: TextWidget(
                                      text: '5.0',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                    circularColor: Colors.black,
                                    size: 0.03,
                                    borderRadius: 4,
                                  ),
                                  SizedBox(width: 5),
                                  CircularIconWidget(
                                    iconColor: Colors.white,
                                    borderColor: Colors.black,
                                    icon: Icons.share,
                                    circularColor: Colors.black,
                                    size: 0.03,
                                    borderRadius: 4,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // تقييم النجوم
                          Wrap(
                            children: List.generate(
                              hotelCubit.hotelSearchResults[index].hotel!.star!,
                              (index) => Icon(
                                Icons.star,
                                color: AppColors.kSecondColor,
                                size: 16,
                              ),
                            ),
                          ),
                          // العنوان
                          TextWidget(
                            text: hotelCubit
                                .hotelSearchResults[index].hotel!.address!,
                            fontSize: 10,
                            color: Colors.black45,
                            isHaveOverflow: true,
                          ),
                          // السعر والعملة
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  TextWidget(
                                    text: hotelCubit.formatNumber(
                                      BlocProvider.of<CurrencyCodeCubit>(
                                              context)
                                          .convertToAppCurrency(
                                        itemPrice: price,
                                        appCurrencyExchangeRate:
                                            BlocProvider.of<CurrencyCodeCubit>(
                                                    context)
                                                .currencyRate!,
                                        ticketCurrencyCode: hotelCubit
                                            .hotelSearchResults[index]
                                            .rooms
                                            .first
                                            .roomAlternatives
                                            .first
                                            .currencyCode!,
                                      ),
                                    ),
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  TextWidget(
                                    text:
                                        ' ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                    fontSize: 12,
                                    color: Colors.black45,
                                  ),
                                ],
                              ),
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
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  height: context.height * 0.03,
                                  width: context.width * 0.2,
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
