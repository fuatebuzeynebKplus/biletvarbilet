import 'package:bamobile1/bottom_nav_bar.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionResultWidget extends StatelessWidget {
  const TransactionResultWidget({
    super.key,
    required this.image,
    required this.title,
    this.subTitle,
    this.code,
    required this.buttonText,
    this.onTap,
  });
  final String image;
  final String title;
  final String? subTitle;
  final String? code;
  final String buttonText;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          width: context.width * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: context.height * 0.15,
                  ),
                  Image.asset(
                    image,
                    height: 150,
                    width: 130,
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  TextWidget(
                    text: title,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  TextWidget(
                    text: subTitle ?? '',
                    fontSize: 12,
                  ),
                  SizedBox(
                    height: context.height * 0.005,
                  ),
                  TextWidget(
                    text: code ?? '',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                child: Column(
                  children: [
                    ButtonWidget(
                      onTap: onTap,
                      border: Border.all(color: AppColors.kSecondColor),
                      title: buttonText,
                      height: 0.055,
                      width: 1,
                      fontSize: 18,
                      textColor: AppColors.kSecondColor,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: context.height * 0.01,
                    ),
                    ButtonWidget(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          BottomNavBar.id,
                          (Route<dynamic> route) => false,
                        );
                        flightTicketCubit.paxInfoList.clear();
                        flightTicketCubit.bottomSheetValue(type: 0);
                        flightTicketCubit.clearAll(type: 'sdfs');
                        flightTicketCubit.selectedCardLeaving = null;
                        flightTicketCubit.selectedCardReturn = null;
                        flightTicketCubit.selectedSeatTypeLeaving = null;
                        flightTicketCubit.selectedSeatTypeReturn = null;
                        flightTicketCubit.isVisibilitySeatType = false;
                        flightTicketCubit.isVisibility = false;
                        flightTicketCubit.validateKeyOneWay = null;
                        flightTicketCubit.validateKeyReturn = null;
                        flightTicketCubit.validateKeyList = [];
                        flightTicketCubit.passengerCardDataList = [];
                        flightTicketCubit.selectPaymentType = null;
                        flightTicketCubit.email = null;
                        flightTicketCubit.phoneNo = null;
                        flightTicketCubit.totalPrice = 0.0;
                        flightTicketCubit.priceValue = 0.0;
                        flightTicketCubit.dateTime = null;
                        flightTicketCubit.dateTimeRange = null;
                        // flightTicketCubit.flightSearchResultGo = [];
                        // flightTicketCubit.flightSearchResultsMainList = [];
                        // flightTicketCubit
                        //     .afterRefreshFlightSearchResultsLeaving = [];
                        // flightTicketCubit
                        //     .afterRefreshFlightSearchResultsReturn = [];
                        flightTicketCubit.firstCityCode =
                            flightTicketCubit.fromAirportCode;
                        flightTicketCubit.secondCityCode =
                            flightTicketCubit.toAirportCode;
                        flightTicketCubit.firstSearchCity =
                            flightTicketCubit.fromCityCode;
                        flightTicketCubit.secondSearchCity =
                            flightTicketCubit.toCityCode;

                        flightTicketCubit.dateTime = DateTime.now();
                        flightTicketCubit.dateTimeRange = DateTimeRange(
                            start: DateTime.now(),
                            end: DateTime.now().add(const Duration(days: 7)));
                        flightTicketCubit.binCode = null;
                        flightTicketCubit.creditCardName = null;
                        flightTicketCubit.creditCardNumber = null;
                        flightTicketCubit.creditCardCvv = null;
                        flightTicketCubit.creditCardMonthAndYear = null;
                      },
                      title: S.of(context).BackToHome,
                      height: 0.055,
                      width: 1,
                      fontSize: 18,
                      textColor: Colors.white,
                      fontWeight: FontWeight.bold,
                      color: AppColors.kSecondColor,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
