import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/flight_details_container_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/passengers_details_container_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/reservation_details_container_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  static String id = 'BookDetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform(
              transform: Matrix4.skewX(-0.15),
              child: const TextWidget(
                text: 'bilet',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Tajawal',
              ),
            ),
            Transform(
              transform: Matrix4.skewX(-0.2),
              child: TextWidget(
                text: 'Var',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.kSecondColor,
                fontFamily: 'Tajawal',
              ),
            ),
            Transform(
              transform: Matrix4.skewX(-0.15),
              child: const TextWidget(
                text: 'bilet',
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Tajawal',
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.kAppBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonWidget(
                  title: S.of(context).PriceVoucher,
                  height: 0.04,
                  width: 0.45,
                  fontSize: 14,
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  onTap: () {},
                ),
                ButtonWidget(
                  title: S.of(context).NonePriceVoucher,
                  height: 0.04,
                  width: 0.45,
                  fontSize: 14,
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const ReservationDetailsContainerWidget(),
            const SizedBox(
              height: 12,
            ),
            const PassengersDetailsContainerWidget(),
            const SizedBox(
              height: 12,
            ),
            const FlightDetailsContainerWidget(),
          ],
        ),
      ),
    );
  }
}
