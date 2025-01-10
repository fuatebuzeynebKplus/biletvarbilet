import 'dart:async';
import 'dart:convert';

import 'package:bamobile1/common/data/enums/gender_type.dart';
import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/common/data/enums/payment_commission_type.dart';

import 'package:bamobile1/common/data/enums/payment_type.dart';
import 'package:bamobile1/common/data/models/booking_request.dart';
import 'package:bamobile1/common/data/models/hotel_room_pax.dart';
import 'package:bamobile1/common/data/models/payment_group.dart';
import 'package:bamobile1/common/data/models/payment_option.dart';
import 'package:bamobile1/common/data/models/payment_option_request.dart';
import 'package:bamobile1/common/data/models/payment_result.dart';
import 'package:bamobile1/common/data/models/payment_verification_result.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/flight/data/models/pax_definition.dart';

import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/hotel/data/models/get_hotel_room_cancellation_policies_model.dart';
import 'package:bamobile1/hotel/data/models/get_validate_hotel_room_model.dart';
import 'package:bamobile1/hotel/data/models/hotel_availability.dart';
import 'package:bamobile1/hotel/data/models/hotel_booking_pax.dart';
import 'package:bamobile1/hotel/data/models/hotel_details.dart';
import 'package:bamobile1/hotel/data/models/hotel_details_result_model.dart';
import 'package:bamobile1/hotel/data/models/hotel_main_result.dart';
import 'package:bamobile1/hotel/data/models/hotel_room_price_result_model.dart';
import 'package:bamobile1/hotel/data/models/hotel_search_filter.dart';
import 'package:bamobile1/hotel/data/models/hotel_search_result.dart';
import 'package:bamobile1/hotel/data/models/hotels.dart';
import 'package:bamobile1/hotel/data/models/payment_options.dart';
import 'package:bamobile1/hotel/data/models/room_cancellation_policies.dart';
import 'package:bamobile1/hotel/data/models/room_offers.dart';
import 'package:bamobile1/hotel/data/models/room_pax_definition.dart';
import 'package:bamobile1/flight/data/models/pax.dart';
import 'package:bamobile1/hotel/data/models/search_hotel.dart';
import 'package:bamobile1/hotel/data/models/validate_hotel_rooms.dart';
import 'package:bamobile1/models/errors_model.dart';
import 'package:bamobile1/models/hotel_guest_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'hotel_state.dart';

class HotelCubit extends Cubit<HotelState> {
  HotelCubit() : super(HotelInitial());

  DateTimeRange? dateTimeRange; //value select date for return
  DateTimeRange selectDateTimeRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  String bottomSheetValue = 'h0';
  String? nationality;
  bool? isClickToNationality = false;
  // int adultQuantity = 1; //passenger from adult
  // int childQuantity = 0; //passenger from child
  int paxesCount = 2;
  int roomQuantity = 1; //passenger from baby
  List<int?> childAgeList = [];
  List<RoomPaxDefinition> roomsList = [
    RoomPaxDefinition(
      paxes: [PaxDefinition(count: 2, paxType: PaxType.adult)],
      roomIndex: 0,
    )
  ];

  String?
      selectBetweenTwoTextValue; //this variable for (male-female) and (Economy-Business)
  int? selectHotelCard;
  int? selectHotelRoomCard;

  String? selectPaymentType;
  String? radioForInstallmentType;
  String? radioForAlternativeType;

  String? searchHotelFullName;
  String? searchHotelCountryName;
  String? searchHotelCountryCode;
  String? searchHotelCode;
  int? searchDestinationCode;

  String? email;
  String? phoneNo;
  String? countryPhone;
  String? firstName;
  String? lastName;
  String? gender;
  DateTime? birthday;

  int? arguments;
  int? argumentsSub;

  int? hotelIndex;
  void sendHotelArguments({required int argument, required int argumentSub}) {
    arguments = argument;
    argumentsSub = argumentSub;
    emit(SendArgumentsHotelState());
  }

  void dateRangePicker() {
    selectDateTimeRange = dateTimeRange!;
    emit(DateRangePickerState());
  }

  void sendHotelIndex({required int value}) {
    hotelIndex = value;
    emit(SendIndexHotelState());
  }

  String? productCode;
  void sendHotelProductCode({required String value}) {
    productCode = value;
    emit(SendIndexHotelState());
  }

  void selectRadioForInstallmentTypeFunction(String? value) {
    radioForInstallmentType = value;

    emit(SelectRadioButtonForPaymentViewState());
  }

  void bottomSheetValueFunction({required String type}) {
    bottomSheetValue = type;
    emit(BottomSheetState());
  }

  void isClickToNationalityFunction() {
    isClickToNationality == false
        ? isClickToNationality = true
        : isClickToNationality = false;
    emit(ClickNationalityState());
  }

  //for select how many passengers (Increment)
  void incrementValue({required int type, int? index}) {
    if (type == 1) {
      roomsList[index!].paxes.first.count += 1;
      paxesCount += 1;
    } else if (type == 2) {
      if (roomsList[index!].paxes.last.paxType == PaxType.child) {
        roomsList[index].paxes.last.count += 1;
      } else {
        roomsList[index].paxes.add(
            PaxDefinition(count: 1, paxType: PaxType.child, childAgeList: []));
      }
      paxesCount += 1;
    } else if (type == 3) {
      roomsList.add(RoomPaxDefinition(
          roomIndex: roomsList.length,
          paxes: [PaxDefinition(count: 1, paxType: PaxType.adult)]));
      paxesCount += 1;
    }

    emit(HotelIncrementState());
  }

  String formatNumber(double number) {
    String formattedNumber = number.toStringAsFixed(2);

    formattedNumber = formattedNumber.replaceAll('.', ',');

    String integerPart = formattedNumber.split(',')[0];
    String decimalPart = formattedNumber.split(',')[1];

    String formattedIntegerPart = integerPart.replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.");

    return "$formattedIntegerPart,$decimalPart";
  }

  void dropDownValue({int? value, required int index, required int indexSub}) {
    roomsList[index].paxes.last.childAgeList ??= [];

    if (roomsList[index].paxes.last.childAgeList!.length < 3) {
      roomsList[index].paxes.last.childAgeList!.add(value!);
    } else if (indexSub >= 0 &&
        indexSub < roomsList[index].paxes.last.childAgeList!.length) {
      roomsList[index].paxes.last.childAgeList![indexSub] = value!;
    }

    emit(HotelDropDownState());
  }

  void selectBetweenTwoTextFunction(
      {required String firstText, required String secondText}) {
    if (selectBetweenTwoTextValue == firstText) {
      selectBetweenTwoTextValue = secondText;
    } else {
      selectBetweenTwoTextValue = firstText;
    }
    emit(SelectBetweenTwoTextState());
  }

//for select how many passengers (Remove)
  void removeValue({required int type, int? index}) {
    if (type == 1) {
      roomsList[index!].paxes.first.count -= 1;
      paxesCount -= 1;
    }
    if (type == 2) {
      if (roomsList[index!].paxes.last.count == 1 &&
          roomsList[index].paxes.last.paxType == PaxType.child) {
        //  roomsList[index].paxes[1].count -= 1;
        roomsList[index].paxes.removeWhere(
            (pax) => pax.count == 1 && pax.paxType == PaxType.child);

        print('type 2--------------------- if');
      } else {
        roomsList[index].paxes[1].count -= 1;
        print('type 2--------------------- else');
      }
      paxesCount -= 1;
    }
    if (type == 3) {
      if (roomsList.length == 1) {
      } else {
        int count = 0;

        for (var element in roomsList.last.paxes) {
          print('Element count: ${element.count}');
          count += element.count;
          print('Total count so far: $count');
        }
        print('Final count: $count');

        paxesCount -= count;
        print('Updated paxesCount: $paxesCount');
        roomsList.removeLast();
      }
    }

    emit(HotelRemoveState());
  }

  double? totalRoomPrice;
  String? currencyCodeForHotelOrRoom;
  void getTotalRoomPrice(
      {required double value, required String currencyCode}) {
    totalRoomPrice = 0.0;
    if (value == 0.0) {
      totalRoomPrice = null;
    } else {
      totalRoomPrice = value;
    }
    currencyCodeForHotelOrRoom = currencyCode;
    emit(GetTotalRoomPriceState());
  }

  int selectHotelCardDetailsValue = 1;
  void selectHotelCardDetailsFunction({required int value}) {
    if (value == 1) {
      selectHotelCardDetailsValue = 1;
    } else if (value == 2) {
      selectHotelCardDetailsValue = 2;
    } else if (value == 3) {
      selectHotelCardDetailsValue = 3;
    } else if (value == 4) {
      selectHotelCardDetailsValue = 4;
    } else if (value == 5) {
      selectHotelCardDetailsValue = 5;
    }
    emit(SelectHotelCardDetailsState());
  }

  bool typeIsAmount = true;
  double? amount;
  int? percent;
  void selectMarkupTypeFunction({required bool value}) {
    if (value == true) {
      typeIsAmount = true;
    } else if (value == false) {
      typeIsAmount = false;
    }
    emit(SelectMarkupTypeState());
  }

  void selectHotelCardFunction({required int value}) {
    if (selectHotelCard == value) {
      selectHotelCard = null;
    } else {
      selectHotelCard = value;
    }
    emit(SelectHotelCardState());
  }

  void selectHotelRoomCardFunction({required int value}) {
    if (selectHotelRoomCard == value) {
      selectHotelRoomCard = null;
    } else {
      selectHotelRoomCard = value;
      bottomSheetValue = 'h0';
    }

    emit(SelectHotelCardState());
  }

  PaymentType? paymentType;
  void selectPaymentTypeFunction(String? value, BuildContext context) {
    if (selectPaymentType == value) {
      selectPaymentType = null;
      paymentType = null;
    } else {
      selectPaymentType = value;
      if (value == S.of(context).CreditCard) {
        paymentType = PaymentType.customerCreditCard;
      } else if (value == S.of(context).Current) {
        paymentType = PaymentType.currentAccount;
      } else if (value == S.of(context).PreReservation) {
        paymentType = PaymentType.preBooking;
      } else if (value == S.of(context).AlternativePayment) {
        paymentType = PaymentType.aps;
      } else {
        print('***************************Error***************');
      }
    }

    emit(HotelSelectRadioButtonForPaymentViewState());
  }

  String? title;

  void saveTitle({required String value}) {
    title = value;
  }

  void clearAllFields({required int index, required int indexSub}) {
    if (hotelGuestCardDataList[index][indexSub]!.firstName != null) {
      firstName = null;
    } else {
      null;
    }
    if (hotelGuestCardDataList[index][indexSub]!.birthday != null) {
      birthday = null;
    } else {
      null;
    }

    if (hotelGuestCardDataList[index][indexSub]!.lastName != null) {
      lastName = null;
    } else {
      null;
    }
    emit(AddIndexState());
  }

// this function for check fields not empty and add passenger info to the passengerCardDataList and for update data
  List<List<HotelGuestCardDataModel?>> hotelGuestCardDataList = [];
  void upDataTestForBarthDay(
      {required int index,
      required int indexSub,
      required BuildContext context}) {
    if (title == S.of(context).Adult) {
      hotelGuestCardDataList[index][indexSub] =
          HotelGuestCardDataModel(birthday: null);
    } else {
      hotelGuestCardDataList[index][indexSub] =
          HotelGuestCardDataModel(birthday: birthday);
    }
    emit(AddIndexState());
  }

  void processFlightTicket(BuildContext context, int index, int indexSub) {
    print(hotelGuestCardDataList);

    if (firstName == null && hotelGuestCardDataList[index][indexSub] == null) {
      SnackbarUtils.showSnackbar(
          context, S.of(context).TheNameMustNotBeLeftBlank);
    } else if (lastName == null &&
        hotelGuestCardDataList[index][indexSub] == null) {
      SnackbarUtils.showSnackbar(
          context, S.of(context).TheLastNameMustNotBeLeftBlank);
    } else if (birthday == null &&
        hotelGuestCardDataList[index][indexSub] == null) {
      SnackbarUtils.showSnackbar(
          context, S.of(context).TheBirthDayMustNotBeLeftBlank);
    } else if (firstName == null &&
        firstName != hotelGuestCardDataList[index][indexSub]?.firstName) {
      print('1111111111111');

      firstName ??= hotelGuestCardDataList[index][indexSub]?.firstName;
      lastName ??= hotelGuestCardDataList[index][indexSub]?.lastName;
      hotelGuestCardDataList[index][indexSub]?.firstName = firstName;

      hotelGuestCardDataList[index][indexSub]?.lastName = lastName;
      hotelGuestCardDataList[index][indexSub]!.itIsOk = true;
      hotelGuestCardDataList[index][indexSub]!.gender =
          selectBetweenTwoTextValue;
      clearAllFields(index: index, indexSub: indexSub);
      emit(AddIndexState());
      Navigator.pop(context);
    } else if (firstName == null &&
        hotelGuestCardDataList[index][indexSub]!.birthday != null &&
        hotelGuestCardDataList[index][indexSub]!.firstName == null) {
      print('77');
      SnackbarUtils.showSnackbar(
          context, S.of(context).TheNameMustNotBeLeftBlank);
    } else if (lastName == null &&
        hotelGuestCardDataList[index][indexSub]!.birthday != null &&
        hotelGuestCardDataList[index][indexSub]!.lastName == null) {
      print('888');
      SnackbarUtils.showSnackbar(
          context, S.of(context).TheLastNameMustNotBeLeftBlank);
    } else if (firstName != null &&
        hotelGuestCardDataList[index][indexSub] != null) {
      print('333333333333');
      firstName ??= hotelGuestCardDataList[index][indexSub]?.firstName;
      lastName ??= hotelGuestCardDataList[index][indexSub]?.lastName;
      hotelGuestCardDataList[index][indexSub]?.firstName = firstName;
      hotelGuestCardDataList[index][indexSub]!.lastName = lastName;
      hotelGuestCardDataList[index][indexSub]!.itIsOk = true;
      hotelGuestCardDataList[index][indexSub]!.gender =
          selectBetweenTwoTextValue;

      //  clearAllFields(index: index, indexSub: indexSub);
      emit(AddIndexState());
      Navigator.pop(context);
    } else {
      firstName ??= hotelGuestCardDataList[index][indexSub]?.firstName;
      lastName ??= hotelGuestCardDataList[index][indexSub]?.lastName;
      hotelGuestCardDataList[index][indexSub]?.firstName = firstName;
      hotelGuestCardDataList[index][indexSub]!.lastName = lastName;
      hotelGuestCardDataList[index][indexSub]!.itIsOk = true;
      hotelGuestCardDataList[index][indexSub]!.gender =
          selectBetweenTwoTextValue;
      emit(AddIndexState());
      Navigator.pop(context);
    }
  }

  List<HotelRoomPax> paxInfoList = [];

  Future<void> convertGuestDataToPaxList(BuildContext context) async {
    // حلقة خارجية للمرور على جميع القوائم الفرعية
    for (int i = 0; i < hotelGuestCardDataList.length; i++) {
      // حلقة داخلية للمرور على جميع العناصر داخل كل قائمة فرعية
      for (int j = 0; j < hotelGuestCardDataList[i].length; j++) {
        var guest = hotelGuestCardDataList[i][j];
        if (guest != null) {
          String title = j < roomsList[i].paxes.first.count
              ? S.of(context).Adult
              : S.of(context).Child;

          // تعريف كائن Pax بناءً على بيانات الضيف
          Pax pax = Pax(
            firstName: guest.firstName ?? '',
            lastName: guest.lastName ?? '',
            nationalityCode: nationality ?? 'TR',
            dateOfBirth: title == S.of(context).Adult
                ? DateFormat('yyyy-MM-dd 00:00:00.000').format(DateTime(
                    DateTime.now().year - 35,
                    DateTime.now().month,
                    DateTime.now().day,
                  ))
                : guest.birthday.toString() ?? '',
            genderType: guest.gender == S.of(context).Man
                ? GenderType.male
                : GenderType.female,
          );

          // تعريف كائن HotelBookingPax
          HotelBookingPax hotelBookingPax = HotelBookingPax(
            hotelPaxType:
                title == S.of(context).Adult ? PaxType.adult : PaxType.child,
            isLeader: j == 0, // فقط أول ضيف في القائمة يعتبر القائد
            pax: pax,
          );

          // تحقق من تكرار الضيف في نفس الغرفة
          int existingRoomIndex = paxInfoList.indexWhere(
            (room) => room.roomIndex == i,
          );

          if (existingRoomIndex != -1) {
            // تحقق إذا كان الضيف موجودًا بالفعل في الغرفة
            bool guestExists = paxInfoList[existingRoomIndex].paxes?.any(
                    (existingPax) =>
                        existingPax.pax.firstName == guest.firstName &&
                        existingPax.pax.lastName == guest.lastName) ??
                false;

            if (!guestExists) {
              // إذا لم يكن الضيف مكررًا، أضف إليه الغرفة
              paxInfoList[existingRoomIndex].paxes?.add(hotelBookingPax);
            }
          } else {
            // إذا لم تكن الغرفة موجودة، قم بإنشائها وأضفها إلى القائمة
            HotelRoomPax hotelRoomPax = HotelRoomPax(
              roomIndex: i,
              paxes: [hotelBookingPax],
            );
            paxInfoList.add(hotelRoomPax);
          }
        }
      }
    }
  }

  //  paxInfo: PaxInfo(
  //                                                   flightPaxes:
  //                                                       flightTicketCubit
  //                                                           .paxInfoList),

  //----------------------------------api---------------------------------
  String apiBaseUrl =
      "https://sandbox.kplus.com.tr/kplus/v0/Hotel.svc/Rest/Json";
  String apiGeneralUrl =
      "https://sandbox.kplus.com.tr/kplus/v0/General.svc/Rest/Json";

  // String apiGeneralUrl =
  //     "http://ws.kplus.com.tr/bookingagoratr/v0/General.svc/Rest/Json";
  // String apiBaseUrl =
  //     "http://ws.kplus.com.tr/bookingagoratr/v0/Hotel.svc/Rest/Json";
  final Dio _dio = Dio();
  dynamic searchDataForCity;
  dynamic searchDataForCityTow;
  Future<Map<String, dynamic>> searchDestination(String text) async {
    emit(SearchHotelDataLoading());
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await _dio.post(
        "$apiGeneralUrl/SearchDestination",
        data: json.encode({
          "request": {
            "TokenCode": getIt<CacheHelper>().getDataString(key: 'token'),
            "SearchKey": text,
          }
        }),
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode! > 400) {
        throw Exception("An error occurred: ${response.data}");
      }

      final responseData = response.data;
      print('Arama Sonucu99: $responseData'); // Yanıtı konsola yazdır
      searchDataForCity = responseData['Result'];

      emit(SearchHotelDataSuccess());

      return responseData;
    } catch (e) {
      emit(SearchHotelDataFailure(errorMassage: e.toString()));
      print('Arama hatası: $e'); // Hata durumunu konsola yazdır
      throw Exception('Failed to search airport: $e');
    }
  }

  Future<Map<String, dynamic>> searchHotelName(String text) async {
    emit(SearchHotelDataLoading());
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await _dio.post(
        "$apiGeneralUrl/SearchHotelName",
        data: json.encode({
          "request": {
            "TokenCode": getIt<CacheHelper>().getDataString(key: 'token'),
            "SearchKey": text,
          }
        }),
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode! > 400) {
        throw Exception("An error occurred: ${response.data}");
      }

      final responseData = response.data;
      print('Arama Sonucu99: $responseData'); // Yanıtı konsola yazdır
      searchDataForCityTow = responseData['Result'];

      emit(SearchHotelDataSuccess());

      return responseData;
    } catch (e) {
      emit(SearchHotelDataFailure(errorMassage: e.toString()));
      print('Arama hatası: $e'); // Hata durumunu konsola yazdır
      throw Exception('Failed to search airport: $e');
    }
  }

  bool? isChangeHotelCard = false;
  void changeHotelCard() {
    isChangeHotelCard = !isChangeHotelCard!;
    emit(ChangeHotelCardState());
  }

  String? errorMassage;
  String? errorCode;
  List<HotelElement> hotelSearchResults = [];
  String? searchKey;
  Future<dynamic> searchHotels(
      HotelSearchFilterJson request, BuildContext context) async {
    emit(SearchAllHotelListLoading());
    hotelSearchResults = [];
    String url = '$apiBaseUrl/SearchHotel';
    final requestJson = jsonEncode(request.toJson());
    print("requestJson:::::$requestJson");

    try {
      final response = await _dio.post(url, data: requestJson);
      final responseData = response.data;

      if (responseData != null) {
        final result = HotelMainResult.fromJson(responseData);
        searchKey = result.result?.searchKey;

        // تحديث الحالة بشكل تدريجي لكل فندق
        for (var hotel in result.result!.hotels) {
          hotelSearchResults.add(hotel);

          // حساب السعر كما في المثال السابق
          double totalPrice = 0.0;
          for (var room in hotel.rooms) {
            totalPrice += BlocProvider.of<CurrencyCodeCubit>(context)
                .convertToAppCurrency(
                    itemPrice:
                        room.roomAlternatives.first.totalAmount.toDouble(),
                    appCurrencyExchangeRate:
                        BlocProvider.of<CurrencyCodeCubit>(context)
                            .currencyRate!,
                    ticketCurrencyCode:
                        room.roomAlternatives.first.currencyCode!);
          }

          // تحديث الحالة جزئيًا
          emit(SearchAllHotelListSuccess());
        }

        // عند اكتمال جميع البيانات
        emit(SearchAllHotelListSuccess());
        return result;
      } else {
        emit(SearchAllHotelListFailure(
            errorMassage: 'Response data is null', errorCode: 'NULL_RESPONSE'));
      }
    } catch (error) {
      emit(SearchAllHotelListFailure(
          errorMassage: error.toString(), errorCode: 'NETWORK_ERROR'));
    }
  }

  ResultHotelDetails? hotelDetailsValue;
  Future<dynamic> getHotelDetailsFunctions(
      HotelDetailsJson request, BuildContext context) async {
    String url = '$apiBaseUrl/GetHotelDetails';

    final requestJson = jsonEncode(request.toJson());
    print("requestJson:::::$requestJson");
    try {
      final response = await _dio.post(url, data: requestJson);
      final responseData = response.data;
      print("responseData:::::::${json.encode(responseData)}");

      if (responseData != null) {
        print("JSON'u HotelSearchResult'a çevirme...");

        try {
          final result = HotelDetailsResultModel.fromJson(responseData);

          hotelDetailsValue = result.result;
          print(hotelDetailsValue);

          return result;
        } catch (e) {
          print(e);
        }
      } else {
        throw Exception('Oteller yüklenemedi');
      }
    } catch (error) {
      print('Error ::::: $error');
      throw Exception('Failed to load Hotels');
    }
  }

  List<double> totalPriceList = [];
  List<String> currencyCodeList = [];
  List<RoomAlternativeModel> hotelRoomAlternativeList = [];
  List<RoomAlternativeModel> oneList = [];
  List<List<RoomAlternativeModel>> twoList = [];
  List<List<String>> roomCodeList = [];
  List<RoomAlternativeModel> twoListIfNoData = [];
  bool? dataIsNull;
  List<SearchFilterRoomModel> roomFilterList = [];
  Future<dynamic> getHotelRoomPrices(
      RoomOffersJson request, BuildContext context) async {
    hotelRoomAlternativeList = [];
    roomCodeList = [];
    totalPriceList = [];
    twoList = [];
    twoListIfNoData = [];
    roomFilterList = [];
    emit(GetHotelRoomPricesLoading());
    print('state---------------------------------1 $state');
    String url = '$apiBaseUrl/GetHotelRoomPrices';

    final requestJson = jsonEncode(request.toJson());
    print("requestJson:::::$requestJson");
    try {
      print('state---------------------------------0 $state');
      final response = await _dio.post(url, data: requestJson);
      final responseData = response.data;
      print("responseData:::::::${json.encode(responseData)}");
      print('state---------------------------------* $state');
      if (responseData != null) {
        print("JSON'u HotelSearchResult'a çevirme..*************************.");

        print('state---------------------------------2 $state');
        try {
          final result = HotelRoomPriceResultModel.fromJson(responseData);

          if (result.result!.hotels.first.data != null) {
            dataIsNull = false;
          } else {
            dataIsNull = true;
          }

          print('state---------------------------------3 $state');
          if (result.result!.hotels.first.data != null) {
            print('--------------------------------------if');
            for (var element in result.result!.hotels.first.rooms) {
              hotelRoomAlternativeList.addAll(element.roomAlternatives);
            }

            for (var element
                in result.result!.hotels.first.data!.roomCombinations) {
              roomCodeList.add(element.roomCodes);
            }

            for (var tt in roomCodeList) {
              for (var element in tt) {
                for (var alternative in hotelRoomAlternativeList) {
                  if (element == alternative.roomCode) {
                    oneList.add(alternative);
                  }
                }
              }
              twoList.add(oneList);

              oneList = [];
            }
            for (var element in twoList) {
              double total = 0.0;
              for (var price in element) {
                total += price.totalAmount;
              }
              currencyCodeList.add(element.first.currencyCode!);
              totalPriceList.add(total);
            }
          } else {
            print('--------------------------------------else');
            for (var element
                in result.result!.hotels.first.rooms.first.roomAlternatives) {
              twoListIfNoData.add(element);
            }
          }

          for (var element in result.result!.searchFilter!.rooms) {
            roomFilterList.add(element);
          }

          print('state---------------------------------4 $state');

          emit(GetHotelRoomPricesSuccess());

          return result;
        } catch (e) {
          print(e);
          emit(GetHotelRoomPricesFailure(
              errorMassage: 'There Is No Room Alternative',
              errorCode: 'PARSE_ERROR'));
          print(state);
        }
      } else {
        emit(GetHotelRoomPricesFailure(
            errorMassage: 'Response data is null', errorCode: 'NULL_RESPONSE'));
        print(state);
        throw Exception('Oteller yüklenemedi');
      }
    } catch (error) {
      emit(GetHotelRoomPricesFailure(
          errorMassage: error.toString(), errorCode: 'NETWORK_ERROR'));
      print(state);
      print('Error ::::: $error');
      throw Exception('Failed to load Hotels');
    }
  }

  List<Map<String, String>> roomsKeysForValidateList = [];
  List<String> roomKeyList = [];
  void getRoomKeys({required int index}) {
    roomKeyList = [];
    roomsKeysForValidateList = [];
    if (dataIsNull == false) {
      for (var element in twoList[index]) {
        roomKeyList.add(element.roomCode!);
      }
    } else {
      roomKeyList.add(twoListIfNoData[index].roomCode!);
    }
    roomsKeysForValidateList = roomKeyList.map((key) {
      return {"Key": key};
    }).toList();
  }

  // void getRoomValidateKeys({required int index}) {
  //   roomKeyList = [];
  //   roomsKeysForValidateList = [];
  //   if (dataIsNull == false) {
  //     for (var element in twoList[index]) {
  //       roomKeyList.add(element.roomCode!);
  //     }
  //   } else {
  //     roomKeyList.add(twoListIfNoData[hotelIndex!].roomCode!);
  //   }
  //   roomsKeysForValidateList = roomKeyList.map((key) {
  //     return {"Key": key};
  //   }).toList();
  // }

  List<String> roomCancellationPoliciesList = [];
  Future<dynamic> getHotelRoomCancellationPolicies(
      RoomCancellationPoliciesJson request, BuildContext context) async {
    roomCancellationPoliciesList = [];
    emit(GetHotelRoomCancellationPoliciesLoading());

    String url = '$apiBaseUrl/GetHotelRoomCancellationPolicies';

    final requestJson = jsonEncode(request.toJson());
    print("requestJson:::::$requestJson");
    try {
      final response = await _dio.post(url, data: requestJson);
      final responseData = response.data;
      print("responseData:::::::${json.encode(responseData)}");

      if (responseData != null) {
        print("JSON'u HotelSearchResult'a çevirme...");

        try {
          final result =
              GetHotelRoomCancellationPoliciesModel.fromJson(responseData);

          for (var element in result.result) {
            roomCancellationPoliciesList.add(element.policyDescription ?? '');
          }
          print('roomCancellationPoliciesList: $roomCancellationPoliciesList');
          emit(GetHotelRoomCancellationPoliciesSuccess());

          return result;
        } catch (e) {
          print(e);
          emit(GetHotelRoomCancellationPoliciesFailure(
              errorMassage: 'Failed to parse response',
              errorCode: 'PARSE_ERROR'));
        }
      } else {
        emit(GetHotelRoomCancellationPoliciesFailure(
            errorMassage: 'Response data is null', errorCode: 'NULL_RESPONSE'));
        throw Exception('Oteller yüklenemedi');
      }
    } catch (error) {
      emit(GetHotelRoomCancellationPoliciesFailure(
          errorMassage: error.toString(), errorCode: 'NETWORK_ERROR'));
      print('Error ::::: $error');
      throw Exception('Failed to load Hotels');
    }
  }

  List<String> roomKeyAfterValidateList = [];
  Future<dynamic> getValidateHotelRooms(
      ValidateHotelRoomsJson request, BuildContext context) async {
    roomKeyAfterValidateList = [];
    //emit(GetHotelRoomCancellationPoliciesLoading());
    String url = '$apiBaseUrl/ValidateHotelRoomsV2';

    final requestJson = jsonEncode(request.toJson());
    print("requestJson:::::$requestJson");
    try {
      final response = await _dio.post(url, data: requestJson);
      final responseData = response.data;
      print("responseData:::::::${json.encode(responseData)}");
      print("00000000000000000000000000");
      if (responseData != null) {
        print("1111111111111111111111111");
        print("JSON'u HotelSearchResult'a çevirme...");

        try {
          final result = GetValidateHotelRoomsModel.fromJson(responseData);

          if (dataIsNull == false) {
            for (var room in result.result!.hotels.first.rooms) {
              for (var element in room.roomAlternatives) {
                roomKeyAfterValidateList.add(element.roomCode!);
              }
            }
          } else {
            for (var room
                in result.result!.hotels.first.rooms.first.roomAlternatives) {
              roomKeyAfterValidateList.add(room.roomCode!);
            }
          }
          print('roomKeyAfterValidateList: $roomKeyAfterValidateList');
          // emit(GetHotelRoomCancellationPoliciesSuccess());
          print("22222222222222222222222222");
          return result;
        } catch (e) {
          print(e);
          // emit(GetHotelRoomCancellationPoliciesFailure(
          //     errorMassage: 'Failed to parse response',
          //     errorCode: 'PARSE_ERROR'));
        }
      } else {
        // emit(GetHotelRoomCancellationPoliciesFailure(
        //     errorMassage: 'Response data is null', errorCode: 'NULL_RESPONSE'));
        throw Exception('Oteller yüklenemedi');
      }
    } catch (error) {
      // emit(GetHotelRoomCancellationPoliciesFailure(
      //     errorMassage: error.toString(), errorCode: 'NETWORK_ERROR'));
      print('Error ::::: $error');
      throw Exception('Failed to load Hotels');
    }
  }

  List<PaymentGroup> creditCardOptions = [];
  List<PaymentGroup> currentAccountOptions = [];
  List<PaymentGroup> preBookingOptions = [];
  List<PaymentGroup> alternativeOptions = [];
  String? bookItemId;
  List<PaymentOption>? paymentOptionList = [];
  String? paymentId;
  Future<PaymentResult> getPaymentOptions(PaymentOptionsJson request) async {
    emit(HotelPaymentOptionsLoading());
    String url = '$apiBaseUrl/GetPaymentOptions';

    final requestJson = jsonEncode(request.toJson());
    print("requestJson for getPaymentOptions:::::$requestJson");

    try {
      final response = await _dio.post(url, data: requestJson);
      final responseData = response.data;
      print(
          "responseData for getPaymentOptions:::::::${json.encode(responseData)}");

      if (responseData != null) {
        print("JSON'u Payment'a çevirme...");

        try {
          final result = PaymentResult.fromJson(responseData);

          if (result.result != null) {
            for (var elementA in result.result!) {
              if (elementA.paymentOptionType == 0) {
                paymentOptionList = elementA.paymentOptions;
                for (int i = 0; i < paymentOptionList!.length; i++) {
                  if (paymentOptionList![i].paymentType ==
                      PaymentType.customerCreditCard) {
                    creditCardOptionsCustomer =
                        paymentOptionList![i].paymentGroups!;
                    bool found = false;

                    for (var itemList in creditCardOptionsCustomer) {
                      for (var element in itemList.paymentGroupItem!) {
                        if (element.isDefaultPaymentItem == true) {
                          bookItemId = element.paymentItemId;
                          found = true;
                          break;
                        }
                      }
                      if (found) {
                        break;
                      }
                    }

                    for (var itemList in creditCardOptionsCustomer) {
                      getAllBinCodesListCustomer.add(itemList.binCodes!);
                    }
                  } else if (paymentOptionList![i].paymentType ==
                      PaymentType.currentAccount) {
                    currentAccountOptions =
                        paymentOptionList![i].paymentGroups!;
                  } else if (paymentOptionList![i].paymentType ==
                      PaymentType.preBooking) {
                    preBookingOptions = paymentOptionList![i].paymentGroups!;
                  } else if (paymentOptionList![i].paymentType ==
                      PaymentType.aps) {
                    alternativeOptions = paymentOptionList![i].paymentGroups!;
                  } else {
                    //           print('We have Error');
                  }
                }
              } else {
                paymentOptionList = elementA.paymentOptions;
                for (int i = 0; i < paymentOptionList!.length; i++) {
                  if (paymentOptionList![i].paymentType ==
                      PaymentType.customerCreditCard) {
                    creditCardOptionsAgent =
                        paymentOptionList![i].paymentGroups!;
                    bool found = false;

                    for (var itemList in creditCardOptionsAgent) {
                      for (var element in itemList.paymentGroupItem!) {
                        if (element.isDefaultPaymentItem == true) {
                          bookItemId = element.paymentItemId;
                          found = true;
                          break;
                        }
                      }
                      if (found) {
                        break;
                      }
                    }

                    for (var itemList in creditCardOptionsAgent) {
                      getAllBinCodesListAgent.add(itemList.binCodes!);
                    }
                  } else if (paymentOptionList![i].paymentType ==
                      PaymentType.currentAccount) {
                    currentAccountOptions =
                        paymentOptionList![i].paymentGroups!;
                  } else if (paymentOptionList![i].paymentType ==
                      PaymentType.preBooking) {
                    preBookingOptions = paymentOptionList![i].paymentGroups!;
                  } else if (paymentOptionList![i].paymentType ==
                      PaymentType.aps) {
                    alternativeOptions = paymentOptionList![i].paymentGroups!;
                  } else {
                    //       print('We have Error');
                  }
                }
              }
            }
            emit(HotelPaymentOptionsSuccess());
            return result;
          } else {
            errorMassage = result.errorMessage;
            errorCode = result.errorCode;
            emit(HotelPaymentOptionsFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
            return result;
          }
        } catch (e) {
          emit(HotelPaymentOptionsFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
          print(e);
          throw Exception(
              'Ödeme seçeneklerini işleme sırasında bir hata oluştu.');
        }
      } else {
        emit(HotelPaymentOptionsFailure(
            errorMassage: errorMassage!, errorCode: errorCode!));
        throw Exception('Ödeme seçeneklerini alma işlemi başarısız oldu.');
      }
    } catch (error) {
      emit(HotelPaymentOptionsFailure(
          errorMassage: errorMassage!, errorCode: errorCode!));
      print('Error in getPaymentOptions ::::: $error');
      throw Exception(
          'Ödeme seçeneklerini alma işlemi sırasında bir hata oluştu.');
    }
  }

  int selectAgentCreditCardOrCustomerCreditCardValue = 0;
  PaymentCommissionType paymentCommissionType =
      PaymentCommissionType.collecting;
  void selectAgentCreditCardOrCustomerCreditCardFunction({
    required int value,
  }) {
    if (0 == value) {
      selectAgentCreditCardOrCustomerCreditCardValue = 0;
      paymentCommissionType = PaymentCommissionType.collecting;
    } else if (1 == value) {
      selectAgentCreditCardOrCustomerCreditCardValue = 1;
      paymentCommissionType = PaymentCommissionType.decreaseFromPrice;
    } else {}
    //  print(
    //       'selectAgentCreditCardOrCustomerCreditCardFunction: $selectAgentCreditCardOrCustomerCreditCardValue');
    //   print('paymentCommissionType: $paymentCommissionType');
    emit(SelectAgentCreditCardOrCustomerCreditCardState());
  }

  List<List<String>> getAllBinCodesListCustomer = [];
  List<List<String>> getAllBinCodesListAgent = [];
  int? binCodeIsHere;
  void searchInBinCodes({required String value}) {
    print('value: $value');
    emit(SearchInBinCodesLoadingState());

    if (value.replaceAll(' ', '').length >= 6) {
      String firstSixDigits = value.replaceAll(' ', '').substring(0, 6);
      if (selectAgentCreditCardOrCustomerCreditCardValue == 0) {
        for (int i = 0; i < getAllBinCodesListCustomer.length; i++) {
          if (getAllBinCodesListCustomer[i].contains(firstSixDigits)) {
            binCodeIsHere = i;

            print(state);
            emit(SearchInBinCodesSuccessState());
            print(state);
          } else {
            null;
          }
        }
      } else if (selectAgentCreditCardOrCustomerCreditCardValue == 1) {
        for (int i = 0; i < getAllBinCodesListAgent.length; i++) {
          if (getAllBinCodesListAgent[i].contains(firstSixDigits)) {
            binCodeIsHere = i;

            print(state);
            emit(SearchInBinCodesSuccessState());
            print(state);
          } else {
            null;
          }
        }
      }
    }
  }

  List<PaymentGroup> creditCardOptionsCustomer = [];
  List<PaymentGroup> creditCardOptionsAgent = [];

  String? creditCardName;
  String? creditCardNumber;
  String? creditCardCvv;
  String? creditCardMonthAndYear;
  bool checkIsAnyOneNullOrNotCompleatForReservationValue = false;
  void checkIsAnyOneNullOrNotCompleatForReservationFunction() {
    if (creditCardName != null &&
        creditCardNumber!.length == 19 &&
        creditCardCvv!.length == 3 &&
        creditCardMonthAndYear != null) {
      checkIsAnyOneNullOrNotCompleatForReservationValue = true;

      emit(CheckIsAnyOneNullOrNotCompleatForReservationState());
    } else {
      checkIsAnyOneNullOrNotCompleatForReservationValue = false;
    }
  }

  String? bookUrlResult;
  bool? is3DPostRequired;
  String? pnrSystemForReservationCard;
  String? pnrSystemForResultView;
  String? lastNameForResultView;
  String? savedSystemPnrFromUrlForResultView;
  String? savedErrorMassageFromUrlForResultView;
  String? savedErrorCodeFromUrlForResultView;
  Future<PaymentVerificationn> bookHotel(
      WrappedBookingRequest request, BuildContext context) async {
    emit(HotelBookLoading());

    print('*******************---------------------');
    String url =
        '$apiBaseUrl/BookHotel'; // API uç noktasını doğru bir şekilde güncelleyin

    final requestJson = jsonEncode(request.toJson());

    // JSON verisinin uzunluğu
    final jsonLength = requestJson.length;

    // JSON verisinin yarısı
    final halfLength = (jsonLength / 2).round();

    // İstek verisinin ilk yarısını bas
    print(
        "requestJson for bookFlight (first half):::::${requestJson.substring(0, halfLength)}");
    //İstek verisinin ikinci yarısını bas
    print(
        "requestJson for bookFlight (second half):::::${requestJson.substring(halfLength)}");

    final response = await _dio.post(url, data: requestJson);
    final responseData = response.data;

    print("responseData for bookFlight:::::::${json.encode(responseData)}");

    if (responseData != null) {
      print("JSON'u PaymentVerification'a çevirme...");

      final result = PaymentVerificationn.fromJson(responseData);
      if (result.result != null) {
        bookUrlResult = result.result!.post3DPageUrl;
        is3DPostRequired = result.result!.is3DPostRequired;
        //  print('bookUrlResult: $bookUrlResult');
        //    print('is3DPostRequired: $is3DPostRequired');
        if (paymentType == PaymentType.currentAccount) {
          pnrSystemForResultView = result.result!.booking!.systemPnr;
          lastNameForResultView = paxInfoList.first.paxes!.first.pax.lastName;
        } else {
          pnrSystemForResultView = savedSystemPnrFromUrlForResultView;
          lastNameForResultView = paxInfoList.first.paxes!.first.pax.lastName;
        }

        //   print('pnrSystemForResultView: $pnrSystemForResultView');
        //     print('lastNameForResultView: $lastNameForResultView');
        if (result.result != null) {
          if (result.result!.booking != null) {
            pnrSystemForReservationCard = result.result!.booking!.systemPnr;
          }
        }
        emit(HotelBookSuccess());
      } else {
        List<ErrorsModel> errors = ErrorsModel.getErrorList(context);
        bool codeIsHere = false;
        errorCode = result.errorCode;
        for (var element in errors) {
          if (errorCode == element.code) {
            errorMassage = element.message;
            codeIsHere = true;
            break;
          }
        }
        //    print('errorCode: $errorCode');
        if (codeIsHere == true) {
          emit(HotelBookFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          errorMassage = '${result.errorMessage}';
          errorCode = result.errorCode;
          emit(HotelBookFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        }
      }
      return result;
    } else {
      emit(HotelBookFailure(
          errorMassage: 'Flight booking failed',
          errorCode: 'Flight booking failed'));
      throw Exception('Flight booking failed');
    }
  }
}
