import 'package:bamobile1/bottom_nav_bar.dart';
import 'package:bamobile1/common/data/enums/calculation_type.dart';
import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/flight/data/models/advanced_options.dart';
import 'package:bamobile1/flight/data/models/pax_definition.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/hotel/data/models/destination.dart';
import 'package:bamobile1/hotel/data/models/hotel_search_filter.dart';
import 'package:bamobile1/hotel/data/models/hotels.dart';
import 'package:bamobile1/hotel/data/models/room_pax_definition.dart';
import 'package:bamobile1/hotel/data/models/search_hotel.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/hotel-views/hotel_search_conclusion_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/container_card_two_widget.dart';
import 'package:bamobile1/widgets/container_card_widget.dart';
import 'package:bamobile1/widgets/hotel-widgets/bottom-sheet/hotel_adult_child_baby_quantity_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/bottom-sheet/hotel_markup_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/bottom-sheet/hotel_search_bottom_sheet.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel_select_nationality_widget.dart';
import 'package:bamobile1/widgets/icon_button_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../flight/data/models/markup.dart';

class HotelView extends StatelessWidget {
  const HotelView({super.key});

  static String id = 'HotelView';

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return PopScope(
          canPop: false,
          child: Scaffold(
              backgroundColor: Colors.grey.shade200,
              appBar: AppBar(
                surfaceTintColor: Colors.white,
                toolbarHeight: context.height * 0.08,
                automaticallyImplyLeading: false,
                title: AppBarWidget(
                  onPressedLeading: () {
                    hotelCubit.bottomSheetValue = 'h0';
                    hotelCubit.dateTimeRange = null;
                    hotelCubit.paxesCount = 2;
                    hotelCubit.searchHotelFullName = null;
                    hotelCubit.roomsList = [
                      RoomPaxDefinition(
                        paxes: [
                          PaxDefinition(count: 2, paxType: PaxType.adult)
                        ],
                        roomIndex: 0,
                      )
                    ];
                    hotelCubit.searchHotelCode = null;
                    hotelCubit.amount = null;
                    hotelCubit.percent = null;

                    Navigator.pushReplacementNamed(context, BottomNavBar.id);
                  },
                  leading: Icons.arrow_back_ios,
                ),
                backgroundColor: AppColors.kAppBarColor,
              ),
              bottomSheet: hotelCubit.bottomSheetValue == 'h1'
                  ? const HotelSearchBottomSheet()
                  : hotelCubit.bottomSheetValue == 'h2'
                      ? const HotelAdultChildBabyQuantityBottomSheet()
                      : hotelCubit.bottomSheetValue == 'h-Markup'
                          ? const HotelMarkupBottomSheet()
                          : null,
              body: Padding(
                padding: const EdgeInsets.only(right: 12, left: 12, top: 10),
                child: Column(
                  children: [
                    ContainerCardWidget(
                      paddingTop: 18,
                      paddingLeftRight: 12,
                      text: hotelCubit.searchHotelFullName != null
                          ? hotelCubit.searchHotelFullName!.length > 35
                              ? '${hotelCubit.searchHotelFullName!.substring(0, 35)}...'
                              : hotelCubit.searchHotelFullName!
                          : S.of(context).WhereWouldYouLikeToGo,
                      fontSize: 18,
                      haveAColumText: true,
                      columText: hotelCubit.searchHotelCountryName != null
                          ? '${hotelCubit.searchHotelCountryName} (${hotelCubit.searchHotelCountryCode})'
                          : S.of(context).EnterYourDestinationCityOrRegion,
                      height: 0.11,
                      width: 1,
                      onTap: () {
                        hotelCubit.bottomSheetValueFunction(type: 'h1');
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonWidget(
                          iconSize: 32,
                          iconColor: AppColors.kSecondColor,
                          height: 0.09,
                          width: 0.46,
                          widgetButton: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: hotelCubit.dateTimeRange != null
                                    ? DateFormat('dd-MM-yyy')
                                        .format(hotelCubit.dateTimeRange!.start)
                                    : '--- -- ----',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              TextWidget(
                                text: S.of(context).CheckIn,
                                fontSize: 12,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          onTap: () async {
                            hotelCubit.dateTimeRange =
                                await showDateRangePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(3000),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme:
                                        Theme.of(context).colorScheme.copyWith(
                                              primary: AppColors
                                                  .kSecondColor, // Set the select color
                                              //onPrimary: Colors.white,
                                            ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            hotelCubit.dateRangePicker();
                          },
                        ),
                        IconButtonWidget(
                          //    axisAlignmentIsCenter: false,
                          iconSize: 32,
                          iconColor: AppColors.kSecondColor,
                          height: 0.09,
                          width: 0.46,
                          widgetButton: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: hotelCubit.dateTimeRange != null
                                    ? DateFormat('dd-MM-yyy')
                                        .format(hotelCubit.dateTimeRange!.end)
                                    : '--- -- ----',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              TextWidget(
                                text: S.of(context).CheckOut,
                                fontSize: 12,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          onTap: () async {
                            hotelCubit.dateTimeRange =
                                await showDateRangePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate: DateTime(3000),
                              builder: (BuildContext context, Widget? child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme:
                                        Theme.of(context).colorScheme.copyWith(
                                              primary: AppColors
                                                  .kSecondColor, // Set the select color
                                              //onPrimary: Colors.white,
                                            ),
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            hotelCubit.dateRangePicker();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButtonWidget(
                          //axisAlignmentIsCenter: false,
                          icon: AppImages.userIcon,
                          iconSize: 28,
                          iconColor: AppColors.kSecondColor,
                          height: 0.09,
                          width: 0.46,
                          widgetButton: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: '${hotelCubit.paxesCount}'
                                    ' ${S.of(context).Guest}',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              TextWidget(
                                text: S.of(context).GuestCount,
                                fontSize: 12,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          onTap: () {
                            hotelCubit.bottomSheetValueFunction(type: 'h2');
                          },
                        ),
                        GestureDetector(
                          child: const HotelSelectNationalityWidget(),
                          // onTap: () {
                          //   hotelCubit.isClickToNationalityFunction();
                          //   print(hotelCubit.isClickToNationality);
                          // },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        hotelCubit.bottomSheetValueFunction(type: 'h-Markup');
                      },
                      child: Container(
                        height: context.height * 0.09,
                        width: context.width * 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: S.of(context).Markup,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            hotelCubit.amount != null &&
                                    hotelCubit.percent != null
                                ? const TextWidget(
                                    text: ' :   ',
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const SizedBox(),
                            TextWidget(
                              textAlign: TextAlign.center,
                              text: hotelCubit.typeIsAmount == true
                                  ? (hotelCubit.amount != null &&
                                          hotelCubit.amount != ''
                                      ? '${hotelCubit.amount} ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}'
                                      : '')
                                  : (hotelCubit.percent != null &&
                                          hotelCubit.percent != ''
                                      ? '${hotelCubit.percent} %'
                                      : ''),
                              fontSize: 14,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ButtonWidget(
                      title: S.of(context).SearchHotel,
                      height: 0.07,
                      width: 1,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textColor: Colors.white,
                      color: AppColors.kSecondColor,
                      onTap: () {
                        print(
                            'hotelCubit.paxesCount------------${hotelCubit.paxesCount}');
                        if (hotelCubit.dateTimeRange != null) {
                          if (hotelCubit.searchHotelCode != null ||
                              hotelCubit.searchDestinationCode != null) {
                            print(hotelCubit.searchHotelCode);

                            hotelCubit.searchHotels(
                              HotelSearchFilterJson(
                                request: HotelSearchFilter(
                                  destinations:
                                      hotelCubit.searchHotelCode == null
                                          ? [
                                              Destination(
                                                  destinationId:
                                                      "${hotelCubit.searchDestinationCode}")
                                            ]
                                          : [],
                                  checkInDate: DateFormat('dd.MM.yyy')
                                      .format(hotelCubit.dateTimeRange!.start)
                                      .toString(),
                                  checkOutDate: DateFormat('dd.MM.yyy')
                                      .format(hotelCubit.dateTimeRange!.end)
                                      .toString(),
                                  nationalityCode:
                                      hotelCubit.nationality ?? 'TR',
                                  rooms: hotelCubit.roomsList,
                                  // [
                                  //   RoomPaxDefinition(
                                  //     paxes: [
                                  //       PaxDefinition(
                                  //         count: 2,
                                  //         paxType: PaxType.adult,
                                  //       ),
                                  //       // PaxDefinition(
                                  //       //   count: 2,
                                  //       //   paxType: PaxType.child,
                                  //       //   childAgeList: [14, 15],
                                  //       // )
                                  //     ],
                                  //   )
                                  // ],
                                  showMultipleRate: false,
                                  token: Token(
                                    channelCode: "kplusmobile",
                                    tokenCode: getIt<CacheHelper>()
                                            .getDataString(key: 'token') ??
                                        "",
                                  ),
                                  hotel: hotelCubit.searchHotelCode == null
                                      ? []
                                      : [
                                          Hotels(
                                              HotelCode:
                                                  hotelCubit.searchHotelCode)
                                        ],
                                  advancedOptions: AdvancedOptions(
                                    markup: Markup(
                                      calculationType:
                                          hotelCubit.typeIsAmount == true
                                              ? CalculationType.amount
                                              : CalculationType.percent,
                                      amount: hotelCubit.typeIsAmount == true
                                          ? hotelCubit.amount
                                          : hotelCubit.percent,
                                      currencyCode:
                                          BlocProvider.of<CurrencyCodeCubit>(
                                                  context)
                                              .currencyCodeValue,
                                    ),
                                    air: null,
                                  ),
                                ),
                              ),
                              context,
                            );
                            Navigator.pushNamed(
                                context, HotelSearchConclusionView.id);
                          } else {
                            SnackbarUtils.showSnackbar(context,
                                S.of(context).PleaseSelectWhereYouWantToGo);
                          }
                        } else {
                          SnackbarUtils.showSnackbar(
                              context, S.of(context).PleaseSelectDate);
                        }
                      },
                    ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
