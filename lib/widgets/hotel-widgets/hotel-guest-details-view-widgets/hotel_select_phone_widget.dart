import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/widgets/text_field_widget.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelSelectPhoneWidget extends StatelessWidget {
  const HotelSelectPhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    GlobalKey<FormState> formKeyInHotelSelectPhoneWidget = GlobalKey();
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        return Form(
          key: formKeyInHotelSelectPhoneWidget,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CountryCodePicker(
                padding: const EdgeInsets.all(0),
                onChanged: (c) {
                  hotelCubit.countryPhone = c.dialCode;
                },
                initialSelection: 'TR',
                showCountryOnly: false,
                showOnlyCountryWhenClosed: false,
                favorite: const ['CA', 'TR'],
              ),
              Expanded(
                child: TextFieldWidget(
                  initialValue: authCubit.agentPhone!
                          .split(' ')
                          .sublist(1)
                          .join(' ')
                          .replaceAll(' ', '') ??
                      hotelCubit.phoneNo ??
                      '',
                  textInputType: TextInputType.phone,
                  hint: S.of(context).PhoneNumber,
                  onChanged: (value) {
                    hotelCubit.phoneNo = value;
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
