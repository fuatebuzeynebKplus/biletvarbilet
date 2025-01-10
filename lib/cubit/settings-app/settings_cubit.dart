import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/helper/shared-preferences/shared_preferences_funs.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:otp/otp.dart';

part 'settings_state.dart';

class SettingsAppCubit extends Cubit<SettingsAppState> {
  SettingsAppCubit() : super(SettingsAppInitial());

  String locale = getIt<CacheHelper>().getDataString(key: 'Lang') ?? 'tr';

  void selectLanguageFunction({required String value}) {
    if (value == 'tr') {
      locale = 'tr';
      langFun('tr');
    } else if (value == 'en') {
      locale = 'en';
      langFun('en');
    } else if (value == 'ar') {
      locale = 'ar';
      langFun('ar');
    }
    emit(SelectLanguagesState());
  }

  // String secretKey = OTP.randomSecret();
  // void pp() {
  //   print('secretKey: $secretKey');
  // }

  bool isValidOtp(String secretKey, String userEnteredOtp) {
    final currentTime = DateTime.now().millisecondsSinceEpoch;

    final generatedOtp = OTP.generateTOTPCodeString(
      secretKey,
      currentTime,
      algorithm: Algorithm.SHA1,
      isGoogle: true,
      length: 6,
      interval: 30,
    );

    return userEnteredOtp == generatedOtp;
  }
}
