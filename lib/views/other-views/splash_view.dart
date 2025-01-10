import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bamobile1/bottom_nav_bar.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'dart:async';
import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/firabase-cubit/firebase_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/swiper-cubit/swiper_cubit.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/helper/shared-preferences/shared_preferences_funs.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/other-views/sign_in_view.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String id = 'SplashView';
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).createToken(context: context);
    BlocProvider.of<FirebaseCubit>(context).getVersionData();
    BlocProvider.of<SwiperCubit>(context).getImagesData();

    //  BlocProvider.of<FlightTicketCubit>(context).fetchCityAndAirportData();
    BlocProvider.of<FirebaseCubit>(context).getAdminEmailsData(context);

    if (getIt<CacheHelper>().getDataString(key: 'Lang') == null) {
      langFun('tr');
    } else {}
    return AnimatedSplashScreen(
      splash: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform(
            transform: Matrix4.skewX(-0.15),
            child: TextWidget(
              text: 'bilet',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.kAppBarColor,
              fontFamily: 'Tajawal',
            ),
          ),
          Transform(
            transform: Matrix4.skewX(-0.2),
            child: TextWidget(
              text: 'Var',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.kSecondColor,
              fontFamily: 'Tajawal',
            ),
          ),
          Transform(
            transform: Matrix4.skewX(-0.15),
            child: TextWidget(
              text: 'bilet',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: AppColors.kAppBarColor,
              fontFamily: 'Tajawal',
            ),
          ),
        ],
      ),
      nextScreen: const BottomNavBar(),
      splashTransition: SplashTransition.slideTransition,
    );
  }
}

// import 'dart:async';
// import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
// import 'package:bamobile1/cubit/firabase-cubit/firebase_cubit.dart';
// import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
// import 'package:bamobile1/cubit/swiper-cubit/swiper_cubit.dart';
// import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
// import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
// import 'package:bamobile1/helper/shared-preferences/shared_preferences_funs.dart';
// import 'package:bamobile1/utils/app_colors.dart';
// import 'package:bamobile1/utils/app_sizes.dart';
// import 'package:bamobile1/views/other-views/sign_in_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({super.key});
//   static String id = 'SplashView';
//   @override
//   State<SplashView> createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView>
//     with SingleTickerProviderStateMixin {
//   double ballY = 0;
//   double widthVal = 50;
//   double heightVal = 50;
//   double bottomVal = 500;
//   bool add = false;
//   bool showShadow = false;
//   int times = 0;
//   bool showComic = false;

//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller =
//         AnimationController(vsync: this, duration: const Duration(seconds: 1))
//           ..addListener(() {
//             if (add) {
//               ballY += 15;
//             } else {
//               ballY -= 15;
//             }
//             if (ballY <= -200) {
//               times += 1;
//               add = true;
//               showShadow = true;
//             }
//             if (ballY >= 0) {
//               add = false;
//               showShadow = false;
//               widthVal += 50;
//               heightVal += 50;
//               bottomVal -= 200;
//             }
//             if (times == 3) {
//               showShadow = false;
//               widthVal = MediaQuery.of(context).size.width;
//               heightVal = MediaQuery.of(context).size.height;
//               Timer(const Duration(milliseconds: 300), () {
//                 setState(() {
//                   showComic = true;
//                 });
//               });
//               _controller.stop();

//               Future.delayed(const Duration(seconds: 1), () {
//                 Navigator.pushReplacementNamed(context, SignInView.id);
//               });
//             }
//             setState(() {});
//           });
//     _controller.repeat();
//     BlocProvider.of<AuthCubit>(context).createToken();
//     BlocProvider.of<FirebaseCubit>(context).getVersionData();
//     BlocProvider.of<SwiperCubit>(context).getImagesData();
//     //  BlocProvider.of<FlightTicketCubit>(context).fetchCityAndAirportData();
//     BlocProvider.of<FirebaseCubit>(context).getAdminEmailsData(context);

//     if (getIt<CacheHelper>().getDataString(key: 'Lang') == null) {
//       langFun('ar');
//     } else {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.kSecondColor,
//       body: SizedBox(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Stack(
//           alignment: Alignment.center,
//           children: [
//             AnimatedPositioned(
//               bottom: bottomVal,
//               duration: const Duration(milliseconds: 600),
//               child: Column(
//                 children: [
//                   Transform.translate(
//                     offset: Offset(0, ballY),
//                     child: AnimatedScale(
//                       duration: const Duration(milliseconds: 200),
//                       scale: times == 3 ? 5 : 1,
//                       child: AnimatedContainer(
//                         duration: const Duration(milliseconds: 1000),
//                         width: widthVal,
//                         height: heightVal,
//                         decoration: const BoxDecoration(
//                           shape: BoxShape.circle,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   if (showShadow)
//                     Container(
//                       width: 50,
//                       height: 10,
//                       decoration: BoxDecoration(
//                           color: Colors.grey.shade800,
//                           borderRadius: BorderRadius.circular(100)),
//                     )
//                 ],
//               ),
//             ),
//             if (showComic)
//               Positioned(
//                 child: Column(mainAxisSize: MainAxisSize.min, children: [
//                   Image.asset(
//                     'assets/images/icon_logo.png',
//                     width: context.width * 0.8,
//                     height: context.height * 0.4,
//                   )
//                 ]),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
