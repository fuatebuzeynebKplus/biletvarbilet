import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/edit-images-package/image_group_widget.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelCardDetailsImagesWidget extends StatelessWidget {
  const HotelCardDetailsImagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    List<String>? imageUrls = [];
    List<String>? imageTitle = [];

    for (var item in hotelCubit.hotelDetailsValue!.hotelImages) {
      imageUrls.add(item.imageUrl!);
      imageTitle.add(item.imageTitle ?? '');
    }
    // List<String> imageUrls = [
    //   "https://media.istockphoto.com/photos/colorful-sunset-at-davis-lake-picture-id1184692500?k=20&m=1184692500&s=612x612&w=0&h=7noTRS8UjiAVKU92eIhPG17PIWVh-kCmH5jKX5GOcdQ=",
    //   "https://images.unsplash.com/photo-1573155993874-d5d48af862ba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGFya3xlbnwwfHwwfHw%3D&w=1000&q=80",
    //   "https://images.pexels.com/photos/158028/bellingrath-gardens-alabama-landscape-scenic-158028.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    //   "https://images.pexels.com/photos/158028/bellingrath-gardens-alabama-landscape-scenic-158028.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    //   "https://images.pexels.com/photos/158028/bellingrath-gardens-alabama-landscape-scenic-158028.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
    // ];
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
            height: context.height * 0.35,
            width: context.width * 1,
            padding: const EdgeInsets.only(left: 10, right: 10),
            color: Colors.white,
            child: ImageGroupWidget(
              imageUrls: imageUrls ?? [],
              titles: imageTitle ?? [],
              marginLeft: 10.0,
              marginRight: 10.0,
              marginBottom: 10.0,
              marginTop: 10.0,
            ));
      },
    );
  }
}


















// import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
// import 'package:bamobile1/utils/app_sizes.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:multi_image_layout/multi_image_layout.dart';

// class HotelCardDetailsImagesWidget extends StatelessWidget {
//   const HotelCardDetailsImagesWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
//     List<ImageModel> imageUrls = [];

//     for (var item in hotelCubit.hotelDetailsValue!.hotelImages) {
//       imageUrls
//           .add(ImageModel(imageUrl: item.imageUrl!, caption: item.imageTitle!));
//     }

//     return BlocConsumer<HotelCubit, HotelState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Container(
//           height: context.height * 0.35,
//           width: context.width * 1,
//           padding: const EdgeInsets.only(left: 10, right: 10),
//           color: Colors.white,
//           child: MultiImageViewer(images: imageUrls),
//         );
//       },
//     );
//   }
// }
