import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';

import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TitleForHotelCardWidget extends StatelessWidget {
  const TitleForHotelCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return SizedBox(
      height: context.height * 0.12,
      width: context.width * 1,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: context.height * 0.1,
              width: context.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                image: DecorationImage(
                  image: NetworkImage(
                      '${hotelCubit.hotelSearchResults[hotelCubit.hotelIndex!].hotel!.hotelImageUrl} '),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    text:
                        '${hotelCubit.hotelSearchResults[hotelCubit.hotelIndex!].hotel!.hotelName}',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    isHaveOverflow: true,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Wrap(
                    children: List.generate(
                        hotelCubit.hotelSearchResults[hotelCubit.hotelIndex!]
                            .hotel!.star!, (index) {
                      return Icon(Icons.star,
                          color: AppColors.kSecondColor, size: 16);
                    }),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextWidget(
                    text:
                        '${hotelCubit.hotelSearchResults[hotelCubit.hotelIndex!].hotel!.address}',
                    fontSize: 10,
                    color: Colors.black45,
                    isHaveOverflow: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
