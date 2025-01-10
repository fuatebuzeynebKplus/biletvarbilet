import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/flight/data/models/air_passenger_fare.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/hotel_card_details_conditions_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/hotel_card_details_images_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/hotel_card_details_info_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/hotel_card_details_location_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/hotel_card_details_room_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/title_for_hotel_card_widget.dart';
import 'package:bamobile1/widgets/icon_button_widget.dart';
import 'package:bamobile1/widgets/text_spacer_widget_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HotelCardDetailsBottomSheet extends StatelessWidget {
  const HotelCardDetailsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BottomSheetWidget(
          height: 1,
          paddingTop: 8,
          paddingLeftRight: 0,
          color: Colors.grey.shade200,
          circularRadius: 0,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: S.of(context).Details,
                  color: AppColors.kSecondColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                GestureDetector(
                  child: const Icon(Icons.close),
                  onTap: () {
                    print(hotelCubit.selectHotelRoomCard);
                    hotelCubit.bottomSheetValueFunction(type: 'h0');
                  },
                )
              ],
            ),
          ),
          widgetBody: Column(
            children: [
              const TitleForHotelCardWidget(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButtonWidget(
                    mainAxisAlignment: true,
                    crossAxisAlignment: false,
                    height: 0.05,
                    width: hotelCubit.selectHotelCardDetailsValue != 1
                        ? 0.15
                        : 0.3,
                    iconSize: 30,
                    padding: 0.0,
                    isIconNotImage: true,
                    iconData: Icons.bed,
                    borderColor: hotelCubit.selectHotelCardDetailsValue != 1
                        ? Colors.grey
                        : AppColors.kSecondColor,
                    widgetButton: hotelCubit.selectHotelCardDetailsValue != 1
                        ? null
                        : TextWidget(
                            text: S.of(context).Rooms,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kSecondColor,
                          ),
                    iconColor: hotelCubit.selectHotelCardDetailsValue != 1
                        ? Colors.grey
                        : AppColors.kSecondColor,
                    onTap: () {
                      hotelCubit.selectHotelCardDetailsFunction(value: 1);
                    },
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  IconButtonWidget(
                    mainAxisAlignment: true,
                    crossAxisAlignment: false,
                    height: 0.05,
                    width: hotelCubit.selectHotelCardDetailsValue != 2
                        ? 0.15
                        : 0.3,
                    iconSize: 30,
                    padding: 0.0,
                    isIconNotImage: true,
                    iconData: Icons.info,
                    borderColor: hotelCubit.selectHotelCardDetailsValue != 2
                        ? Colors.grey
                        : AppColors.kSecondColor,
                    widgetButton: hotelCubit.selectHotelCardDetailsValue != 2
                        ? null
                        : TextWidget(
                            text: S.of(context).About,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kSecondColor,
                          ),
                    iconColor: hotelCubit.selectHotelCardDetailsValue != 2
                        ? Colors.grey
                        : AppColors.kSecondColor,
                    onTap: () {
                      hotelCubit.selectHotelCardDetailsFunction(value: 2);
                    },
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  IconButtonWidget(
                    mainAxisAlignment: true,
                    crossAxisAlignment: false,
                    height: 0.05,
                    width: hotelCubit.selectHotelCardDetailsValue != 3
                        ? 0.15
                        : 0.3,
                    iconSize: 30,
                    padding: 0.0,
                    isIconNotImage: true,
                    iconData: Icons.photo_camera,
                    borderColor: hotelCubit.selectHotelCardDetailsValue != 3
                        ? Colors.grey
                        : AppColors.kSecondColor,
                    widgetButton: hotelCubit.selectHotelCardDetailsValue != 3
                        ? null
                        : TextWidget(
                            text: S.of(context).Pictures,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kSecondColor,
                          ),
                    iconColor: hotelCubit.selectHotelCardDetailsValue != 3
                        ? Colors.grey
                        : AppColors.kSecondColor,
                    onTap: () {
                      hotelCubit.selectHotelCardDetailsFunction(value: 3);
                    },
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  IconButtonWidget(
                    mainAxisAlignment: true,
                    crossAxisAlignment: false,
                    height: 0.05,
                    width: hotelCubit.selectHotelCardDetailsValue != 4
                        ? 0.15
                        : 0.3,
                    iconSize: 30,
                    padding: 0.0,
                    isIconNotImage: true,
                    iconData: Icons.location_pin,
                    borderColor: hotelCubit.selectHotelCardDetailsValue != 4
                        ? Colors.grey
                        : AppColors.kSecondColor,
                    widgetButton: hotelCubit.selectHotelCardDetailsValue != 4
                        ? null
                        : TextWidget(
                            text: S.of(context).Location,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kSecondColor,
                          ),
                    iconColor: hotelCubit.selectHotelCardDetailsValue != 4
                        ? Colors.grey
                        : AppColors.kSecondColor,
                    onTap: () {
                      hotelCubit.selectHotelCardDetailsFunction(value: 4);
                    },
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  IconButtonWidget(
                    mainAxisAlignment: true,
                    crossAxisAlignment: false,
                    height: 0.05,
                    width: hotelCubit.selectHotelCardDetailsValue != 5
                        ? 0.15
                        : 0.3,
                    iconSize: 30,
                    padding: 0.0,
                    isIconNotImage: true,
                    iconData: Icons.done,
                    borderColor: hotelCubit.selectHotelCardDetailsValue != 5
                        ? Colors.grey
                        : AppColors.kSecondColor,
                    widgetButton: hotelCubit.selectHotelCardDetailsValue != 5
                        ? null
                        : TextWidget(
                            text: S.of(context).Conditions,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kSecondColor,
                          ),
                    iconColor: hotelCubit.selectHotelCardDetailsValue != 5
                        ? Colors.grey
                        : AppColors.kSecondColor,
                    onTap: () {
                      hotelCubit.selectHotelCardDetailsFunction(value: 5);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              hotelCubit.selectHotelCardDetailsValue == 1
                  ? const HotelCardDetailsRoomWidget()
                  : hotelCubit.selectHotelCardDetailsValue == 2
                      ? const HotelCardDetailsInfoWidget()
                      : hotelCubit.selectHotelCardDetailsValue == 3
                          ? const HotelCardDetailsImagesWidget()
                          : hotelCubit.selectHotelCardDetailsValue == 4
                              ? const HotelCardDetailsLocationWidget()
                              : hotelCubit.selectHotelCardDetailsValue == 5
                                  ? const HotelCardDetailsConditionsWidget()
                                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
