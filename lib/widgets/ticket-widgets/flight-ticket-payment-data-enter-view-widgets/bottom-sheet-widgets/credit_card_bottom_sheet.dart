import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:bamobile1/widgets/save_and_clean_in_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/text_field_other_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_installment_type_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_payment_type_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditCardBottomSheet extends StatelessWidget {
  const CreditCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    //String? paymentId = flightTicketCubit.selectPaymentType;

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // Implement listener if needed
      },
      builder: (context, state) {
        return BottomSheetWidget(
          noScroll: false,
          paddingLeftRight: 0,
          height: flightTicketCubit.binCodeIsHere == null ? 0.4 : 0.6,
          paddingTop: 0,
          title: SaveAndCleanInBottomSheetWidget(
            onTopForSave: () {
              flightTicketCubit
                  .checkIsAnyOneNullOrNotCompleatForReservationFunction();
              if (flightTicketCubit
                      .checkIsAnyOneNullOrNotCompleatForReservationValue ==
                  true) {
                flightTicketCubit.bottomSheetValue(type: 6);
              } else {
                SnackbarUtils.showSnackbar(
                    context, S.of(context).PleaseFillInAllFields);
              }
            },
            onTopForClean: () {
              flightTicketCubit.selectPaymentType = null;
              flightTicketCubit.paymentType = null;
              flightTicketCubit.bottomSheetValue(type: 0);
            },
          ),
          widgetBody: SizedBox(
            height: context.height * 0.515,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  flightTicketCubit.amount == null &&
                          flightTicketCubit.percent == null
                      ? const SizedBox()
                      : Container(
                          width: context.width * 1,
                          height: context.height * 0.045,
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
                                  title: S.of(context).CustomerPayment,
                                  height: context.height * 0.049,
                                  width: 0.45,
                                  fontSize: 14,
                                  textColor: Colors.black,
                                  color: flightTicketCubit
                                              .selectAgentCreditCardOrCustomerCreditCardValue ==
                                          0
                                      ? Colors.white
                                      : Colors.grey.shade200,
                                  border: flightTicketCubit
                                              .selectAgentCreditCardOrCustomerCreditCardValue ==
                                          0
                                      ? Border.all(
                                          color: AppColors.kSecondColor)
                                      : null,
                                  onTap: () {
                                    flightTicketCubit
                                        .selectAgentCreditCardOrCustomerCreditCardFunction(
                                            value: 0);
                                    flightTicketCubit.searchInBinCodes(
                                        value: flightTicketCubit
                                                .creditCardNumber ??
                                            '0');
                                  },
                                ),
                                ButtonWidget(
                                  borderCircularValue: 14,
                                  title: S.of(context).AgencyPayment,
                                  height: context.height * 0.049,
                                  width: 0.45,
                                  fontSize: 14,
                                  textColor: Colors.black,
                                  color: flightTicketCubit
                                              .selectAgentCreditCardOrCustomerCreditCardValue ==
                                          1
                                      ? Colors.white
                                      : Colors.grey.shade200,
                                  border: flightTicketCubit
                                              .selectAgentCreditCardOrCustomerCreditCardValue ==
                                          1
                                      ? Border.all(
                                          color: AppColors.kSecondColor)
                                      : null,
                                  onTap: () {
                                    flightTicketCubit
                                        .selectAgentCreditCardOrCustomerCreditCardFunction(
                                            value: 1);
                                    flightTicketCubit.searchInBinCodes(
                                        value: flightTicketCubit
                                                .creditCardNumber ??
                                            '0');
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                  SizedBox(height: context.height * 0.02),
                  TextFieldOtherDesignWidget(
                    initialValue: flightTicketCubit.creditCardName,
                    textInputType: TextInputType.name,
                    width: 1,
                    text: S.of(context).NameOnCard,
                    padding: 8,
                    inputFormatters: [
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) {
                          final filteredText = newValue.text
                              .replaceAll(RegExp(r'[^a-zA-Z\s]'), '');
                          return TextEditingValue(
                            text: filteredText.toUpperCase(),
                            selection: newValue.selection,
                          );
                        },
                      ),
                    ],
                    onChanged: (value) {
                      flightTicketCubit.creditCardName = value;
                    },
                  ),
                  const SizedBox(height: 6),
                  TextFieldOtherDesignWidget(
                    initialValue: flightTicketCubit.creditCardNumber,
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // السماح فقط بالأرقام
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        // إزالة جميع الفراغات أولاً ثم إعادة إدخالها بعد كل 4 أرقام
                        String newText = newValue.text.replaceAll(' ', '');
                        if (newText.length > 16) {
                          return oldValue; // تحديد الحد الأقصى بـ 16 رقم فقط
                        }

                        String formatted = '';
                        for (int i = 0; i < newText.length; i++) {
                          formatted += newText[i];
                          if ((i + 1) % 4 == 0 && i + 1 != newText.length) {
                            formatted += ' '; // إضافة فراغ بعد كل 4 أرقام
                          }
                        }
                        return TextEditingValue(
                          text: formatted,
                          selection:
                              TextSelection.collapsed(offset: formatted.length),
                        );
                      }),
                    ],
                    textInputType: TextInputType.number,
                    width: 1,
                    height: 0.05,
                    text: S.of(context).CardNumber,
                    onChanged: (value) {
                      flightTicketCubit.searchInBinCodes(value: value);
                      flightTicketCubit.creditCardNumber = value;
                    },
                    padding: 18,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          flightTicketCubit.bottomSheetValue(type: 24);
                        },
                        child: Container(
                          height: context.height * 0.04,
                          width: context.width * 0.45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.black26,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: [
                                TextWidget(
                                    text: flightTicketCubit
                                            .creditCardMonthAndYear ??
                                        S.of(context).ExpirationDate,
                                    color: Colors.grey.shade600,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // TextFieldOtherDesignWidget(
                      //   initialValue: flightTicketCubit.creditCardMonthAndYear,
                      //   textInputType: TextInputType.number,
                      //   inputFormatters: [
                      //     FilteringTextInputFormatter
                      //         .digitsOnly, // السماح فقط بالأرقام
                      //     TextInputFormatter.withFunction((oldValue, newValue) {
                      //       String newText = newValue.text.replaceAll('/', '');
                      //       if (newText.length > 4) {
                      //         return oldValue; // تحديد الحد الأقصى بـ 4 أرقام فقط (MMYY)
                      //       }

                      //       String formatted = '';
                      //       for (int i = 0; i < newText.length; i++) {
                      //         formatted += newText[i];
                      //         if (i == 1 && newText.length > 2) {
                      //           formatted +=
                      //               '/'; // إضافة الشرطة بعد الشهر (MM/)
                      //         }
                      //       }
                      //       return TextEditingValue(
                      //         text: formatted,
                      //         selection: TextSelection.collapsed(
                      //             offset: formatted.length),
                      //       );
                      //     }),
                      //   ],
                      //   width: 0.45,
                      //   text: S.of(context).ValidityDate,
                      //   padding: 8,
                      //   onChanged: (value) {
                      //     flightTicketCubit.creditCardMonthAndYear = value;
                      //   },
                      // ),
                      TextFieldOtherDesignWidget(
                        initialValue: flightTicketCubit.creditCardCvv,
                        textInputType: TextInputType.number,
                        width: 0.25,
                        height: 0.06,
                        text: 'CVV',
                        padding: 8,
                        maxLength: 3,
                        onChanged: (value) {
                          flightTicketCubit.creditCardCvv = value;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  BlocConsumer<FlightTicketCubit, FlightTicketState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return state is SearchInBinCodesLoadingState
                          ? const SizedBox()
                          : state is SearchInBinCodesSuccessState ||
                                  state
                                      is SelectRadioButtonForPaymentViewState ||
                                  state
                                      is SelectAgentCreditCardOrCustomerCreditCardState
                              ? Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12),
                                        height: context.height * 0.07,
                                        decoration: BoxDecoration(
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.black45,
                                              offset: Offset(0.0, 1.0), //(x,y)
                                              blurRadius: 0.2,
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Image.network(
                                              flightTicketCubit
                                                  .creditCardOptionsCustomer[
                                                      flightTicketCubit
                                                          .binCodeIsHere!]
                                                  .logoUrl!,
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return Image.asset(
                                                  'assets/images/no_Image.png',
                                                  height: 30,
                                                );
                                              },
                                              height: 30,
                                            ),
                                            TextWidget(
                                              text: flightTicketCubit
                                                  .creditCardOptionsCustomer[
                                                      flightTicketCubit
                                                          .binCodeIsHere!]
                                                  .name!,
                                              color: Colors.black45,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      flightTicketCubit
                                                  .creditCardOptionsCustomer[
                                                      flightTicketCubit
                                                          .binCodeIsHere!]
                                                  .paymentGroupItem!
                                                  .length >
                                              2
                                          ? TextWidget(
                                              text: S
                                                  .of(context)
                                                  .InstallmentTypes,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            )
                                          : const SizedBox(),
                                      const SizedBox(height: 6),
                                      SizedBox(
                                        height: context.height * 0.15,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: flightTicketCubit
                                                      .selectAgentCreditCardOrCustomerCreditCardValue ==
                                                  0
                                              ? flightTicketCubit
                                                      .creditCardOptionsCustomer[
                                                          flightTicketCubit
                                                              .binCodeIsHere!]
                                                      .paymentGroupItem!
                                                      .length -
                                                  1
                                              : flightTicketCubit
                                                      .creditCardOptionsAgent[
                                                          flightTicketCubit
                                                              .binCodeIsHere!]
                                                      .paymentGroupItem!
                                                      .length -
                                                  1,
                                          itemBuilder: (BuildContext context,
                                              int subIndex) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 6, left: 6, right: 6),
                                              child: ContainerCardWidget(
                                                isShadow: true,
                                                borderColor: flightTicketCubit
                                                            .radioForInstallmentType ==
                                                        '${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)}${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId!} TRY)'
                                                    ? AppColors.kSecondColor
                                                    : Colors.transparent,
                                                onTap: () {
                                                  flightTicketCubit
                                                              .selectAgentCreditCardOrCustomerCreditCardValue ==
                                                          0
                                                      ? flightTicketCubit
                                                              .paymentId =
                                                          flightTicketCubit
                                                              .creditCardOptionsCustomer[
                                                                  flightTicketCubit
                                                                      .binCodeIsHere!]
                                                              .paymentGroupItem![
                                                                  subIndex + 1]
                                                              .paymentItemId
                                                      : flightTicketCubit
                                                              .paymentId =
                                                          flightTicketCubit
                                                              .creditCardOptionsAgent[
                                                                  flightTicketCubit
                                                                      .binCodeIsHere!]
                                                              .paymentGroupItem![
                                                                  subIndex + 1]
                                                              .paymentItemId;

                                                  print(
                                                      'paymentId: ${flightTicketCubit.paymentId}');
                                                },
                                                fontSize: 14,
                                                height: 0.045,
                                                paddingTop:
                                                    context.height * 0.006,
                                                paddingLeftRight: 4,
                                                text:
                                                    '${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)} TRY)',
                                                action:
                                                    RadioForInstallmentTypeWidget(
                                                  text:
                                                      '${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)}${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId!} TRY)',
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
} 

/*
 Column(
                                        children: [
                                          const SizedBox(height: 6),
                                          flightTicketCubit
                                                      .creditCardOptionsCustomer[
                                                          flightTicketCubit
                                                              .binCodeIsHere!]
                                                      .paymentGroupItem!
                                                      .length >
                                                  1
                                              ? TextWidget(
                                                  text: S
                                                      .of(context)
                                                      .InstallmentTypes,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                )
                                              : const SizedBox(),
                                          ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: flightTicketCubit
                                                        .selectAgentCreditCardOrCustomerCreditCardValue ==
                                                    0
                                                ? flightTicketCubit
                                                        .creditCardOptionsCustomer[
                                                            flightTicketCubit
                                                                .binCodeIsHere!]
                                                        .paymentGroupItem!
                                                        .length -
                                                    1
                                                : flightTicketCubit
                                                        .creditCardOptionsAgent[
                                                            flightTicketCubit
                                                                .binCodeIsHere!]
                                                        .paymentGroupItem!
                                                        .length -
                                                    1,
                                            itemBuilder: (BuildContext context,
                                                int subIndex) {
                                              return Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 6),
                                                child: ContainerCardWidget(
                                                  isShadow: true,
                                                  borderColor: flightTicketCubit
                                                              .radioForInstallmentType ==
                                                          '${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)}${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId!} TRY)'
                                                      ? AppColors.kSecondColor
                                                      : Colors.transparent,
                                                  onTap: () {
                                                    flightTicketCubit
                                                        .paymentId = flightTicketCubit
                                                                .selectAgentCreditCardOrCustomerCreditCardValue ==
                                                            0
                                                        ? flightTicketCubit
                                                            .creditCardOptionsCustomer[
                                                                flightTicketCubit
                                                                    .binCodeIsHere!]
                                                            .paymentGroupItem![
                                                                subIndex + 1]
                                                            .paymentItemId
                                                        : flightTicketCubit
                                                            .creditCardOptionsAgent[
                                                                flightTicketCubit
                                                                    .binCodeIsHere!]
                                                            .paymentGroupItem![
                                                                subIndex + 1]
                                                            .paymentItemId;
                                                  },
                                                  fontSize: 14,
                                                  height: 0.045,
                                                  paddingTop:
                                                      context.height * 0.006,
                                                  paddingLeftRight: 4,
                                                  text:
                                                      '${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)} TRY)',
                                                  action:
                                                      RadioForInstallmentTypeWidget(
                                                    text:
                                                        '${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)}${flightTicketCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId! : flightTicketCubit.creditCardOptionsAgent[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId!} TRY)',
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),


*/

/*

import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:bamobile1/widgets/save_and_clean_in_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/text_field_other_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_installment_type_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_payment_type_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreditCardBottomSheet extends StatelessWidget {
  const CreditCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    //String? paymentId = flightTicketCubit.selectPaymentType;

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // Implement listener if needed
      },
      builder: (context, state) {
        return BottomSheetWidget(
          noScroll: false,
          paddingLeftRight: 0,
          height: flightTicketCubit.binCodeIsHere == null ? 0.4 : 0.6,
          paddingTop: 0,
          title: SaveAndCleanInBottomSheetWidget(
            onTopForSave: () {
              flightTicketCubit
                  .checkIsAnyOneNullOrNotCompleatForReservationFunction();
              if (flightTicketCubit
                      .checkIsAnyOneNullOrNotCompleatForReservationValue ==
                  true) {
                flightTicketCubit.bottomSheetValue(type: 6);
              } else {
                SnackbarUtils.showSnackbar(
                    context, 'Lütfen tüm alanları doldurunuz');
              }
            },
            onTopForClean: () {
              flightTicketCubit.selectPaymentType = null;
              flightTicketCubit.paymentType = null;
              flightTicketCubit.bottomSheetValue(type: 0);
            },
          ),
          widgetBody: SizedBox(
            height: context.height * 0.515,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                   Container(
                    width: context.width * 1,
                    height: context.height * 0.045,
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
                            title: 'Müşteri Kartı',
                            height: context.height * 0.049,
                            width: 0.45,
                            fontSize: 14,
                            textColor: Colors.black,
                            color: flightTicketCubit
                                        .selectAgentCreditCardOrCustomerCreditCardValue ==
                                    0
                                ? Colors.white
                                : Colors.grey.shade200,
                            border: flightTicketCubit
                                        .selectAgentCreditCardOrCustomerCreditCardValue ==
                                    0
                                ? Border.all(color: AppColors.kSecondColor)
                                : null,
                            onTap: () {
                              flightTicketCubit
                                  .selectAgentCreditCardOrCustomerCreditCardFunction(
                                      value: 0);
                            },
                          ),
                          ButtonWidget(
                            borderCircularValue: 14,
                            title: 'Agent Kartı',
                            height: context.height * 0.049,
                            width: 0.45,
                            fontSize: 14,
                            textColor: Colors.black,
                            color: flightTicketCubit
                                        .selectAgentCreditCardOrCustomerCreditCardValue ==
                                    1
                                ? Colors.white
                                : Colors.grey.shade200,
                            border: flightTicketCubit
                                        .selectAgentCreditCardOrCustomerCreditCardValue ==
                                    1
                                ? Border.all(color: AppColors.kSecondColor)
                                : null,
                            onTap: () {
                              flightTicketCubit
                                  .selectAgentCreditCardOrCustomerCreditCardFunction(
                                      value: 1);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: context.height * 0.02),
                  TextFieldOtherDesignWidget(
                    initialValue: flightTicketCubit.creditCardName,
                    textInputType: TextInputType.name,
                    width: 1,
                    text: S.of(context).NameOnCard,
                    padding: 8,
                    onChanged: (value) {
                      flightTicketCubit.creditCardName = value;
                    },
                  ),
                  const SizedBox(height: 6),
                  TextFieldOtherDesignWidget(
                    initialValue: flightTicketCubit.creditCardNumber,
                    inputFormatters: [
                      FilteringTextInputFormatter
                          .digitsOnly, // السماح فقط بالأرقام
                      TextInputFormatter.withFunction((oldValue, newValue) {
                        // إزالة جميع الفراغات أولاً ثم إعادة إدخالها بعد كل 4 أرقام
                        String newText = newValue.text.replaceAll(' ', '');
                        if (newText.length > 16) {
                          return oldValue; // تحديد الحد الأقصى بـ 16 رقم فقط
                        }

                        String formatted = '';
                        for (int i = 0; i < newText.length; i++) {
                          formatted += newText[i];
                          if ((i + 1) % 4 == 0 && i + 1 != newText.length) {
                            formatted += ' '; // إضافة فراغ بعد كل 4 أرقام
                          }
                        }
                        return TextEditingValue(
                          text: formatted,
                          selection:
                              TextSelection.collapsed(offset: formatted.length),
                        );
                      }),
                    ],
                    textInputType: TextInputType.number,
                    width: 1,
                    height: 0.05,
                    text: S.of(context).CardNumber,
                    onChanged: (value) {
                      flightTicketCubit.searchInBinCodes(value: value);
                      flightTicketCubit.creditCardNumber = value;
                    },
                    padding: 18,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldOtherDesignWidget(
                        initialValue: flightTicketCubit.creditCardMonthAndYear,
                        textInputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // السماح فقط بالأرقام
                          TextInputFormatter.withFunction((oldValue, newValue) {
                            String newText = newValue.text.replaceAll('/', '');
                            if (newText.length > 4) {
                              return oldValue; // تحديد الحد الأقصى بـ 4 أرقام فقط (MMYY)
                            }

                            String formatted = '';
                            for (int i = 0; i < newText.length; i++) {
                              formatted += newText[i];
                              if (i == 1 && newText.length > 2) {
                                formatted +=
                                    '/'; // إضافة الشرطة بعد الشهر (MM/)
                              }
                            }
                            return TextEditingValue(
                              text: formatted,
                              selection: TextSelection.collapsed(
                                  offset: formatted.length),
                            );
                          }),
                        ],
                        width: 0.45,
                        text: S.of(context).ValidityDate,
                        padding: 8,
                        onChanged: (value) {
                          flightTicketCubit.creditCardMonthAndYear = value;
                        },
                      ),
                      TextFieldOtherDesignWidget(
                        initialValue: flightTicketCubit.creditCardCvv,
                        textInputType: TextInputType.number,
                        width: 0.25,
                        height: 0.06,
                        text: 'CVV',
                        padding: 8,
                        maxLength: 3,
                        onChanged: (value) {
                          flightTicketCubit.creditCardCvv = value;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  BlocConsumer<FlightTicketCubit, FlightTicketState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return state is SearchInBinCodesLoadingState
                          ? const SizedBox()
                          : state is SearchInBinCodesSuccessState ||
                                  state is SelectRadioButtonForPaymentViewState
                              ? Expanded(
                                  child: ListView.builder(
                                    itemCount: 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 2),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12),
                                              height: context.height * 0.07,
                                              decoration: BoxDecoration(
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Colors.black45,
                                                    offset: Offset(
                                                        0.0, 1.0), //(x,y)
                                                    blurRadius: 0.2,
                                                  ),
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                border: Border.all(
                                                  color: Colors.grey.shade300,
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Image.network(
                                                    flightTicketCubit
                                                        .creditCardOptionsCustomer[
                                                            flightTicketCubit
                                                                .binCodeIsHere!]
                                                        .logoUrl!,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Image.asset(
                                                        'assets/images/user.png',
                                                        height: 30,
                                                      );
                                                    },
                                                    height: 30,
                                                  ),
                                                  TextWidget(
                                                    text: flightTicketCubit
                                                        .creditCardOptionsCustomer[
                                                            flightTicketCubit
                                                                .binCodeIsHere!]
                                                        .name!,
                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            flightTicketCubit
                                                        .creditCardOptionsCustomer[
                                                            flightTicketCubit
                                                                .binCodeIsHere!]
                                                        .paymentGroupItem!
                                                        .length >
                                                    2
                                                ? TextWidget(
                                                    text: S
                                                        .of(context)
                                                        .InstallmentTypes,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  )
                                                : const SizedBox(),
                                            const SizedBox(height: 6),
                                            ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: flightTicketCubit
                                                      .creditCardOptionsCustomer[
                                                          flightTicketCubit
                                                              .binCodeIsHere!]
                                                      .paymentGroupItem!
                                                      .length -
                                                  1,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int subIndex) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 6),
                                                  child: ContainerCardWidget(
                                                    isShadow: true,
                                                    borderColor: flightTicketCubit
                                                                .radioForInstallmentType ==
                                                            '${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)}${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId!} TRY)'
                                                        ? AppColors.kSecondColor
                                                        : Colors.transparent,
                                                    onTap: () {
                                                      flightTicketCubit
                                                              .paymentId =
                                                          flightTicketCubit
                                                              .creditCardOptionsCustomer[
                                                                  flightTicketCubit
                                                                      .binCodeIsHere!]
                                                              .paymentGroupItem![
                                                                  subIndex + 1]
                                                              .paymentItemId;
                                                    },
                                                    fontSize: 14,
                                                    height: 0.045,
                                                    paddingTop:
                                                        context.height * 0.006,
                                                    paddingLeftRight: 4,
                                                    text:
                                                        '${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)} TRY)',
                                                    action:
                                                        RadioForInstallmentTypeWidget(
                                                      text:
                                                          '${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)}${flightTicketCubit.creditCardOptionsCustomer[flightTicketCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId!} TRY)',
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                              : const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );


*/