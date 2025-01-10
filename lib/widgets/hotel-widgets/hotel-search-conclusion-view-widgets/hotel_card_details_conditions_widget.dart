import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/error_result_widget.dart';
import 'package:bamobile1/widgets/loading_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class HotelCardDetailsConditionsWidget extends StatelessWidget {
//   const HotelCardDetailsConditionsWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> services = [
//       'Laundry Services',
//       'Swimming Pool',
//       'Restaurant',
//       'Internet',
//       'Fitness Facility',
//       'Parking',
//       'Lounge',
//       'Breakfast',
//       'Business Center',
//       'Bar',
//       'Spa',
//       'Gym',
//       'Pool',
//     ];

//     HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);

//     return BlocConsumer<HotelCubit, HotelState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Container(
//           height: context.height * 0.65,
//           width: context.width * 1,
//           color: Colors.white,
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: context.height * 0.03,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Wrap(
//                     spacing: 8.0,
//                     runSpacing: 4.0,
//                     children: services.map((name) {
//                       return Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12.0, vertical: 6.0),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.green, width: 1.0),
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: TextWidget(
//                           text: name,
//                           fontSize: 14,
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                   child: Divider(color: Colors.black),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Wrap(
//                     spacing: 8.0,
//                     runSpacing: 4.0,
//                     children: services.map((name) {
//                       return Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12.0, vertical: 6.0),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: Colors.black, width: 1.0),
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: TextWidget(
//                           text: name,
//                           fontSize: 14,
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                   child: Divider(color: Colors.black),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Wrap(
//                     spacing: 8.0,
//                     runSpacing: 4.0,
//                     children: services.map((name) {
//                       return Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12.0, vertical: 6.0),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                               color: AppColors.kSecondColor, width: 1.0),
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         child: TextWidget(
//                           text: name,
//                           fontSize: 14,
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const Row(
//                       children: [
//                         Icon(Icons.circle, size: 20, color: Colors.green),
//                         SizedBox(width: 4),
//                         TextWidget(text: 'Ücrecsiz')
//                       ],
//                     ),
//                     const Row(
//                       children: [
//                         Icon(Icons.circle, size: 20),
//                         SizedBox(width: 4),
//                         TextWidget(text: 'Bilinmiyor')
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Icon(Icons.circle,
//                             size: 20, color: AppColors.kSecondColor),
//                         const SizedBox(width: 4),
//                         const TextWidget(text: 'Ücretli')
//                       ],
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
class HotelCardDetailsConditionsWidget extends StatelessWidget {
  const HotelCardDetailsConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> freeServices = [];
    List<String> paidServices = [];
    List<String> unknownServices = [];

    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);

    for (var item in hotelCubit.hotelDetailsValue!.hotelFacilities) {
      if (item.feeType == 0) {
        unknownServices.add(item.name!);
      } else if (item.feeType == 1) {
        freeServices.add(item.name!);
      } else if (item.feeType == 2) {
        paidServices.add(item.name!);
      }
    }

    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container(
          height: context.height * 0.65,
          width: context.width * 1,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  freeServices.isEmpty
                      ? const SizedBox()
                      : Stack(
                          children: [
                            Container(
                              width: context.width * 1,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 30, bottom: 8),
                                child: Wrap(
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: freeServices.map((name) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 6.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.green, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: TextWidget(
                                        text: name,
                                        fontSize: 14,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                  ),
                                  color: Colors.green.shade400,
                                ),
                                height: 25,
                                width: 100,
                                child: Center(
                                    child: TextWidget(
                                  text: S.of(context).Free,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                          ],
                        ),
                  freeServices.isEmpty
                      ? const SizedBox()
                      : const SizedBox(
                          height: 10,
                        ),
                  unknownServices.isEmpty
                      ? const SizedBox()
                      : Stack(
                          children: [
                            Container(
                              width: context.width * 1,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 30, bottom: 8),
                                child: Wrap(
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: unknownServices.map((name) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 6.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: TextWidget(
                                        text: name,
                                        fontSize: 14,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                  ),
                                  color: Colors.grey,
                                ),
                                height: 25,
                                width: 100,
                                child: Center(
                                    child: TextWidget(
                                  text: S.of(context).Unknown,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                          ],
                        ),
                  unknownServices.isEmpty
                      ? const SizedBox()
                      : const SizedBox(
                          height: 10,
                        ),
                  paidServices.isEmpty
                      ? const SizedBox()
                      : Stack(
                          children: [
                            Container(
                              width: context.width * 1,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.shade300, width: 2.0),
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 30, bottom: 8),
                                child: Wrap(
                                  spacing: 8.0,
                                  runSpacing: 4.0,
                                  children: paidServices.map((name) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0, vertical: 6.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.red, width: 1.0),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: TextWidget(
                                        text: name,
                                        fontSize: 14,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                  ),
                                  color: Colors.red.shade400,
                                ),
                                height: 25,
                                width: 100,
                                child: Center(
                                    child: TextWidget(
                                  text: S.of(context).Paid,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                              ),
                            ),
                          ],
                        ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
