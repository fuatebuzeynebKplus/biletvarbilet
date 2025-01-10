import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/cubit/hotel-cubit/hotel_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/hotel-widgets/hotel-guest-details-view-widgets/hotel_select_phone_widget.dart';
import 'package:bamobile1/widgets/text_field_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-passenger-details-widgets/select_phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HotelContactInfoForGuestCardWidget extends StatelessWidget {
  const HotelContactInfoForGuestCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HotelCubit hotelCubit = BlocProvider.of<HotelCubit>(context);
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    GlobalKey<FormState> formKeyInHotelContactInfoForGuestCardWidget =
        GlobalKey();
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            // height: context.height * 0.18,
            child: Form(
              key: formKeyInHotelContactInfoForGuestCardWidget,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: AppColors.kSecondColor,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      TextWidget(
                        text: S.of(context).ContactInformation,
                        color: Colors.black45,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 35,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: TextFieldWidget(
                            initialValue:
                                authCubit.agentEmail ?? hotelCubit.email ?? '',
                            hint: S.of(context).EMail,
                            textInputType: TextInputType.emailAddress,
                            onChanged: (value) {
                              hotelCubit.email = value;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const HotelSelectPhoneWidget(),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
