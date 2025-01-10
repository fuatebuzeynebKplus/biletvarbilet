import 'dart:io';
import 'dart:math';

import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/firabase-cubit/firebase_cubit.dart';
import 'package:bamobile1/cubit/settings-app/settings_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/custom_clip_path.dart';
import 'package:bamobile1/bottom_nav_bar.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/views/other-views/sign_in_view.dart';

import 'package:bamobile1/views/other-views/tow_factor_login_view.dart';
import 'package:bamobile1/views/popup_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/check_box_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/bottom-sheet/select_birthday_bottom_sheet.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-data_enter-widgets/bottom-sheet/select_birthday_bottom_sheet_for_signup.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-details-widgets/select_phone_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/text_widget.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static String id = 'SignUpView';
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKeyForSignUp = GlobalKey();
    // BlocProvider.of<CurrencyCodeCubit>(context).fetchCurrencyData();
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.selectBetweenTwoTextValue = S.of(context).Man;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          SnackbarUtils.showSnackbar(context, state.errorMassage);
        } else if (state is SignUpSuccuss) {
          // SnackbarUtils.showSnackbar(context, 'success');

          // BlocProvider.of<AuthCubit>(context).getUserProfile();
          Navigator.pushNamed(context, BottomNavBar.id);
          // Navigator.pushReplacementNamed(context, TowFactorLogin.id);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading,
          progressIndicator: const LoadingWidget(
            showImageLoading: false,
          ),
          child: Scaffold(
            bottomSheet: authCubit.isShowSelectDate == true
                ? const SelectBirthdayBottomSheetSignUp()
                : null,
            backgroundColor: AppColors.kTest,
            body: Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    color: Colors.white,
                    height: context.height * 1,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: Center(
                      child: Form(
                        key: formKeyForSignUp,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, SignInView.id);
                                      },
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        size: 30,
                                        color: AppColors.kAppBarColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: context.height * 0.1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Transform(
                                      transform: Matrix4.skewX(-0.15),
                                      child: TextWidget(
                                        text: 'bilet',
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.kAppBarColor,
                                        fontFamily: 'Tajawal',
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.skewX(-0.2),
                                      child: TextWidget(
                                        text: 'Var',
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.kSecondColor,
                                        fontFamily: 'Tajawal',
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.skewX(-0.15),
                                      child: TextWidget(
                                        text: 'bilet',
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.kAppBarColor,
                                        fontFamily: 'Tajawal',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.all(20),
                                height: context.height * 0.71,
                                width: context.width * 0.9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text: S.of(context).CreateAccount,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFieldWidget(
                                      hint: S.of(context).Name,
                                      onChanged: (value) {
                                        authCubit.firstName = value;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFieldWidget(
                                      hint: S.of(context).LastName,
                                      onChanged: (value) {
                                        authCubit.lastName = value;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFieldWidget(
                                      hint: S.of(context).EMail,
                                      onChanged: (value) {
                                        authCubit.email = value;
                                      },
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    TextFieldWidget(
                                      onChanged: (value) {
                                        // RegExp to validate the password
                                        final passwordRegex = RegExp(
                                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$',
                                        );

                                        if (passwordRegex.hasMatch(value)) {
                                          // Password is valid
                                          authCubit.password = value;
                                          authCubit.isPasswordValid = true;
                                        } else {
                                          authCubit.isPasswordValid = false;
                                        }
                                      },
                                      onTapSuffixIcon: () {
                                        BlocProvider.of<AuthCubit>(context)
                                            .obscurePasswordText();
                                      },
                                      icon: Icons.lock,
                                      colorSuffixIcon: Colors.grey,
                                      suffixIcon:
                                          authCubit.obscurePasswordTextValue ==
                                                  true
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                      hint: S.of(context).Password,
                                    ),

                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      width: context.width * 1,
                                      height: context.height * 0.05,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: Colors.grey.shade200,
                                      ),
                                      child: SizedBox(
                                        //height: context.height * 0.05,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ButtonWidget(
                                              borderCircularValue: 14,
                                              title: S.of(context).Man,
                                              height: context.height * 0.049,
                                              width: 0.38,
                                              fontSize: 14,
                                              textColor: Colors.black,
                                              color: authCubit
                                                          .selectBetweenTwoTextValue ==
                                                      S.of(context).Man
                                                  ? Colors.white
                                                  : Colors.grey.shade200,
                                              border: authCubit
                                                          .selectBetweenTwoTextValue ==
                                                      S.of(context).Man
                                                  ? Border.all(
                                                      color: AppColors
                                                          .kSecondColor)
                                                  : null,
                                              onTap: () {
                                                if (authCubit
                                                        .selectBetweenTwoTextValue !=
                                                    S.of(context).Man) {
                                                  authCubit
                                                      .selectBetweenTwoTextFunction(
                                                          firstText:
                                                              S.of(context).Man,
                                                          secondText: S
                                                              .of(context)
                                                              .Woman);
                                                }
                                              },
                                            ),
                                            ButtonWidget(
                                              borderCircularValue: 14,
                                              title: S.of(context).Woman,
                                              height: context.height * 0.049,
                                              width: 0.38,
                                              fontSize: 14,
                                              textColor: Colors.black,
                                              color: authCubit
                                                          .selectBetweenTwoTextValue ==
                                                      S.of(context).Woman
                                                  ? Colors.white
                                                  : Colors.grey.shade200,
                                              border: authCubit
                                                          .selectBetweenTwoTextValue ==
                                                      S.of(context).Woman
                                                  ? Border.all(
                                                      color: AppColors
                                                          .kSecondColor)
                                                  : null,
                                              onTap: () {
                                                if (authCubit
                                                        .selectBetweenTwoTextValue !=
                                                    S.of(context).Woman) {
                                                  authCubit
                                                      .selectBetweenTwoTextFunction(
                                                          firstText:
                                                              S.of(context).Man,
                                                          secondText: S
                                                              .of(context)
                                                              .Woman);
                                                }
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: context.height * 0.023,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        authCubit.showSelectDate(value: true);
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextWidget(
                                                text:
                                                    //  flightTicketCubit.cardDataList[index] == null
                                                    //     ? flightTicketCubit.birthday == null
                                                    //         ? S.of(context).BirthDay
                                                    //         : DateFormat('dd/MM/yyy')
                                                    //             .format(flightTicketCubit.birthday!)
                                                    //     : DateFormat('dd/MM/yyy').format(flightTicketCubit
                                                    //         .cardDataList[index]!.birthday!),
                                                    authCubit.birthday != null
                                                        ? DateFormat(
                                                                'MM.dd.yyyy')
                                                            .format(authCubit
                                                                .birthday!)
                                                        : S
                                                            .of(context)
                                                            .BirthDay,
                                                color: Colors.black38,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                            const Divider(
                                              color: Colors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        CountryCodePicker(
                                          padding: const EdgeInsets.all(0),
                                          onChanged: (c) {
                                            authCubit.countryPhone = c.dialCode;
                                          },
                                          initialSelection: 'TR',
                                          showCountryOnly: false,
                                          showOnlyCountryWhenClosed: false,
                                          favorite: const ['CA', 'TR'],
                                        ),
                                        Expanded(
                                          child: TextFieldWidget(
                                            textInputType: TextInputType.phone,
                                            hint: S.of(context).PhoneNumber,
                                            onChanged: (value) {
                                              authCubit.phone = value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: context.height * 0.01,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.end,
                                    //   children: [
                                    //     TextWidget(
                                    //       fontSize: 13,
                                    //       text: S.of(context).ForgetPassword,
                                    //       color: AppColors.kSecondColor,
                                    //     )
                                    //   ],
                                    // ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CheckBoxWidget(
                                          value: BlocProvider.of<AuthCubit>(
                                                  context)
                                              .termsAndConditionCheckBoxValue,
                                          onChanged: (value) {
                                            BlocProvider.of<AuthCubit>(context)
                                                .updateTermsAndConditionCheckBoxInLoginView(
                                                    newValue: value);
                                          },
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            launchUrl(Uri.parse(
                                                'https://www.bookingagora.com/Page/kvkk--kisisel-verilerin-korunmasi-ve-islenmesi-hakkinda-aydinlatma-metni'));
                                          },
                                          child: Text(
                                            S.of(context).TermsAndCondition,
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor:
                                                    AppColors.kSecondColor,
                                                fontSize: 12,
                                                color: AppColors.kSecondColor),
                                          ),
                                        ),
                                        SizedBox(
                                          width: context.width * 0.01,
                                        ),
                                        TextWidget(
                                          text: S.of(context).IHaveAgreeToOur,
                                          fontSize: 12,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(
                                    //   height: context.height * 0.002,
                                    // ),
                                    // GestureDetector(
                                    //   onTap: () {},
                                    //   child: Text(
                                    //     S.of(context).TermsAndCondition,
                                    //     style: TextStyle(
                                    //         decorationColor:
                                    //             AppColors.kSecondColor,
                                    //         fontSize: 12,
                                    //         color: AppColors.kSecondColor),
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: context.height * 0.02,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        if (authCubit
                                                .termsAndConditionCheckBoxValue ==
                                            false) {
                                          SnackbarUtils.showSnackbar(
                                              context,
                                              S
                                                  .of(context)
                                                  .YouCannotLogInWithoutAcceptingTheTerms,
                                              2);
                                        } else {
                                          if (authCubit.isPasswordValid ==
                                              false) {
                                            String message =
                                                '${S.of(context).passwordCriteria}\n'
                                                '* ${S.of(context).minLength}\n'
                                                '* ${S.of(context).upperCase}\n'
                                                '* ${S.of(context).lowerCase}\n'
                                                '* ${S.of(context).number}\n'
                                                '* ${S.of(context).specialChar}';
                                            SnackbarUtils.showSnackbar(
                                                context, message);
                                          } else if (authCubit.email == null ||
                                              authCubit.password == null ||
                                              authCubit.firstName == null ||
                                              authCubit.lastName == null ||
                                              authCubit.birthday == null ||
                                              authCubit.phone == null) {
                                            SnackbarUtils.showSnackbar(
                                                context,
                                                S
                                                    .of(context)
                                                    .pleaseFillAllFields);
                                          } else {
                                            await authCubit.customerRegister(
                                                context: context);

                                            // BlocProvider.of<CurrencyCodeCubit>(
                                            //         context)
                                            //     .saveTimeAndStartTimer();
                                          }
                                        }
                                      },
                                      child: Center(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 36, vertical: 12),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: AppColors.kSecondColor,
                                          ),
                                          child: TextWidget(
                                            text: S.of(context).CompleteSignUp,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
