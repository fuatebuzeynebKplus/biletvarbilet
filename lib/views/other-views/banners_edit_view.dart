import 'dart:io';

import 'package:bamobile1/cubit/swiper-cubit/swiper_cubit.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/pick_image_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:uuid/uuid.dart';

class BannersEditView extends StatelessWidget {
  const BannersEditView({super.key});
  static String id = 'BannersEditView';

  @override
  Widget build(BuildContext context) {
    SwiperCubit swiperCubit = BlocProvider.of<SwiperCubit>(context);

    return SafeArea(
      child: BlocConsumer<SwiperCubit, SwiperState>(
        listener: (context, state) {
          if (state is UpdateOrDeleteImageSuccess) {
            SnackbarUtils.showSnackbar(context, 'Success');
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
                  title: 'banner Düzenleme Sayfası',
                ),
                backgroundColor: Colors.black,
              ),
              backgroundColor: Colors.grey.shade200,
              body: ModalProgressHUD(
                  inAsyncCall: state is UpdateOrDeleteImageLoading,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: state is UpdateOrDeleteImageFailure
                        ? const Text('Error')
                        : Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  swiperCubit
                                              .swiperModelList[
                                                  swiperCubit.saveIndexVale!]
                                              .image ==
                                          null
                                      ? PickImageWidget(
                                          function: () {
                                            swiperCubit
                                                .localImagePicker(context);
                                          },
                                          pickedImage: swiperCubit.pickImage)
                                      : Stack(
                                          children: [
                                            Image.network(swiperCubit
                                                .swiperModelList[
                                                    swiperCubit.saveIndexVale!]
                                                .image
                                                .toString()),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                color: Colors.red,
                                                child: InkWell(
                                                  splashColor: Colors.red,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                  onTap: () {
                                                    swiperCubit
                                                        .makeBannerImageNull();
                                                  },
                                                  child: const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Icon(
                                                      Icons.delete,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ButtonWidget(
                                        height: 0.06,
                                        width: 0.4,
                                        color: Colors.red,
                                        onTap: () {
                                          print('delete');
                                          swiperCubit.deleteBannerImage(
                                              swiperCubit
                                                  .swiperModelList[swiperCubit
                                                      .saveIndexVale!]
                                                  .url!);
                                        },
                                        title: 'Sil',
                                        fontSize: 14,
                                        textColor: Colors.white,
                                      ),
                                      ButtonWidget(
                                        height: 0.06,
                                        width: 0.4,
                                        color: Colors.green,
                                        onTap: () {
                                          swiperCubit.updateBannerImages(
                                            bannerUrl: swiperCubit
                                                    .newBannerUrl ??
                                                swiperCubit
                                                    .swiperModelList[swiperCubit
                                                        .saveIndexVale!]
                                                    .url,
                                            bannerImage: swiperCubit
                                                        .swiperModelList[
                                                            swiperCubit
                                                                .saveIndexVale!]
                                                        .image !=
                                                    null
                                                ? XFile(swiperCubit
                                                    .swiperModelList[swiperCubit
                                                        .saveIndexVale!]
                                                    .image!)
                                                : swiperCubit.pickImage,
                                          );
                                        },
                                        title: 'Kaydet',
                                        fontSize: 14,
                                        textColor: Colors.white,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                  )));
        },
      ),
    );
  }
}
