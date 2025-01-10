import 'dart:io';

import 'package:bamobile1/cubit/swiper-cubit/swiper_cubit.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/pick_image_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:uuid/uuid.dart';

class BannersAddView extends StatelessWidget {
  const BannersAddView({super.key});
  static String id = 'BannersAddView';

  @override
  Widget build(BuildContext context) {
    SwiperCubit swiperCubit = BlocProvider.of<SwiperCubit>(context);

    return SafeArea(
      child: BlocConsumer<SwiperCubit, SwiperState>(
        listener: (context, state) {
          if (state is AddImageSuccess) {
            SnackbarUtils.showSnackbar(context, 'Banner Image added');
            Navigator.pop(context);
            swiperCubit.getImagesData();
          }
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                toolbarHeight: context.height * 0.06,
                automaticallyImplyLeading: false,
                title: AppBarWidget(
                  onPressedLeading: () {
                    Navigator.pop(context);
                  },
                  title: 'Banner Ekleme Sayfası',
                ),
                backgroundColor: AppColors.kAppBarColor,
              ),
              backgroundColor: Colors.grey.shade200,
              body: ModalProgressHUD(
                inAsyncCall: state is AddImageLoading,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: state is AddImageFailure
                      ? const Text('Error')
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 100,
                                ),
                                PickImageWidget(
                                    function: () {
                                      swiperCubit.localImagePicker(context);
                                    },
                                    pickedImage: swiperCubit.pickImage),
                                const SizedBox(
                                  height: 20,
                                ),
                                ButtonWidget(
                                  color: AppColors.kSecondColor,
                                  height: 0.06,
                                  width: 0.8,
                                  onTap: () {
                                    swiperCubit.addImage();
                                  },
                                  title: 'Ekle',
                                  fontSize: 18,
                                  textColor: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ));
        },
      ),
    );
  }
}
