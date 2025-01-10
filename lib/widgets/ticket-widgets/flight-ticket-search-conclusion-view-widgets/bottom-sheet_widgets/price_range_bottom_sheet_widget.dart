import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/text_field_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/save_and_clean_in_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceRangeBottomSheet extends StatelessWidget {
  const PriceRangeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return BottomSheetWidget(
          paddingTop: 0,
          paddingLeftRight: 0,
          title: Column(
            children: [
              SaveAndCleanInBottomSheetWidget(
                onTopForClean: () {
                  flightTicketCubit.highestPriceInFilter = 0;
                  flightTicketCubit.lowestPriceInFilter = 0;
                  flightTicketCubit.bottomSheetValue(type: 12);
                },
                onTopForSave: () {
                  flightTicketCubit.filterByPriceRange(context);
                  if (flightTicketCubit.highestPriceInFilter == 0) {
                    SnackbarUtils.showSnackbar(context,
                        S.of(context).TheHighestPriceDoseNotHaveToByEmpty);
                  } else if (flightTicketCubit.lowestPriceInFilter == 0) {
                    SnackbarUtils.showSnackbar(context,
                        S.of(context).TheLowestPriceDoseNotHaveToByEmpty);
                  } else if (flightTicketCubit.lowestPriceInFilter >
                      flightTicketCubit.highestPriceInFilter) {
                    SnackbarUtils.showSnackbar(
                        context,
                        S
                            .of(context)
                            .TheLowestPriceCanNotHigherFromHighestPrice);
                  } else if (flightTicketCubit
                          .listFilterPriceLeaving!.isEmpty &&
                      flightTicketCubit.searchTypeForListInFilter == 'tek') {
                    SnackbarUtils.showSnackbar(
                        context, S.of(context).NoFlightsFoundInThisPriceRange);
                    print(flightTicketCubit.lowestPriceInFilter);
                    print(flightTicketCubit.highestPriceInFilter);
                  } else if (flightTicketCubit.listFilterPriceReturn!.isEmpty &&
                      flightTicketCubit.searchTypeForListInFilter == 'donus') {
                    SnackbarUtils.showSnackbar(
                        context, S.of(context).NoFlightsFoundInThisPriceRange);
                    print(flightTicketCubit.lowestPriceInFilter);
                    print(flightTicketCubit.highestPriceInFilter);
                  } else {
                    flightTicketCubit.bottomSheetValue(type: 12);
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: S.of(context).PriceRange,
                color: AppColors.kSecondColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          height: 0.3,
          widgetBody: Form(
            key: flightTicketCubit.formKeyInPriceBottomSheetInTheFilter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                    child: TextFieldWidget(
                      suffixIcon: Icons.arrow_circle_down,
                      textInputType: TextInputType.number,
                      colorSuffixIcon: AppColors.kSecondColor,
                      onChanged: (value) {
                        flightTicketCubit.lowestPriceInFilter =
                            int.parse(value);
                      },
                      hint:
                          '${S.of(context).LowestPrice} (${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue})',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 35,
                    child: TextFieldWidget(
                      suffixIcon: Icons.arrow_circle_up,
                      textInputType: TextInputType.number,
                      colorSuffixIcon: AppColors.kSecondColor,
                      onChanged: (value) {
                        flightTicketCubit.highestPriceInFilter =
                            int.parse(value);
                      },
                      hint:
                          '${S.of(context).HighestPrice} (${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue})',
                    ),
                  ),
                  // const SizedBox(
                  //   height: 40,
                  // ),
                  // ButtonWidget(
                  //   onTap: () {
                  // if (flightTicketCubit.highestPriceInFilter == 0) {
                  //   SnackbarUtils.showSnackbar(context,
                  //       'the Highest price dose not have to by empty');
                  // } else if (flightTicketCubit.lowestPriceInFilter == 0) {
                  //   SnackbarUtils.showSnackbar(context,
                  //       'the Lowest price dose not have to by empty');
                  // } else if (flightTicketCubit.lowestPriceInFilter >
                  //     flightTicketCubit.highestPriceInFilter) {
                  //   SnackbarUtils.showSnackbar(context,
                  //       'the Lowest price can\'t higher from Highest price');
                  // } else {
                  //   flightTicketCubit.bottomSheetValue(type: 12);
                  //   print(flightTicketCubit.lowestPriceInFilter);
                  //   print(flightTicketCubit.highestPriceInFilter);
                  // }
                  //   },
                  //   title: S.of(context).Apply,
                  //   height: 0.045,
                  //   width: 0.5,
                  //   fontSize: 16,
                  //   fontWeight: FontWeight.bold,
                  //   textColor: Colors.white,
                  //   color: AppColors.kSecondColor,
                  // )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
