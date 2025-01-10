import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:bamobile1/widgets/save_and_clean_in_bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/text_field_other_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-payment-data-enter-view-widgets/radio_for_installment_type_widget.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelCreditCardBottomSheet extends StatelessWidget {
  const HotelCreditCardBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);

    //String? paymentId = flightTicketCubit.selectPaymentType;

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // Implement listener if needed
      },
      builder: (context, state) {
        return BottomSheetWidget(
          noScroll: false,
          paddingLeftRight: 0,
          height: hotelCubit.binCodeIsHere == null ? 0.4 : 0.6,
          paddingTop: 0,
          title: SaveAndCleanInBottomSheetWidget(
            onTopForSave: () {
              hotelCubit.checkIsAnyOneNullOrNotCompleatForReservationFunction();
              if (hotelCubit
                      .checkIsAnyOneNullOrNotCompleatForReservationValue ==
                  true) {
                hotelCubit.bottomSheetValueFunction(type: 'h9');
              } else {
                SnackbarUtils.showSnackbar(
                    context, S.of(context).PleaseFillInAllFields);
              }
            },
            onTopForClean: () {
              hotelCubit.selectPaymentType = null;
              hotelCubit.paymentType = null;
              hotelCubit.bottomSheetValueFunction(type: 'h0');
            },
          ),
          widgetBody: SizedBox(
            height: context.height * 0.515,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  hotelCubit.amount == null && hotelCubit.percent == null
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
                                  color: hotelCubit
                                              .selectAgentCreditCardOrCustomerCreditCardValue ==
                                          0
                                      ? Colors.white
                                      : Colors.grey.shade200,
                                  border: hotelCubit
                                              .selectAgentCreditCardOrCustomerCreditCardValue ==
                                          0
                                      ? Border.all(
                                          color: AppColors.kSecondColor)
                                      : null,
                                  onTap: () {
                                    hotelCubit
                                        .selectAgentCreditCardOrCustomerCreditCardFunction(
                                            value: 0);
                                    hotelCubit.searchInBinCodes(
                                        value:
                                            hotelCubit.creditCardNumber ?? '0');
                                  },
                                ),
                                ButtonWidget(
                                  borderCircularValue: 14,
                                  title: S.of(context).AgencyPayment,
                                  height: context.height * 0.049,
                                  width: 0.45,
                                  fontSize: 14,
                                  textColor: Colors.black,
                                  color: hotelCubit
                                              .selectAgentCreditCardOrCustomerCreditCardValue ==
                                          1
                                      ? Colors.white
                                      : Colors.grey.shade200,
                                  border: hotelCubit
                                              .selectAgentCreditCardOrCustomerCreditCardValue ==
                                          1
                                      ? Border.all(
                                          color: AppColors.kSecondColor)
                                      : null,
                                  onTap: () {
                                    hotelCubit
                                        .selectAgentCreditCardOrCustomerCreditCardFunction(
                                            value: 1);
                                    hotelCubit.searchInBinCodes(
                                        value:
                                            hotelCubit.creditCardNumber ?? '0');
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                  SizedBox(height: context.height * 0.02),
                  TextFieldOtherDesignWidget(
                    initialValue: hotelCubit.creditCardName,
                    textInputType: TextInputType.name,
                    width: 1,
                    text: S.of(context).NameOnCard,
                    padding: 8,
                    inputFormatters: [
                      TextInputFormatter.withFunction(
                        (oldValue, newValue) {
                          // فلترة النص للسماح فقط بالأحرف الإنجليزية
                          final filteredText = newValue.text
                              .replaceAll(RegExp(r'[^a-zA-Z]'), '');
                          return TextEditingValue(
                            text: filteredText
                                .toUpperCase(), // تحويل النص إلى أحرف كبيرة
                            selection: newValue.selection,
                          );
                        },
                      ),
                    ],
                    onChanged: (value) {
                      hotelCubit.creditCardName = value;
                    },
                  ),
                  const SizedBox(height: 6),
                  TextFieldOtherDesignWidget(
                    initialValue: hotelCubit.creditCardNumber,
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
                      hotelCubit.searchInBinCodes(value: value);
                      hotelCubit.creditCardNumber = value;
                    },
                    padding: 18,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //  hotelCubit.bottomSheetValue(type: 24);
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
                                    text: hotelCubit.creditCardMonthAndYear ??
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
                        initialValue: hotelCubit.creditCardCvv,
                        textInputType: TextInputType.number,
                        width: 0.25,
                        height: 0.06,
                        text: 'CVV',
                        padding: 8,
                        maxLength: 3,
                        onChanged: (value) {
                          hotelCubit.creditCardCvv = value;
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  BlocConsumer<HotelCubit, HotelState>(
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
                                              hotelCubit
                                                  .creditCardOptionsCustomer[
                                                      hotelCubit.binCodeIsHere!]
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
                                              text: hotelCubit
                                                  .creditCardOptionsCustomer[
                                                      hotelCubit.binCodeIsHere!]
                                                  .name!,
                                              color: Colors.black45,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      hotelCubit
                                                  .creditCardOptionsCustomer[
                                                      hotelCubit.binCodeIsHere!]
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
                                          itemCount: hotelCubit
                                                      .selectAgentCreditCardOrCustomerCreditCardValue ==
                                                  0
                                              ? hotelCubit
                                                      .creditCardOptionsCustomer[
                                                          hotelCubit
                                                              .binCodeIsHere!]
                                                      .paymentGroupItem!
                                                      .length -
                                                  1
                                              : hotelCubit
                                                      .creditCardOptionsAgent[
                                                          hotelCubit
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
                                                borderColor: hotelCubit
                                                            .radioForInstallmentType ==
                                                        '${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)}${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId! : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId!} TRY)'
                                                    ? AppColors.kSecondColor
                                                    : Colors.transparent,
                                                onTap: () {
                                                  hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue ==
                                                          0
                                                      ? hotelCubit.paymentId = hotelCubit
                                                          .creditCardOptionsCustomer[
                                                              hotelCubit
                                                                  .binCodeIsHere!]
                                                          .paymentGroupItem![
                                                              subIndex + 1]
                                                          .paymentItemId
                                                      : hotelCubit.paymentId = hotelCubit
                                                          .creditCardOptionsAgent[
                                                              hotelCubit
                                                                  .binCodeIsHere!]
                                                          .paymentGroupItem![
                                                              subIndex + 1]
                                                          .paymentItemId;

                                                  print(
                                                      'paymentId: ${hotelCubit.paymentId}');
                                                },
                                                fontSize: 14,
                                                height: 0.045,
                                                paddingTop:
                                                    context.height * 0.006,
                                                paddingLeftRight: 4,
                                                text:
                                                    '${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)} TRY)',
                                                action:
                                                    RadioForInstallmentTypeWidget(
                                                  text:
                                                      '${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name! : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].name!}  ${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2) : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].total!.toStringAsFixed(2)} (${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount! : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentCount!} x ${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2) : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].installmentAmount!.toStringAsFixed(2)}${hotelCubit.selectAgentCreditCardOrCustomerCreditCardValue == 0 ? hotelCubit.creditCardOptionsCustomer[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId! : hotelCubit.creditCardOptionsAgent[hotelCubit.binCodeIsHere!].paymentGroupItem![subIndex + 1].paymentItemId!} TRY)',
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
