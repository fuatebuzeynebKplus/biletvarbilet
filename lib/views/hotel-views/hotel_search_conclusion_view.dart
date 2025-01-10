import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/hotel/data/models/room_cancellation_policies.dart';
import 'package:bamobile1/hotel/data/models/room_pax_definition.dart';
import 'package:bamobile1/hotel/data/models/validate_hotel_rooms.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/hotel-views/hotel_guest_details_view.dart';
import 'package:bamobile1/views/hotel-views/hotel_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/circular_icon_widget.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/bottom-sheet/hotel_card_details_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/bottom-sheet/hotel_price_and_continue_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/hotel_card_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/hotel_new_card_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelSearchConclusionView extends StatelessWidget {
  const HotelSearchConclusionView({super.key});
  static String id = 'HotelSearchConclusionView';
  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            toolbarHeight: context.height * 0.06,
            automaticallyImplyLeading: false,
            title: AppBarWidget(
              isImage: true,
              onPressedLeading: () {
                // print(hotelCubit.selectHotelRoomCard);

                // hotelCubit.selectHotelCard = null;
                // hotelCubit.selectHotelRoomCard = null;
                Navigator.pushReplacementNamed(context, HotelView.id);
              },
              title: S.of(context).SearchHotel,
              leading: Icons.arrow_back_ios,
              onPressedAction: () {
                if (hotelCubit.hotelSearchResults.isNotEmpty) {
                  hotelCubit.changeHotelCard();
                }
              },
            ),
            backgroundColor: AppColors.kAppBarColor,
          ),
          bottomSheet: hotelCubit.bottomSheetValue == 'h3'
              ? const HotelCardDetailsBottomSheet()
              : hotelCubit.selectHotelCard != null
                  ? HotelPriceAndContinueBottomSheet(onTap: () {
                      if (hotelCubit.selectHotelRoomCard != null) {
                        Navigator.pushNamed(context, HotelGuestDetailsView.id);
                        hotelCubit.getRoomKeys(
                            index: hotelCubit.selectHotelRoomCard!);
                        hotelCubit.getHotelRoomCancellationPolicies(
                            RoomCancellationPoliciesJson(
                                request: RoomCancellationPolicies(
                                    tokenCode: getIt<CacheHelper>()
                                            .getDataString(key: 'token') ??
                                        "",
                                    ResultKeys: hotelCubit.roomKeyList)),
                            context);
                        hotelCubit.getValidateHotelRooms(
                            ValidateHotelRoomsJson(
                                request: ValidateHotelRooms(
                              rooms: hotelCubit.roomsKeysForValidateList,
                              tokenCode: getIt<CacheHelper>()
                                      .getDataString(key: 'token') ??
                                  "",
                            )),
                            context);
                      } else {
                        SnackbarUtils.showSnackbar(
                            context, S.of(context).PleaseSelectARoom);
                      }
                    })
                  : null,
          body: state is SearchAllHotelListLoading
              ? Column(
                  children: [
                    SizedBox(
                      height: context.height * 0.2,
                    ),
                    const LoadingWidget(),
                  ],
                )
              : state is SearchAllHotelListFailure
                  ? ErrorResultWidget(
                      errorCode: state.errorCode,
                      errorMassage: state.errorMassage,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      child: Column(
                        children: [
                          Container(
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.swap_vert,
                                          color: AppColors.kSecondColor,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        TextWidget(
                                          text: S.of(context).Sort,
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const VerticalDivider(
                                    width: 10.0,
                                    thickness: 1,
                                    color: Colors.grey,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Icon(
                                          color: AppColors.kSecondColor,
                                          Icons.filter_alt,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        TextWidget(
                                          text: S.of(context).Filter,
                                          fontSize: 16,
                                          color: Colors.black54,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: hotelCubit.selectHotelCard != null
                                ? ListView.builder(
                                    itemCount: 1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return hotelCubit.isChangeHotelCard ==
                                              false
                                          ? HotelCardWidget(
                                              index:
                                                  hotelCubit.selectHotelCard!,
                                            )
                                          : HotelNewCardWidget(
                                              index:
                                                  hotelCubit.selectHotelCard!,
                                            );
                                    },
                                  )
                                : ListView.builder(
                                    itemCount:
                                        hotelCubit.hotelSearchResults.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return hotelCubit.isChangeHotelCard ==
                                              false
                                          ? HotelCardWidget(
                                              index: index,
                                            )
                                          : HotelNewCardWidget(
                                              index: index,
                                            );
                                    },
                                  ),
                          )
                        ],
                      )),
        );
      },
    );
  }
}




/*


  Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 0,
                                    width: context.width * 0.58,
                                    child: const Divider(
                                      thickness: 1,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const TextWidget(
                                    text: 'text fsdfs ',
                                    fontSize: 12,
                                    color: Colors.black45,
                                  ),
                                  const Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.kSecondColor,
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(20),
                                      ),
                                    ),
                                    height: context.height * 0.081,
                                    width: context.width * 0.3,
                                  ),
                                ],
                              ),
                            ],
                          )
*/