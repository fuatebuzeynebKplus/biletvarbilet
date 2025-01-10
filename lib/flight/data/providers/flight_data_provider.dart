// import "../../../common/data/models/booking_request.dart";
// import "../../../common/data/models/payment_verification_result.dart";
// import "../../../common/data/models/result.dart";
// import '../../../flight/fligth_service.dart';
// import 'package:riverpod/riverpod.dart';
// import "../../../flight/data/models/air_search_request.dart";
// import "../../../flight/data/models/air_result.dart";
// import "../../../flight/data/models/air_search_response.dart";
// import "../../../flight/data/models/air_branded_fare_request.dart";
// import "../../../flight/data/models/validate_request.dart";
// import "../../../common/data/models/token.dart";
// import 'package:shared_preferences/shared_preferences.dart';
// import "../../../flight/data/models/air_fare.dart";
// import "../../../flight/data/models/air_validate_request.dart";
// import "../../../common/data/models/payment_option_request.dart";
// import "../../../common/data/models/payment_result.dart";
// import "../../../common/data/models/payment_verification.dart";
// import "../../../common/data/models/booking_request.dart";

// import "../../../common/data/models/booking_result.dart";

// final flightServiceProvider = Provider<FlightService>((ref) {
//   final dio = ref.watch(flightProvider);
//   return FlightService(dio);
// });

// // arama provideri
// final airSearchResponseProvider =
//     FutureProvider.family<Result, RequestModel>((ref, airSearchRequest) async {
//   final flightService = ref.read(flightServiceProvider);
//   final response = await flightService.searchAvailability(
//     airSearchRequest,
//   );
//   return response; // airSearchResponseProvider'ın sonucu olarak döndürülüyor
// });

// // Uçuş araması sonrası gelen uçuşları(Responsu) yönetmek için kullanılan Notifier.
// class FlightResultsNotifier extends StateNotifier<Result> {
//   FlightResultsNotifier() : super(Result()); // Varsayılan başlangıç değeri

//   void updateResults(Result newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }

//   void clear() {
//     state = Result(); // Varsayılan değerle state'i temizle
//   }
// }

// // Uçuş araması sonrası gelen uçuşları(Responsu) yönetmek için kullanılan Provider.
// final flightResultsProvider =
//     StateNotifierProvider<FlightResultsNotifier, Result>((ref) {
//   return FlightResultsNotifier();
// });

// // Seçili uçuşları içinde tutan SelectedFlights dizisini yönetmek için kullanılan Notifier.
// class SelectedFlightsNotifier extends StateNotifier<List<AirResult>> {
//   SelectedFlightsNotifier() : super([]);

//   void addFlight(AirResult flight) {
//     state = [...state, flight];
//   }

//   void removeLastFlight() {
//     if (state.isNotEmpty) {
//       state = List.from(state)..removeLast();
//     }
//   }

//   void clearFlights() {
//     state = [];
//   }
// } //31WR117A20

// // Seçili uçuşları içinde tutan SelectedFlights dizisini yönetmek için kullanılan Provider.
// final selectedFlightsProvider =
//     StateNotifierProvider<SelectedFlightsNotifier, List<AirResult>>((ref) {
//   return SelectedFlightsNotifier();
// });

// // AirBrandedFare Provideri.
// final airBrandedFareProvider = FutureProvider.autoDispose<Result>((ref) async {
//   final flightService = ref.read(flightServiceProvider);
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? savedToken = prefs.getString('token');
//   final selectedFlights = ref.read(selectedFlightsProvider);
//   final List<String> fareKeys = [];

//   for (final flight in selectedFlights) {
//     final fare = flight.fares?[0];

//     if (fare != null) {
//       final alternativeLegs = fare.fareAlternativeLegs;

//       if (alternativeLegs != null) {
//         for (final alternativeLeg in alternativeLegs) {
//           final key = alternativeLeg.key;

//           if (key != null) {
//             fareKeys.add(key);
//           }
//         }
//       }
//     }
//   }

//   final airBrandedFareRequest = AirBrandedFareRequestJson(
//     request: AirBrandedFareRequest(
//       fareAlternativeLegKeys: fareKeys,
//       token: Token(
//         channelCode: "MobileChannel",
//         tokenCode: savedToken,
//       ),
//     ),
//   );

//   final response = await flightService.getBrandedFares(airBrandedFareRequest);
//   ref.read(airBrandedFareResultProvider.notifier).updateResults(response);

//   return response;
// });

// // AirBrandedFare isteğinden dönen Response yönetimi için oluşturulan StateNotifier.
// class AirBrandedFareResultNotifier extends StateNotifier<Result> {
//   AirBrandedFareResultNotifier()
//       : super(Result()); // Varsayılan başlangıç değeri

//   void updateResults(Result newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }

//   void clear() {
//     state = Result(); // Varsayılan değerle state'i temizle
//   }
// }

// // AirBrandedFare isteğinden dönen Response yönetimi için oluşturulan StateNotifier provideri.
// final airBrandedFareResultProvider =
//     StateNotifierProvider<AirBrandedFareResultNotifier, Result>((ref) {
//   return AirBrandedFareResultNotifier();
// });

// // Seçili uçuşların getbrandedfares özellikleri içinde tutan selectedBrandedFares dizisini yönetmek için kullanılan Notifier.
// class SelectedBrandedFaresNotifier extends StateNotifier<List<AirFare>> {
//   SelectedBrandedFaresNotifier() : super([]);

//   void addFlight(AirFare fare) {
//     state = [...state, fare];
//   }

//   void clearFlights() {
//     state = [];
//   }

//   void removeLastFlight() {
//     if (state.isNotEmpty) {
//       state = List.from(state)..removeLast();
//     }
//   }
// }

// // Seçili uçuşları içinde tutan SelectedFlights dizisini yönetmek için kullanılan Provider.
// final selectedBrandedFaresProvider =
//     StateNotifierProvider<SelectedBrandedFaresNotifier, List<AirFare>>((ref) {
//   return SelectedBrandedFaresNotifier();
// });

// // getValidate metodunun Provideri.
// final getValidateProvider = FutureProvider.autoDispose<Result>((ref) async {
//   final flightService = ref.read(flightServiceProvider);
//   final selectedBrandedFares = ref.read(selectedBrandedFaresProvider);
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? savedToken = prefs.getString('token');
//   final List<String> keys = [];

//   for (final flight in selectedBrandedFares) {
//     final fareAlternativeLegs = flight.fareAlternativeLegs;

//     if (fareAlternativeLegs != null) {
//       for (final alternativeLeg in fareAlternativeLegs) {
//         final key = alternativeLeg.key;

//         if (key != null) {
//           keys.add(key);
//         }
//       }
//     }
//   }

//   final getValidateRequest = ValidateRequestJson(
//     request: ValidateRequest(
//       air: AirValidateRequest(fareAlternativeLegKeys: keys),
//       token: Token(
//         channelCode: "MobileChannel",
//         tokenCode: savedToken,
//       ),
//     ),
//   );

//   final response = await flightService.getValidate(getValidateRequest);
//   ref.read(getValidateResultProvider.notifier).updateResults(response);

//   return response;
// });

// // getValidate isteğinden dönen Response yönetimi için oluşturulan StateNotifier.
// class GetValidateResultNotifier extends StateNotifier<Result> {
//   GetValidateResultNotifier() : super(Result()); // Varsayılan başlangıç değeri

//   void updateResults(Result newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }

//   void clear() {
//     state = Result(); // Varsayılan değerle state'i temizle
//   }
// }

// // getValidate isteğinden dönen Response yönetimi için oluşturulan StateNotifier provideri.
// final getValidateResultProvider =
//     StateNotifierProvider<GetValidateResultNotifier, Result>((ref) {
//   return GetValidateResultNotifier();
// });

// final getPaymentOptionProvider =
//     FutureProvider.autoDispose<PaymentResult>((ref) async {
//   final flightService = ref.read(flightServiceProvider);
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? savedToken = prefs.getString('token');
//   final getValidateResult = ref.watch(getValidateResultProvider);
//   final List<String> keys = [];

//   // getValidateResult.result veya result.searchResults gibi değerlerin null olup olmadığını kontrol etmek önemlidir.
//   if (getValidateResult.result != null &&
//       getValidateResult.result!.searchResults != null) {
//     for (final searchResult in getValidateResult.result!.searchResults!) {
//       if (searchResult.results != null) {
//         for (final result in searchResult.results!) {
//           if (result.fares != null) {
//             for (final fare in result.fares!) {
//               if (fare.fareAlternativeLegs != null) {
//                 for (final alternativeLeg in fare.fareAlternativeLegs!) {
//                   final key = alternativeLeg.key;
//                   if (key != null) {
//                     keys.add(key);
//                   }
//                 }
//               }
//             }
//           }
//         }
//       }
//     }
//   }

//   final paymentOptionRequest = PaymentOptionRequestJson(
//     request: PaymentOptionRequest(
//       resultKeys: keys,
//       systemPnr: "",
//       tokenCode: savedToken ?? "",
//     ),
//   );

//   final response = await flightService.getPaymentOptions(paymentOptionRequest);
//   ref.read(getPaymentOptionResultProvider.notifier).updateResults(response);

//   return response;
// });

// // getPayment isteğinden dönen Response yönetimi için oluşturulan StateNotifier.
// class GetPaymentOptionResultNotifier extends StateNotifier<PaymentResult> {
//   GetPaymentOptionResultNotifier()
//       : super(PaymentResult()); // Varsayılan başlangıç değeri

//   void updateResults(PaymentResult newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }

//   void clear() {
//     state = PaymentResult(); // Varsayılan değerle state'i temizle
//   }
// }

// // getPayment isteğinden dönen Response yönetimi için oluşturulan StateNotifier provideri.

// final getPaymentOptionResultProvider =
//     StateNotifierProvider<GetPaymentOptionResultNotifier, PaymentResult>((ref) {
//   return GetPaymentOptionResultNotifier();
// });

// // bookFlight metodunun Provideri.
// final bookFlightProvider =
//     FutureProvider.family<PaymentVerificationn, WrappedBookingRequest>(
//         (ref, bookingRequest) async {
//   final flightService = ref.read(flightServiceProvider);
//   final response = await flightService.bookFlight(bookingRequest);
//   ref.read(bookFlightResultProvider.notifier).updateResults(response);

//   return response;
// });

// class BookFlightResultNotifier extends StateNotifier<PaymentVerificationn> {
//   BookFlightResultNotifier()
//       : super(PaymentVerificationn()); // Varsayılan başlangıç değeri

//   void updateResults(PaymentVerificationn newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }
// }

// // getValidate isteğinden dönen Response yönetimi için oluşturulan StateNotifier provideri.
// final bookFlightResultProvider =
//     StateNotifierProvider<BookFlightResultNotifier, PaymentVerificationn>(
//         (ref) {
//   return BookFlightResultNotifier();
// });

// // retriveReservation servicisinin Provideri.
// final retriveReservationProvider =
//     FutureProvider.family<BookingResult, WrappedBookingRequest>(
//         (ref, request) async {
//   final flightService = ref.read(flightServiceProvider);
//   final response = await flightService.retriveReservation(request);
//   return response; // airSearchResponseProvider'ın sonucu olarak döndürülüyor
// });

// class RetriveReservationNotifier extends StateNotifier<BookingResult> {
//   RetriveReservationNotifier()
//       : super(BookingResult()); // Varsayılan başlangıç değeri

//   void updateResults(BookingResult newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }
// }

// // retriveReservation isteğinden dönen Response yönetimi için oluşturulan StateNotifier provideri.
// final retriveReservationResultProvider =
//     StateNotifierProvider<RetriveReservationNotifier, BookingResult>((ref) {
//   return RetriveReservationNotifier();
// });

// // getbooking service provideri
// final getBookingProvider =
//     FutureProvider.family<BookingResult, WrappedBookingRequest>(
//         (ref, request) async {
//   final flightService = ref.read(flightServiceProvider);
//   final response = await flightService.getBooking(request);
//   return response; // airSearchResponseProvider'ın sonucu olarak döndürülüyor
// });

// class GetBookingNotifier extends StateNotifier<BookingResult> {
//   GetBookingNotifier() : super(BookingResult()); // Varsayılan başlangıç değeri

//   void updateResults(BookingResult newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }
// }

// // retriveReservation isteğinden dönen Response yönetimi için oluşturulan StateNotifier provideri.
// final getBookingResultProvider =
//     StateNotifierProvider<RetriveReservationNotifier, BookingResult>((ref) {
//   return RetriveReservationNotifier();
// });

// // cancelReservation service Provideri
// final cancelReservationProvider =
//     FutureProvider.family<BookingResult, WrappedBookingRequest>(
//         (ref, request) async {
//   final flightService = ref.read(flightServiceProvider);
//   final response = await flightService.cancelReservation(request);
//   return response; // airSearchResponseProvider'ın sonucu olarak döndürülüyor
// });

// class CancelReservationNotifier extends StateNotifier<BookingResult> {
//   CancelReservationNotifier()
//       : super(BookingResult()); // Varsayılan başlangıç değeri

//   void updateResults(BookingResult newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }
// }

// // retriveReservation isteğinden dönen Response yönetimi için oluşturulan StateNotifier provideri.
// final cancelReservationResultProvider =
//     StateNotifierProvider<CancelReservationNotifier, BookingResult>((ref) {
//   return CancelReservationNotifier();
// });

// // reservationToTicket service provideri
// final reservationToTicketProvider =
//     FutureProvider.family<PaymentVerificationn, WrappedBookingRequest>(
//         (ref, request) async {
//   final flightService = ref.read(flightServiceProvider);
//   final response = await flightService.reservationToTicket(request);
//   ref.read(reservationToTicketResultProvider.notifier).updateResults(response);
//   return response; // airSearchResponseProvider'ın sonucu olarak döndürülüyor
// });

// class ReservationToTicketNotifier extends StateNotifier<PaymentVerificationn> {
//   ReservationToTicketNotifier()
//       : super(PaymentVerificationn()); // Varsayılan başlangıç değeri

//   void updateResults(PaymentVerificationn newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }
// }

// // retriveReservation isteğinden dönen Response yönetimi için oluşturulan StateNotifier provideri.
// final reservationToTicketResultProvider =
//     StateNotifierProvider<ReservationToTicketNotifier, PaymentVerificationn>(
//         (ref) {
//   return ReservationToTicketNotifier();
// });
// // getPaymentOptionForReservation provideri.
// final getPaymentOptionForReservationProvider =
//     FutureProvider.family<PaymentResult, PaymentOptionRequestJson>(
//         (ref, request) async {
//   final flightService = ref.read(flightServiceProvider);

//   final response = await flightService.getPaymentOptions(request);
//   ref
//       .read(getPaymentOptionForReservationResultProvider.notifier)
//       .updateResults(response);

//   return response;
// });

// // getPaymentOptionForReservation isteğinden dönen Response yönetimi için oluşturulan StateNotifier.
// class GetPaymentOptionForReservationResultNotifier
//     extends StateNotifier<PaymentResult> {
//   GetPaymentOptionForReservationResultNotifier()
//       : super(PaymentResult()); // Varsayılan başlangıç değeri

//   void updateResults(PaymentResult newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }

//   void clear() {
//     state = PaymentResult(); // Varsayılan değerle state'i temizle
//   }
// }

// // getPaymentOptionForReservation isteğinden dönen Response yönetimi için oluşturulan StateNotifier provideri.
// final getPaymentOptionForReservationResultProvider = StateNotifierProvider<
//     GetPaymentOptionForReservationResultNotifier, PaymentResult>((ref) {
//   return GetPaymentOptionForReservationResultNotifier();
// });
