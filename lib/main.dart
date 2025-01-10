import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/firabase-cubit/firebase_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/cubit/settings-app/settings_cubit.dart';
import 'package:bamobile1/cubit/swiper-cubit/swiper_cubit.dart';
import 'package:bamobile1/firebase_options.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/helper/routes.dart';
import 'package:bamobile1/helper/shared-preferences/shared_preferences_funs.dart';

import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/other-views/sign_up_view.dart';

import 'package:bamobile1/views/other-views/tow_factor_login_view.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/views/other-views/splash_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();
  await getIt<CacheHelper>().init();
  saveVersionAndroid('1.0.0');
  saveVersionIos('1.0.0');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const MyApp(), // Wrap your app
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CurrencyCodeCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => FlightTicketCubit(),
        ),
        BlocProvider(
          create: (context) => SettingsAppCubit(),
        ),
        BlocProvider(
          create: (context) => HotelCubit(),
        ),
        BlocProvider(create: (context) => SwiperCubit()),
        BlocProvider(create: (context) => FirebaseCubit()),
      ],
      child: BlocBuilder<SettingsAppCubit, SettingsAppState>(
        builder: (context, state) {
          print('height: ${context.height}');
          print('width: ${context.width}');
          return ScreenUtilInit(
            designSize: const Size(392.73, 825.45), // أبعاد شاشة التصميم
            minTextAdapt: true,
            splitScreenMode: true,
            child: MaterialApp(
              //  useInheritedMediaQuery: true,
              // locale: DevicePreview.locale(context),
              //  builder: DevicePreview.appBuilder,
              theme: ThemeData(
                  datePickerTheme: DatePickerThemeData(
                rangeSelectionBackgroundColor:
                    AppColors.kPastelFromSecondColorOne,
              )),
              locale: Locale(BlocProvider.of<SettingsAppCubit>(context).locale),
              localizationsDelegates: const [
                AppLocalizationDelegate(),
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              routes: routes,
              initialRoute: SplashView.id,
              //home: const SignUpView(),
            ),
          );
        },
      ),
    );
  }
}
