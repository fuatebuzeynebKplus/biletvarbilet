import 'dart:math';

import 'package:bamobile1/cubit/swiper-cubit/swiper_cubit.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/alert_dialog_widget.dart';
import 'package:bamobile1/widgets/home-widgets/home_slider_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.showImageLoading = true});
  final bool showImageLoading;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialogWidget(
            color: Colors.white,
            heightTest: 0.2,
            widthTest: 0.2,
            widget: Container(
              width: context.width * 0.15,
              height: context.width * 0.15,
              alignment: Alignment.center, // التوسيط
              child: CircularProgressIndicator(
                color: AppColors.kSecondColor,
              ),
            )),
        SizedBox(
          height: context.height * 0.03,
        ),
        // CachedNetworkImage(
        //   fit: BoxFit.cover,
        //   imageUrl: BlocProvider.of<SwiperCubit>(context)
        //       .swiperModelList[0]
        //       .image
        //       .toString(),
        // ),
        showImageLoading == true ? const HomeSliderWidget() : const SizedBox(),
      ],
    );
  }
}
