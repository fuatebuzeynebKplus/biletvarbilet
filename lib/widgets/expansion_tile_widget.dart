import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/air_fare_service.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    List<AirFareService>? fareServices;

    if (flightTicketCubit.searchTypeValue == 'tek') {
      fareServices = flightTicketCubit.flightFaresLeaving![0].fares![index]
          .fareAlternativeLegs![0].fareServices;
    } else {
      fareServices = flightTicketCubit.flightFaresLeaving!.first.fares![index]
          .fareAlternativeLegs![0].fareServices;
    }

    List<String> faresList = [];

    for (var fares in fareServices!) {
      faresList.add(fares.title!);
    }
    return ExpansionTile(
      shape: const StadiumBorder(side: BorderSide.none),
      tilePadding: const EdgeInsets.all(0),
      title: Row(
        children: [
          TextWidget(
            text: S.of(context).MoreInformation,
            fontSize: 12,
            color: AppColors.kSecondColor,
            fontWeight: FontWeight.bold,
          ),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
      iconColor: AppColors.kSecondColor,
      collapsedIconColor: AppColors.kSecondColor,
      trailing: const SizedBox(),
      children: [
        SizedBox(
            height: context.height * 0.1,
            child: ListView.builder(
              itemCount: fareServices.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Icon(
                      Icons.done,
                      color: AppColors.kSecondColor,
                      size: 20,
                    ),
                    TextWidget(
                      text: '${faresList[index]} $index',
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ],
                );
              },
            ))
      ],
    );
  }
}
