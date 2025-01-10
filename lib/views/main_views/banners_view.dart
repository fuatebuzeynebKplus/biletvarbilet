import 'dart:io';
import 'package:bamobile1/cubit/swiper-cubit/swiper_cubit.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/other-views/banners_add_view.dart';
import 'package:bamobile1/views/other-views/banners_edit_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uuid/uuid.dart';

class BannersView extends StatelessWidget {
  const BannersView({super.key});
  static String id = 'BannersView';

  @override
  Widget build(BuildContext context) {
    SwiperCubit swiperCubit = BlocProvider.of<SwiperCubit>(context);

    swiperCubit.getImagesData();

    return BlocConsumer<SwiperCubit, SwiperState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: Image.asset(
                AppImages.logo,
                height: context.height * 0.06,
                width: context.height * 0.24,
              ),
            ),
            backgroundColor: AppColors.kAppBarColor,
          ),
          backgroundColor: Colors.grey.shade200,
          body: BlocConsumer<SwiperCubit, SwiperState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    ButtonWidget(
                      color: AppColors.kSecondColor,
                      height: 0.06,
                      width: 1,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BannersAddView()),
                        );
                      },
                      title: 'Add Image Banner',
                      fontSize: 16,
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    state is SwiperLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : state is SwiperFailure
                            ? const Center(
                                child: Text('Error'),
                              )
                            : Expanded(
                                // height: 300,
                                // width: context.width * 0.9,
                                child: ListView.builder(
                                itemCount: swiperCubit.swiperModelList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      swiperCubit.saveIndex(index: index);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const BannersEditView()),
                                      );
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(swiperCubit
                                                    .swiperModelList[index]
                                                    .image ??
                                                ''),
                                          ),
                                        ),
                                        height: context.height * 0.26,
                                      ),
                                    ),
                                  );
                                },
                              ))
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
