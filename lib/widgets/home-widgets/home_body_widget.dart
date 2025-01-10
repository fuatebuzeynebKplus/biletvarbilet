import 'package:bamobile1/cubit/settings-app/settings_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/views/hotel-views/hotel_view.dart';
import 'package:bamobile1/views/main_views/home_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_view.dart';
import 'package:bamobile1/widgets/home-widgets/home_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeCardWidget(
          onTap: () {
            Navigator.pushNamed(context, FlightTicketView.id);
          },
          title: S.of(context).FlightTicket,
          icon: Icons.airplane_ticket,
        ),
        const SizedBox(
          height: 12,
        ),
        // HomeCardWidget(
        //   onTap: () {
        //     Navigator.pushNamed(context, HotelView.id);
        //   },
        //   title: S.of(context).Hotel,
        //   icon: Icons.hotel,
        // ),

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     HomeCardWidget(
        //       title: S.of(context).RentCar,
        //       icon: Icons.directions_car,
        //     ),
        //     HomeCardWidget(
        //       title: S.of(context).Tur,
        //       icon: Icons.travel_explore,
        //     ),
        //     HomeCardWidget(
        //       title: S.of(context).Visa,
        //       icon: FontAwesomeIcons.passport,
        //     ),
        //   ],
        // ),
        // const SizedBox(
        //   height: 12,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     HomeCardWidget(
        //       title: S.of(context).GroupRequests,
        //       icon: Icons.group,
        //     ),
        //     HomeCardWidget(
        //       title: S.of(context).AmusementPackage,
        //       icon: Icons.redeem_rounded,
        //     ),
        //     HomeCardWidget(
        //       title: S.of(context).Events,
        //       icon: Icons.celebration,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
