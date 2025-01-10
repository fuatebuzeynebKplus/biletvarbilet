import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceAndContinueBottomSheet extends StatelessWidget {
  const PriceAndContinueBottomSheet({
    super.key,
    required this.onTap,
  });
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightTicketCubit, FlightTicketState>(
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return BottomSheetWidget(
          height: 0.17,
          paddingTop: 0,
          paddingLeftRight: 0,
          circularRadius: 0,
          widgetBody: Column(
            children: [
              GestureDetector(
                onTap: () {
                  print(flightTicketCubit.bottomSheetType);
                  print('searchTypeValue ${flightTicketCubit.searchTypeValue}');
                  if (flightTicketCubit.searchTypeValue != 'cok') {
                    flightTicketCubit.bottomSheetValue(type: 4);
                  } else {
                    flightTicketCubit.bottomSheetValue(type: 53);
                  }
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
                        flightTicketCubit.searchTypeValue == 'cok'
                            ? Row(
                                children: [
                                  flightTicketCubit
                                              .isResultTypeForFareMultiPointCombined ==
                                          true
                                      ? TextWidget(
                                          text: flightTicketCubit
                                                      .saveIndexFareForCombinedMultiPointValue ==
                                                  null
                                              ? '${flightTicketCubit.formatNumber(flightTicketCubit.totalPriceMultiPoint)}  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}'
                                              : '${flightTicketCubit.formatNumber(flightTicketCubit.totalPriceMultiPoint + (flightTicketCubit.flightFaresMultiPointIfIsCombined!.first.fares![flightTicketCubit.saveIndexFareForCombinedMultiPointValue!].totalPrice!.totalAmount.toDouble() - flightTicketCubit.totalPriceMultiPoint))}  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF329224),
                                        )
                                      : TextWidget(
                                          text: flightTicketCubit
                                                      .listMultiPoint.length !=
                                                  flightTicketCubit
                                                      .flightFaresMultiPointSelectedForSeparated!
                                                      .length
                                              ? '${flightTicketCubit.formatNumber(flightTicketCubit.totalPriceMultiPoint)}  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}'
                                              : '${flightTicketCubit.formatNumber(flightTicketCubit.totalPriceFareMultiPoint)}  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xFF329224),
                                        ),
                                  const Icon(
                                    Icons.navigate_next,
                                    color: Color(0xFF329224),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  TextWidget(
                                    text:
                                        '${flightTicketCubit.formatNumber(flightTicketCubit.totalPrice!)}  ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF329224),
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
