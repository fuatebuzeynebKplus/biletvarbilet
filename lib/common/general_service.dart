// // service
// import 'package:riverpod/riverpod.dart';

// import '../../../common/data/models/bookingResultReservations.dart';
// import '../../../common/data/models/booking_result.dart';
// import '../../../common/data/models/country.dart';
// import '../../../common/data/models/get_countries_result.dart';
// import '../../../common/data/models/login_response.dart';
// import '../../../common/data/models/login_result.dart';
// import '../../../common/data/models/user.dart';
// import '../../../common/general_provider.dart';
// import 'package:dio/dio.dart';
// import "../../../common/data/models/token.dart";

// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// final container = ProviderContainer();

// class ApiService {
//   final Dio _dio = Dio();
//   final String apiBaseUrl = "https://ws.kplus.com.tr/bagora/v0/";
//   final String apiChannelCode = "MobileChannel";
//   final String apiChannelPassword = "bq@u56Je9LnQT!";

//   Future<Token> createToken() async {
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       //"X-Forwarded-For": "8.8.8.8",
//       //"X-Real-IP": "8.8.8.8"
//     };

//     try {
//       final response = await _dio.post(
//         "${apiBaseUrl}General.svc/Rest/Json/CreateTokenV2",
//         data: json.encode({
//           "channelCredential": {
//             "ChannelCode": apiChannelCode,
//             "ChannelPassword": apiChannelPassword
//           }
//         }),
//         options: Options(
//           headers: headers,
//         ),
//       );

//       if (response.statusCode! > 400) {
//         throw Exception("An error occurred: ${response.data}");
//       }

//       if (response.statusCode == 200) {
//         final tokenData = Token.fromJson(response.data['Result']);
//         print('TokenCode:::: ${tokenData.tokenCode}');

//         // Token'ı shared_preferences'a kaydet
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         prefs.setString('token', tokenData.tokenCode ?? "");
//         prefs.setString('tokenTime', tokenData.expiresAt ?? "");

//         return tokenData;
//       }

//       throw Exception('Unexpected response from server');
//     } catch (e) {
//       print('Error: $e');
//       throw Exception('Failed to create token: $e');
//     }
//   }

//   Future<Map<String, dynamic>> searchAirport(
//       String token, String searchQuery) async {
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//     };

//     try {
//       final response = await _dio.post(
//         "${apiBaseUrl}General.svc/Rest/Json/SearchAirport",
//         data: json.encode({
//           "tokenCode": token,
//           "searchKey": searchQuery,
//         }),
//         options: Options(
//           headers: headers,
//         ),
//       );

//       if (response.statusCode! > 400) {
//         throw Exception("An error occurred: ${response.data}");
//       }

//       final responseData = response.data;
//       print('Arama Sonucu: $responseData'); // Yanıtı konsola yazdır

//       return responseData;
//     } catch (e) {
//       print('Arama hatası: $e'); // Hata durumunu konsola yazdır
//       throw Exception('Failed to search airport: $e');
//     }
//   }

//   Future<LoginResponse> login(User request) async {
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//     };
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedToken = prefs.getString('token');
//     final token = savedToken ?? "";

//     final loginRequest = {
//       "tokenCode": token,
//       "email": request.email,
//       "password": request.password,
//     };

//     final loginRequestJson = json.encode(loginRequest);

//     print('Login Request: $loginRequestJson');

//     try {
//       final response = await _dio.post(
//         "${apiBaseUrl}General.svc/Rest/Json/Login",
//         data: loginRequestJson,
//         options: Options(
//           headers: headers,
//         ),
//       );

//       if (response.statusCode! >= 400) {
//         throw Exception("An error occurred: ${response.data}");
//       }

//       final responseData = response.data;
//       print('Login Response: $responseData');

//       final Data = LoginResponse.fromJson(responseData);
//       if (Data != null) {
//         print("Dönüşüm Başarılı.");
//       } else {
//         print("Dönüşüm Başarısız.");
//       }

//       return Data; // Return an instance of LoginResult
//     } catch (e) {
//       print('Login Error: $e');
//       throw Exception('Failed to login: $e');
//     }
//   }

//   Future<GetCountriesResult> getCountries() async {
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//     };
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedToken = prefs.getString('token');
//     try {
//       final response = await _dio.post(
//         "${apiBaseUrl}General.svc/Rest/Json/GetCountries",
//         data: json.encode({
//           "tokenCode": savedToken,
//           "culture": "en", // Set culture to "en"
//         }),
//         options: Options(
//           headers: headers,
//         ),
//       );

//       if (response.statusCode! >= 400) {
//         throw Exception("An error occurred: ${response.data}");
//       }

//       final responseData = response.data;
//       print('GetCountries Response: $responseData');

//       final countriesData = GetCountriesResult.fromJson(responseData);
//       // container
//       //     .read(getCountriesResultProvider.notifier)
//       //     .updateResults(responseData);

//       if (countriesData != null) {
//         print("Conversion Successful.");
//       } else {
//         print("Conversion Failed.");
//       }

//       return countriesData; // Return an instance of GetCountriesResult
//     } catch (e) {
//       print('GetCountries Error: $e');
//       throw Exception('Failed to get countries: $e');
//     }
//   }

//   Future<BookingResultReservations> getReservations() async {
//     Map<String, String> headers = {
//       'Content-Type': 'application/json',
//     };
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedToken = prefs.getString('token');
//     final token = savedToken ?? "";

//     // Get the current date
//     DateTime currentDate = DateTime.now();

//     // Calculate the date one month ago
//     DateTime oneMonthAgo = currentDate.subtract(Duration(days: 29));

//     final requestData = {
//       "request": {
//         "TokenCode": token,
//         "StartDate":
//             "${oneMonthAgo.day}.${oneMonthAgo.month}.${oneMonthAgo.year}",
//         "EndDate":
//             "${currentDate.day}.${currentDate.month}.${currentDate.year}",
//       }
//     };
//     final requestJson = jsonEncode(requestData);
//     print("requestJsonEncode: $requestJson");

//     try {
//       final response = await _dio.post(
//         "${apiBaseUrl}General.svc/Rest/Json/GetReservations",
//         data: requestJson,
//         options: Options(
//           headers: headers,
//         ),
//       );

//       if (response.statusCode! >= 400) {
//         throw Exception("An error occurred: ${response.data}");
//       }

//       final responseData = response.data;
//       print("responseData: $responseData");

//       final data = BookingResultReservations.fromJson(responseData);

//       if (data != null) {
//         print("Conversion Successful.");
//       } else {
//         print("Conversion Failed.");
//       }

//       return data; // Return an instance of GetCountriesResult
//     } catch (e) {
//       print('GetReservations Error: $e');
//       throw Exception('Failed to get reservations: $e');
//     }
//   }
// }
