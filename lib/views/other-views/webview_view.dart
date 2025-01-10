import 'package:bamobile1/cubit/auth-cubit/auth_cubit.dart';
import 'package:bamobile1/cubit/flight_ticket-cubit/flight_ticket_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/utils/app_colors.dart';
import 'package:bamobile1/utils/app_images.dart';
import 'package:bamobile1/utils/app_sizes.dart';
import 'package:bamobile1/views/other-views/flight-other-views/flight_reservation_details_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/get_reservations_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_payment_data_enter_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_result_view.dart';
import 'package:bamobile1/widgets/app_bar_widget.dart';
import 'package:bamobile1/widgets/transaction_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewView extends StatefulWidget {
  const WebViewView({super.key});
  static String id = 'WebViewView';

  @override
  State<WebViewView> createState() => _WebViewViewState();
}

class _WebViewViewState extends State<WebViewView> {
  bool _showWebView = true;
  bool _isSuccess = false;

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    FlightTicketCubit flightTicketCubit =
        BlocProvider.of<FlightTicketCubit>(context);
    final String receivedData =
        ModalRoute.of(context)!.settings.arguments as String;

    final WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            print('Page Finished Loading. URL: $url');
            final Uri uri = Uri.parse(url);
            if (uri.queryParameters['success'] == "True") {
              setState(() {
                BlocProvider.of<FlightTicketCubit>(context)
                        .savedSystemPnrFromUrlForResultView =
                    uri.queryParameters['systempnr'];
                print(
                    'savedSystemPnrFromUrlForResultView: ${BlocProvider.of<FlightTicketCubit>(context).savedSystemPnrFromUrlForResultView}');
                _isSuccess = true;
                _showWebView = false;
              });
            } else if (uri.queryParameters['success'] == "False") {
              BlocProvider.of<FlightTicketCubit>(context)
                      .savedErrorCodeFromUrlForResultView =
                  uri.queryParameters['errorcode'];
              BlocProvider.of<FlightTicketCubit>(context)
                      .savedErrorMassageFromUrlForResultView =
                  uri.queryParameters['errormessage'];
              setState(() {
                _showWebView = false;
              });
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(receivedData));

    URL:
    https: //www.bookingagora.com/?success=True&systempnr=4HQD10U5K6

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        toolbarHeight: context.height * 0.06,
        automaticallyImplyLeading: false,
        title: AppBarWidget(
          onPressedLeading: () {},
          title: 'Ödeme Sayfası',
        ),
        backgroundColor: AppColors.kAppBarColor,
      ),
      body: _showWebView
          ? WebViewWidget(controller: controller)
          : _isSuccess
              ? TransactionResultWidget(
                  image: AppImages.doneIcon,
                  title:
                      S.of(context).YourTransactionHasBeenSuccessfullyCompleted,
                  buttonText: S.of(context).ReservationDetails,
                  onTap: () async {
                    // BlocProvider.of<FlightTicketCubit>(context)
                    //     .getBookingDetails();
                    // Navigator.pushReplacementNamed(
                    //   context,
                    //   FlightTicketResultView.id,
                    // );
                    flightTicketCubit.paxInfoList.clear();
                    flightTicketCubit
                            .checkIsAnyOneNullOrNotCompleatForReservationValue =
                        false;
                    flightTicketCubit.selectedPaymentTypeForReservation = null;
                    flightTicketCubit.paymentTypesShow = false;
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
                    //flightTicketCubit.passengerCardDataList = [];
                    flightTicketCubit.selectPaymentType = null;
                    flightTicketCubit.email = null;
                    flightTicketCubit.phoneNo = null;
                    flightTicketCubit.totalPrice = 0.0;
                    flightTicketCubit.priceValue = 0.0;
                    flightTicketCubit.flightSearchResultGo = [];
                    flightTicketCubit.flightSearchResultsMainList = [];
                    flightTicketCubit.afterRefreshFlightSearchResultsLeaving =
                        [];
                    flightTicketCubit.afterRefreshFlightSearchResultsReturn =
                        [];

                    flightTicketCubit.firstCityCode =
                        flightTicketCubit.fromAirportCode;
                    flightTicketCubit.secondCityCode =
                        flightTicketCubit.toAirportCode;
                    flightTicketCubit.firstSearchCity =
                        flightTicketCubit.fromCityCode;
                    flightTicketCubit.secondSearchCity =
                        flightTicketCubit.toCityCode;

                    flightTicketCubit.binCode = null;
                    flightTicketCubit.creditCardName = null;
                    flightTicketCubit.creditCardNumber = null;
                    flightTicketCubit.creditCardCvv = null;
                    flightTicketCubit.creditCardMonthAndYear = null;
                    flightTicketCubit.dateTime = DateTime.now();
                    flightTicketCubit.dateTimeRange = DateTimeRange(
                        start: DateTime.now(),
                        end: DateTime.now().add(const Duration(days: 7)));
                    if (authCubit.thisUserIsAgent == false) {
                    } else {
                      await BlocProvider.of<FlightTicketCubit>(context)
                          .getReservations(context);
                      print(
                          'getReservations.length: ${flightTicketCubit.getReservationsList.length}');
                      print(
                          'flightTicketCubit.pnrSystemForResultView: ${flightTicketCubit.pnrSystemForReservationCard}');
                      for (var item in flightTicketCubit.getReservationsList) {
                        print(item.systemPnr); // لطباعة قيمة systemPnr لكل عنصر
                      }
                      int index = flightTicketCubit.getReservationsList
                          .indexWhere((item) =>
                              item.systemPnr ==
                              flightTicketCubit.pnrSystemForReservationCard);
                      print('index: $index');
                      flightTicketCubit.saveReservationIndexFunction(
                          index: index);
                      print(
                          'flightTicketCubit.saveReservationIndexValue: ${flightTicketCubit.saveReservationIndexValue}');

                      Navigator.pushReplacementNamed(
                          context, FlightReservationDetailsView.id);
                    }
                  },
                )
              : TransactionResultWidget(
                  image: AppImages.errorIcon,
                  title: 'İşlem Başarısız',
                  subTitle: BlocProvider.of<FlightTicketCubit>(context)
                      .savedErrorMassageFromUrlForResultView!,
                  code: BlocProvider.of<FlightTicketCubit>(context)
                      .savedErrorCodeFromUrlForResultView!,
                  buttonText: 'Tekrar Dene',
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      FlightTicketPaymentDataEnterView.id,
                    );
                  },
                ),
    );
  }
}















//URL: https://www.bookingagora.com/?success=False&errorcode=0000&errormessage=Bank%20Error%20(0):%20%20-