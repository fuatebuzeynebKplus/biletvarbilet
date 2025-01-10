import 'package:bamobile1/cubit/swiper-cubit/swiper_cubit.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

class HomeSliderWidget extends StatelessWidget {
  const HomeSliderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwiperCubit, SwiperState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          height: context.height * 0.2,
          //   width: size.width * 0.9,
          child: Swiper(
            viewportFraction: 0.8,
            scale: 0.9,
            // pagination: SwiperPagination(
            //   alignment: Alignment.bottomCenter,
            //   builder: DotSwiperPaginationBuilder(
            //     color: Colors.grey,
            //     activeColor: AppColors.kMainColor,
            //   ),
            // ),
            duration: 3000,
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // launchUrl(Uri.parse(
                  //   BlocProvider.of<SwiperCubit>(context)
                  //       .swiperModelList[index]
                  //       .url,
                  // ));
                },
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: BlocProvider.of<SwiperCubit>(context)
                      .swiperModelList[index]
                      .image
                      .toString(),
                ),
              );
            },
            itemCount:
                BlocProvider.of<SwiperCubit>(context).swiperModelList.length,
          ),
        );
      },
    );
  }
}
