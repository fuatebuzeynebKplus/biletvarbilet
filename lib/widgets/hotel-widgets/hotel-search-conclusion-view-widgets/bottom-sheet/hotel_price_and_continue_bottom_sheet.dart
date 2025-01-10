import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelPriceAndContinueBottomSheet extends StatelessWidget {
  const HotelPriceAndContinueBottomSheet({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
        // double price = 0.0;

        // for (var element
        //     in hotelCubit.hotelSearchResults[hotelCubit.hotelIndex!].rooms) {
        //   price += element.roomAlternatives.first.totalAmount.toDouble();
        // }
        return BottomSheetWidget(
          height: 0.17,
          paddingTop: 0,
          paddingLeftRight: 0,
          circularRadius: 0,
          widgetBody: Column(
            children: [
              GestureDetector(
                onTap: () {
                  // hotelCubit.bottomSheetValue(type: );
                },
                child: Container(
                  height: context.height * 0.07,
                  color: const Color(0xFFebfce9),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        TextWidget(
                          text: S.of(context).TotalCharge,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF329224),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            hotelCubit.totalRoomPrice == null
                                ? Row(
                                    children: [
                                      TextWidget(
                                        text: hotelCubit.formatNumber(
                                            BlocProvider.of<CurrencyCodeCubit>(context)
                                                .convertToAppCurrency(
                                                    itemPrice: hotelCubit
                                                        .hotelSearchResults[
                                                            hotelCubit
                                                                .hotelIndex!]
                                                        .rooms
                                                        .first
                                                        .roomAlternatives
                                                        .first
                                                        .totalAmount
                                                        .toDouble(),
                                                    appCurrencyExchangeRate:
                                                        BlocProvider.of<CurrencyCodeCubit>(context)
                                                            .currencyRate!,
                                                    ticketCurrencyCode: hotelCubit
                                                        .hotelSearchResults[hotelCubit.hotelIndex!]
                                                        .rooms
                                                        .first
                                                        .roomAlternatives
                                                        .first
                                                        .currencyCode!)),
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF329224),
                                      ),
                                      TextWidget(
                                        text:
                                            ' ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF329224),
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      TextWidget(
                                        text: hotelCubit.formatNumber(BlocProvider
                                                .of<CurrencyCodeCubit>(context)
                                            .convertToAppCurrency(
                                                itemPrice:
                                                    hotelCubit.totalRoomPrice!,
                                                appCurrencyExchangeRate:
                                                    BlocProvider.of<
                                                                CurrencyCodeCubit>(
                                                            context)
                                                        .currencyRate!,
                                                ticketCurrencyCode: hotelCubit
                                                    .currencyCodeForHotelOrRoom!)),
                                        //${hotelCubit.hotelSearchResults[hotelCubit.hotelIndex!].rooms.first.roomAlternatives.first.totalAmount}
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF329224),
                                      ),
                                      TextWidget(
                                        text:
                                            ' ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xFF329224),
                                      ),
                                    ],
                                  ),
                            const Icon(
                              Icons.navigate_next,
                              color: Color(0xFF329224),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ButtonWidget(
                color: AppColors.kSecondColor,
                title: S.of(context).Continue,
                height: 0.055,
                width: 0.7,
                fontSize: 16,
                textColor: Colors.white,
                onTap: onTap,
              )
            ],
          ),
        );
      },
    );
  }
}
