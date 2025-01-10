import 'package:bamobile1/common/data/models/payment_option_request.dart';
import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/hotel/data/models/payment_options.dart';
import 'package:bamobile1/models/hotel_guest_model.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/hotel-views/hotel_payment_data_enter_view.dart';
import 'package:bamobile1/views/hotel-views/hotel_search_conclusion_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-guest-data-enter-widgets/hotel_birthday_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-guest-details-view-widgets/bottom-sheet/hotel_card_all_details_for_title_card_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-guest-details-view-widgets/hotel_contact_info_for_guest_card_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-guest-details-view-widgets/hotel_guest_card_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/bottom-sheet/hotel_card_details_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/bottom-sheet/hotel_price_and_continue_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-search-conclusion-view-widgets/title_for_hotel_card_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-details-widgets/contact_info_for_passenger_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelGuestDetailsView extends StatelessWidget {
  const HotelGuestDetailsView({super.key});

  static String id = 'HotelGuestDetailsView';

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    // bool allNotNull = hotelCubit.hotelGuestCardDataList.every(
    //     (subList) => subList.every((element) => element!.itIsOk != false));

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          appBar: AppBar(
            backgroundColor: AppColors.kAppBarColor,
            toolbarHeight: context.height * 0.06,
            automaticallyImplyLeading: false,
            title: AppBarWidget(
              onPressedLeading: () {
                print(hotelCubit.hotelGuestCardDataList);
                Navigator.pushReplacementNamed(
                    context, HotelSearchConclusionView.id);
                // print(hotelCubit
                //     .hotelGuestCardDataList[hotelCubit.arguments!]!.firstName);
                // Navigator.pop(context);
              },
              title: 'Guest Details',
              leading: Icons.arrow_back_ios,
            ),
          ),
          bottomSheet: hotelCubit.bottomSheetValue == 'h5'
              ? const HotelCardAllDetailsForTitleCardBottomSheet()
              : hotelCubit.bottomSheetValue == 'h6'
                  ? HotelPriceAndContinueBottomSheet(
                      onTap: () {
                        hotelCubit.countryPhone ??= '+90';
                        hotelCubit.email ??= authCubit.agentEmail;
                        hotelCubit.phoneNo ??= authCubit.agentPhone!
                            .split(' ')
                            .sublist(1)
                            .join(' ')
                            .replaceAll(' ', '');
                        if (hotelCubit.email == null) {
                          SnackbarUtils.showSnackbar(context,
                              S.of(context).TheEmailMustNotBeLeftBlank);
                        } else if (!RegExp(r'^[a-zA-Z0-9._@]+@[a-zA-Z0-9._]+$')
                            .hasMatch(hotelCubit.email ?? 'p')) {
                          SnackbarUtils.showSnackbar(
                              context,
                              S
                                  .of(context)
                                  .MakeSureYourEmailIsWrittenCorrectly);
                        } else if (hotelCubit.phoneNo == null) {
                          SnackbarUtils.showSnackbar(context,
                              S.of(context).ThePhoneNoMustNotBeLeftBlank);
                        } else if (!RegExp(r'^\d{10}$')
                            .hasMatch(hotelCubit.phoneNo ?? 'p')) {
                          SnackbarUtils.showSnackbar(
                              context,
                              S
                                  .of(context)
                                  .MakeSureThePhoneNumberIsWrittenCorrectly);
                        } else {
                          hotelCubit.getPaymentOptions(PaymentOptionsJson(
                            request: PaymentOptions(
                              tokenCode: getIt<CacheHelper>()
                                      .getDataString(key: 'token') ??
                                  "",
                              ResultKeys: hotelCubit.roomKeyAfterValidateList,
                            ),
                          ));

                          Navigator.pushNamed(
                              context, HotelPaymentDataEnterView.id);
                        }
                      },
                    )
                  : null,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const TitleForHotelCardWidget(),
                GestureDetector(
                  onTap: () {
                    hotelCubit.bottomSheetValueFunction(type: 'h5');
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    width: context.width * 0.25,
                    height: context.height * 0.025,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        TextWidget(
                          text: 'Details',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                // const SelectNationalityWidget(),
                const HotelContactInfoForGuestCardWidget(),

                // GestureDetector(
                //   onTap: () {
                //     print(
                //         'flightTicketCubit.bottomSheetType: ${flightTicketCubit.bottomSheetType}');
                //   },
                //   child: Container(
                //     height: 100,
                //     width: 100,
                //     color: Colors.red,
                //   ),
                // ),
                // const SizedBox(
                //   height: 8,
                // ),
                SizedBox(
                  height: context.height * 0.57,
                  child: ListView.builder(
                    itemCount: hotelCubit.roomsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      // print('roomList.length: ${hotelCubit.roomsList.length}');

                      // تأكد من أن hotelGuestCardDataList يحتوي على عدد كافٍ من العناصر
                      if (hotelCubit.hotelGuestCardDataList.length <= index) {
                        hotelCubit.hotelGuestCardDataList
                            .add([]); // إضافة عنصر جديد إذا لزم الأمر
                      }

                      // حساب طول الفندق بناءً على عدد الضيوف
                      hotelCubit.hotelGuestCardDataList[index].length =
                          hotelCubit.roomsList[index].paxes.first.count +
                              hotelCubit.roomsList[index].paxes.last.count;

                      return Column(
                        children: [
                          SizedBox(
                            height: context.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                TextWidget(
                                  text: '${index + 1}.${S.of(context).Room}',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                    child: Divider(
                                  color: Colors.black,
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.01,
                          ),
                          SizedBox(
                              height: context.height *
                                  0.085 *
                                  (hotelCubit.roomsList[index].paxes.length == 1
                                      ? hotelCubit
                                          .roomsList[index].paxes.first.count
                                      : hotelCubit.roomsList[index].paxes.first
                                              .count +
                                          hotelCubit.roomsList[index].paxes.last
                                              .count),
                              width: context.width * 1,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount:
                                    hotelCubit.roomsList[index].paxes.length ==
                                            1
                                        ? hotelCubit
                                            .roomsList[index].paxes.first.count
                                        : hotelCubit.roomsList[index].paxes
                                                .first.count +
                                            hotelCubit.roomsList[index].paxes
                                                .last.count,
                                itemBuilder:
                                    (BuildContext context, int indexSub) {
                                  String title = indexSub <
                                          hotelCubit.roomsList[index].paxes
                                              .first.count
                                      ? S.of(context).Adult
                                      : S.of(context).Child;

                                  return HotelGuestCardWidget(
                                    index: index,
                                    indexSub: indexSub,
                                    title: title,
                                  );
                                },
                              )),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/*

Column(
                        children: [
                          SizedBox(
                            height: context.height * 0.01,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Row(
                              children: [
                                TextWidget(
                                  text: '${index + 1}.${S.of(context).Room}',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                    child: Divider(
                                  color: Colors.black,
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: context.height * 0.01,
                          ),
                          SizedBox(
                              height: context.height *
                                  0.085 *
                                  (hotelCubit
                                          .roomsList[index].paxes.first.count +
                                      hotelCubit
                                          .roomsList[index].paxes.last.count),
                              width: context.width * 1,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: hotelCubit
                                        .roomsList[index].paxes.first.count +
                                    hotelCubit
                                        .roomsList[index].paxes.last.count,
                                itemBuilder:
                                    (BuildContext context, int indexSub) {
                                  String title = indexSub <
                                          hotelCubit.roomsList[index].paxes
                                              .first.count
                                      ? S.of(context).Adult
                                      : S.of(context).Child;

                                  return HotelGuestCardWidget(
                                    index: index,
                                    indexSub: indexSub,
                                    title: title,
                                  );
                                },
                              )),
                        ],
                      );

*/
