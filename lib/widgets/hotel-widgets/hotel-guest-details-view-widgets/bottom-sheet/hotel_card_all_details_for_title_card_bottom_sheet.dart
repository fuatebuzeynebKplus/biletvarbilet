import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/flight/data/models/air_passenger_fare.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/hotel/data/models/get_hotel_room_cancellation_policies_model.dart';
import 'package:bamobile1/hotel/data/models/room_cancellation_policies.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/alert_dialog_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/container_card_two_widget.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';

import 'package:newsfeed_multiple_imageview/newsfeed_multiple_imageview.dart';

class HotelCardAllDetailsForTitleCardBottomSheet extends StatelessWidget {
  const HotelCardAllDetailsForTitleCardBottomSheet({
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
          paddingTop: 14,
          paddingLeftRight: 0,
          color: Colors.white,
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
                    hotelCubit.bottomSheetValueFunction(type: 'h0');
                  },
                )
              ],
            ),
          ),
          widgetBody: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showAlertDialog(context);
                    },
                    child: Container(
                      height: context.height * 0.045,
                      width: context.width * 1,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.red.shade700, width: 1.5),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Center(
                          child: TextWidget(
                        text: '! ${S.of(context).CancellationPolicies}',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red.shade700,
                      )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: context.height * 0.25,
                    width: context.width * 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(
                            '${hotelCubit.hotelSearchResults[hotelCubit.hotelIndex!].hotel!.hotelImageUrl} '),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        text:
                            '${hotelCubit.hotelSearchResults[hotelCubit.hotelIndex!].hotel!.hotelName}',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      Wrap(
                        children: List.generate(
                            hotelCubit
                                .hotelSearchResults[hotelCubit.hotelIndex!]
                                .hotel!
                                .star!, (index) {
                          return Icon(Icons.star,
                              color: AppColors.kSecondColor, size: 18);
                        }),
                      ),
                      TextWidget(
                        text:
                            '${hotelCubit.hotelSearchResults[hotelCubit.hotelIndex!].hotel!.address}',
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        height: context.height * 0.12,
                        width: context.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                TextWidget(
                                  text: S.of(context).CheckIn,
                                  fontSize: 16,
                                ),
                                SizedBox(
                                  height: 0,
                                  child: SizedBox(
                                    width: 16 *
                                        0.6 *
                                        (S.of(context).CheckIn).length,
                                    child: Divider(
                                      color: AppColors.kSecondColor,
                                      thickness: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextWidget(
                              text: DateFormat('dd-MMMM')
                                  .format(hotelCubit.dateTimeRange!.start),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kSecondColor,
                            ),
                            TextWidget(
                              text: DateFormat('yyyy')
                                  .format(hotelCubit.dateTimeRange!.start),
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        height: context.height * 0.12,
                        width: context.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1.5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                TextWidget(
                                  text: S.of(context).CheckOut,
                                  fontSize: 16,
                                ),
                                SizedBox(
                                  height: 0,
                                  child: SizedBox(
                                    width: 16 *
                                        0.6 *
                                        (S.of(context).CheckOut).length,
                                    child: Divider(
                                      color: AppColors.kSecondColor,
                                      thickness: 1.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            TextWidget(
                              text: DateFormat('dd-MMMM')
                                  .format(hotelCubit.dateTimeRange!.end),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kSecondColor,
                            ),
                            TextWidget(
                              text: DateFormat('yyyy')
                                  .format(hotelCubit.dateTimeRange!.end),
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    height: (hotelCubit.roomFilterList.length *
                        (context.width * 0.27)),
                    width: context.width * 1,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: hotelCubit.twoList.isEmpty
                          ? 1
                          : hotelCubit.roomFilterList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TextVV(
                          index: index,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  //-------------------------------
  showAlertDialog(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);

    // set up the button
    Widget okButton = TextButton(
      child: TextWidget(
        text: 'Ok',
        fontSize: 18,
        color: AppColors.kSecondColor,
        fontWeight: FontWeight.bold,
      ),
      onPressed: () async {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      title: TextWidget(
        text: 'Cancellation Policies',
        fontSize: 18,
        color: AppColors.kSecondColor,
        fontWeight: FontWeight.bold,
      ),
      content: SizedBox(
        height: (hotelCubit.roomCancellationPoliciesList.length *
            (context.width * 0.27)),
        width: context.width * 1,
        child: BlocConsumer<HotelCubit, HotelState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return ListView.builder(
              itemCount: hotelCubit.roomCancellationPoliciesList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: '${index + 1}.Oda',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 0,
                      child: SizedBox(
                        width: 16 * 0.6 * 5,
                        child: Divider(
                          color: AppColors.kSecondColor,
                          thickness: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      text: hotelCubit.roomCancellationPoliciesList[index],
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class TextVV extends StatelessWidget {
  const TextVV({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return Column(
      children: [
        Row(
          children: [
            TextWidget(
              text: '${index + 1}.${S.of(context).Room}',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(
              height: 0,
              child: SizedBox(
                width: 18 * 1.01 * (S.of(context).Room).length,
                child: Divider(
                  color: AppColors.kSecondColor,
                  thickness: 1.5,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        TextSpacerWidgetWidget(
            title: S.of(context).hostel,
            widget: TextWidget(
              text: hotelCubit.dataIsNull == true
                  ? '${hotelCubit.twoListIfNoData[index].roomName}'
                  : '${hotelCubit.twoList[hotelCubit.selectHotelRoomCard!][index].roomName}',
              fontSize: 16,
              color: Colors.grey,
            ),
            fontSize: 16),
        SizedBox(
          height: 0,
          width: context.width * 1,
          child: const Divider(),
        ),
        const SizedBox(
          height: 4,
        ),
        TextSpacerWidgetWidget(
            title: S.of(context).Guests,
            widget: TextWidget(
              text: hotelCubit.dataIsNull == true
                  ? hotelCubit.roomFilterList.first.paxes.length == 1
                      ? '${hotelCubit.roomFilterList.first.paxes.first.count} ${S.of(context).Adult}'
                      : '${hotelCubit.roomFilterList.first.paxes.first.count} ${S.of(context).Adult}  ${hotelCubit.roomFilterList.first.paxes.last.count} ${S.of(context).Child}'
                  : hotelCubit.roomFilterList[index].paxes.length == 1
                      ? '${hotelCubit.roomFilterList[index].paxes.first.count} ${S.of(context).Adult}'
                      : '${hotelCubit.roomFilterList[index].paxes.first.count} ${S.of(context).Adult}  ${hotelCubit.roomFilterList[index].paxes.last.count} ${S.of(context).Child}',
              fontSize: 16,
              color: Colors.grey,
            ),
            fontSize: 16),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}

//

// TextWidget(
//                 text: hotelCubit.roomFilterList[indexSub].paxes.first.count
//                     .toString(),
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//               ),
//               hotelCubit.roomFilterList[indexSub].paxes.length == 1
//                   ? const SizedBox()
//                   : Icon(Icons.boy, color: AppColors.kSecondColor),
//               hotelCubit.roomFilterList[indexSub].paxes.length == 1
//                   ? const SizedBox()
//                   : TextWidget(
//                       text: hotelCubit.roomFilterList[indexSub].paxes.last.count
//                           .toString(),
//                       fontSize: 12,
//                       fontWeight: FontWeight.bold,
//                     ),
