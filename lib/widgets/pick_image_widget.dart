import 'dart:io';
import 'package:bamobile1/cubit/swiper-cubit/swiper_cubit.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PickImageWidget extends StatelessWidget {
  const PickImageWidget({super.key, this.pickedImage, required this.function});
  final XFile? pickedImage;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SwiperCubit, SwiperState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: pickedImage == null
                    ? Container(
                        height: context.height * 0.28,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(),
                        ),
                      )
                    : Image.file(
                        height: context.height * 0.28,
                        //  width: 400,
                        File(
                          pickedImage!.path,
                        ),
                      ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Material(
                borderRadius: BorderRadius.circular(0),
                color: Colors.lightBlue,
                child: InkWell(
                  splashColor: Colors.red,
                  borderRadius: BorderRadius.circular(16.0),
                  onTap: () {
                    function();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.add_a_photo,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
