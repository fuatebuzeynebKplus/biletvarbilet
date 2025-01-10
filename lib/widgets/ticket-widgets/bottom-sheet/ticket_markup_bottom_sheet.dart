import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/text_field_other_design_widget.dart';
import 'package:bamobile1/widgets/text_field_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/close_and_apply_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TicketMarkupBottomSheet extends StatelessWidget {
  const TicketMarkupBottomSheet({
    super.key,
  });

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
          height: 0.4,
          title: TextWidget(
            text: S.of(context).Markup,
            color: AppColors.kSecondColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          widgetBody: Column(
            children: [
              SizedBox(
                height: context.height * 0.05,
                child: Container(
                  width: context.width * 0.92,
                  height: context.height * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.grey.shade200,
                  ),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          borderCircularValue: 14,
                          title: S.of(context).Amount,
                          height: context.height * 0.049,
                          width: 0.92 / 2,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                          color: flightTicketCubit.typeIsAmount == true
                              ? Colors.white
                              : Colors.grey.shade200,
                          border: flightTicketCubit.typeIsAmount == true
                              ? Border.all(color: AppColors.kSecondColor)
                              : null,
                          onTap: () {
                            flightTicketCubit.selectMarkupTypeFunction(
                                value: true);
                          },
                        ),
                        ButtonWidget(
                          borderCircularValue: 14,
                          title: S.of(context).Percent,
                          height: context.height * 0.049,
                          width: 0.92 / 2,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black,
                          color: flightTicketCubit.typeIsAmount == false
                              ? Colors.white
                              : Colors.grey.shade200,
                          border: flightTicketCubit.typeIsAmount == false
                              ? Border.all(color: AppColors.kSecondColor)
                              : null,
                          onTap: () {
                            flightTicketCubit.selectMarkupTypeFunction(
                                value: false);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  flightTicketCubit.typeIsAmount == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextFieldWidget(
                            initialValue: flightTicketCubit.amount != null
                                ? flightTicketCubit.amount.toString()
                                : '',
                            suffix: TextWidget(
                              text: BlocProvider.of<CurrencyCodeCubit>(context)
                                  .currencyCodeValue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            hint: S.of(context).Amount,
                            textInputType: TextInputType.number,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                flightTicketCubit.amount = null;
                              } else {
                                flightTicketCubit.amount = double.parse(value);
                              }
                            },
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: TextFieldWidget(
                            initialValue: flightTicketCubit.percent != null
                                ? flightTicketCubit.percent.toString()
                                : '',
                            suffixIcon: Icons.percent,
                            hint: S.of(context).Percent,
                            textInputType: TextInputType.number,
                            onChanged: (value) {
                              if (value.isEmpty) {
                                flightTicketCubit.percent = null;
                              } else {
                                flightTicketCubit.percent = int.parse(value);
                              }
                            },
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: context.height * 0.12,
              ),
              CloseAndApplyWidget(
                onTapClose: () {
                  BlocProvider.of<FlightTicketCubit>(context)
                      .bottomSheetValue(type: 0);
                },
                onTapApPly: () {
                  BlocProvider.of<FlightTicketCubit>(context)
                      .bottomSheetValue(type: 0);
                },
              ),
            ],
          ),
          // closeApply: CloseAndApplyWidget(
          //   onTapClose: () {
          //     BlocProvider.of<FlightTicketCubit>(context)
          //         .bottomSheetValue(type: 0);
          //   },
          //   onTapApPly: () {
          //     BlocProvider.of<FlightTicketCubit>(context)
          //         .bottomSheetValue(type: 0);
          //   },
          // ),
        );
      },
    );
  }
}
