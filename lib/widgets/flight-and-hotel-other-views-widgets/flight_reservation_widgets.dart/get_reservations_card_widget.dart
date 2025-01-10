import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/common/data/models/booking.dart';
import 'package:bamobile1/common/data/models/payment_option_request.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/get_voucher.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/hotel/data/models/payment_options.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/other-views/flight-other-views/flight_reservation_details_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/flight-and-hotel-other-views-widgets/flight_reservation_widgets.dart/get_reservations_card_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/two_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/title_for_list_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class GetReservationsCardWidget extends StatelessWidget {
  const GetReservationsCardWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    List<Booking> howListIsComing = [];

    howListIsComing = flightTicketCubit.getReservationsList;

    print('howListIsComing: ${howListIsComing.length}');
    print(
        '33getReservationsList: ${flightTicketCubit.getReservationsList.length}');
    String? logo;
    String? arriveTime;
    String? departureTime;
    String formattedDepartureTime = '';
    String? arrivalAirportCode;
    String formattedArriveTime = '';
    String? departureAirportCode;
    String formattedDepartureForStringMonth = '';
    int stopCount = 0;
    String? firstName;
    String? lastName;
    double price = 0.0;
    String? systemPnr;
    BookingStatusType? reservationState;
    DateTime? expirationDate;
    DateTime? dateArriveTime; // تعريف المتغير هنا

    Alignment alignment =
        getIt<CacheHelper>().getDataString(key: 'Lang') == 'ar'
            ? Alignment.centerRight
            : Alignment.bottomLeft;

    if (howListIsComing[index].flightBookingList != null &&
        howListIsComing[index].flightBookingList!.isNotEmpty) {
      var firstLeg = howListIsComing[index].flightBookingList!.first.legs;

      if (firstLeg != null && firstLeg.isNotEmpty) {
        logo = firstLeg.first.ticketingAirline?.logo;

        departureTime = firstLeg.first.departureDate;
        if (departureTime != null) {
          DateTime dateDepartureTime = DateTime.parse(departureTime);
          formattedDepartureTime = DateFormat.Hm().format(dateDepartureTime);
        }

        departureAirportCode = firstLeg.first.departureAirport?.code;

        for (var element in firstLeg) {
          if (element.isConnectedToNextFlight == false) {
            arrivalAirportCode = element.arrivalAirport?.code;
            arriveTime = element.arrivalDate;
            break;
          }
        }

        if (arriveTime != null) {
          dateArriveTime =
              DateTime.parse(arriveTime); // تعيين القيمة للمتغير dateArriveTime
          formattedArriveTime = DateFormat.Hm().format(dateArriveTime);
          formattedDepartureForStringMonth =
              DateFormat.MMM().format(dateArriveTime);
        }

        stopCount = firstLeg.length;
      }
    }

    firstName = howListIsComing[index].contactInfo?.firstName;
    lastName = howListIsComing[index].contactInfo?.lastName;

    if (flightTicketCubit.getReservationsList.isNotEmpty &&
        flightTicketCubit.getReservationsList[index].amount?.totalBuyAmount !=
            null) {
      price = flightTicketCubit
          .getReservationsList[index].amount!.totalBuyAmount!
          .toDouble();
    }

    systemPnr = howListIsComing[index].systemPnr;
    reservationState = howListIsComing[index].bookingStatusType;

    if (howListIsComing[index].expirationDate != null) {
      expirationDate =
          DateTime.parse(howListIsComing[index].expirationDate!).toLocal();
    }

    return BlocConsumer<FlightTicketCubit, FlightTicketState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 6, top: 2),
          child: Container(
            padding: const EdgeInsets.all(8),
            width: context.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.kSecondColor, width: 1),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Image.network(
                      logo ?? '',
                      height: context.width * 0.06,
                      width: context.width * 0.13,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/no_Image.png',
                          height: context.width * 0.06,
                          width: context.width * 0.12,
                        );
                      },
                    ),
                    // const SizedBox(
                    //   width: 8,
                    // ),
                    SizedBox(
                      width: context.width * 0.02,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: departureAirportCode ?? '',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        TextWidget(
                          text: flightTicketCubit.convertArabicNumbersToEnglish(
                              formattedDepartureTime),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: context.width * 0.01,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        stopCount == 1
                            ? const NonStopDesignWidget(
                                dividerWidth: 0.05,
                                text: false,
                              )
                            : stopCount == 2
                                ? const OneStopDesignWidget(
                                    dividerWidth: 0.05,
                                    text: false,
                                  )
                                : const TwoStopDesignWidget(
                                    dividerWidth: 0.05,
                                    text: false,
                                  ),
                      ],
                    ),
                    SizedBox(
                      width: context.width * 0.01,
                    ),
                    Row(
                      children: [
                        TextWidget(
                          text: flightTicketCubit.convertArabicNumbersToEnglish(
                              formattedArriveTime),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        TextWidget(
                          text: ' $arrivalAirportCode',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: context.width * 0.02,
                    ),

                    Row(
                      children: [
                        TextWidget(
                          text: '${dateArriveTime?.day.toString()}',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: context.width * 0.01,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              text: formattedDepartureForStringMonth,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                            TextWidget(
                              text: '${dateArriveTime?.year.toString()}',
                              fontSize: 10,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Table(
                  columnWidths: {
                    0: FixedColumnWidth(
                        context.width * 0.47), // عرض العمود الأول
                  },
                  children: [
                    TableRow(
                      children: [
                        Container(
                          alignment: alignment, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text:
                                '${S.of(context).Name} ${S.of(context).LastName}:', // totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          alignment: alignment, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text: '$firstName $lastName', // totalPrice!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          alignment: alignment, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text:
                                '${S.of(context).ReservationNumber}:', // totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          alignment: alignment, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text: '$systemPnr', // totalPrice!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          alignment: alignment, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text: S.of(context).TotalCharge, // totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          alignment: alignment, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text:
                                '${flightTicketCubit.formatNumber(BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(itemPrice: price, appCurrencyExchangeRate: BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!, ticketCurrencyCode: flightTicketCubit.getReservationsList[index].amount!.currencyCode!))} ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        Container(
                          alignment: alignment, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text:
                                '${S.of(context).Reservation}:', // totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          alignment: alignment, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text: BookingStatusType.fromValue(reservationState!)
                                .description(context), // totalPrice!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: reservationState ==
                                    BookingStatusType.reservationSucceed
                                ? Colors.orange
                                : reservationState ==
                                        BookingStatusType.ticketingSucceed
                                    ? Colors.green
                                    : reservationState ==
                                                BookingStatusType
                                                    .reservationCancelled ||
                                            reservationState ==
                                                BookingStatusType
                                                    .ticketingCancelled
                                        ? Colors.red
                                        : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    if (reservationState ==
                        BookingStatusType.reservationSucceed)
                      TableRow(
                        children: [
                          Container(
                            alignment: alignment, // محاذاة النص إلى اليسار
                            child: TextWidget(
                              text:
                                  '${S.of(context).ExpirationDate}:', // totalPrice!,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            alignment: alignment, // محاذاة النص إلى اليسار
                            child: TextWidget(
                              text: flightTicketCubit
                                  .convertArabicNumbersToEnglish(
                                      DateFormat('dd.MM.yyyy HH:mm').format(
                                          expirationDate ??
                                              DateTime.now())), // totalPrice!,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ButtonWidget(
                  title: S.of(context).ReservationDetails,
                  onTap: () {
                    flightTicketCubit.saveReservationIndexFunction(
                        index: index);

                    flightTicketCubit.paymentTypesShow = false;
                    flightTicketCubit.selectedPaymentTypeForReservation = null;

                    if (reservationState ==
                        BookingStatusType.reservationSucceed) {
                      flightTicketCubit.getPaymentOptions(
                          PaymentOptionRequestJson(
                            request: PaymentOptionRequest(
                              resultKeys: [],
                              systemPnr: '$systemPnr',
                              tokenCode: getIt<CacheHelper>()
                                      .getDataString(key: 'token') ??
                                  "",
                            ),
                          ),
                          context);
                    }

                    Navigator.pushNamed(
                      context,
                      FlightReservationDetailsView.id,
                    );

                    flightTicketCubit.getVoucher(
                        GetVoucherJson(
                            request: GetVoucher(
                          tokenCode: getIt<CacheHelper>()
                                  .getDataString(key: 'token') ??
                              "",
                          systemPnr: flightTicketCubit
                              .getReservationsList[
                                  flightTicketCubit.saveReservationIndexValue!]
                              .systemPnr!,
                          lastName: flightTicketCubit
                              .getReservationsList[
                                  flightTicketCubit.saveReservationIndexValue!]
                              .flightBookingList!
                              .first
                              .paxList!
                              .first
                              .pax!
                              .lastName!,
                          productType: 0,
                          languageCode:
                              getIt<CacheHelper>().getDataString(key: 'lang') ??
                                  "en",
                          withPrice: true,
                        )),
                        context);
                  },
                  height: 0.04,
                  width: 0.6,
                  fontSize: 14,
                  textColor: Colors.white,
                  color: AppColors.kSecondColor,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
