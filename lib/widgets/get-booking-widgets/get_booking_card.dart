import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/flight/data/models/get_voucher.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/widgets/button_widget.dart';
import 'package:bamobile1/widgets/get-booking-widgets/book_details_view.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/non_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/one_stop_design_widget.dart';
import 'package:bamobile1/widgets/stop-or-non-design-widgets/two_stop_design_widget.dart';
import 'package:bamobile1/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class GetBookingCard extends StatelessWidget {
  const GetBookingCard({super.key});

  @override
  Widget build(BuildContext context) {
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);

    var result = flightTicketCubit
        .getBookingModelDetails!.result!.flightBookingList.first;

    var contactInfo = flightTicketCubit.getBookingModelDetails!.result!;
    DateTime? arriveTime;
    String? arrivalAirportCode;
    int stopCount = result.legs.length;
    BookingStatusType bookingStatusTypeValue =
        BookingStatusType.reservationFailed;
    // تحويل من القيم (int) إلى التعداد (enum)

    switch (contactInfo.bookingStatusType!) {
      case 1:
        bookingStatusTypeValue = BookingStatusType.reservationSucceed;
      case 2:
        bookingStatusTypeValue = BookingStatusType.reservationFailed;
      case 3:
        bookingStatusTypeValue = BookingStatusType.reservationExpired;
      case 4:
        bookingStatusTypeValue = BookingStatusType.reservationCancelled;
      case 6:
        bookingStatusTypeValue = BookingStatusType.ticketingFailed;
      case 7:
        bookingStatusTypeValue = BookingStatusType.ticketingSucceed;
      case 8:
        bookingStatusTypeValue = BookingStatusType.ticketingCancelled;
      case 12:
        bookingStatusTypeValue = BookingStatusType.reservationChanged;
      case 13:
        bookingStatusTypeValue = BookingStatusType.ticketingChanged;
      case 14:
        bookingStatusTypeValue = BookingStatusType.cancellationPending;
      case 16:
        bookingStatusTypeValue = BookingStatusType.ticketingVoid;
    }
    for (var element in result.legs) {
      if (element.isConnectedToNextFlight == false) {
        arrivalAirportCode = element.arrivalAirport?.code;
        arriveTime = element.arrivalDate;
        break;
      }
    }
    Alignment alignment =
        getIt<CacheHelper>().getDataString(key: 'Lang') == 'ar'
            ? Alignment.centerRight
            : Alignment.bottomLeft;
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
                      result.legs.first.ticketingAirline!.logo!,
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
                          text: '${result.legs.first.departureAirport!.code}',
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        SizedBox(
                          width: context.width * 0.005,
                        ),
                        TextWidget(
                          text: DateFormat.Hm()
                              .format(result.legs.first.departureDate!),
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
                          text: DateFormat.Hm().format(arriveTime!),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: context.width * 0.005,
                        ),
                        TextWidget(
                          text: '$arrivalAirportCode',
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
                          text: result.legs.last.arrivalDate!.day.toString(),
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
                              text: DateFormat.MMM().format(DateTime(
                                result.legs.last.arrivalDate!.month, // الشهر
                              )),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                            TextWidget(
                              text:
                                  result.legs.last.arrivalDate!.year.toString(),
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
                            text:
                                '${contactInfo.contactInfo!.firstName} ${contactInfo.contactInfo!.lastName}', // totalPrice!,
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
                            text: '${contactInfo.systemPnr}', // totalPrice!,
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
                                '${flightTicketCubit.formatNumber(BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(itemPrice: contactInfo.amount!.baseBuyAmount!, appCurrencyExchangeRate: BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!, ticketCurrencyCode: contactInfo.amount!.currencyCode!))} ${BlocProvider.of<CurrencyCodeCubit>(context).currencyCodeValue}',
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
                            text: BookingStatusType.fromValue(
                                    bookingStatusTypeValue)
                                .description(context),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: bookingStatusTypeValue ==
                                    BookingStatusType.reservationSucceed
                                ? Colors.orange
                                : bookingStatusTypeValue ==
                                        BookingStatusType.ticketingSucceed
                                    ? Colors.green
                                    : bookingStatusTypeValue ==
                                                BookingStatusType
                                                    .reservationCancelled ||
                                            bookingStatusTypeValue ==
                                                BookingStatusType
                                                    .ticketingCancelled
                                        ? Colors.red
                                        : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    if (BookingStatusType.reservationSucceed ==
                        BookingStatusType.reservationSucceed)
                      TableRow(
                        children: [
                          Container(
                            alignment: alignment, // محاذاة النص إلى اليسار
                            child: TextWidget(
                              text:
                                  '${S.of(context).TransactionDate}:', // totalPrice!,
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
                                          contactInfo.bookingDate ??
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
                    flightTicketCubit.getVoucher(
                        GetVoucherJson(
                            request: GetVoucher(
                          tokenCode: getIt<CacheHelper>()
                                  .getDataString(key: 'token') ??
                              "",
                          systemPnr: flightTicketCubit.systemPnrForGetBook!,
                          lastName: flightTicketCubit.lastNameForGetBook!,
                          productType: 0,
                          languageCode:
                              getIt<CacheHelper>().getDataString(key: 'lang') ??
                                  "en",
                          withPrice: true,
                        )),
                        context);
                    Navigator.pushNamed(context, BookDetailsView.id);
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
