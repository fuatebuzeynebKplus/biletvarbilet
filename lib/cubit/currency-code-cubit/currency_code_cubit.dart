import 'dart:async';
import 'dart:convert';

import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/helper/shared-preferences/shared_preferences_funs.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../common/data/models/currency_model.dart';

part 'currency_code_state.dart';

class CurrencyCodeCubit extends Cubit<CurrencyCodeState> {
  CurrencyCodeCubit() : super(CurrencyCodeInitial());
  final Dio _dio = Dio();

  DateTime? savedTime;
  Timer? timer;

  DateTime? currencyUpdateTime;
  String? currencyCode;
  String? currencyName;
  double? currencyRate;
  List<Result> currencyList = [];
  String currencyCodeValue =
      getIt<CacheHelper>().getDataString(key: 'CurrencyCode') ?? 'TRY';
  String currencyNameValue =
      getIt<CacheHelper>().getDataString(key: 'CurrencyName') ?? 'Turkish Lira';

  Future<void> saveTimeAndStartTimer() async {
    savedTime = DateTime.now();
    Duration difference = savedTime!.difference(currencyUpdateTime!).abs();
    Duration adjustedDifference =
        (const Duration(hours: 1, minutes: 1) - difference).abs();
    timer = Timer.periodic(adjustedDifference, (timer) {
      fetchCurrencyData();
      print('Saved time: $savedTime');
      print('Currency update time: $currencyUpdateTime');
      print('Difference: $difference');
      print('adjustedDifference: $adjustedDifference');
    });

    print('Saved time: $savedTime');
    print('Currency update time: $currencyUpdateTime');
    print('Difference: $difference');
    print('adjustedDifference: $adjustedDifference');
  }

  Future<void> fetchCurrencyData() async {
    try {
      final response = await _dio.post(
        "https://sandbox.kplus.com.tr/kplus/v0/General.svc/rest/json/GetCurrencies",
        // "https://ws.kplus.com.tr/alsafarigate/v0/General.svc/rest/json/GetCurrencies",
        data: json.encode({
          "tokenCode": getIt<CacheHelper>().getDataString(key: 'token'),
        }),
      );

      if (response.statusCode == 200) {
        final currencyModel = CurrencyModel.fromJson(response.data);
        print('currencyModel: ${currencyModel.result.length}');

        currencyList = currencyModel.result;

        // print('currencyList: ${currencyList.length}');
        bool found = false;
        for (var element in currencyList) {
          if (element.code == currencyCodeValue) {
            currencyRate = element.currencyRate;
            found = true;
            break;
          }
        }

        if (!found) {
          currencyCodeValue = currencyList.first.code!;
          currencyRate = currencyList.first.currencyRate;
        }

        currencyUpdateTime = currencyList.first.updateDate;

        print('currencyRate: $currencyRate');
        print('currencyUpdateTime: $currencyUpdateTime');
        print('currencyCodeValue: $currencyCodeValue');
      } else {}
    } catch (e) {
      //  print("Error fetching data: $e");
    }
  }

  void currencyCodeFunction({required String value, required String name}) {
    currencyCodeValue = value;
    currencyNameValue = name;

    saveCurrencyCode(value);
    saveCurrencyName(name);
    print('currencyCodeValue: $currencyCodeValue');

    emit(CurrencyCodeChanged());
  }

  double convertToAppCurrency({
    required double itemPrice,
    required double appCurrencyExchangeRate,
    required String ticketCurrencyCode,
  }) {
    double? exchangeRate;
    for (var element in currencyList) {
      if (element.code == ticketCurrencyCode) {
        exchangeRate = element.currencyRate;
      }
    }
    if (currencyCodeValue == ticketCurrencyCode) {
      return itemPrice;
    } else {
      double priceInUSD = itemPrice * exchangeRate!;
      return priceInUSD / appCurrencyExchangeRate;
    }
  }
}
























/*
  Timer? refreshTimer;
  void scheduleNextRequest() {
    final now = DateTime.now();
    final nextRequestTime = _getNextRequestTime(now);
    final duration = nextRequestTime.difference(now);
    refreshTimer = Timer(duration, () {
      fetchData();
      scheduleNextRequest();
    });
  }

  DateTime _getNextRequestTime(DateTime now) {
    final List<String> requestTimes = List.generate(24, (index) {
      return '${index.toString().padLeft(2, '0')}:06';
    });
    for (var time in requestTimes) {
      final parts = time.split(':');
      final requestTime = DateTime(now.year, now.month, now.day,
          int.parse(parts[0]), int.parse(parts[1]));

      if (requestTime.isAfter(now)) {
        return requestTime;
      }
    }
    final firstTimeParts = requestTimes.first.split(':');
    return DateTime(now.year, now.month, now.day + 1,
        int.parse(firstTimeParts[0]), int.parse(firstTimeParts[1]));
  }
*/
