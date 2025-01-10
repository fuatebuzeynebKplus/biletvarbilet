// import "../../../common/data/models/payment_verification_result.dart";
// import 'package:dio/dio.dart';

// import '../../../flight/data/models/air_search_request.dart';
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/foundation.dart';
// import 'dart:developer';
// import "../../../common/data/models/result.dart";
// import 'package:riverpod/riverpod.dart';
// import "../../../flight/data/providers/flight_data_provider.dart";
// import "../../../flight/data/models/air_search_response.dart";
// import "../../../flight/data/models/air_branded_fare_request.dart";
// import "../../../flight/data/models/validate_request.dart";
// import "../../../common/data/models/payment_result.dart";
// import "../../../common/data/models/payment_option_request.dart";
// import "../../../common/data/models/booking_request.dart";
// import "../../../common/data/models/payment_verification.dart";

// import "../common/data/models/booking_result.dart";

// final flightProvider = Provider((ref) => Dio(BaseOptions(headers: {
//       "X-CW-API-Key": FlightService,
//     }, baseUrl: 'https://ws.kplus.com.tr/bagora/v0/')));

// class FlightService {
//   final Dio _dio;

//   FlightService(this._dio);

//   Future<dynamic> searchAvailability(RequestModel request) async {
//     final url = '/Air.svc/Rest/Json/SearchAvailability';
//     final requestJson = jsonEncode(request.toJson());
//     print("requestJson:::::$requestJson");
//     try {
//       final response = await _dio.post(url, data: requestJson);
//       final responseData = response.data;
//       print("responseData:::::::${json.encode(responseData)}");

//       if (responseData != null) {
//         print("JSON'u AirSearchResult'a çevirme...");

//         try {
//           final result = Result.fromJson(responseData);

//           return result;
//         } catch (e) {
//           print(e);
//         }
//       } else {
//         throw Exception('Uçuşlar yüklenemedi');
//       }
//     } catch (error) {
//       print('Error ::::: $error');
//       throw Exception('Failed to load flights');
//     }
//   }

//   // Markalı fiyatları almak için API'ye istek yapar
//   Future<Result> getBrandedFares(AirBrandedFareRequestJson request) async {
//     final url = '/Air.svc/Rest/Json/GetBrandedFares';
//     final requestJson = jsonEncode(request.toJson());
//     print("requestJson for getBrandedFares:::::$requestJson");

//     try {
//       final response = await _dio.post(url, data: requestJson);
//       final responseData = response.data;
//       print(
//           "responseData for getBrandedFares:::::::${json.encode(responseData)}");

//       if (responseData != null) {
//         print("JSON'u AirSearchResponse'a çevirme...");

//         try {
//           final result = Result.fromJson(responseData);
//           if (result != null) {
//             print("dönüşüm başarılı");
//           } else {
//             print("dönüşüm başarısız");
//           }
//           return result;
//         } catch (e) {
//           print(e);
//           throw Exception(
//               'Markalı fiyatları işleme sırasında bir hata oluştu.');
//         }
//       } else {
//         throw Exception('Markalı fiyatlar yüklenemedi');
//       }
//     } catch (error) {
//       print('Error in getBrandedFares ::::: $error');
//       throw Exception('Markalı fiyatları alırken bir hata oluştu.');
//     }
//   }

// // Onaylamayı almak için API'ye istek yapar
//   Future<Result> getValidate(ValidateRequestJson request) async {
//     final url =
//         '/Air.svc/Rest/Json/Validate'; // API'nin doğru URL'sini buraya ekleyin
//     final requestJson = jsonEncode(request.toJson());
//     print("requestJson for getValidate:::::$requestJson");

//     try {
//       final response = await _dio.post(url, data: requestJson);
//       final responseData = response.data;
//       print("responseData for getValidate:::::::${json.encode(responseData)}");

//       if (responseData != null) {
//         print("JSON'u AirSearchResponse'a çevirme...");

//         try {
//           final result = Result.fromJson(responseData);

//           return result;
//         } catch (e) {
//           print(e);
//           throw Exception('Doğrulama işleme sırasında bir hata oluştu.');
//         }
//       } else {
//         throw Exception('Doğrulama işlemi başarısız oldu.');
//       }
//     } catch (error) {
//       print('Error in getValidate ::::: $error');
//       throw Exception('Doğrulama işlemi sırasında bir hata oluştu.');
//     }
//   }

// // Ödeme seçeneklerini almak için API'ye istek yapar
//   Future<PaymentResult> getPaymentOptions(
//       PaymentOptionRequestJson request) async {
//     final url =
//         '/Air.svc/Rest/Json/GetPaymentOptions'; // API'nin doğru URL'sini buraya ekleyin
//     final requestJson = jsonEncode(request.toJson());
//     print("requestJson for getPaymentOptions:::::$requestJson");

//     try {
//       final response = await _dio.post(url, data: requestJson);
//       final responseData = response.data;
//       print(
//           "responseData for getPaymentOptions:::::::${json.encode(responseData)}");

//       if (responseData != null) {
//         print("JSON'u Payment'a çevirme...");

//         try {
//           final result = PaymentResult.fromJson(responseData);
//           if (result != null) {
//             print("dönüşüm başarılı");
//             print(result.result?.length);
//           } else {
//             print("dönüşüm başarısız");
//           }
//           return result;
//         } catch (e) {
//           print(e);
//           throw Exception(
//               'Ödeme seçeneklerini işleme sırasında bir hata oluştu.');
//         }
//       } else {
//         throw Exception('Ödeme seçeneklerini alma işlemi başarısız oldu.');
//       }
//     } catch (error) {
//       print('Error in getPaymentOptions ::::: $error');
//       throw Exception(
//           'Ödeme seçeneklerini alma işlemi sırasında bir hata oluştu.');
//     }
//   }

// // Uçuşu rezerve etmek için API'ye istek yapar
//   Future<PaymentVerificationn> bookFlight(WrappedBookingRequest request) async {
//     final url =
//         '/Air.svc/Rest/Json/Book'; // API uç noktasını doğru bir şekilde güncelleyin

//     final requestJson = jsonEncode(request.toJson());

//     // JSON verisinin uzunluğu
//     final jsonLength = requestJson.length;

//     // JSON verisinin yarısı
//     final halfLength = (jsonLength / 2).round();

//     // İstek verisinin ilk yarısını bas
//     print(
//         "requestJson for bookFlight (first half):::::${requestJson.substring(0, halfLength)}");
//     // İstek verisinin ikinci yarısını bas
//     print(
//         "requestJson for bookFlight (second half):::::${requestJson.substring(halfLength)}");

//     try {
//       final response = await _dio.post(url, data: requestJson);
//       final responseData = response.data;

//       print("responseData for bookFlight:::::::${json.encode(responseData)}");

//       if (responseData != null) {
//         print("JSON'u PaymentVerification'a çevirme...");

//         try {
//           final result = PaymentVerificationn.fromJson(responseData);
//           if (result != null) {
//             print("dönüşüm başarılı");
//             return result;
//           } else {
//             print("dönüşüm başarısız");
//             throw Exception(
//                 'Failed to convert the response to PaymentVerification');
//           }
//         } catch (e) {
//           print(e);
//           throw Exception('Reservation process encountered an error.');
//         }
//       } else {
//         throw Exception('Flight booking failed');
//       }
//     } catch (error) {
//       print('Error in bookFlight ::::: $error');
//       throw Exception('Failed to book the flight');
//     }
//   }

//   Future<BookingResult> retriveReservation(
//       WrappedBookingRequest request) async {
//     final url =
//         '/Air.svc/Rest/Json/RetrieveReservation'; // API'nin doğru URL'sini buraya ekleyin
//     final requestJson = jsonEncode(request.toJson());
//     print("requestJson for retriveReservation:::::$requestJson");

//     try {
//       final response = await _dio.post(url, data: requestJson);
//       final responseData = response.data;
//       print(
//           "responseData for retriveReservation:::::::${json.encode(responseData)}");

//       if (responseData != null) {
//         print("JSON'u BookingResult'a çevirme...");

//         try {
//           final result = BookingResult.fromJson(responseData);
//           if (result != null) {
//             print("dönüşüm başarılı");
//             return result;
//           } else {
//             print("dönüşüm başarısız");
//             throw Exception('Failed to convert the response to Booking');
//           }
//           return result; // Sonucu döndür
//         } catch (e) {
//           print(e);
//           throw Exception('Reservasyonları işleme sırasında bir hata oluştu.');
//         }
//       } else {
//         throw Exception('Reservasyonları alma işlemi başarısız oldu.');
//       }
//     } catch (error) {
//       print('Error ::::: $error');
//       throw Exception('Reservasyonları alma işlemi sırasında bir hata oluştu.');
//     }
//   }

// // Rezervasyonu bilet olarak almak için API'ye istek yapar
//   Future<PaymentVerificationn> reservationToTicket(
//       WrappedBookingRequest request) async {
//     // Implement reservationToTicket method
//     final url =
//         '/Air.svc/Rest/Json/ReservationToTicket'; // API'nin doğru URL'sini buraya ekleyin
//     final requestJson = jsonEncode(request.toJson());
//     print("requestJson for reservationToTicket:::::$requestJson");

//     try {
//       final response = await _dio.post(url, data: requestJson);
//       final responseData = response.data;
//       print(
//           "responseData for reservationToTicket:::::::${json.encode(responseData)}");

//       if (responseData != null) {
//         print("JSON'u Payment'a çevirme...");
//         final result = PaymentVerificationn.fromJson(responseData);
//         if (result != null) {
//           print("Dönüşüm başarılı.");
//         } else {
//           print("Dönüşüm başarısız.");
//         }
//         return result;
//       } else {
//         throw Exception(
//             'Rezervasyon bilgilerini yükleme işlemi başarısız oldu.');
//       }
//     } catch (error) {
//       print('Error in reservationToTicket ::::: $error');
//       throw Exception('Rezervasyon bilgileri yüklenirken bir hata oluştu.');
//     }
//   }

// // Rezervasyonu iptal etmek için API'ye istek yapar
//   Future<BookingResult> cancelReservation(WrappedBookingRequest request) async {
//     final url =
//         '/Air.svc/Rest/Json/CancelReservation'; // Update with the correct API endpoint URL
//     final requestJson = jsonEncode(request.toJson());
//     print("requestJson for cancelReservation:::::$requestJson");

//     try {
//       final response = await _dio.post(url, data: requestJson);
//       final responseData = response.data;
//       print(
//           "responseData for cancelReservation:::::::${json.encode(responseData)}");

//       if (responseData != null) {
//         print("Converting JSON to BookingResult...");

//         try {
//           final result = BookingResult.fromJson(responseData);
//           if (result != null) {
//             print("Conversion successful");
//             return result;
//           } else {
//             print("Conversion failed");
//             throw Exception('Failed to convert the response to BookingResult');
//           }
//         } catch (e) {
//           print(e);
//           throw Exception('Cancellation process encountered an error.');
//         }
//       } else {
//         throw Exception('Cancellation of the reservation failed');
//       }
//     } catch (error) {
//       print('Error in cancelReservation ::::: $error');
//       throw Exception('Failed to cancel the reservation');
//     }
//   }

// // Bileti iptal etmek için API'ye istek yapar
//   Future<void> voidTicket() async {
//     // Implement voidTicket method
//   }

// // satın alınan bileti almak için API'ye istek yapar
//   Future<BookingResult> getBooking(WrappedBookingRequest request) async {
//     final url =
//         '/Air.svc/Rest/Json/GetBooking'; // API'nin doğru URL'sini buraya ekleyin
//     final requestJson = jsonEncode(request.toJson());
//     print("requestJson for getBooking:::::$requestJson");

//     try {
//       final response = await _dio.post(url, data: requestJson);
//       final responseData = response.data;
//       print("responseData for getBooking:::::::${json.encode(responseData)}");

//       if (responseData != null) {
//         print("JSON'u BookingResult'a çevirme...");

//         try {
//           final result = BookingResult.fromJson(responseData);
//           if (result != null) {
//             print("dönüşüm başarılı");
//             return result;
//           } else {
//             print("dönüşüm başarısız");
//             throw Exception('Failed to convert the response to BookingResult');
//           }
//         } catch (e) {
//           print(e);
//           throw Exception('Bilet bilgileri işleme sırasında bir hata oluştu.');
//         }
//       } else {
//         throw Exception('Bilet bilgilerini alma işlemi başarısız oldu.');
//       }
//     } catch (error) {
//       print('Error in getBooking ::::: $error');
//       throw Exception(
//           'Bilet bilgilerini alma işlemi sırasında bir hata oluştu.');
//     }
//   }

//   // Ücret kurallarını almak için API'ye istek yapar
//   Future<void> getFareRules() async {
//     // Implement getFareRules method
//   }
// }
