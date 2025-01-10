import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelSelectNationalityWidget extends StatelessWidget {
  const HotelSelectNationalityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
        return Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          height: context.height * 0.09,
          width: context.width * 0.46,
          child:
              //  hotelCubit.isClickToNationality == false
              //     ? Row(
              //         children: [
              //           Image.asset(
              //             AppImages.earthIcon,
              //             height: 35,
              //             width: 35,
              //             color: AppColors.kSecondColor,
              //           ),
              //           const SizedBox(
              //             width: 12,
              //           ),
              //           const TextWidget(
              //             text: 'Uyruk',
              //             fontSize: 16,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ],
              //       )
              //     :
              CountryCodePicker(
            padding: const EdgeInsets.all(0),
            onChanged: (c) {
              hotelCubit.nationality = c.code;
            },
            initialSelection: 'TR',
            showCountryOnly: true,
            showOnlyCountryWhenClosed: true,
            favorite: const ['CA', 'TR'],
          ),
        );
      },
    );
  }
}
