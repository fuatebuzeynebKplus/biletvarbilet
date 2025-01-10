import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/widgets/select_value_from_two_text_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/bottom_sheet_widget.dart';
import 'package:bamobile1/widgets/close_and_apply_widget.dart';
import 'package:bamobile1/widgets/text_spacer_widget_widget.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelAdultChildBabyQuantityBottomSheet extends StatelessWidget {
  const HotelAdultChildBabyQuantityBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<int>> getDropdownItems() {
      List<DropdownMenuItem<int>> items = [];
      for (int i = 1; i <= 17; i++) {
        items.add(DropdownMenuItem(
          value: i,
          child: Text(i.toString()),
        ));
      }
      return items;
    }

    List<int?> selectedValues = List<int?>.filled(3, null);
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
        return BottomSheetWidget(
          height: 0.5,
          heightBetweenBodyAndClose: 1.1,
          title: TextWidget(
            text: S.of(context).RoomsAndGuests,
            color: AppColors.kSecondColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          //   closeApply: const CloseAndApplyWidget(),
          widgetBody: Column(
            children: [
              TextSpacerWidgetWidget(
                title: S.of(context).Room,
                fontSize: 16,
                color: Colors.black,
                widget: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        hotelCubit.removeValue(type: 3, index: null);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColors.kSecondColor),
                        height: context.height * 0.4,
                        width: context.height * 0.037,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          '${hotelCubit.roomsList.length}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        hotelCubit.incrementValue(type: 3, index: null);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: AppColors.kSecondColor),
                        height: context.height * 0.4,
                        width: context.height * 0.037,
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: context.height * 0.02),
              SizedBox(
                height: context.height * 0.28,
                width: context.width * 1,
                child: ListView.builder(
                  itemCount: hotelCubit.roomsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(height: context.height * 0.02),
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextWidget(
                                  text: "${index + 1}.${S.of(context).Room}",
                                  fontSize: 16),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        TextSpacerWidgetWidget(
                          title: S.of(context).Adult,
                          fontSize: 16,
                          color: Colors.black,
                          widget: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  hotelCubit.removeValue(type: 1, index: index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: AppColors.kSecondColor),
                                  height: context.height * 0.4,
                                  width: context.height * 0.037,
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                                child: Center(
                                  child: Text(
                                    '${hotelCubit.roomsList[index].paxes.first.count ?? 0}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  hotelCubit.incrementValue(
                                      type: 1, index: index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: AppColors.kSecondColor),
                                  height: context.height * 0.4,
                                  width: context.height * 0.037,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextSpacerWidgetWidget(
                          title: S.of(context).Child,
                          fontSize: 16,
                          color: Colors.black,
                          widget: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  hotelCubit.removeValue(type: 2, index: index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: AppColors.kSecondColor),
                                  height: context.height * 0.4,
                                  width: context.height * 0.037,
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 40,
                                child: Center(
                                  child: Text(
                                    '${hotelCubit.roomsList[index].paxes.last.paxType != PaxType.child ? 0 : hotelCubit.roomsList[index].paxes.last.count}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  hotelCubit.incrementValue(
                                      type: 2, index: index);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: AppColors.kSecondColor),
                                  height: context.height * 0.4,
                                  width: context.height * 0.037,
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:
                              hotelCubit.roomsList[index].paxes.last.paxType !=
                                      PaxType.child
                                  ? 0
                                  : context.height * 0.025,
                        ),
                        SizedBox(
                          height: hotelCubit
                                      .roomsList[index].paxes.last.paxType !=
                                  PaxType.child
                              ? 0
                              : hotelCubit.roomsList[index].paxes.last.count *
                                  context.height *
                                  0.04,
                          child: ListView.builder(
                            itemCount: hotelCubit
                                        .roomsList[index].paxes.last.paxType !=
                                    PaxType.child
                                ? 0
                                : hotelCubit.roomsList[index].paxes.last.count,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int indexSub) {
                              return Row(
                                children: [
                                  Container(
                                    height: context.height * 0.04,
                                    color: Colors.grey.withOpacity(0.2),
                                    child: DropdownButton<int>(
                                      alignment: Alignment.center,
                                      underline: const SizedBox(),
                                      dropdownColor: Colors.white,
                                      menuMaxHeight: 200.0,
                                      itemHeight: 48.0,
                                      value:
                                          //  hotelCubit.roomsList[index].paxes
                                          //     .last.childAgeList![indexSub],

                                          (indexSub >= 0 &&
                                                  indexSub <
                                                      hotelCubit
                                                          .roomsList[index]
                                                          .paxes
                                                          .last
                                                          .childAgeList!
                                                          .length)
                                              ? hotelCubit
                                                  .roomsList[index]
                                                  .paxes
                                                  .last
                                                  .childAgeList![indexSub]
                                              : null,
                                      items: getDropdownItems(),
                                      onChanged: (int? newValue) {
                                        hotelCubit.dropDownValue(
                                            value: newValue,
                                            index: index,
                                            indexSub: indexSub);
                                      },
                                      hint: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 16),
                                        child: Text(
                                            "${indexSub + 1}.${S.of(context).Child}"),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: context.width * 0.03),
                                ],
                              );
                            },
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
          closeApply: CloseAndApplyWidget(
            onTapClose: () {
              hotelCubit.bottomSheetValueFunction(type: 'h0');
            },
            onTapApPly: () {
              hotelCubit.bottomSheetValueFunction(type: 'h0');
              print(hotelCubit.roomsList.toString());
            },
          ),
        );
      },
    );
  }
}
