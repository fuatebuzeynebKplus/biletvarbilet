import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectNationalityWidget extends StatelessWidget {
  const SelectNationalityWidget({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: S.of(context).Nationality,
                fontSize: 14,
                color: Colors.black54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CountryCodePicker(
                    padding: const EdgeInsets.all(0),
                    onChanged: (c) {
                      flightTicketCubit.nationality = c.code;
                      flightTicketCubit.checkIfGlobalFlyOrNot();
                    },
                    initialSelection: flightTicketCubit.nationality ??
                        (flightTicketCubit
                                .passengerCardDataList[index]?.nationality ??
                            'TR'),
                    // flightTicketCubit.passengerCardDataList[index] != null
                    //     ? flightTicketCubit
                    //         .passengerCardDataList[index]!.nationality
                    //     : 'TR',
                    // flightTicketCubit.passengerCardDataList[index] == null
                    //     ? 'TR'
                    //     :
                    // flightTicketCubit
                    //         .passengerCardDataList[index]?.nationality ??
                    //     'TR',
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: true,
                    favorite: const ['CA', 'TR'],
                  ),
                  Icon(
                    Icons.flag,
                    color: AppColors.kGrey,
                  )
                ],
              ),
              const SizedBox(
                height: 0,
                child: Divider(),
              ),
            ],
          ),
        );
      },
    );
  }
}

/*
  Widget build(BuildContext context) {
    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: S.of(context).Nationality,
                fontSize: 14,
                color: Colors.black54,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CountryCodePicker(
                    padding: const EdgeInsets.all(0),
                    onChanged: (c) {
                      flightTicketCubit.updateNationality(c.name!);
                    },
                    initialSelection: 'TR',
                    showCountryOnly: true,
                    showOnlyCountryWhenClosed: true,
                    favorite: const ['CA', 'TR'],
                  ),
                  Icon(
                    Icons.flag,
                    color: AppColors.kGrey,
                  )
                ],
              ),
              const SizedBox(
                height: 0,
                child: Divider(),
              ),
            ],
          ),
        );
      },
    );
  }

*/
