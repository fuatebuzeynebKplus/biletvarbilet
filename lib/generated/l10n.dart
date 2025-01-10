// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Currency`
  String get Currency {
    return Intl.message(
      'Currency',
      name: 'Currency',
      desc: '',
      args: [],
    );
  }

  /// `Search for a Flight`
  String get SearchFlight {
    return Intl.message(
      'Search for a Flight',
      name: 'SearchFlight',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get Amount {
    return Intl.message(
      'Amount',
      name: 'Amount',
      desc: '',
      args: [],
    );
  }

  /// `Percent`
  String get Percent {
    return Intl.message(
      'Percent',
      name: 'Percent',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get Account {
    return Intl.message(
      'Account',
      name: 'Account',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Bookings`
  String get Bookings {
    return Intl.message(
      'Bookings',
      name: 'Bookings',
      desc: '',
      args: [],
    );
  }

  /// `Result Screen`
  String get ResultScreen {
    return Intl.message(
      'Result Screen',
      name: 'ResultScreen',
      desc: '',
      args: [],
    );
  }

  /// `Back To Home Screen`
  String get BackToHome {
    return Intl.message(
      'Back To Home Screen',
      name: 'BackToHome',
      desc: '',
      args: [],
    );
  }

  /// `A new version of the app is available. Update to enjoy the latest features and improvements.`
  String get UpdateMessage {
    return Intl.message(
      'A new version of the app is available. Update to enjoy the latest features and improvements.',
      name: 'UpdateMessage',
      desc: '',
      args: [],
    );
  }

  /// `Update Available !!`
  String get UpdateAvailable {
    return Intl.message(
      'Update Available !!',
      name: 'UpdateAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Unable to open the app store.`
  String get UnableToOpenTheAppStore {
    return Intl.message(
      'Unable to open the app store.',
      name: 'UnableToOpenTheAppStore',
      desc: '',
      args: [],
    );
  }

  /// `Click to update the app`
  String get ClickToUpdateTheApp {
    return Intl.message(
      'Click to update the app',
      name: 'ClickToUpdateTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Check-In`
  String get CheckInDate {
    return Intl.message(
      'Check-In',
      name: 'CheckInDate',
      desc: '',
      args: [],
    );
  }

  /// `Check-Out`
  String get CheckOutDate {
    return Intl.message(
      'Check-Out',
      name: 'CheckOutDate',
      desc: '',
      args: [],
    );
  }

  /// `Room Count`
  String get RoomCount {
    return Intl.message(
      'Room Count',
      name: 'RoomCount',
      desc: '',
      args: [],
    );
  }

  /// `Hotel Info`
  String get HotelInfo {
    return Intl.message(
      'Hotel Info',
      name: 'HotelInfo',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get TryAgain {
    return Intl.message(
      'Try Again',
      name: 'TryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Payment Failed!!`
  String get PaymentFailed {
    return Intl.message(
      'Payment Failed!!',
      name: 'PaymentFailed',
      desc: '',
      args: [],
    );
  }

  /// `Your transaction has been successfully completed`
  String get YourTransactionHasBeenSuccessfullyCompleted {
    return Intl.message(
      'Your transaction has been successfully completed',
      name: 'YourTransactionHasBeenSuccessfullyCompleted',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to exit the application?`
  String get AppCloseMessage {
    return Intl.message(
      'Are you sure you want to exit the application?',
      name: 'AppCloseMessage',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel the reservation?`
  String get ReservationCancelMessage {
    return Intl.message(
      'Are you sure you want to cancel the reservation?',
      name: 'ReservationCancelMessage',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to cancel the ticket?`
  String get TicketCancelMessage {
    return Intl.message(
      'Are you sure you want to cancel the ticket?',
      name: 'TicketCancelMessage',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get Yes {
    return Intl.message(
      'Yes',
      name: 'Yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get No {
    return Intl.message(
      'No',
      name: 'No',
      desc: '',
      args: [],
    );
  }

  /// `Agency Payment`
  String get AgencyPayment {
    return Intl.message(
      'Agency Payment',
      name: 'AgencyPayment',
      desc: '',
      args: [],
    );
  }

  /// `Customer Payment`
  String get CustomerPayment {
    return Intl.message(
      'Customer Payment',
      name: 'CustomerPayment',
      desc: '',
      args: [],
    );
  }

  /// `Flight`
  String get Flight {
    return Intl.message(
      'Flight',
      name: 'Flight',
      desc: '',
      args: [],
    );
  }

  /// `Departure`
  String get Departure {
    return Intl.message(
      'Departure',
      name: 'Departure',
      desc: '',
      args: [],
    );
  }

  /// `Arrival`
  String get Arrival {
    return Intl.message(
      'Arrival',
      name: 'Arrival',
      desc: '',
      args: [],
    );
  }

  /// `Baggage`
  String get Baggage {
    return Intl.message(
      'Baggage',
      name: 'Baggage',
      desc: '',
      args: [],
    );
  }

  /// `Class`
  String get Class {
    return Intl.message(
      'Class',
      name: 'Class',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get Status {
    return Intl.message(
      'Status',
      name: 'Status',
      desc: '',
      args: [],
    );
  }

  /// `Ticket Price`
  String get TicketPrice {
    return Intl.message(
      'Ticket Price',
      name: 'TicketPrice',
      desc: '',
      args: [],
    );
  }

  /// `Taxes`
  String get Taxes {
    return Intl.message(
      'Taxes',
      name: 'Taxes',
      desc: '',
      args: [],
    );
  }

  /// `Passenger Type`
  String get PassengerType {
    return Intl.message(
      'Passenger Type',
      name: 'PassengerType',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `ID / Passport`
  String get IdOrPassport {
    return Intl.message(
      'ID / Passport',
      name: 'IdOrPassport',
      desc: '',
      args: [],
    );
  }

  /// `Ticket Number`
  String get TicketNumber {
    return Intl.message(
      'Ticket Number',
      name: 'TicketNumber',
      desc: '',
      args: [],
    );
  }

  /// `* We would like to point out that the responsibility for the country entry requirements (visa, vaccination card, and PCR test) lies entirely with the passenger. We strongly remind you to check with the relevant country's consulate for up-to-date information on entry and exit restrictions and new regulations before your flight.`
  String get PdfRedMessage {
    return Intl.message(
      '* We would like to point out that the responsibility for the country entry requirements (visa, vaccination card, and PCR test) lies entirely with the passenger. We strongly remind you to check with the relevant country\'s consulate for up-to-date information on entry and exit restrictions and new regulations before your flight.',
      name: 'PdfRedMessage',
      desc: '',
      args: [],
    );
  }

  /// `According to the airline's rules, especially on long-haul flights, check-in procedures at the counter can be available earlier, and baggage allowances may vary depending on the airline.`
  String get ImportantSubTitle {
    return Intl.message(
      'According to the airline\'s rules, especially on long-haul flights, check-in procedures at the counter can be available earlier, and baggage allowances may vary depending on the airline.',
      name: 'ImportantSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `File downloaded:`
  String get FileDownloaded {
    return Intl.message(
      'File downloaded:',
      name: 'FileDownloaded',
      desc: '',
      args: [],
    );
  }

  /// `IMPORTANT REMINDER:`
  String get ImportantReminder {
    return Intl.message(
      'IMPORTANT REMINDER:',
      name: 'ImportantReminder',
      desc: '',
      args: [],
    );
  }

  /// `TO INFORM`
  String get Information {
    return Intl.message(
      'TO INFORM',
      name: 'Information',
      desc: '',
      args: [],
    );
  }

  /// `Price Information`
  String get PriceInformation {
    return Intl.message(
      'Price Information',
      name: 'PriceInformation',
      desc: '',
      args: [],
    );
  }

  /// `Reservation Info`
  String get ReservationInfo {
    return Intl.message(
      'Reservation Info',
      name: 'ReservationInfo',
      desc: '',
      args: [],
    );
  }

  /// `Fax`
  String get Fax {
    return Intl.message(
      'Fax',
      name: 'Fax',
      desc: '',
      args: [],
    );
  }

  /// `IATA No`
  String get IATANo {
    return Intl.message(
      'IATA No',
      name: 'IATANo',
      desc: '',
      args: [],
    );
  }

  /// `Company`
  String get Company {
    return Intl.message(
      'Company',
      name: 'Company',
      desc: '',
      args: [],
    );
  }

  /// `Agency Information`
  String get AgencyInformation {
    return Intl.message(
      'Agency Information',
      name: 'AgencyInformation',
      desc: '',
      args: [],
    );
  }

  /// `For all international flights, we recommend checking official sources for the latest information and country requirements regarding passenger acceptance.`
  String get PdfOneMessage {
    return Intl.message(
      'For all international flights, we recommend checking official sources for the latest information and country requirements regarding passenger acceptance.',
      name: 'PdfOneMessage',
      desc: '',
      args: [],
    );
  }

  /// `ELECTRONIC TICKET PASSENGER ITINERARY RECEIPT`
  String get PdfTitle {
    return Intl.message(
      'ELECTRONIC TICKET PASSENGER ITINERARY RECEIPT',
      name: 'PdfTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get SelectDate {
    return Intl.message(
      'Select Date',
      name: 'SelectDate',
      desc: '',
      args: [],
    );
  }

  /// `Please note that the airport from which your next flight will depart is not the same as the one you arrived at. Therefore, ensure that you allocate enough time to transfer between the airports and avoid any delays.`
  String get NotSameAirportMassage {
    return Intl.message(
      'Please note that the airport from which your next flight will depart is not the same as the one you arrived at. Therefore, ensure that you allocate enough time to transfer between the airports and avoid any delays.',
      name: 'NotSameAirportMassage',
      desc: '',
      args: [],
    );
  }

  /// `Price Voucher`
  String get PriceVoucher {
    return Intl.message(
      'Price Voucher',
      name: 'PriceVoucher',
      desc: '',
      args: [],
    );
  }

  /// `None Price Voucher`
  String get NonePriceVoucher {
    return Intl.message(
      'None Price Voucher',
      name: 'NonePriceVoucher',
      desc: '',
      args: [],
    );
  }

  /// `Flight Date`
  String get FlightDate {
    return Intl.message(
      'Flight Date',
      name: 'FlightDate',
      desc: '',
      args: [],
    );
  }

  /// `No reservations found for this date`
  String get GE0016ErrorMassage {
    return Intl.message(
      'No reservations found for this date',
      name: 'GE0016ErrorMassage',
      desc: '',
      args: [],
    );
  }

  /// `Please try again with a different date`
  String get GE0016ErrorCode {
    return Intl.message(
      'Please try again with a different date',
      name: 'GE0016ErrorCode',
      desc: '',
      args: [],
    );
  }

  /// `No flights found in this price range`
  String get NoFlightsFoundInThisPriceRange {
    return Intl.message(
      'No flights found in this price range',
      name: 'NoFlightsFoundInThisPriceRange',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all fields`
  String get PleaseFillInAllFields {
    return Intl.message(
      'Please fill in all fields',
      name: 'PleaseFillInAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Empty Space cannot be left`
  String get EmptySpaceCannotBeLeft {
    return Intl.message(
      'Empty Space cannot be left',
      name: 'EmptySpaceCannotBeLeft',
      desc: '',
      args: [],
    );
  }

  /// `The number of babies cannot exceed the number of adults`
  String get TheNumberOfBabiesCannotExceedTheNumberOfAdults {
    return Intl.message(
      'The number of babies cannot exceed the number of adults',
      name: 'TheNumberOfBabiesCannotExceedTheNumberOfAdults',
      desc: '',
      args: [],
    );
  }

  /// `The starting and returning point should not be the same.`
  String get TheStartingAndReturningPointShouldNotBeTheSame {
    return Intl.message(
      'The starting and returning point should not be the same.',
      name: 'TheStartingAndReturningPointShouldNotBeTheSame',
      desc: '',
      args: [],
    );
  }

  /// `The departure or return point must not be empty.`
  String get TheDepartureOrReturnPointMustNotBeEmpty {
    return Intl.message(
      'The departure or return point must not be empty.',
      name: 'TheDepartureOrReturnPointMustNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `You Can Only Write Letters`
  String get YouCanOnlyWriteLetters {
    return Intl.message(
      'You Can Only Write Letters',
      name: 'YouCanOnlyWriteLetters',
      desc: '',
      args: [],
    );
  }

  /// `Canceled`
  String get Canceled {
    return Intl.message(
      'Canceled',
      name: 'Canceled',
      desc: '',
      args: [],
    );
  }

  /// `Invalid Code, please try again.`
  String get InvalidCodePleaseTryAgain {
    return Intl.message(
      'Invalid Code, please try again.',
      name: 'InvalidCodePleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `You cannot log in without accepting the terms!`
  String get YouCannotLogInWithoutAcceptingTheTerms {
    return Intl.message(
      'You cannot log in without accepting the terms!',
      name: 'YouCannotLogInWithoutAcceptingTheTerms',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Date`
  String get PleaseSelectDate {
    return Intl.message(
      'Please Select Date',
      name: 'PleaseSelectDate',
      desc: '',
      args: [],
    );
  }

  /// `Please Select Where You Want to Go`
  String get PleaseSelectWhereYouWantToGo {
    return Intl.message(
      'Please Select Where You Want to Go',
      name: 'PleaseSelectWhereYouWantToGo',
      desc: '',
      args: [],
    );
  }

  /// `Please select a room`
  String get PleaseSelectARoom {
    return Intl.message(
      'Please select a room',
      name: 'PleaseSelectARoom',
      desc: '',
      args: [],
    );
  }

  /// `Make sure the phone number is written correctly`
  String get MakeSureThePhoneNumberIsWrittenCorrectly {
    return Intl.message(
      'Make sure the phone number is written correctly',
      name: 'MakeSureThePhoneNumberIsWrittenCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `Make sure your email is written correctly`
  String get MakeSureYourEmailIsWrittenCorrectly {
    return Intl.message(
      'Make sure your email is written correctly',
      name: 'MakeSureYourEmailIsWrittenCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `You can choose a maximum of 1 month`
  String get YouCanChooseAMaximumOf1Month {
    return Intl.message(
      'You can choose a maximum of 1 month',
      name: 'YouCanChooseAMaximumOf1Month',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get Buy {
    return Intl.message(
      'Buy',
      name: 'Buy',
      desc: '',
      args: [],
    );
  }

  /// `Min.`
  String get Minimum {
    return Intl.message(
      'Min.',
      name: 'Minimum',
      desc: '',
      args: [],
    );
  }

  /// `Ho.`
  String get Hour {
    return Intl.message(
      'Ho.',
      name: 'Hour',
      desc: '',
      args: [],
    );
  }

  /// `Identity Number`
  String get IdentityNumber {
    return Intl.message(
      'Identity Number',
      name: 'IdentityNumber',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Type`
  String get TransactionType {
    return Intl.message(
      'Transaction Type',
      name: 'TransactionType',
      desc: '',
      args: [],
    );
  }

  /// `Reservation Details`
  String get ReservationDetails {
    return Intl.message(
      'Reservation Details',
      name: 'ReservationDetails',
      desc: '',
      args: [],
    );
  }

  /// `Departure Date/Time`
  String get DepartureDateTime {
    return Intl.message(
      'Departure Date/Time',
      name: 'DepartureDateTime',
      desc: '',
      args: [],
    );
  }

  /// `Route`
  String get Route {
    return Intl.message(
      'Route',
      name: 'Route',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Date`
  String get TransactionDate {
    return Intl.message(
      'Transaction Date',
      name: 'TransactionDate',
      desc: '',
      args: [],
    );
  }

  /// `Booking Date`
  String get BookingDate {
    return Intl.message(
      'Booking Date',
      name: 'BookingDate',
      desc: '',
      args: [],
    );
  }

  /// `flight time`
  String get FlightTime {
    return Intl.message(
      'flight time',
      name: 'FlightTime',
      desc: '',
      args: [],
    );
  }

  /// `Reservation Number`
  String get ReservationNumber {
    return Intl.message(
      'Reservation Number',
      name: 'ReservationNumber',
      desc: '',
      args: [],
    );
  }

  /// `Reservation`
  String get Reservation {
    return Intl.message(
      'Reservation',
      name: 'Reservation',
      desc: '',
      args: [],
    );
  }

  /// `Payment Info`
  String get PaymentInfo {
    return Intl.message(
      'Payment Info',
      name: 'PaymentInfo',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get Total {
    return Intl.message(
      'Total',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `Rooms and Guests`
  String get RoomsAndGuests {
    return Intl.message(
      'Rooms and Guests',
      name: 'RoomsAndGuests',
      desc: '',
      args: [],
    );
  }

  /// `Guests`
  String get Guests {
    return Intl.message(
      'Guests',
      name: 'Guests',
      desc: '',
      args: [],
    );
  }

  /// `Room`
  String get Room {
    return Intl.message(
      'Room',
      name: 'Room',
      desc: '',
      args: [],
    );
  }

  /// `Hostel`
  String get hostel {
    return Intl.message(
      'Hostel',
      name: 'hostel',
      desc: '',
      args: [],
    );
  }

  /// `Cancellation policies`
  String get CancellationPolicies {
    return Intl.message(
      'Cancellation policies',
      name: 'CancellationPolicies',
      desc: '',
      args: [],
    );
  }

  /// `Non-Refundable`
  String get NonRefundable {
    return Intl.message(
      'Non-Refundable',
      name: 'NonRefundable',
      desc: '',
      args: [],
    );
  }

  /// `Refundable`
  String get Refundable {
    return Intl.message(
      'Refundable',
      name: 'Refundable',
      desc: '',
      args: [],
    );
  }

  /// `Partially Refundable`
  String get PartiallyRefundable {
    return Intl.message(
      'Partially Refundable',
      name: 'PartiallyRefundable',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get Unknown {
    return Intl.message(
      'Unknown',
      name: 'Unknown',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get Free {
    return Intl.message(
      'Free',
      name: 'Free',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get Paid {
    return Intl.message(
      'Paid',
      name: 'Paid',
      desc: '',
      args: [],
    );
  }

  /// `Rooms`
  String get Rooms {
    return Intl.message(
      'Rooms',
      name: 'Rooms',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get About {
    return Intl.message(
      'About',
      name: 'About',
      desc: '',
      args: [],
    );
  }

  /// `Pictures`
  String get Pictures {
    return Intl.message(
      'Pictures',
      name: 'Pictures',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message(
      'Location',
      name: 'Location',
      desc: '',
      args: [],
    );
  }

  /// `Conditions`
  String get Conditions {
    return Intl.message(
      'Conditions',
      name: 'Conditions',
      desc: '',
      args: [],
    );
  }

  /// `Show Details`
  String get ShowDetails {
    return Intl.message(
      'Show Details',
      name: 'ShowDetails',
      desc: '',
      args: [],
    );
  }

  /// `   ' Prices starting from`
  String get PricesStartingFrom {
    return Intl.message(
      '   \' Prices starting from',
      name: 'PricesStartingFrom',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Search Hotel' key

  /// `Search Hotel`
  String get SearchHotel {
    return Intl.message(
      'Search Hotel',
      name: 'SearchHotel',
      desc: '',
      args: [],
    );
  }

  /// `Guest Count`
  String get GuestCount {
    return Intl.message(
      'Guest Count',
      name: 'GuestCount',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get Guest {
    return Intl.message(
      'Guest',
      name: 'Guest',
      desc: '',
      args: [],
    );
  }

  /// `Enter your destination city or region`
  String get EnterYourDestinationCityOrRegion {
    return Intl.message(
      'Enter your destination city or region',
      name: 'EnterYourDestinationCityOrRegion',
      desc: '',
      args: [],
    );
  }

  /// `Where would you like to go?`
  String get WhereWouldYouLikeToGo {
    return Intl.message(
      'Where would you like to go?',
      name: 'WhereWouldYouLikeToGo',
      desc: '',
      args: [],
    );
  }

  /// `Check-In`
  String get CheckIn {
    return Intl.message(
      'Check-In',
      name: 'CheckIn',
      desc: '',
      args: [],
    );
  }

  /// `Check-Out`
  String get CheckOut {
    return Intl.message(
      'Check-Out',
      name: 'CheckOut',
      desc: '',
      args: [],
    );
  }

  /// `NonStop`
  String get NonStop {
    return Intl.message(
      'NonStop',
      name: 'NonStop',
      desc: '',
      args: [],
    );
  }

  /// `Stop`
  String get Stop {
    return Intl.message(
      'Stop',
      name: 'Stop',
      desc: '',
      args: [],
    );
  }

  /// `Hand Bag`
  String get Handluggage {
    return Intl.message(
      'Hand Bag',
      name: 'Handluggage',
      desc: '',
      args: [],
    );
  }

  /// `Reservation Search`
  String get ReservationSearch {
    return Intl.message(
      'Reservation Search',
      name: 'ReservationSearch',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get To {
    return Intl.message(
      'To',
      name: 'To',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get From {
    return Intl.message(
      'From',
      name: 'From',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get CreateAccount {
    return Intl.message(
      'Create Account',
      name: 'CreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Complete SignUp`
  String get CompleteSignUp {
    return Intl.message(
      'Complete SignUp',
      name: 'CompleteSignUp',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get ForgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'ForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `E-Mail`
  String get EMail {
    return Intl.message(
      'E-Mail',
      name: 'EMail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `I have read and approve.`
  String get IHaveAgreeToOur {
    return Intl.message(
      'I have read and approve.',
      name: 'IHaveAgreeToOur',
      desc: '',
      args: [],
    );
  }

  /// ` Terms and condition`
  String get TermsAndCondition {
    return Intl.message(
      ' Terms and condition',
      name: 'TermsAndCondition',
      desc: '',
      args: [],
    );
  }

  /// `Flight Ticket`
  String get FlightTicket {
    return Intl.message(
      'Flight Ticket',
      name: 'FlightTicket',
      desc: '',
      args: [],
    );
  }

  /// `Password must meet the following criteria:`
  String get passwordCriteria {
    return Intl.message(
      'Password must meet the following criteria:',
      name: 'passwordCriteria',
      desc: '',
      args: [],
    );
  }

  /// `Min. 8 characters`
  String get minLength {
    return Intl.message(
      'Min. 8 characters',
      name: 'minLength',
      desc: '',
      args: [],
    );
  }

  /// `Min. 1 uppercase letter`
  String get upperCase {
    return Intl.message(
      'Min. 1 uppercase letter',
      name: 'upperCase',
      desc: '',
      args: [],
    );
  }

  /// `Min. 1 lowercase letter`
  String get lowerCase {
    return Intl.message(
      'Min. 1 lowercase letter',
      name: 'lowerCase',
      desc: '',
      args: [],
    );
  }

  /// `Min. 1 number`
  String get number {
    return Intl.message(
      'Min. 1 number',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Min. 1 special character`
  String get specialChar {
    return Intl.message(
      'Min. 1 special character',
      name: 'specialChar',
      desc: '',
      args: [],
    );
  }

  /// `Hotel`
  String get Hotel {
    return Intl.message(
      'Hotel',
      name: 'Hotel',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get Transfer {
    return Intl.message(
      'Transfer',
      name: 'Transfer',
      desc: '',
      args: [],
    );
  }

  /// `Rent Car`
  String get RentCar {
    return Intl.message(
      'Rent Car',
      name: 'RentCar',
      desc: '',
      args: [],
    );
  }

  /// `Tur`
  String get Tur {
    return Intl.message(
      'Tur',
      name: 'Tur',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all the fields`
  String get pleaseFillAllFields {
    return Intl.message(
      'Please fill all the fields',
      name: 'pleaseFillAllFields',
      desc: '',
      args: [],
    );
  }

  /// `Visa`
  String get Visa {
    return Intl.message(
      'Visa',
      name: 'Visa',
      desc: '',
      args: [],
    );
  }

  /// `Group Requests`
  String get GroupRequests {
    return Intl.message(
      'Group Requests',
      name: 'GroupRequests',
      desc: '',
      args: [],
    );
  }

  /// `Amusement Package`
  String get AmusementPackage {
    return Intl.message(
      'Amusement Package',
      name: 'AmusementPackage',
      desc: '',
      args: [],
    );
  }

  /// `Events`
  String get Events {
    return Intl.message(
      'Events',
      name: 'Events',
      desc: '',
      args: [],
    );
  }

  /// `Departure Point`
  String get DeparturePoint {
    return Intl.message(
      'Departure Point',
      name: 'DeparturePoint',
      desc: '',
      args: [],
    );
  }

  /// `Destination`
  String get Destination {
    return Intl.message(
      'Destination',
      name: 'Destination',
      desc: '',
      args: [],
    );
  }

  /// `Oneway`
  String get OneDirection {
    return Intl.message(
      'Oneway',
      name: 'OneDirection',
      desc: '',
      args: [],
    );
  }

  /// `Roundtrip`
  String get DepartureReturn {
    return Intl.message(
      'Roundtrip',
      name: 'DepartureReturn',
      desc: '',
      args: [],
    );
  }

  /// `Multipoint`
  String get MultiPoint {
    return Intl.message(
      'Multipoint',
      name: 'MultiPoint',
      desc: '',
      args: [],
    );
  }

  /// `Departure Date`
  String get DepartureDate {
    return Intl.message(
      'Departure Date',
      name: 'DepartureDate',
      desc: '',
      args: [],
    );
  }

  /// `Return Date`
  String get ReturnDate {
    return Intl.message(
      'Return Date',
      name: 'ReturnDate',
      desc: '',
      args: [],
    );
  }

  /// `Passenger`
  String get Passenger {
    return Intl.message(
      'Passenger',
      name: 'Passenger',
      desc: '',
      args: [],
    );
  }

  /// `Markup`
  String get Markup {
    return Intl.message(
      'Markup',
      name: 'Markup',
      desc: '',
      args: [],
    );
  }

  /// `Passenger & Cabin`
  String get PassengerAndCabin {
    return Intl.message(
      'Passenger & Cabin',
      name: 'PassengerAndCabin',
      desc: '',
      args: [],
    );
  }

  /// `Direct Flights`
  String get DirectFlights {
    return Intl.message(
      'Direct Flights',
      name: 'DirectFlights',
      desc: '',
      args: [],
    );
  }

  /// `Returnable`
  String get Returnable {
    return Intl.message(
      'Returnable',
      name: 'Returnable',
      desc: '',
      args: [],
    );
  }

  /// `Package`
  String get Package {
    return Intl.message(
      'Package',
      name: 'Package',
      desc: '',
      args: [],
    );
  }

  /// `Detailed Search`
  String get DetailedSearch {
    return Intl.message(
      'Detailed Search',
      name: 'DetailedSearch',
      desc: '',
      args: [],
    );
  }

  /// `Corporate Code`
  String get CorporateCode {
    return Intl.message(
      'Corporate Code',
      name: 'CorporateCode',
      desc: '',
      args: [],
    );
  }

  /// `Prefer Airline`
  String get PreferAirline {
    return Intl.message(
      'Prefer Airline',
      name: 'PreferAirline',
      desc: '',
      args: [],
    );
  }

  /// `Search Flights`
  String get SearchFlights {
    return Intl.message(
      'Search Flights',
      name: 'SearchFlights',
      desc: '',
      args: [],
    );
  }

  /// `Departure date has not been selected.`
  String get DepartureDateHasNotBeenSelected {
    return Intl.message(
      'Departure date has not been selected.',
      name: 'DepartureDateHasNotBeenSelected',
      desc: '',
      args: [],
    );
  }

  /// `Departure and return dates were not selected.`
  String get DepartureAndReturnDatesWereNotSelected {
    return Intl.message(
      'Departure and return dates were not selected.',
      name: 'DepartureAndReturnDatesWereNotSelected',
      desc: '',
      args: [],
    );
  }

  /// `Sort`
  String get Sort {
    return Intl.message(
      'Sort',
      name: 'Sort',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get Filter {
    return Intl.message(
      'Filter',
      name: 'Filter',
      desc: '',
      args: [],
    );
  }

  /// `Departing Flight`
  String get DestinationPoint {
    return Intl.message(
      'Departing Flight',
      name: 'DestinationPoint',
      desc: '',
      args: [],
    );
  }

  /// `Returning Flight`
  String get ReturnPoint {
    return Intl.message(
      'Returning Flight',
      name: 'ReturnPoint',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get Details {
    return Intl.message(
      'Details',
      name: 'Details',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Passenger & Cabin Selection`
  String get PassengerAndCabinSelection {
    return Intl.message(
      'Passenger & Cabin Selection',
      name: 'PassengerAndCabinSelection',
      desc: '',
      args: [],
    );
  }

  /// `Economy`
  String get Economy {
    return Intl.message(
      'Economy',
      name: 'Economy',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get Business {
    return Intl.message(
      'Business',
      name: 'Business',
      desc: '',
      args: [],
    );
  }

  /// `Adult`
  String get Adult {
    return Intl.message(
      'Adult',
      name: 'Adult',
      desc: '',
      args: [],
    );
  }

  /// `Child`
  String get Child {
    return Intl.message(
      'Child',
      name: 'Child',
      desc: '',
      args: [],
    );
  }

  /// `Baby`
  String get Baby {
    return Intl.message(
      'Baby',
      name: 'Baby',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get Close {
    return Intl.message(
      'Close',
      name: 'Close',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get Apply {
    return Intl.message(
      'Apply',
      name: 'Apply',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get Clear {
    return Intl.message(
      'Clear',
      name: 'Clear',
      desc: '',
      args: [],
    );
  }

  /// `Airline`
  String get Airline {
    return Intl.message(
      'Airline',
      name: 'Airline',
      desc: '',
      args: [],
    );
  }

  /// `Select Flight`
  String get SelectFlight {
    return Intl.message(
      'Select Flight',
      name: 'SelectFlight',
      desc: '',
      args: [],
    );
  }

  /// `Flight Details`
  String get FlightDetails {
    return Intl.message(
      'Flight Details',
      name: 'FlightDetails',
      desc: '',
      args: [],
    );
  }

  /// `Waiting time`
  String get WaitingTime {
    return Intl.message(
      'Waiting time',
      name: 'WaitingTime',
      desc: '',
      args: [],
    );
  }

  /// `Total Charge:`
  String get TotalCharge {
    return Intl.message(
      'Total Charge:',
      name: 'TotalCharge',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Passenger Info`
  String get SeatDetails {
    return Intl.message(
      'Passenger Info',
      name: 'SeatDetails',
      desc: '',
      args: [],
    );
  }

  /// `There is no children`
  String get ThereIsNoChildren {
    return Intl.message(
      'There is no children',
      name: 'ThereIsNoChildren',
      desc: '',
      args: [],
    );
  }

  /// `There is no Baby`
  String get ThereIsNoBaby {
    return Intl.message(
      'There is no Baby',
      name: 'ThereIsNoBaby',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get Select {
    return Intl.message(
      'Select',
      name: 'Select',
      desc: '',
      args: [],
    );
  }

  /// `More info`
  String get MoreInformation {
    return Intl.message(
      'More info',
      name: 'MoreInformation',
      desc: '',
      args: [],
    );
  }

  /// `Passenger & Contact Info`
  String get PassengerAndContactInformation {
    return Intl.message(
      'Passenger & Contact Info',
      name: 'PassengerAndContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get ContactInformation {
    return Intl.message(
      'Contact Information',
      name: 'ContactInformation',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get Man {
    return Intl.message(
      'Male',
      name: 'Man',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get Woman {
    return Intl.message(
      'Female',
      name: 'Woman',
      desc: '',
      args: [],
    );
  }

  /// `Passenger Info`
  String get PassengerInformation {
    return Intl.message(
      'Passenger Info',
      name: 'PassengerInformation',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get LastName {
    return Intl.message(
      'Last Name',
      name: 'LastName',
      desc: '',
      args: [],
    );
  }

  /// `BirthDay`
  String get BirthDay {
    return Intl.message(
      'BirthDay',
      name: 'BirthDay',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get Nationality {
    return Intl.message(
      'Nationality',
      name: 'Nationality',
      desc: '',
      args: [],
    );
  }

  /// `Passport Number`
  String get PassportNumber {
    return Intl.message(
      'Passport Number',
      name: 'PassportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Validity Date`
  String get ValidityDate {
    return Intl.message(
      'Validity Date',
      name: 'ValidityDate',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `The Name Must Not Be Left Blank`
  String get TheNameMustNotBeLeftBlank {
    return Intl.message(
      'The Name Must Not Be Left Blank',
      name: 'TheNameMustNotBeLeftBlank',
      desc: '',
      args: [],
    );
  }

  /// `The LastName Must Not Be Left Blank`
  String get TheLastNameMustNotBeLeftBlank {
    return Intl.message(
      'The LastName Must Not Be Left Blank',
      name: 'TheLastNameMustNotBeLeftBlank',
      desc: '',
      args: [],
    );
  }

  /// `The BirthDay Must Not Be Left Blank`
  String get TheBirthDayMustNotBeLeftBlank {
    return Intl.message(
      'The BirthDay Must Not Be Left Blank',
      name: 'TheBirthDayMustNotBeLeftBlank',
      desc: '',
      args: [],
    );
  }

  /// `Passport Or ID Details`
  String get PassportAndIDDetails {
    return Intl.message(
      'Passport Or ID Details',
      name: 'PassportAndIDDetails',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get Ok {
    return Intl.message(
      'OK',
      name: 'Ok',
      desc: '',
      args: [],
    );
  }

  /// `Select Flight Ticket`
  String get SelectFlightTicket {
    return Intl.message(
      'Select Flight Ticket',
      name: 'SelectFlightTicket',
      desc: '',
      args: [],
    );
  }

  /// `Select Flight Ticket Package`
  String get SelectFlightTicketPackage {
    return Intl.message(
      'Select Flight Ticket Package',
      name: 'SelectFlightTicketPackage',
      desc: '',
      args: [],
    );
  }

  /// `Payment Info`
  String get PaymentInformation {
    return Intl.message(
      'Payment Info',
      name: 'PaymentInformation',
      desc: '',
      args: [],
    );
  }

  /// `Reservation Note`
  String get ReservationNote {
    return Intl.message(
      'Reservation Note',
      name: 'ReservationNote',
      desc: '',
      args: [],
    );
  }

  /// `Payment Type`
  String get PaymentType {
    return Intl.message(
      'Payment Type',
      name: 'PaymentType',
      desc: '',
      args: [],
    );
  }

  /// `Credit Card`
  String get CreditCard {
    return Intl.message(
      'Credit Card',
      name: 'CreditCard',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder`
  String get NameOnCard {
    return Intl.message(
      'Card Holder',
      name: 'NameOnCard',
      desc: '',
      args: [],
    );
  }

  /// `Option Date`
  String get ExpirationDate {
    return Intl.message(
      'Option Date',
      name: 'ExpirationDate',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get CardNumber {
    return Intl.message(
      'Card Number',
      name: 'CardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Installment Types`
  String get InstallmentTypes {
    return Intl.message(
      'Installment Types',
      name: 'InstallmentTypes',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get Current {
    return Intl.message(
      'Current',
      name: 'Current',
      desc: '',
      args: [],
    );
  }

  /// `Alternative Payment`
  String get AlternativePayment {
    return Intl.message(
      'Alternative Payment',
      name: 'AlternativePayment',
      desc: '',
      args: [],
    );
  }

  /// `Pre-reservation`
  String get PreReservation {
    return Intl.message(
      'Pre-reservation',
      name: 'PreReservation',
      desc: '',
      args: [],
    );
  }

  /// `Flight number: `
  String get FlightNumber {
    return Intl.message(
      'Flight number: ',
      name: 'FlightNumber',
      desc: '',
      args: [],
    );
  }

  /// `Operator: `
  String get OperatedCompany {
    return Intl.message(
      'Operator: ',
      name: 'OperatedCompany',
      desc: '',
      args: [],
    );
  }

  /// `Cabin: `
  String get Cabin {
    return Intl.message(
      'Cabin: ',
      name: 'Cabin',
      desc: '',
      args: [],
    );
  }

  /// `Default`
  String get Default {
    return Intl.message(
      'Default',
      name: 'Default',
      desc: '',
      args: [],
    );
  }

  /// `Highest Flying Time`
  String get HighestFlyingTime {
    return Intl.message(
      'Highest Flying Time',
      name: 'HighestFlyingTime',
      desc: '',
      args: [],
    );
  }

  /// `Lowest Flying Time`
  String get LowestFlyingTime {
    return Intl.message(
      'Lowest Flying Time',
      name: 'LowestFlyingTime',
      desc: '',
      args: [],
    );
  }

  /// `Highest Hours`
  String get HighestHours {
    return Intl.message(
      'Highest Hours',
      name: 'HighestHours',
      desc: '',
      args: [],
    );
  }

  /// `Lowest Hours`
  String get LowestHours {
    return Intl.message(
      'Lowest Hours',
      name: 'LowestHours',
      desc: '',
      args: [],
    );
  }

  /// `Highest Price`
  String get HighestPrice {
    return Intl.message(
      'Highest Price',
      name: 'HighestPrice',
      desc: '',
      args: [],
    );
  }

  /// `Lowest Price`
  String get LowestPrice {
    return Intl.message(
      'Lowest Price',
      name: 'LowestPrice',
      desc: '',
      args: [],
    );
  }

  /// `Providers`
  String get Providers {
    return Intl.message(
      'Providers',
      name: 'Providers',
      desc: '',
      args: [],
    );
  }

  /// `Airlines`
  String get Airlines {
    return Intl.message(
      'Airlines',
      name: 'Airlines',
      desc: '',
      args: [],
    );
  }

  /// `Luggages`
  String get Luggages {
    return Intl.message(
      'Luggages',
      name: 'Luggages',
      desc: '',
      args: [],
    );
  }

  /// `Pauses`
  String get Pauses {
    return Intl.message(
      'Pauses',
      name: 'Pauses',
      desc: '',
      args: [],
    );
  }

  /// `Airports`
  String get Airports {
    return Intl.message(
      'Airports',
      name: 'Airports',
      desc: '',
      args: [],
    );
  }

  /// `Cabins`
  String get Cabins {
    return Intl.message(
      'Cabins',
      name: 'Cabins',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get Hours {
    return Intl.message(
      'Hours',
      name: 'Hours',
      desc: '',
      args: [],
    );
  }

  /// `H`
  String get HourAnd {
    return Intl.message(
      'H',
      name: 'HourAnd',
      desc: '',
      args: [],
    );
  }

  /// `M`
  String get Min {
    return Intl.message(
      'M',
      name: 'Min',
      desc: '',
      args: [],
    );
  }

  /// `Time Of Flight`
  String get TimeOfFlight {
    return Intl.message(
      'Time Of Flight',
      name: 'TimeOfFlight',
      desc: '',
      args: [],
    );
  }

  /// `Price Range`
  String get PriceRange {
    return Intl.message(
      'Price Range',
      name: 'PriceRange',
      desc: '',
      args: [],
    );
  }

  /// `Choose the correct time for your flight`
  String get ChooseTheCorrectTimeForYourFlight {
    return Intl.message(
      'Choose the correct time for your flight',
      name: 'ChooseTheCorrectTimeForYourFlight',
      desc: '',
      args: [],
    );
  }

  /// `Choose the duration time for your flight`
  String get ChooseTheDurationTimeForYourFlight {
    return Intl.message(
      'Choose the duration time for your flight',
      name: 'ChooseTheDurationTimeForYourFlight',
      desc: '',
      args: [],
    );
  }

  /// `The First hour can not higher from Second hour`
  String get TheFirstHourCanNotHigherFromSecondHour {
    return Intl.message(
      'The First hour can not higher from Second hour',
      name: 'TheFirstHourCanNotHigherFromSecondHour',
      desc: '',
      args: [],
    );
  }

  /// `The Highest price dose not have to by empty`
  String get TheHighestPriceDoseNotHaveToByEmpty {
    return Intl.message(
      'The Highest price dose not have to by empty',
      name: 'TheHighestPriceDoseNotHaveToByEmpty',
      desc: '',
      args: [],
    );
  }

  /// `The Lowest price dose not have to by empty`
  String get TheLowestPriceDoseNotHaveToByEmpty {
    return Intl.message(
      'The Lowest price dose not have to by empty',
      name: 'TheLowestPriceDoseNotHaveToByEmpty',
      desc: '',
      args: [],
    );
  }

  /// `the Lowest price can not higher from Highest price`
  String get TheLowestPriceCanNotHigherFromHighestPrice {
    return Intl.message(
      'the Lowest price can not higher from Highest price',
      name: 'TheLowestPriceCanNotHigherFromHighestPrice',
      desc: '',
      args: [],
    );
  }

  /// `The Email Must Not Be Left Blank`
  String get TheEmailMustNotBeLeftBlank {
    return Intl.message(
      'The Email Must Not Be Left Blank',
      name: 'TheEmailMustNotBeLeftBlank',
      desc: '',
      args: [],
    );
  }

  /// `The Phone Number Must Not Be Left Blank`
  String get ThePhoneNoMustNotBeLeftBlank {
    return Intl.message(
      'The Phone Number Must Not Be Left Blank',
      name: 'ThePhoneNoMustNotBeLeftBlank',
      desc: '',
      args: [],
    );
  }

  /// `Airline Filter`
  String get AirlineFilter {
    return Intl.message(
      'Airline Filter',
      name: 'AirlineFilter',
      desc: '',
      args: [],
    );
  }

  /// `Cabin Filter`
  String get CabinFilter {
    return Intl.message(
      'Cabin Filter',
      name: 'CabinFilter',
      desc: '',
      args: [],
    );
  }

  /// `Luggage Filter`
  String get LuggageFilter {
    return Intl.message(
      'Luggage Filter',
      name: 'LuggageFilter',
      desc: '',
      args: [],
    );
  }

  /// `Providers Filter`
  String get ProvidersFilter {
    return Intl.message(
      'Providers Filter',
      name: 'ProvidersFilter',
      desc: '',
      args: [],
    );
  }

  /// `Airport Filter`
  String get AirportFilter {
    return Intl.message(
      'Airport Filter',
      name: 'AirportFilter',
      desc: '',
      args: [],
    );
  }

  /// `User Info`
  String get USerInformation {
    return Intl.message(
      'User Info',
      name: 'USerInformation',
      desc: '',
      args: [],
    );
  }

  /// `Company Info`
  String get CompanyInformation {
    return Intl.message(
      'Company Info',
      name: 'CompanyInformation',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Turkish`
  String get Turkish {
    return Intl.message(
      'Turkish',
      name: 'Turkish',
      desc: '',
      args: [],
    );
  }

  /// `My Reservation`
  String get MyReservation {
    return Intl.message(
      'My Reservation',
      name: 'MyReservation',
      desc: '',
      args: [],
    );
  }

  /// `All Reservations`
  String get AllReservations {
    return Intl.message(
      'All Reservations',
      name: 'AllReservations',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorised access`
  String get UnauthorisedAccess {
    return Intl.message(
      'Unauthorised access',
      name: 'UnauthorisedAccess',
      desc: '',
      args: [],
    );
  }

  /// `Invalid token code`
  String get InvalidTokenCode {
    return Intl.message(
      'Invalid token code',
      name: 'InvalidTokenCode',
      desc: '',
      args: [],
    );
  }

  /// `Token has been expired`
  String get TokenHasExpired {
    return Intl.message(
      'Token has been expired',
      name: 'TokenHasExpired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid username or password`
  String get InvalidUsernameOrPassword {
    return Intl.message(
      'Invalid username or password',
      name: 'InvalidUsernameOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get InvalidEmail {
    return Intl.message(
      'Invalid email',
      name: 'InvalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Invalid data`
  String get InvalidData {
    return Intl.message(
      'Invalid data',
      name: 'InvalidData',
      desc: '',
      args: [],
    );
  }

  /// `Invalid username`
  String get InvalidUsername {
    return Intl.message(
      'Invalid username',
      name: 'InvalidUsername',
      desc: '',
      args: [],
    );
  }

  /// `Invalid first name`
  String get InvalidFirstName {
    return Intl.message(
      'Invalid first name',
      name: 'InvalidFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid last name`
  String get InvalidLastName {
    return Intl.message(
      'Invalid last name',
      name: 'InvalidLastName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get InvalidPhoneNumber {
    return Intl.message(
      'Invalid phone number',
      name: 'InvalidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid company name`
  String get InvalidCompanyName {
    return Intl.message(
      'Invalid company name',
      name: 'InvalidCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `This email is used`
  String get EmailIsUsed {
    return Intl.message(
      'This email is used',
      name: 'EmailIsUsed',
      desc: '',
      args: [],
    );
  }

  /// `This username is used`
  String get UsernameIsUsed {
    return Intl.message(
      'This username is used',
      name: 'UsernameIsUsed',
      desc: '',
      args: [],
    );
  }

  /// `Insufficient permission`
  String get InsufficientPermission {
    return Intl.message(
      'Insufficient permission',
      name: 'InsufficientPermission',
      desc: '',
      args: [],
    );
  }

  /// `New password cannot be empty or less than 8 characters`
  String get NewPasswordCannotBeEmptyOrLessThan8Characters {
    return Intl.message(
      'New password cannot be empty or less than 8 characters',
      name: 'NewPasswordCannotBeEmptyOrLessThan8Characters',
      desc: '',
      args: [],
    );
  }

  /// `Data not found`
  String get DataNotFound {
    return Intl.message(
      'Data not found',
      name: 'DataNotFound',
      desc: '',
      args: [],
    );
  }

  /// `There should be an agent to save pax info`
  String get AgentRequiredToSavePaxInformation {
    return Intl.message(
      'There should be an agent to save pax info',
      name: 'AgentRequiredToSavePaxInformation',
      desc: '',
      args: [],
    );
  }

  /// `Invalid birth date`
  String get InvalidBirthDate {
    return Intl.message(
      'Invalid birth date',
      name: 'InvalidBirthDate',
      desc: '',
      args: [],
    );
  }

  /// `Invalid identity or passport number`
  String get InvalidIdentityOrPassportNumber {
    return Intl.message(
      'Invalid identity or passport number',
      name: 'InvalidIdentityOrPassportNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid system pnr`
  String get InvalidSystemPNR {
    return Intl.message(
      'Invalid system pnr',
      name: 'InvalidSystemPNR',
      desc: '',
      args: [],
    );
  }

  /// `Invalid date`
  String get InvalidDate {
    return Intl.message(
      'Invalid date',
      name: 'InvalidDate',
      desc: '',
      args: [],
    );
  }

  /// `Date range can be maximum 30 days`
  String get DateRangeMaximum30Days {
    return Intl.message(
      'Date range can be maximum 30 days',
      name: 'DateRangeMaximum30Days',
      desc: '',
      args: [],
    );
  }

  /// `Invalid address`
  String get InvalidAddress {
    return Intl.message(
      'Invalid address',
      name: 'InvalidAddress',
      desc: '',
      args: [],
    );
  }

  /// `Invalid subject`
  String get InvalidSubject {
    return Intl.message(
      'Invalid subject',
      name: 'InvalidSubject',
      desc: '',
      args: [],
    );
  }

  /// `Invalid content`
  String get InvalidContent {
    return Intl.message(
      'Invalid content',
      name: 'InvalidContent',
      desc: '',
      args: [],
    );
  }

  /// `Invalid departure point`
  String get InvalidDeparturePoint {
    return Intl.message(
      'Invalid departure point',
      name: 'InvalidDeparturePoint',
      desc: '',
      args: [],
    );
  }

  /// `Invalid arrival point`
  String get InvalidArrivalPoint {
    return Intl.message(
      'Invalid arrival point',
      name: 'InvalidArrivalPoint',
      desc: '',
      args: [],
    );
  }

  /// `Price has been changed`
  String get PriceChanged {
    return Intl.message(
      'Price has been changed',
      name: 'PriceChanged',
      desc: '',
      args: [],
    );
  }

  /// `Agency is not activated`
  String get AgencyNotActivated {
    return Intl.message(
      'Agency is not activated',
      name: 'AgencyNotActivated',
      desc: '',
      args: [],
    );
  }

  /// `Invalid IP address`
  String get InvalidIPAddress {
    return Intl.message(
      'Invalid IP address',
      name: 'InvalidIPAddress',
      desc: '',
      args: [],
    );
  }

  /// `Invalid contact person`
  String get InvalidContactPerson {
    return Intl.message(
      'Invalid contact person',
      name: 'InvalidContactPerson',
      desc: '',
      args: [],
    );
  }

  /// `Invalid invoice info`
  String get InvalidInvoiceInformation {
    return Intl.message(
      'Invalid invoice info',
      name: 'InvalidInvoiceInformation',
      desc: '',
      args: [],
    );
  }

  /// `Invalid tax number`
  String get InvalidTaxNumber {
    return Intl.message(
      'Invalid tax number',
      name: 'InvalidTaxNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid postal code`
  String get InvalidPostalCode {
    return Intl.message(
      'Invalid postal code',
      name: 'InvalidPostalCode',
      desc: '',
      args: [],
    );
  }

  /// `Invalid invoice name`
  String get InvalidInvoiceName {
    return Intl.message(
      'Invalid invoice name',
      name: 'InvalidInvoiceName',
      desc: '',
      args: [],
    );
  }

  /// `Invalid city`
  String get InvalidCity {
    return Intl.message(
      'Invalid city',
      name: 'InvalidCity',
      desc: '',
      args: [],
    );
  }

  /// `Reservation failed`
  String get ReservationFailed {
    return Intl.message(
      'Reservation failed',
      name: 'ReservationFailed',
      desc: '',
      args: [],
    );
  }

  /// `This method is only available for succeed reservations`
  String get MethodAvailableOnlyForSucceedReservations {
    return Intl.message(
      'This method is only available for succeed reservations',
      name: 'MethodAvailableOnlyForSucceedReservations',
      desc: '',
      args: [],
    );
  }

  /// `Ticket is already cancelled`
  String get TicketAlreadyCancelled {
    return Intl.message(
      'Ticket is already cancelled',
      name: 'TicketAlreadyCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Reservation is already cancelled`
  String get ReservationAlreadyCancelled {
    return Intl.message(
      'Reservation is already cancelled',
      name: 'ReservationAlreadyCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Reservation is already expired`
  String get ReservationAlreadyExpired {
    return Intl.message(
      'Reservation is already expired',
      name: 'ReservationAlreadyExpired',
      desc: '',
      args: [],
    );
  }

  /// `Ticket could not be cancelled`
  String get TicketCouldNotBeCancelled {
    return Intl.message(
      'Ticket could not be cancelled',
      name: 'TicketCouldNotBeCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Reservation could not be cancelled`
  String get ReservationCouldNotBeCancelled {
    return Intl.message(
      'Reservation could not be cancelled',
      name: 'ReservationCouldNotBeCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Invalid nationality`
  String get InvalidNationality {
    return Intl.message(
      'Invalid nationality',
      name: 'InvalidNationality',
      desc: '',
      args: [],
    );
  }

  /// `Invalid pax info`
  String get InvalidPaxInformation {
    return Intl.message(
      'Invalid pax info',
      name: 'InvalidPaxInformation',
      desc: '',
      args: [],
    );
  }

  /// `Invalid pax type`
  String get InvalidPaxType {
    return Intl.message(
      'Invalid pax type',
      name: 'InvalidPaxType',
      desc: '',
      args: [],
    );
  }

  /// `Please provide the count of the passenger`
  String get ProvidePassengerCount {
    return Intl.message(
      'Please provide the count of the passenger',
      name: 'ProvidePassengerCount',
      desc: '',
      args: [],
    );
  }

  /// `Minimum count of adult should be 1`
  String get MinimumCountOfAdultShouldBe1 {
    return Intl.message(
      'Minimum count of adult should be 1',
      name: 'MinimumCountOfAdultShouldBe1',
      desc: '',
      args: [],
    );
  }

  /// `Invalid child age(s)`
  String get InvalidChildAge {
    return Intl.message(
      'Invalid child age(s)',
      name: 'InvalidChildAge',
      desc: '',
      args: [],
    );
  }

  /// `Invalid result key(s)`
  String get InvalidResultKey {
    return Intl.message(
      'Invalid result key(s)',
      name: 'InvalidResultKey',
      desc: '',
      args: [],
    );
  }

  /// `Passenger count is not compatible with related passenger type`
  String get PassengerCountNotCompatibleWithPassengerType {
    return Intl.message(
      'Passenger count is not compatible with related passenger type',
      name: 'PassengerCountNotCompatibleWithPassengerType',
      desc: '',
      args: [],
    );
  }

  /// `Insufficient quota`
  String get InsufficientQuota {
    return Intl.message(
      'Insufficient quota',
      name: 'InsufficientQuota',
      desc: '',
      args: [],
    );
  }

  /// `Invalid product type`
  String get InvalidProductType {
    return Intl.message(
      'Invalid product type',
      name: 'InvalidProductType',
      desc: '',
      args: [],
    );
  }

  /// `Availability not found`
  String get AvailabilityNotFound {
    return Intl.message(
      'Availability not found',
      name: 'AvailabilityNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Invalid country`
  String get InvalidCountry {
    return Intl.message(
      'Invalid country',
      name: 'InvalidCountry',
      desc: '',
      args: [],
    );
  }

  /// `Reservation updated by user from main account`
  String get ReservationUpdatedByMainAccountUser {
    return Intl.message(
      'Reservation updated by user from main account',
      name: 'ReservationUpdatedByMainAccountUser',
      desc: '',
      args: [],
    );
  }

  /// `Your search result expired`
  String get SearchResultExpired {
    return Intl.message(
      'Your search result expired',
      name: 'SearchResultExpired',
      desc: '',
      args: [],
    );
  }

  /// `Canceled failed`
  String get CancelledFailed {
    return Intl.message(
      'Canceled failed',
      name: 'CancelledFailed',
      desc: '',
      args: [],
    );
  }

  /// `Invalid mileage program number`
  String get InvalidMileageProgramNumber {
    return Intl.message(
      'Invalid mileage program number',
      name: 'InvalidMileageProgramNumber',
      desc: '',
      args: [],
    );
  }

  /// `Invalid HES code`
  String get InvalidHESCode {
    return Intl.message(
      'Invalid HES code',
      name: 'InvalidHESCode',
      desc: '',
      args: [],
    );
  }

  /// `HES code is mandatory`
  String get HESCodeIsMandatory {
    return Intl.message(
      'HES code is mandatory',
      name: 'HESCodeIsMandatory',
      desc: '',
      args: [],
    );
  }

  /// `Invalid payment type`
  String get InvalidPaymentType {
    return Intl.message(
      'Invalid payment type',
      name: 'InvalidPaymentType',
      desc: '',
      args: [],
    );
  }

  /// `Invalid card info`
  String get InvalidCardInformation {
    return Intl.message(
      'Invalid card info',
      name: 'InvalidCardInformation',
      desc: '',
      args: [],
    );
  }

  /// `3D secure payment is mandatory`
  String get ThreeDSecurePaymentIsMandatory {
    return Intl.message(
      '3D secure payment is mandatory',
      name: 'ThreeDSecurePaymentIsMandatory',
      desc: '',
      args: [],
    );
  }

  /// `Return url is mandatory for 3D secure payment`
  String get ReturnUrlIsMandatoryForThreeDSecurePayment {
    return Intl.message(
      'Return url is mandatory for 3D secure payment',
      name: 'ReturnUrlIsMandatoryForThreeDSecurePayment',
      desc: '',
      args: [],
    );
  }

  /// `Return url is mandatory for APS(Alternative Payment Systems)`
  String get ReturnUrlIsMandatoryForAPS {
    return Intl.message(
      'Return url is mandatory for APS(Alternative Payment Systems)',
      name: 'ReturnUrlIsMandatoryForAPS',
      desc: '',
      args: [],
    );
  }

  /// `Balance is not enough`
  String get BalanceNotEnough {
    return Intl.message(
      'Balance is not enough',
      name: 'BalanceNotEnough',
      desc: '',
      args: [],
    );
  }

  /// `Credit card does not match payment option`
  String get CreditCardDoesNotMatchPaymentOption {
    return Intl.message(
      'Credit card does not match payment option',
      name: 'CreditCardDoesNotMatchPaymentOption',
      desc: '',
      args: [],
    );
  }

  /// `Reservation`
  String get reservationSucceed {
    return Intl.message(
      'Reservation',
      name: 'reservationSucceed',
      desc: '',
      args: [],
    );
  }

  /// `Reservation failed`
  String get reservationFailed {
    return Intl.message(
      'Reservation failed',
      name: 'reservationFailed',
      desc: '',
      args: [],
    );
  }

  /// `Reservation expired`
  String get reservationExpired {
    return Intl.message(
      'Reservation expired',
      name: 'reservationExpired',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get reservationCancelled {
    return Intl.message(
      'Cancel',
      name: 'reservationCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Issue ticket failed`
  String get ticketingFailed {
    return Intl.message(
      'Issue ticket failed',
      name: 'ticketingFailed',
      desc: '',
      args: [],
    );
  }

  /// `Sales`
  String get ticketingSucceed {
    return Intl.message(
      'Sales',
      name: 'ticketingSucceed',
      desc: '',
      args: [],
    );
  }

  /// `Ticket cancelled`
  String get ticketingCancelled {
    return Intl.message(
      'Ticket cancelled',
      name: 'ticketingCancelled',
      desc: '',
      args: [],
    );
  }

  /// `Reservation details changed`
  String get reservationChanged {
    return Intl.message(
      'Reservation details changed',
      name: 'reservationChanged',
      desc: '',
      args: [],
    );
  }

  /// `Ticket details changed`
  String get ticketingChanged {
    return Intl.message(
      'Ticket details changed',
      name: 'ticketingChanged',
      desc: '',
      args: [],
    );
  }

  /// `Pending cancellation`
  String get cancellationPending {
    return Intl.message(
      'Pending cancellation',
      name: 'cancellationPending',
      desc: '',
      args: [],
    );
  }

  /// `Ticket void succeed`
  String get ticketingVoid {
    return Intl.message(
      'Ticket void succeed',
      name: 'ticketingVoid',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
