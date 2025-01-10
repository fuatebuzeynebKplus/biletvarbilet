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
import 'package:bamobile1/views/other-views/sign_up_view.dart';

import 'package:bamobile1/views/other-views/tow_factor_login_view.dart';
import 'package:bamobile1/views/popup_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/check_box_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/text_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});
  static String id = 'SignInView';
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKeyForSignInAndroid = GlobalKey();
    GlobalKey<FormState> formKeyForSignInIos = GlobalKey();
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          SnackbarUtils.showSnackbar(context, state.errorMassage);
        } else if (state is SignInSuccuss) {
          // SnackbarUtils.showSnackbar(context, 'success');

          // BlocProvider.of<AuthCubit>(context).getUserProfile();
          Navigator.pushReplacementNamed(context, BottomNavBar.id);
          // Navigator.pushReplacementNamed(context, TowFactorLogin.id);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignInLoading,
            progressIndicator: const LoadingWidget(
              showImageLoading: false,
            ),
            child: Scaffold(
              backgroundColor: AppColors.kTest,
              body: Stack(
                children: [
                  ClipPath(
                    clipper: CustomClipPath(),
                    child: Container(
                      color: Colors.white,
                      height: context.height * 1,
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 56),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, BottomNavBar.id);
                            },
                            child: Icon(
                              Icons.close,
                              color: AppColors.kAppBarColor,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Platform.isAndroid
                          ? getIt<CacheHelper>()
                                      .getDataString(key: 'versionAndroid') ==
                                  BlocProvider.of<FirebaseCubit>(context)
                                      .versionAndroid
                              ? Center(
                                  child: Form(
                                    key: formKeyForSignInAndroid,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: context.height * 0.2,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Transform(
                                                  transform:
                                                      Matrix4.skewX(-0.15),
                                                  child: TextWidget(
                                                    text: 'bilet',
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.kAppBarColor,
                                                    fontFamily: 'Tajawal',
                                                  ),
                                                ),
                                                Transform(
                                                  transform:
                                                      Matrix4.skewX(-0.2),
                                                  child: TextWidget(
                                                    text: 'Var',
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.kSecondColor,
                                                    fontFamily: 'Tajawal',
                                                  ),
                                                ),
                                                Transform(
                                                  transform:
                                                      Matrix4.skewX(-0.15),
                                                  child: TextWidget(
                                                    text: 'bilet',
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.kAppBarColor,
                                                    fontFamily: 'Tajawal',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 10.0,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.white,
                                            ),
                                            padding: const EdgeInsets.all(20),
                                            height: context.height * 0.4,
                                            width: context.height * 0.4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  text: S.of(context).Login,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                TextFieldWidget(
                                                  hint: S.of(context).EMail,
                                                  icon: Icons.mail,
                                                  initialValue: getIt<
                                                              CacheHelper>()
                                                          .getDataString(
                                                              key: 'email') ??
                                                      '',
                                                  onChanged: (value) {
                                                    authCubit.email = value;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                TextFieldWidget(
                                                  initialValue: getIt<
                                                              CacheHelper>()
                                                          .getDataString(
                                                              key:
                                                                  'password') ??
                                                      '',
                                                  onChanged: (value) {
                                                    authCubit.password = value;
                                                  },
                                                  onTapSuffixIcon: () {
                                                    BlocProvider.of<AuthCubit>(
                                                            context)
                                                        .obscurePasswordText();
                                                  },
                                                  icon: Icons.lock,
                                                  colorSuffixIcon: Colors.grey,
                                                  suffixIcon: authCubit
                                                              .obscurePasswordTextValue ==
                                                          true
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  hint: S.of(context).Password,
                                                ),
                                                SizedBox(
                                                  height: context.height * 0.02,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Text(
                                                        S
                                                            .of(context)
                                                            .ForgotPassword,
                                                        style: TextStyle(
                                                            decorationColor:
                                                                AppColors
                                                                    .kSecondColor,
                                                            fontSize: 14,
                                                            color: AppColors
                                                                .kSecondColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: context.height * 0.02,
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    if (authCubit.email !=
                                                            null &&
                                                        authCubit.password !=
                                                            null) {
                                                      await authCubit.login(
                                                          context: context);
                                                      BlocProvider.of<
                                                                  CurrencyCodeCubit>(
                                                              context)
                                                          .saveTimeAndStartTimer();
                                                    }
                                                  },
                                                  child: Center(
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 36,
                                                          vertical: 12),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: AppColors
                                                            .kSecondColor,
                                                      ),
                                                      child: TextWidget(
                                                        text:
                                                            S.of(context).Login,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: context.height * 0.02,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            SignUpView.id);
                                                      },
                                                      child: Text(
                                                        S
                                                            .of(context)
                                                            .CreateAccount,
                                                        style: TextStyle(
                                                            decorationColor:
                                                                AppColors
                                                                    .kSecondColor,
                                                            fontSize: 14,
                                                            color: AppColors
                                                                .kSecondColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const UpdatePopup()
                          : getIt<CacheHelper>()
                                      .getDataString(key: 'versionIos') ==
                                  BlocProvider.of<FirebaseCubit>(context)
                                      .versionIos
                              ? Center(
                                  child: Form(
                                    key: formKeyForSignInIos,
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: context.height * 0.2,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Transform(
                                                  transform:
                                                      Matrix4.skewX(-0.15),
                                                  child: TextWidget(
                                                    text: 'bilet',
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.kAppBarColor,
                                                    fontFamily: 'Tajawal',
                                                  ),
                                                ),
                                                Transform(
                                                  transform:
                                                      Matrix4.skewX(-0.2),
                                                  child: TextWidget(
                                                    text: 'Var',
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.kSecondColor,
                                                    fontFamily: 'Tajawal',
                                                  ),
                                                ),
                                                Transform(
                                                  transform:
                                                      Matrix4.skewX(-0.15),
                                                  child: TextWidget(
                                                    text: 'bilet',
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        AppColors.kAppBarColor,
                                                    fontFamily: 'Tajawal',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Colors.black45,
                                                  offset:
                                                      Offset(0.0, 1.0), //(x,y)
                                                  blurRadius: 10.0,
                                                ),
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              color: Colors.white,
                                            ),
                                            padding: const EdgeInsets.all(20),
                                            height: context.height * 0.4,
                                            width: context.height * 0.4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  text: S.of(context).Login,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                TextFieldWidget(
                                                  hint: S.of(context).EMail,
                                                  icon: Icons.mail,
                                                  initialValue: getIt<
                                                              CacheHelper>()
                                                          .getDataString(
                                                              key: 'email') ??
                                                      '',
                                                  onChanged: (value) {
                                                    authCubit.email = value;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                TextFieldWidget(
                                                  initialValue: getIt<
                                                              CacheHelper>()
                                                          .getDataString(
                                                              key:
                                                                  'password') ??
                                                      '',
                                                  onChanged: (value) {
                                                    authCubit.password = value;
                                                  },
                                                  onTapSuffixIcon: () {
                                                    BlocProvider.of<AuthCubit>(
                                                            context)
                                                        .obscurePasswordText();
                                                  },
                                                  icon: Icons.lock,
                                                  colorSuffixIcon: Colors.grey,
                                                  suffixIcon: authCubit
                                                              .obscurePasswordTextValue ==
                                                          true
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  hint: S.of(context).Password,
                                                ),
                                                SizedBox(
                                                  height: context.height * 0.02,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {},
                                                      child: Text(
                                                        S
                                                            .of(context)
                                                            .ForgotPassword,
                                                        style: TextStyle(
                                                            decorationColor:
                                                                AppColors
                                                                    .kSecondColor,
                                                            fontSize: 14,
                                                            color: AppColors
                                                                .kSecondColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: context.height * 0.02,
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    if (authCubit.email !=
                                                            null &&
                                                        authCubit.password !=
                                                            null) {
                                                      await authCubit.login(
                                                          context: context);
                                                      BlocProvider.of<
                                                                  CurrencyCodeCubit>(
                                                              context)
                                                          .saveTimeAndStartTimer();
                                                    }
                                                  },
                                                  child: Center(
                                                    child: Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 36,
                                                          vertical: 12),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: AppColors
                                                            .kSecondColor,
                                                      ),
                                                      child: TextWidget(
                                                        text:
                                                            S.of(context).Login,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: context.height * 0.02,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            SignUpView.id);
                                                      },
                                                      child: Text(
                                                        S
                                                            .of(context)
                                                            .CreateAccount,
                                                        style: TextStyle(
                                                            decorationColor:
                                                                AppColors
                                                                    .kSecondColor,
                                                            fontSize: 14,
                                                            color: AppColors
                                                                .kSecondColor),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const UpdatePopup(),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
