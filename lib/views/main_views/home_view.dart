import 'dart:math';

import 'package:bamobile1/cubit/swiper-cubit/swiper_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/views/main_views/banners_view.dart';
import 'package:bamobile1/widgets/alert_dialog_widget.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/drawer_widget.dart';
import 'package:bamobile1/widgets/home-widgets/home_body_widget.dart';

import 'package:bamobile1/widgets/home-widgets/home_slider_widget.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  @override
  Widget build(BuildContext context) {
    var swiperList = BlocProvider.of<SwiperCubit>(context).swiperModelList;

    if (swiperList.isEmpty) {
      return const Center(child: Text('No data available'));
    }

    int randomIndex = Random().nextInt(swiperList.length);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialogWidget(
                  isHaveBorder: false,
                  heightTest: 0.13,
                  widthTest: 1,
                  widget: Column(
                    children: [
                      TextWidget(
                        textAlign: TextAlign.left,
                        text: S.of(context).AppCloseMessage,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: TextWidget(
                              color: AppColors.kSecondColor,
                              text: S.of(context).Cancel,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              SystemNavigator.pop();
                            },
                            child: TextWidget(
                              color: AppColors.kSecondColor,
                              text: S.of(context).Yes,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ));
            });
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                transform: Matrix4.skewX(-0.15),
                child: const TextWidget(
                  text: 'bilet',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Tajawal',
                ),
              ),
              Transform(
                transform: Matrix4.skewX(-0.2),
                child: TextWidget(
                  text: 'Var',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.kSecondColor,
                  fontFamily: 'Tajawal',
                ),
              ),
              Transform(
                transform: Matrix4.skewX(-0.15),
                child: const TextWidget(
                  text: 'bilet',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Tajawal',
                ),
              ),
            ],
          ),
          backgroundColor: AppColors.kAppBarColor,
        ),
        //drawer: const DrawerWidget(),
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 14, left: 14, top: 12),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: BlocProvider.of<SwiperCubit>(context)
                          .swiperModelList[randomIndex]
                          .image
                          .toString(),
                      width: context.width * 0.9,
                      height: context.height * 0.25,
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/no_Image.png',
                        width: context.width * 0.9,
                        height: context.height * 0.25,
                      ),
                    ),
                    //     HomeSliderWidget(),
                    const SizedBox(
                      height: 12,
                    ),
                    const HomeBodyWidget()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
