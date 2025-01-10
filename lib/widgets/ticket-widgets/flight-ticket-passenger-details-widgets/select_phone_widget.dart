import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/widgets/text_field_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectPhoneWidget extends StatelessWidget {
  const SelectPhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKeyInSelectPhoneWidget = GlobalKey();

    return BlocBuilder<FlightTicketCubit, FlightTicketState>(
      builder: (context, state) {
        FlightTicketCubit flightTicketCubit =
            BlocProvider.of<FlightTicketCubit>(context);
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: formKeyInSelectPhoneWidget,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CountryCodePicker(
                padding: const EdgeInsets.all(0),
                onChanged: (c) {
                  flightTicketCubit.countryPhone = c.dialCode;
                },
                initialSelection: 'TR',
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                favorite: const ['CA', 'TR'],
              ),
              Expanded(
                child: TextFieldWidget(
                  initialValue: '',
                  textInputType: TextInputType.phone,
                  hint: S.of(context).PhoneNumber,
                  onChanged: (value) {
                    flightTicketCubit.phoneNo = value;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
