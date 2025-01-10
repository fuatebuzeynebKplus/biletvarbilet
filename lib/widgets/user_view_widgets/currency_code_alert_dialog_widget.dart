import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/check_box_widget.dart';
import 'package:bamobile1/widgets/text_spacer_widget_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_payment_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyCodeAlertDialogWidget extends StatelessWidget {
  const CurrencyCodeAlertDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CurrencyCodeCubit currencyCodeCubit =
        BlocProvider.of<CurrencyCodeCubit>(context);

    return BlocConsumer<CurrencyCodeCubit, CurrencyCodeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Column(
          children: [
            TextWidget(
              text: S.of(context).Sort,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.kSecondColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: currencyCodeCubit.currencyList.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      currencyCodeCubit.currencyCodeFunction(
                          value: currencyCodeCubit.currencyList[index].code!,
                          name: currencyCodeCubit.currencyList[index].name!);
                    },
                    child: TextSpacerWidgetWidget(
                        color: Colors.black,
                        fontSize: 14,
                        title:
                            '${currencyCodeCubit.currencyList[index].name!.length > 20 ? "${currencyCodeCubit.currencyList[index].name!.substring(0, 20)}..." : currencyCodeCubit.currencyList[index].name} - ${currencyCodeCubit.currencyList[index].code}',
                        widget: Radio(
                            value: currencyCodeCubit.currencyList[index].code,
                            groupValue: currencyCodeCubit.currencyCodeValue,
                            activeColor: AppColors.kSecondColor,
                            onChanged: (value) {
                              currencyCodeCubit.currencyCodeFunction(
                                  value: value!,
                                  name: currencyCodeCubit
                                      .currencyList[index].name!);
                            })),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              onTap: () {
                currencyCodeCubit.fetchCurrencyData();
                Navigator.pop(context);
              },
              fontWeight: FontWeight.bold,
              borderCircularValue: 16,
              title: S.of(context).Apply,
              height: 0.05,
              width: 0.5,
              fontSize: 18,
              textColor: Colors.white,
              color: AppColors.kSecondColor,
            )
          ],
        );
      },
    );
  }
}
