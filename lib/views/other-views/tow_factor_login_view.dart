import 'package:bamobile1/bottom_nav_bar.dart';
import 'package:bamobile1/cubit/settings-app/settings_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/other-views/sign_in_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:bamobile1/helper/functions.dart';

class TowFactorLogin extends StatelessWidget {
  const TowFactorLogin({
    super.key,
  });
  static String id = 'TowFactorLogin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: context.height * 0.06,
        automaticallyImplyLeading: false,
        title: AppBarWidget(
          onPressedLeading: () {
            Navigator.pushNamed(context, SignInView.id);
          },
          title: 'kimlik dogrulama',
          leading: Icons.arrow_back_ios,
        ),
        backgroundColor: AppColors.kAppBarColor,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Google Authenticator kodunu giriniz',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            OtpTextField(
              numberOfFields: 6,
              borderColor: AppColors.kSecondColor,
              showFieldAsBox: true,
              onSubmit: (String verificationCode) {
                bool isValid = BlocProvider.of<SettingsAppCubit>(context)
                    .isValidOtp(
                        getIt<CacheHelper>().getDataString(key: 'OtpKey')!,
                        verificationCode);
                if (isValid) {
                  // ScaffoldMessenger.of(context).showSnackBar(
                  //   const SnackBar(content: Text('OTP is valid!')),
                  // );
                  Navigator.pushNamed(context, BottomNavBar.id);
                } else {
                  SnackbarUtils.showSnackbar(
                      context, S.of(context).InvalidCodePleaseTryAgain, 2);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
