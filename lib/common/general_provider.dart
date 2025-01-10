// // lib/providers/token_provider.dart
// import 'package:riverpod/riverpod.dart';

// import '../../../common/data/models/bookingResultReservations.dart';
// import '../../../common/data/models/booking_result.dart';
// import '../../../common/data/models/country.dart';
// import '../../../common/data/models/get_countries_result.dart';
// import '../../../common/data/models/login_response.dart';
// import '../../../common/data/models/login_result.dart';
// import '../../../common/data/models/user.dart';

// import "../../../common/data/models/token.dart";
// import "../../../common/general_service.dart";
// import 'package:shared_preferences/shared_preferences.dart';

// final apiService = ApiService();

// final tokenProvider = FutureProvider<Token>((ref) async {
//   final tokenData = await apiService.createToken();
//   return tokenData;
// });

// final searchAirportProvider =
//     FutureProvider.family<Map<String, dynamic>, String>(
//         (ref, searchQuery) async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   String? savedToken = prefs.getString('token');
//   final token = savedToken;
//   if (token != null) {
//     return apiService.searchAirport(token, searchQuery);
//   } else {
//     throw Exception('Token not available');
//   }
// });

// final loginProvider = FutureProvider.family<LoginResponse, User>(
//   (ref, loginRequest) async {
//     final response = await apiService.login(loginRequest);
//     ref.read(loginResultProvider.notifier).updateResults(response);
//     return response;
//   },
// );

// class LoginResultNotifier extends StateNotifier<LoginResponse> {
//   LoginResultNotifier() : super(LoginResponse()); // Varsayılan başlangıç değeri

//   void updateResults(LoginResponse newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }
// }

// // getValidate isteğinden dönen Response yönetimi için oluşturulan StateNotifier provideri.
// final loginResultProvider =
//     StateNotifierProvider<LoginResultNotifier, LoginResponse>((ref) {
//   return LoginResultNotifier();
// });

// final getCountriesProvider = FutureProvider<GetCountriesResult>((ref) async {
//   final countries = await apiService.getCountries(); // Await the future
//   ref.read(getCountriesResultProvider.notifier).updateResults(countries);
//   return countries;
// });

// class GetCountriesNotifier extends StateNotifier<GetCountriesResult> {
//   GetCountriesNotifier()
//       : super(GetCountriesResult()); // Default initial value is an empty list

//   void updateResults(GetCountriesResult newResults) {
//     state = newResults; // Update the state with new results
//   }
// }

// // StateNotifierProvider for managing the state of getCountriesResultProvider
// final getCountriesResultProvider =
//     StateNotifierProvider<GetCountriesNotifier, GetCountriesResult>((ref) {
//   return GetCountriesNotifier();
// });

// final getReservationsProvider = FutureProvider<BookingResultReservations>(
//   (ref) async {
//     final response = await apiService.getReservations();
//     ref.read(getReservationsResultProvider.notifier).updateResults(response);
//     return response;
//   },
// );

// class GetReservationsNotifier extends StateNotifier<BookingResultReservations> {
//   GetReservationsNotifier()
//       : super(BookingResultReservations()); // Varsayılan başlangıç değeri

//   void updateResults(BookingResultReservations newResults) {
//     state = newResults; // Yeni sonuçları state'e atama
//   }
// }

// // getReservationsResultProvider yönetimi için oluşturulan StateNotifierProvider
// final getReservationsResultProvider =
//     StateNotifierProvider<GetReservationsNotifier, BookingResultReservations>(
//         (ref) {
//   return GetReservationsNotifier();
// });
