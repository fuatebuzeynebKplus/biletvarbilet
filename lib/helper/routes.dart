import 'package:bamobile1/pdf_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/hotel_reservation_details_view.dart';
import 'package:bamobile1/views/other-views/sign_up_view.dart';

import 'package:bamobile1/views/other-views/tow_factor_login_view.dart';
import 'package:bamobile1/views/ticket-views/multi_point_views/flight_ticket_select_multi_point_seat_view.dart';
import 'package:bamobile1/widgets/get-booking-widgets/book_details_view.dart';
import 'package:bamobile1/widgets/ticket-widgets/flight-ticket-select-seat-type-widgets/new_fare_card.dart';
import 'package:bamobile1/views/hotel-views/hotel_guest_data_enter_view.dart';
import 'package:bamobile1/views/hotel-views/hotel_guest_details_view.dart';
import 'package:bamobile1/views/hotel-views/hotel_payment_data_enter_view.dart';
import 'package:bamobile1/views/hotel-views/hotel_search_conclusion_view.dart';
import 'package:bamobile1/views/hotel-views/hotel_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/filter_views/airline_filter_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/filter_views/airports_filter_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/filter_views/cabin_filter_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/filter_views/flight_providers_filter_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/filter_views/luggage_filter_view.dart';
import 'package:bamobile1/views/other-views/flight-other-views/flight_reservation_details_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_book_result.dart';
import 'package:bamobile1/views/other-views/flight-other-views/get_reservations_view.dart';
import 'package:bamobile1/views/other-views/splash_view.dart';
import 'package:bamobile1/views/other-views/webview_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_passenger_data_enter_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_passenger_details_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_payment_data_enter_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_result_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_search_conclusion_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_select_seat_view.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_view.dart';
import 'package:bamobile1/views/main_views/home_view.dart';
import 'package:bamobile1/views/other-views/sign_in_view.dart';
import 'package:bamobile1/bottom_nav_bar.dart';

import 'package:bamobile1/views/ticket-views/multi_point_views/flight_ticket_search_conclusion_multi_point_view.dart';

import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  //---------------flight ticket-------------------
  SignUpView.id: (context) => const SignUpView(),
  SignInView.id: (context) => const SignInView(),
  SplashView.id: (context) => const SplashView(),
  HomeView.id: (context) => const HomeView(),
  BottomNavBar.id: (context) => const BottomNavBar(),
  FlightTicketView.id: (context) => const FlightTicketView(),
  WebViewView.id: (context) => const WebViewView(),
  FlightTicketSearchConclusionView.id: (context) =>
      const FlightTicketSearchConclusionView(),
  FlightTicketSelectSeatView.id: (context) =>
      const FlightTicketSelectSeatView(),
  FlightTicketBookResult.id: (context) => const FlightTicketBookResult(),
  FlightTicketPassengerDetailsView.id: (context) =>
      const FlightTicketPassengerDetailsView(),
  FlightTicketPassengerDataEnterView.id: (context) =>
      const FlightTicketPassengerDataEnterView(),
  FlightTicketPaymentDataEnterView.id: (context) =>
      const FlightTicketPaymentDataEnterView(),
  AirLineFilterView.id: (context) => const AirLineFilterView(),
  LuggageFilterView.id: (context) => const LuggageFilterView(),
  FlightProvidersFilterView.id: (context) => const FlightProvidersFilterView(),
  AirPortFilterView.id: (context) => const AirPortFilterView(),
  CabinTypeFilterView.id: (context) => const CabinTypeFilterView(),
  GetReservationsView.id: (context) => const GetReservationsView(),
  FlightReservationDetailsView.id: (context) =>
      const FlightReservationDetailsView(),
  FlightTicketSearchConclusionMultiPointView.id: (context) =>
      const FlightTicketSearchConclusionMultiPointView(),

  FlightTicketSelectMultiPointSeatView.id: (context) =>
      const FlightTicketSelectMultiPointSeatView(),
  PdfPreviewScreen.id: (context) => const PdfPreviewScreen(),
  TowFactorLogin.id: (context) => const TowFactorLogin(),
  BookDetailsView.id: (context) => const BookDetailsView(),

  //----------------------hotel-------------------------
  HotelView.id: (context) => const HotelView(),
  HotelSearchConclusionView.id: (context) => const HotelSearchConclusionView(),
  HotelGuestDetailsView.id: (context) => const HotelGuestDetailsView(),
  HotelGuestDataEnterView.id: (context) => const HotelGuestDataEnterView(),
  HotelPaymentDataEnterView.id: (context) => const HotelPaymentDataEnterView(),
  HotelReservationDetailsView.id: (context) =>
      const HotelReservationDetailsView(),
};
