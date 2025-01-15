import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/pdf_view.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/flight_details_container_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/passengers_details_container_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/reservation_details_container_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  static String id = 'BookDetailsView';
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        toolbarHeight: context.height * 0.06,
        automaticallyImplyLeading: false,
        title: AppBarWidget(
          title: S.of(context).ReservationInfo,
          onPressedLeading: () {
            Navigator.pop(context);
          },
          leading: Icons.arrow_back_ios,
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
                  onTap: () {
                    flightTicketCubit.voucherWithPrice = true;
                    Navigator.pushNamed(context, PdfPreviewScreen.id);
                  },
                ),
                ButtonWidget(
                  title: S.of(context).NonePriceVoucher,
                  height: 0.04,
                  width: 0.45,
                  fontSize: 14,
                  textColor: Colors.black,
                  fontWeight: FontWeight.bold,
                  onTap: () {
                    flightTicketCubit.voucherWithPrice = false;
                    Navigator.pushNamed(context, PdfPreviewScreen.id);
                  },
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
