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
import 'package:bamobile1/views/other-views/flight-other-views/hotel_reservation_details_view.dart';
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

class HotelReservationsCardWidget extends StatelessWidget {
  const HotelReservationsCardWidget({
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
    String? hotelName;
    String? firstName;
    String? lastName;
    double price = 0.0;
    String? systemPnr;
    BookingStatusType? reservationState;
    DateTime? expirationDate;
    DateTime? checkInDate;
    DateTime? checkOutDate;

    checkOutDate = (DateTime.parse(
        howListIsComing[index].hotelBookingList?.first["CheckOutDate"]));
    checkInDate = DateTime.parse(
        howListIsComing[index].hotelBookingList?.first["CheckInDate"]);
    firstName = howListIsComing[index].contactInfo?.firstName;
    lastName = howListIsComing[index].contactInfo?.lastName;
    logo = howListIsComing[index].hotelBookingList?.first["HotelInfo"]
        ["HotelImageURL"];
    hotelName = howListIsComing[index].hotelBookingList?.first["HotelInfo"]
        ["HotelName"];
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
//mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8.0), // درجة انحناء الحواف
                      child: Image.network(
                        logo ?? '',
                        height: context.width * 0.2,
                        width: context.width * 0.2,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/no_Image.png',
                            height: context.width * 0.2,
                            width: context.width * 0.2,
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: hotelName!.length > 31
                              ? '${hotelName.substring(0, 31)}...'
                              : hotelName,
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        TextWidget(
                            text:
                                'Giriş Tarihi: ${DateFormat('dd.MM.yyyy').format(checkInDate ?? DateTime.now())}',
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                        TextWidget(
                            text:
                                'Çıkış Tarihi: ${DateFormat('dd.MM.yyyy').format(checkOutDate ?? DateTime.now())}',
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ],
                    )
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
                          alignment:
                              Alignment.centerLeft, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text:
                                '${S.of(context).Name} ${S.of(context).LastName}:', // totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          alignment:
                              Alignment.centerLeft, // محاذاة النص إلى اليسار
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
                          alignment:
                              Alignment.centerLeft, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text:
                                '${S.of(context).ReservationNumber}:', // totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          alignment:
                              Alignment.centerLeft, // محاذاة النص إلى اليسار
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
                          alignment:
                              Alignment.centerLeft, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text: S.of(context).TotalCharge, // totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          alignment:
                              Alignment.centerLeft, // محاذاة النص إلى اليسار
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
                          alignment:
                              Alignment.centerLeft, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text:
                                '${S.of(context).Reservation}:', // totalPrice!,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          alignment:
                              Alignment.centerLeft, // محاذاة النص إلى اليسار
                          child: TextWidget(
                            text: BookingStatusType.fromValue(reservationState!)
                                .description(context), // totalPrice!,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: reservationState ==
                                    BookingStatusType.reservationSucceed
                                ? AppColors.kSecondColor
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
                            alignment:
                                Alignment.centerLeft, // محاذاة النص إلى اليسار
                            child: TextWidget(
                              text:
                                  '${S.of(context).ExpirationDate}:', // totalPrice!,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            alignment:
                                Alignment.centerLeft, // محاذاة النص إلى اليسار
                            child: TextWidget(
                              text: DateFormat('dd.MM.yyyy HH:mm').format(
                                  expirationDate ??
                                      DateTime.now()), // totalPrice!,
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
                    print('************************************');
                    Navigator.pushNamed(
                      context,
                      HotelReservationDetailsView.id,
                    );
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
