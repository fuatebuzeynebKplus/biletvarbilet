import 'dart:convert';
import 'dart:math';
import 'package:bamobile1/flight/data/models/get_booking_model.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;
import 'package:bamobile1/common/data/enums/air_cabin_type.dart';
import 'package:bamobile1/common/data/enums/air_result_type.dart';
import 'package:bamobile1/common/data/enums/booking_status_type.dart';
import 'package:bamobile1/common/data/enums/gender_type.dart';
import 'package:bamobile1/common/data/enums/hotpoint_type.dart';
import 'package:bamobile1/common/data/enums/pax_type.dart';
import 'package:bamobile1/common/data/enums/payment_commission_type.dart';
import 'package:bamobile1/common/data/enums/payment_type.dart';
import 'package:bamobile1/common/data/models/booking.dart';
import 'package:bamobile1/common/data/models/bookingResultReservations.dart';
import 'package:bamobile1/common/data/models/booking_request.dart';
import 'package:bamobile1/common/data/models/booking_result.dart';
import 'package:bamobile1/common/data/models/error_codes.dart';
import 'package:bamobile1/common/data/models/result_voucher.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/flight/data/models/air.dart';
import 'package:bamobile1/flight/data/models/air_alternative_leg.dart';
import 'package:bamobile1/flight/data/models/air_fare.dart';
import 'package:bamobile1/flight/data/models/air_fare.dart';
import 'package:bamobile1/flight/data/models/air_leg.dart';
import 'package:bamobile1/flight/data/models/air_search_leg.dart';
import 'package:bamobile1/flight/data/models/air_search_result.dart';
import 'package:bamobile1/flight/data/models/corporate.dart';
import 'package:bamobile1/flight/data/models/get_voucher.dart';
import 'package:bamobile1/flight/data/models/hotpoint.dart';
import 'package:bamobile1/flight/data/models/mileage_program.dart';
import 'package:bamobile1/flight/data/models/price.dart';
import 'package:bamobile1/hotel/data/models/cancel_reservation.dart';
import 'package:bamobile1/hotel/data/models/retrieve_reservation.dart';
import 'package:bamobile1/models/city_codes_and_airport_codes_model.dart';
import 'package:bamobile1/models/errors_model.dart';
import 'package:bamobile1/models/multi_point_model.dart';
import 'package:bamobile1/views/ticket-views/flight_ticket_passenger_details_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:timezone/standalone.dart' as tz;
import 'package:bamobile1/common/data/models/payment_group.dart';
import 'package:bamobile1/common/data/models/payment_option.dart';
import 'package:bamobile1/common/data/models/payment_option_request.dart';
import 'package:bamobile1/common/data/models/payment_result.dart';
import 'package:bamobile1/common/data/models/payment_verification_result.dart';

import 'package:bamobile1/common/data/models/result.dart';
import 'package:bamobile1/flight/data/models/air_branded_fare_request.dart';
import 'package:bamobile1/flight/data/models/air_result.dart';
import 'package:bamobile1/flight/data/models/air_search_request.dart';
import 'package:bamobile1/flight/data/models/flight_booking_pax.dart';
import 'package:bamobile1/flight/data/models/pax.dart';
import 'package:bamobile1/flight/data/models/validate_request.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/functions.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/models/passenger_model.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
part 'flight_ticket_state.dart';

class FlightTicketCubit extends Cubit<FlightTicketState> {
  FlightTicketCubit() : super(FlightTicketInitial());
  bool isCanceled = false;
  bool? isTicket;
  bool? voucherWithPrice;
  double turns = 0.0; //for animations

  String searchTypeValue = 'gidis'; // searchType (one away- return -multi )
  bool? binCode;
  String? creditCardName;
  String? creditCardNumber;
  String? creditCardCvv;
  String? creditCardMonthAndYear;

  bool isSelectOneWay = true;

  bool onlyDirectFlightsCheckBoxValue = false; //value for check box
  bool onlyRefundableFlightsCheckBoxValue = false; //value for check box
  bool packageSearchCheckBoxValue = false; //value for check box
  bool detailedSearchCheckBoxValue = false; //value for check box

  String?
      selectBetweenTwoTextValue; //this variable for (male-female) and (Economy-Business)
  DateTimeRange? dateTimeRange = DateTimeRange(
      start: DateTime.now(),
      end: DateTime.now()
          .add(const Duration(days: 7))); //value select date for return
  DateTimeRange selectDateTimeRange =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  DateTime? dateTime = DateTime.now(); //value select date for one away
  DateTime? selectDate = DateTime.now();

  int bottomSheetType =
      0; // value for bottom sheet we have from 1-21 bottom sheet and 0 for close
  String? firstSearchCity; //first value for airport select
  String? firstCityCode;
  String? secondSearchCity; //second value for airport select
  String? secondCityCode;
  int? selectBetweenArriveAndDeparture; //0 for arrive and 1 for Departure

  HotpointType? departureHotpointTypeEnum = HotpointType.values[1];
  HotpointType? arrivalHotpointTypeEnum = HotpointType.values[1];

  String? fromAirportCode;
  String? fromCityCode;
  String? toAirportCode;
  String? toCityCode;
  // Future<void> fetchCityAndAirportData() async {
  //   try {
  //     final documentSnapshot = await FirebaseFirestore.instance
  //         .collection('citesAndAirports')
  //         .doc('LAvBY4lNWF3eGOxXKANI') // استبدل هذا بمعرف الوثيقة المطلوب
  //         .get();

  //     if (documentSnapshot.exists) {
  //       final data = documentSnapshot.data();
  //       if (data != null) {
  //         final model = CityCodesAndAirportCodesModel.fromJson(data);
  //         print('toCityCode: ${model.toCityCode}');
  //         print('toAirportCode: ${model.toAirportCode}');
  //         print('fromCityCode: ${model.fromCityCode}');
  //         print('fromAirportCode: ${model.fromAirportCode}');
  //         firstSearchCity = model.fromCityCode!;
  //         firstCityCode = model.fromAirportCode!;
  //         secondSearchCity = model.toCityCode!;
  //         secondCityCode = model.toAirportCode!;

  //         fromCityCode = model.fromCityCode!;
  //         fromAirportCode = model.fromAirportCode!;
  //         toCityCode = model.toCityCode!;
  //         toAirportCode = model.toAirportCode!;
  //       } else {
  //         print('Document data is null.');
  //       }
  //     } else {
  //       print('Document does not exist.');
  //     }
  //   } catch (e) {
  //     print('Error fetching document: $e');
  //   }
  // }

  List<Color> colors = [
    // const Color(0xFFBFBFBF),
    // const Color(0xFF8AA6A3),
    //------
    // const Color(0xFF02A676),
    // const Color(0xFF008C72),
    // const Color(0xFF007369),
    // const Color(0xFF005A5B),
    // const Color(0xFF003840),
    //--------
    // const Color(0xFF4C5958),
    // const Color(0xFF10403B),
    // const Color(0xFF127369),

//-----------------------

    // const Color(0xFF41B3A2),

    // const Color(0xFF7A1CAC),
    // const Color(0xFFA6B37D),
    // //----------------------
    // const Color(0xFFF05A7E),
    // const Color(0xFF55679C),
    // const Color(0xFFE85C0D),
    // const Color(0xFFE2BFD9),
    // const Color(0xFFFF0000),
    // const Color(0xFF028391),

//-------------------------
    const Color(0xFF006B77),

    const Color(0xFF00829B),
    const Color(0xFFF28411),
    const Color(0xFFFC9E49),
    const Color(0xFF9BAABF),
    const Color(0xFFBFC6D1),
    const Color(0xFF009BAA),
    //----------------------

    const Color(0xFF6D87A8),

    const Color(0xFF00494F),
    const Color(0xFF35C4AF),
    const Color(0xFF006B77),

    const Color(0xFF00829B),
    const Color(0xFF009BAA),
    //----------------------
    const Color(0xFFF28411),
    const Color(0xFFFC9E49),
    const Color(0xFF6D87A8),
    const Color(0xFF9BAABF),
    const Color(0xFFBFC6D1),
    const Color(0xFF00494F),
    const Color(0xFF35C4AF),
  ];
//41B3A2
  bool theFlyInTheTurkey = true;

  String? firstSearchCountryCode; //first value for airport select

  String? secondSearchCountryCode;

  bool paymentTypesShow = false;

  void paymentTypesShowFunction() {
    paymentTypesShow = !paymentTypesShow;
    if (paymentTypesShow == false) {
      selectedPaymentTypeForReservation = null;
    }
    emit(PaymentTypesShow());
  }

  int? selectedSeatTypeLeaving; //select leaving package
  int? selectedSeatTypeReturn; //select return package
  int? selectedCardLeaving; //select leaving flight ticket
  int? selectedCardReturn; //select return flight ticket

  String? selectPaymentType;
  String? radioForInstallmentType;
  String? radioForAlternativeType;
  String? radioForSort;

  bool isVisibility = false; //select Visibility return card flight ticket
  bool isVisibilitySeatType =
      false; //select Visibility return card return package
  bool flightDetailsShowContainer = true;

  ///i wont delete this

  int adultQuantity = 1; //passenger from adult
  int childQuantity = 0; //passenger from child
  int babyQuantity = 0; //passenger from baby

  int highestPriceInFilter = 0; //in the filters highestPrice
  int lowestPriceInFilter = 0; //in the filters lowestPrice

  DateTime? flyingFirstHourInFilter; //in the filters FirstHour
  DateTime? flyingSecondHourInFilter; //in the filters SecondHour

  Duration?
      flyingDurationFirstInFilter; //in the filters highest time of the fly

  DateTime? test; //in the filters lowest time of the fly

//those key for textfield

  GlobalKey<FormState> formKeyInPriceBottomSheetInTheFilter = GlobalKey();

//passenger info
  String? firstName;
  String? lastName;
  dynamic nationality = 'TR';
  String? passportNo;
  String? identityNo;
  DateTime? validityDate;
  String? tkFfn;
  String? phoneNo;
  String? email;
  String? countryPhone;
  DateTime? birthday;
  String? gender;

  List<PassengerCardData?> passengerCardDataList = [];

//for add date to the passengerCardDataList from birthdayBottomSheet
  void upDataTestForBarthDay({required int index}) {
    passengerCardDataList[index] = PassengerCardData(birthday: birthday);
    //  passengerCardDataList[index] = PassengerCardData(validityDate: validityDate);

    emit(AddIndexState());
  }

  int arguments = 0;

  void sendArguments({required int argument}) {
    arguments = argument;
    emit(SendArgumentsState());
  }

  List<List<String>> getAllBinCodesListCustomer = [];
  List<List<String>> getAllBinCodesListAgent = [];
  int? binCodeIsHere;
  void searchInBinCodes({required String value}) {
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

  void checkIfGlobalFlyOrNot() {
    emit(CheckIfGlobalFlyOrNot());
  }

// //this function for clear the field when user he want add other passengers info
//   void clearAllFields({required int index}) {
//     if (passengerCardDataList[index]!.firstName != null) {
//       firstName = null;
//     } else {
//       null;
//     }

//     if (passengerCardDataList[index]!.lastName != null) {
//       lastName = null;
//     } else {
//       null;
//     }
//     if (passengerCardDataList[index]!.birthday != null) {
//       birthday = null;
//     } else {
//       null;
//     }
//     if (passengerCardDataList[index]!.validityDate != null) {
//       validityDate = null;
//     } else {
//       null;
//     }
//     if (passengerCardDataList[index]!.nationality != null) {
//       nationality = null;
//     } else {
//       null;
//     }
//     if (passengerCardDataList[index]!.passportNo != null) {
//       passportNo = null;
//     } else {
//       null;
//     }
//     if (passengerCardDataList[index]!.identityNumber != null) {
//       identityNo = null;
//     } else {
//       null;
//     }
//     emit(AddIndexState());
//   }

// this function for check fields not empty and add passenger info to the passengerCardDataList and for update data
  void processFlightTicket(BuildContext context, int index) {
    //   print('passengerCardDataList[index] ${passengerCardDataList[index]}');
    if (firstName == null && passengerCardDataList[index] == null) {
      SnackbarUtils.showSnackbar(
          context, S.of(context).TheNameMustNotBeLeftBlank);
    } else if (lastName == null && passengerCardDataList[index] == null) {
      SnackbarUtils.showSnackbar(
          context, S.of(context).TheLastNameMustNotBeLeftBlank);
    } else if (birthday == null && passengerCardDataList[index] == null) {
      SnackbarUtils.showSnackbar(
          context, S.of(context).TheBirthDayMustNotBeLeftBlank);
    } else if (firstName == null &&
        firstName != passengerCardDataList[index]?.firstName) {
      print('1111111111111');

      firstName ??= passengerCardDataList[index]?.firstName;
      lastName ??= passengerCardDataList[index]?.lastName;
      passengerCardDataList[index]?.firstName = firstName;

      passengerCardDataList[index]?.lastName = lastName;

      //  mile ??= passengerCardDataList[index]?.mileMM ?? [];

      // passengerCardDataList[index]?.mileMM = mile;

      nationality ??= passengerCardDataList[index]?.nationality;

      passengerCardDataList[index]?.nationality = nationality;
      passengerCardDataList[index]!.itIsOk = true;
      passengerCardDataList[index]!.gender = selectBetweenTwoTextValue;

      validityDate ??= passengerCardDataList[index]?.validityDate;
      passengerCardDataList[index]?.validityDate = validityDate;

      passportNo ??= passengerCardDataList[index]?.passportNo;
      identityNo ??= passengerCardDataList[index]?.identityNumber;
      passengerCardDataList[index]?.passportNo = passportNo;

      passengerCardDataList[index]?.identityNumber = identityNo;
      //clearAllFields(index: index);
      emit(AddIndexState());
      Navigator.pushNamed(context, FlightTicketPassengerDetailsView.id);
    } else if (firstName == null &&
        passengerCardDataList[index]!.birthday != null &&
        passengerCardDataList[index]!.firstName == null) {
      print('77');
      SnackbarUtils.showSnackbar(
          context, S.of(context).TheNameMustNotBeLeftBlank);
    } else if (lastName == null &&
        passengerCardDataList[index]!.birthday != null &&
        passengerCardDataList[index]!.lastName == null) {
      print('888');
      SnackbarUtils.showSnackbar(
          context, S.of(context).TheLastNameMustNotBeLeftBlank);
    } else if (firstName != null &&
        passengerCardDataList[index] != null &&
        passengerCardDataList[index]?.firstName != firstName) {
      print('333333333333');
      firstName ??= passengerCardDataList[index]?.firstName;
      lastName ??= passengerCardDataList[index]?.lastName;
      passengerCardDataList[index]?.firstName = firstName;
      passengerCardDataList[index]?.lastName = lastName;

      //mile ??= passengerCardDataList[index]?.mileMM ?? [];

      // passengerCardDataList[index]?.mileMM = mile;

      nationality ??= passengerCardDataList[index]?.nationality;

      passengerCardDataList[index]?.nationality = nationality;

      passengerCardDataList[index]!.itIsOk = true;
      passengerCardDataList[index]!.gender = selectBetweenTwoTextValue;
      validityDate ??= passengerCardDataList[index]?.validityDate;
      passengerCardDataList[index]!.validityDate = validityDate;
      passengerCardDataList[index]!.passportNo = passportNo;
      passengerCardDataList[index]!.identityNumber = identityNo;
      // clearAllFields(index: index);
      emit(AddIndexState());
      Navigator.pushNamed(context, FlightTicketPassengerDetailsView.id);
    } else {
      print('4444444444444');
      firstName ??= passengerCardDataList[index]?.firstName;
      lastName ??= passengerCardDataList[index]?.lastName;
      passengerCardDataList[index]?.firstName = firstName;
      passengerCardDataList[index]?.lastName = lastName;

      //mile ??= passengerCardDataList[index]?.mileMM ?? [];

      // passengerCardDataList[index]?.mileMM = mile;

      nationality ??= passengerCardDataList[index]?.nationality;

      passengerCardDataList[index]?.nationality = nationality;

      passengerCardDataList[index]!.itIsOk = true;
      passengerCardDataList[index]!.gender = selectBetweenTwoTextValue;
      validityDate ??= passengerCardDataList[index]?.validityDate;
      passengerCardDataList[index]!.validityDate = validityDate;
      passengerCardDataList[index]!.passportNo = passportNo;
      passengerCardDataList[index]!.identityNumber = identityNo;
      Navigator.pushNamed(context, FlightTicketPassengerDetailsView.id);
    }
  }

  List<FlightBookingPax> paxInfoList = [];

  List<PaxType> paxTypeList = [];

  void paxTypeListCountFunction() {
    for (int i = 0; i < adultQuantity; i++) {
      print('Adding PaxType.adult to list');
      paxTypeList.add(PaxType.adult);
    }

    for (int i = 0; i < childQuantity; i++) {
      paxTypeList.add(PaxType.child);
    }

    for (int i = 0; i < babyQuantity; i++) {
      paxTypeList.add(PaxType.infant);
    }

    print('paxTypeList= $paxTypeList');
  }

  Future<void> convertPassengerDataToPaxList(BuildContext context) async {
    for (int i = 0; i < passengerCardDataList.length; i++) {
      var passenger = passengerCardDataList[i];
      if (passenger != null) {
        Pax pax = Pax(
            firstName: passenger.firstName ?? '',
            lastName: passenger.lastName ?? '',
            nationalityCode: passenger.nationality ?? "",
            passportNumber: passenger.passportNo ?? '',
            passportValidityDate: convertArabicNumbersToEnglish(
                    passenger.validityDate.toString()) ??
                '',
            dateOfBirth:
                convertArabicNumbersToEnglish(passenger.birthday.toString()) ??
                    '',
            genderType: passenger.gender == S.of(context).Man
                ? GenderType.male
                : GenderType.female,
            identityNumber: passenger.identityNumber ?? "",
            mileagePrograms: mile[i]);

        FlightBookingPax flightBookingPax = FlightBookingPax(
          flightPaxType: paxTypeList[i],
          pax: pax,
        );

        bool exists = paxInfoList.any((existingPax) =>
            existingPax.pax!.firstName == pax.firstName &&
            existingPax.pax!.lastName == pax.lastName &&
            existingPax.pax!.dateOfBirth == pax.dateOfBirth);

        if (exists) {
          // استبدل الراكب الموجود بالراكب الجديد
          int index = paxInfoList.indexWhere((existingPax) =>
              existingPax.pax!.firstName == pax.firstName &&
              existingPax.pax!.lastName == pax.lastName &&
              existingPax.pax!.dateOfBirth == pax.dateOfBirth);
          paxInfoList[index] = flightBookingPax; // استبدال الراكب
        } else {
          paxInfoList.add(flightBookingPax); // إضافة الراكب الجديد
        }
      }
    }

    // طباعة القائمة النهائية
    for (var flightBookingPax in paxInfoList) {
      print(flightBookingPax.toJson());
    }
  }

//for flight type (tek.....)
  void searchType({required String value}) {
    searchTypeValue = value;
    emit(SearchTypeState());
  }

//checkboxes values
  void checkBoxesInFlightTicketView({required newValue, required int type}) {
    if (type == 0) {
      onlyDirectFlightsCheckBoxValue = newValue;
    } else if (type == 1) {
      onlyRefundableFlightsCheckBoxValue = newValue;
    } else if (type == 2) {
      packageSearchCheckBoxValue = newValue;
    } else if (type == 3) {
      detailedSearchCheckBoxValue = newValue;
    }
    emit(HomeCheckBoxesState());
  }

//select between two options
  void selectBetweenTwoTextFunction(
      {required String firstText, required String secondText}) {
    if (selectBetweenTwoTextValue == firstText) {
      selectBetweenTwoTextValue = secondText;
    } else {
      selectBetweenTwoTextValue = firstText;
    }
    emit(SelectBetweenTwoTextState());
  }

//how bottom sheet is activated
  void bottomSheetValue({required int type}) {
    // t=0 nothing (close)
    // t=1 ticket Search Widget (open)
    // t=2 ticket details Widget (yetişkin) (open)
    // t=3 ticket details Widget (markup) (open)
    // t=4 ticket sell Widget (markup) (open)

    print('type: $type');

    bottomSheetType = type;
    emit(BottomSheetState());
  }

  ///for animation
  void toggleTexts() {
    turns += 1 / 2;
    String value;
    value = firstSearchCity!;
    firstSearchCity = secondSearchCity;
    secondSearchCity = value;
    value = firstCityCode!;
    firstCityCode = secondCityCode;
    secondCityCode = value;
    emit(ToggleTextsState());
  }

//for Range(Two) date picker
  void dateRangePicker() {
    selectDateTimeRange = dateTimeRange!;
    emit(DateRangePickerState());
  }

  void datePicker() {
    selectDate = dateTime!;
    emit(DatePickerState());
  }

//for select how many passengers (Increment)
  void incrementValue({required int type}) {
    if (type == 1) {
      adultQuantity += 1;
    } else if (type == 2) {
      childQuantity += 1;
    } else if (type == 3) {
      babyQuantity += 1;
    }

    emit(TicketIncrementState());
  }

//for select how many passengers (Remove)
  void removeValue({required int type}) {
    if (type == 1) {
      if (adultQuantity == 1) {
        adultQuantity = 1;
      } else {
        if (adultQuantity == babyQuantity) {
          adultQuantity -= 1;
          babyQuantity -= 1;
        } else {
          adultQuantity -= 1;
        }
      }
    }
    if (type == 2) {
      if (childQuantity == 0) {
        childQuantity = 0;
      } else {
        childQuantity -= 1;
      }
    }
    if (type == 3) {
      if (babyQuantity == 0) {
        babyQuantity = 0;
      } else {
        babyQuantity -= 1;
      }
    }
    emit(TicketRemoveState());
  }

//for select Leaving card
  void selectedCardLeavingFunction({required value}) {
    if (selectedCardLeaving == value) {
      selectedCardLeaving = null;
    } else {
      selectedCardLeaving = value;
    }

    emit(SelectedCardLeavingIndexState());
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

//for select Return card
  void selectedCardReturnFunction({required value}) {
    if (selectedCardReturn == value) {
      selectedCardReturn = null;
    } else {
      selectedCardReturn = value;
    }

    emit(SelectedCardReturnIndexState());
  }

//is function if flight a Back show Return Cards
  void showSecondListIfFlightReturn({required value}) {
    if (isVisibility == false) {
      isVisibility = true;
    } else {
      isVisibility = false;
    }

    emit(VisibilitySecondListForReturnState());
  }

//in the flight details show more details in trip
  void showContainer({required value}) {
    if (flightDetailsShowContainer == true) {
      flightDetailsShowContainer = false;
    } else {
      flightDetailsShowContainer = true;
    }

    emit(VisibilityContainerInFlightDetailsState());
  }

//select ticket type (EcoFly.....) for Leaving
  void selectedSeatTypeLeavingFunction({
    required value,
  }) {
    if (selectedSeatTypeLeaving == value) {
      selectedSeatTypeLeaving = null;
    } else {
      selectedSeatTypeLeaving = value;
    }

    emit(SelectedSeatTypeLeavingState());
  }

//select ticket type (EcoFly.....) for Return
  void selectedSeatTypeReturnFunction({
    required value,
  }) {
    if (selectedSeatTypeReturn == value) {
      selectedSeatTypeReturn = null;
    } else {
      selectedSeatTypeReturn = value;
    }

    emit(SelectedSeatTypeReturnState());
  }

  final ScrollController scrollController = ScrollController();
  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

//is function if flight a Back show ticket type (EcoFly.....) Cards for Return
  void showSecondListIfFlightSeatType({required value}) {
    if (isVisibilitySeatType == false) {
      isVisibilitySeatType = true;
    } else {
      isVisibilitySeatType = false;
    }

    emit(VisibilityFlightSeatTypeState());
  }

  PaymentType? paymentType;
  void selectPaymentTypeFunction(String? value, BuildContext context) {
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
    emit(SelectRadioButtonForPaymentViewState());
  }

  void selectRadioForInstallmentTypeFunction(String? value) {
    radioForInstallmentType = value;

    emit(SelectRadioButtonForPaymentViewState());
  }

  void selectRadioForAlternativeTypeFunction(String? value) {
    radioForAlternativeType = value;
    emit(SelectRadioButtonForPaymentViewState());
  }

  void selectRadioForSortFunction(String? value) {
    radioForSort = value;
    emit(SelectRadioButtonForSortState());
  }

  int apple = 0;
  String formatNumber(double number) {
    String formattedNumber = number.toStringAsFixed(2);

    formattedNumber = formattedNumber.replaceAll('.', ',');

    String integerPart = formattedNumber.split(',')[0];
    String decimalPart = formattedNumber.split(',')[1];

    String formattedIntegerPart = integerPart.replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.");

    return "$formattedIntegerPart,$decimalPart";
  }

  String convertArabicNumbersToEnglish(String input) {
    const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const englishNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    for (int i = 0; i < arabicNumbers.length; i++) {
      input = input.replaceAll(arabicNumbers[i], englishNumbers[i]);
    }

    return input;
  }

  //------------------api functions-------------------

  dynamic searchDataForCity;
  dynamic searchDataForAirLine;
  List<String> preferAirlineCodeList = [];
  List<String> preferAirlineNameList = [];

  void addPreferAirlineCodeAndName(
      {required String code, required String name}) {
    if (!preferAirlineCodeList.contains(code)) {
      preferAirlineCodeList.add(code);
      preferAirlineNameList.add(name);
      emit(AddPreferAirlineCodeAndNameState());
    }
  }

  void removePreferAirlineCodeAndName({required int index}) {
    preferAirlineCodeList.removeAt(index);
    preferAirlineNameList.removeAt(index);

    emit(AddPreferAirlineCodeAndNameState());
  }

  List<Discount> corporateAirlineCodeList = [];
  List<String> corporateAirlineNameList = [];
  List<String> corporateCodeList = [];

  void addCorporateAirlineCodeAndName({
    required String code,
    required String name,
  }) {
    if (!corporateAirlineNameList.contains(name)) {
      corporateCodeList =
          List.generate(corporateAirlineCodeList.length + 1, (index) => '');
      corporateAirlineCodeList.add(
        Discount(
          code: code,
          supplierCode: '',
        ),
      );
      corporateAirlineNameList.add(name);
      emit(AddPreferAirlineCodeAndNameState());
    }
  }

  void removeCorporateAirlineCodeAndName({required int index}) {
    corporateAirlineCodeList.removeAt(index);
    corporateAirlineNameList.removeAt(index);
    corporateCodeList.removeAt(index);

    emit(AddPreferAirlineCodeAndNameState());
  }

  String apiBaseUrl = "https://sandbox.kplus.com.tr/kplus/v0/Air.svc/Rest/Json";
  String apiBaseUrlGeneral =
      "https://sandbox.kplus.com.tr/kplus/v0/General.svc/Rest/Json";

  // String apiBaseUrl =
  //     "https://ws.kplus.com.tr/alsafarigate/v0/Air.svc/Rest/Json";
  // String apiBaseUrlGeneral =
  //     "https://ws.kplus.com.tr/alsafarigate/v0/General.svc/Rest/Json";
  final Dio _dio = Dio();
  bool theTextLengthIs3AndMore = false;
  void theTextLengthIs3AndMoreFunction({required bool value}) {
    theTextLengthIs3AndMore = value;
    emit(TheTextLengthIs3AndMoreState());
  }

  Future<Map<String, dynamic>> searchAirport(String text) async {
    emit(SearchCityDataLoading());
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      final response = await _dio.post(
        "$apiBaseUrlGeneral/SearchAirports",
        data: json.encode({
          "request": {
            "TokenCode": getIt<CacheHelper>().getDataString(key: 'token'),
            "SearchKey": text,
            "LanguageCode": getIt<CacheHelper>().getDataString(key: 'Lang'),
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
      // print('Arama Sonucu: $responseData'); // Yanıtı konsola yazdır
      searchDataForCity = responseData['Result'];

      emit(SearchCityDataSuccess());

      return responseData;
    } catch (e) {
      emit(SearchCityDataFailure(errorMassage: e.toString()));
      //   print('Arama hatası: $e'); // Hata durumunu konsola yazdır
      throw Exception('Failed to search airport: $e');
    }
  }

  Future<Map<String, dynamic>> searchAirLine(String text) async {
    emit(SearchCityDataLoading());

    try {
      // البيانات التي سيتم إرسالها
      final requestData = {
        'request': {
          "TokenCode": getIt<CacheHelper>().getDataString(key: 'token'),
          "SearchKey": text,
        }
      };

      // طباعة البيانات التي سيتم إرسالها
      print("Request JSON::: ${json.encode(requestData)}");

      // إرسال الطلب
      final response = await _dio.post(
        "$apiBaseUrlGeneral/SearchAirline",
        data: json.encode(requestData),
      );

      print("Response JSON::::: $response");

      if (response.statusCode! > 400) {
        throw Exception("An error occurred: ${response.data}");
      }

      final responseData = response.data;
      print('Arama Sonucu: $responseData'); // Yanıtı konsola yazdır
      searchDataForAirLine = responseData['Result'];

      emit(SearchCityDataSuccess());

      return responseData;
    } catch (e) {
      emit(SearchCityDataFailure(errorMassage: e.toString()));
      print('Arama hatası: $e'); // Hata durumunu konsولا yazdır
      throw Exception('Failed to search airport: $e');
    }
  }

  String? errorMassage;
  String? errorCode;

  List<AirResult> flightSearchResultGo = [];
  List<AirResult> afterRefreshFlightSearchResultsLeaving = [];
  List<AirResult> afterRefreshFlightSearchResultsReturn = [];
  List<AirSearchResult>? flightSearchResultsMainList;

  List<AirResult> flightSearchResultReturnP = [];
  List<AirResult> flightSearchResultReturnS = [];

  // Future<dynamic> searchAvailability(
  //     RequestModel request, BuildContext context) async {
  //   emit(SearchFlightLoading());
  //   afterRefreshFlightSearchResultsLeaving = [];
  //   afterRefreshFlightSearchResultsReturn = [];
  //   flightSearchResultsMainList;

  //   String url = '$apiBaseUrl/SearchAvailability';
  //   final requestJson = jsonEncode(request.toJson());
  //   print("requestJson:::::$requestJson");
  //   try {
  //     final response = await _dio.post(url, data: requestJson);
  //     final responseData = response.data;
  //     print("responseData:::::::${json.encode(responseData)}");

  //     if (responseData != null) {
  //       print("JSON'u AirSearchResult'a çevirme...");

  //       try {
  //         final result = Result.fromJson(responseData);
  //         if (result.result != null) {
  //           flightSearchResultsMainList = result.result!.searchResults!;

  //           if (searchTypeValue == 'tek') {
  //             for (int index = 0;
  //                 index < result.result!.searchResults!.first.results!.length;
  //                 index++) {
  //               var item = result.result!.searchResults!.first.results![index];

  //               //  firstLeg.add(segment);
  //               afterRefreshFlightSearchResultsLeaving.add(
  //                 AirResult(
  //                   data: item.data,
  //                   fares: item.fares,
  //                   groupId: item.groupId,
  //                   isCharter: null,
  //                   legs: item.legs!,
  //                   providerCode: item.providerCode,
  //                   resultRef: item.resultRef,
  //                 ),
  //               );
  //             }
  //           } else {
  //             bool itIsLeaving = true;

  //             for (var elementA in result.result!.searchResults!) {
  //               print('${result.result!.searchResults!.length}');
  //               if (elementA.resultType == AirResultType.combined) {
  //                 for (int index = 0;
  //                     index < elementA.results!.length;
  //                     index++) {
  //                   for (var elementB in elementA
  //                       .results![index].legs!.first.alternativeLegs!) {
  //                     flightSearchResultGo.add(
  //                       AirResult(
  //                         data: elementA.results![index].data,
  //                         fares: elementA.results![index].fares,
  //                         groupId:
  //                             elementA.results![index].groupId ?? 'P$index',
  //                         isCharter: elementA.results![index].isCharter,
  //                         legs: [
  //                           AirLeg(
  //                             alternativeLegs: [
  //                               elementB
  //                             ],
  //                             searchLeg: elementA
  //                                 .results![index].legs!.first.searchLeg,
  //                           ),
  //                         ],
  //                         providerCode: elementA.results![index].providerCode,
  //                         resultRef: elementA.results![index].resultRef,
  //                       ),
  //                     );
  //                     print('${result.result!.searchResults!.length}');
  //                   }
  //                   for (var elementB in elementA
  //                       .results![index].legs!.last.alternativeLegs!) {
  //                     flightSearchResultReturnP.add(
  //                       AirResult(
  //                         data: elementA.results![index].data,
  //                         fares: elementA.results![index].fares,
  //                         groupId:
  //                             elementA.results![index].groupId ?? '0P$index',
  //                         isCharter: elementA.results![index].isCharter,
  //                         legs: [
  //                           AirLeg(
  //                             alternativeLegs: [
  //                               elementB
  //                             ], // إضافة كل عنصر من alternativeLegs بشكل فردي
  //                             searchLeg: elementA
  //                                 .results![index].legs!.first.searchLeg,
  //                           ),
  //                         ],
  //                         providerCode: elementA.results![index].providerCode,
  //                         resultRef: elementA.results![index].resultRef,
  //                       ),
  //                     );
  //                   }
  //                 }
  //               } else {
  //                 if (itIsLeaving == true) {
  //                   for (var elementB in elementA.results!) {
  //                     for (var elementC
  //                         in elementB.legs!.first.alternativeLegs!) {
  //                       flightSearchResultGo.add(
  //                         AirResult(
  //                           data: elementB.data,
  //                           fares: elementB.fares,
  //                           groupId: elementB.groupId ?? 'S',
  //                           isCharter: elementB.isCharter,
  //                           legs: [
  //                             AirLeg(
  //                               alternativeLegs: [
  //                                 elementC
  //                               ], // إضافة كل عنصر من alternativeLegs بشكل فردي
  //                               searchLeg: elementB.legs!.first.searchLeg,
  //                             ),
  //                           ],
  //                           providerCode: elementB.providerCode,
  //                           resultRef: elementB.resultRef,
  //                         ),
  //                       );
  //                     }
  //                   }
  //                   print("Processing as Leaving (ذهاب)");

  //                   itIsLeaving = false;
  //                 } else {
  //                   for (var elementB in elementA.results!) {
  //                     for (var elementC
  //                         in elementB.legs!.first.alternativeLegs!) {
  //                       flightSearchResultReturnS.add(
  //                         AirResult(
  //                           data: elementB.data,
  //                           fares: elementB.fares,
  //                           groupId: elementB.groupId ?? 'S',
  //                           isCharter: elementB.isCharter,
  //                           legs: [
  //                             AirLeg(
  //                               alternativeLegs: [
  //                                 elementC
  //                               ], // إضافة كل عنصر من alternativeLegs بشكل فردي
  //                               searchLeg: elementB.legs!.first.searchLeg,
  //                             ),
  //                           ],
  //                           providerCode: elementB.providerCode,
  //                           resultRef: elementB.resultRef,
  //                         ),
  //                       );
  //                     }
  //                   }
  //                   print("Processing as Returning (عودة)");
  //                 }
  //               }
  //             }

  //             for (var item1 in flightSearchResultGo) {
  //               String departureDate = item1.legs!.first.alternativeLegs!.first
  //                   .segments!.first.departureDate!;
  //               String arrivalDate = item1.legs!.first.alternativeLegs!.first
  //                   .segments!.last.arrivalDate!;

  //               List<String> flightNo = [];
  //               List<String> flightCode = [];

  //               // جمع أرقام الرحلات ورموز شركات الطيران
  //               for (var segment
  //                   in item1.legs!.first.alternativeLegs!.first.segments!) {
  //                 flightNo.add(segment.flightNo!);
  //                 flightCode.add(segment.ticketingAirline!.code!);
  //               }

  //               double totalStrikeAmount =
  //                   item1.fares![0].totalPrice!.totalStrikeAmount.toDouble();

  //               // تحقق من وجود عنصر مشابه بالفعل في afterRefreshFlightSearchResultsLeaving
  //               var existingItemIndex =
  //                   afterRefreshFlightSearchResultsLeaving.indexWhere((item) {
  //                 String existingDepartureDate = item.legs!.first
  //                     .alternativeLegs!.first.segments!.first.departureDate!;
  //                 String existingArrivalDate = item.legs!.first.alternativeLegs!
  //                     .first.segments!.last.arrivalDate!;

  //                 List<String> existingFlightNo = [];
  //                 List<String> existingFlightCode = [];

  //                 for (var segment
  //                     in item.legs!.first.alternativeLegs!.first.segments!) {
  //                   existingFlightNo.add(segment.flightNo!);
  //                   existingFlightCode.add(segment.ticketingAirline!.code!);
  //                 }

  //                 return existingDepartureDate == departureDate &&
  //                     existingArrivalDate == arrivalDate &&
  //                     listEquals(flightNo, existingFlightNo) &&
  //                     listEquals(flightCode, existingFlightCode);
  //               });

  //               if (existingItemIndex == -1) {
  //                 // إذا لم يكن العنصر موجودًا، أضفه للقائمة
  //                 afterRefreshFlightSearchResultsLeaving.add(item1);
  //               } else {
  //                 // إذا كان العنصر موجودًا بالفعل، قارن الأسعار
  //                 double existingFareTitle =
  //                     afterRefreshFlightSearchResultsLeaving[existingItemIndex]
  //                         .fares![0]
  //                         .totalPrice!
  //                         .totalStrikeAmount
  //                         .toDouble();

  //                 String existingGroupId =
  //                     afterRefreshFlightSearchResultsLeaving[existingItemIndex]
  //                         .groupId!;
  //                 String newGroupId = item1.groupId!;

  //                 // تحقق من أول حرف في groupId
  //                 if (existingGroupId[0] == newGroupId[0]) {
  //                   if (totalStrikeAmount < existingFareTitle) {
  //                     // استبدل العنصر إذا كانت السعر الجديد أقل
  //                     afterRefreshFlightSearchResultsLeaving[
  //                         existingItemIndex] = item1;
  //                   }
  //                 } else {
  //                   // إذا كان الـ groupId مختلفًا ولا يبدأ بالحرف 'F'
  //                   if (!newGroupId.startsWith('F')) {
  //                     newGroupId = 'F$newGroupId';
  //                   }
  //                   item1.groupId = newGroupId;

  //                   if (totalStrikeAmount < existingFareTitle) {
  //                     // استبدل العنصر إذا كانت السعر الجديد أقل
  //                     afterRefreshFlightSearchResultsLeaving[
  //                         existingItemIndex] = item1;
  //                   }
  //                 }
  //               }
  //             }

  //             print(
  //                 "afterRefreshFlightSearchResultsLeaving: ${afterRefreshFlightSearchResultsLeaving.length}");

  //             print('flightSearchResultGoP: ${flightSearchResultGo.length}');
  //             print(
  //                 'flightSearchResultReturnP: ${flightSearchResultReturnP.length}');
  //             print('flightSearchResultGoS: ${flightSearchResultGo.length}');
  //             print(
  //                 'flightSearchResultReturnS: ${flightSearchResultReturnS.length}');

  //             print(
  //                 "afterRefreshFlightSearchResultsLeaving: ${afterRefreshFlightSearchResultsLeaving.length}");
  //             print(afterRefreshFlightSearchResultsLeaving.length);

  //             //---------------------------------------------

  //             // if (result.result!.searchResults!.length > 2) {
  //             //   for (int index = 0;
  //             //       index < result.result!.searchResults!.first.results!.length;
  //             //       index++) {
  //             //     var item =
  //             //         result.result!.searchResults!.first.results![index];
  //             //     for (var segment in item.legs!.first.alternativeLegs!) {
  //             //       //  firstLeg.add(segment);
  //             //       flightSearchResultGo.add(
  //             //         AirResult(
  //             //           data: item.data,
  //             //           fares: item.fares,
  //             //           groupId: 'pc$index',
  //             //           isCharter: null,
  //             //           legs: [
  //             //             AirLeg(
  //             //               alternativeLegs: [segment],
  //             //               searchLeg: item.legs!.first.searchLeg!,
  //             //             ),
  //             //           ],
  //             //           providerCode: item.providerCode,
  //             //           resultRef: item.resultRef,
  //             //         ),
  //             //       );
  //             //     }
  //             //   }

  //             //   for (int index = 0;
  //             //       index < result.result!.searchResults![1].results!.length;
  //             //       index++) {
  //             //     var item = result.result!.searchResults![1].results![index];

  //             //     String groupId =
  //             //         item.groupId == null ? 'sp' : '${item.groupId}';

  //             //     flightSearchResultGo.add(
  //             //       AirResult(
  //             //         data: item.data,
  //             //         fares: item.fares,
  //             //         groupId: groupId,
  //             //         isCharter: null,
  //             //         legs: item.legs,
  //             //         providerCode: item.providerCode,
  //             //         resultRef: item.resultRef,
  //             //       ),
  //             //     );
  //             //   }

  //             //   for (var result in flightSearchResultGo) {
  //             //     String? arrivalDate = result
  //             //         .legs![0].alternativeLegs![0].segments!.last.arrivalDate;
  //             //     String? departureDate = result.legs![0].alternativeLegs![0]
  //             //         .segments!.first.departureDate;
  //             //     // String? flightNo =
  //             //     //     result.legs![0].alternativeLegs![0].segments!.first.flightNo;
  //             //     var flightDetails =
  //             //         result.legs![0].alternativeLegs![0].segments!;
  //             //     List<String> flightNo = [];
  //             //     List<String> flightCode = [];

  //             //     for (var segment in flightDetails) {
  //             //       flightNo.add(segment.flightNo!);
  //             //       flightCode.add(segment.ticketingAirline!.code!);
  //             //     }

  //             //     double? fareTitle =
  //             //         result.fares![0].totalPrice!.totalStrikeAmount.toDouble();

  //             //     var existingItemIndex =
  //             //         afterRefreshFlightSearchResultsLeaving.indexWhere((item) {
  //             //       var flightDetails =
  //             //           item.legs![0].alternativeLegs![0].segments!;
  //             //       List<String> flightNoItem = [];
  //             //       List<String> flightCodeItem = [];

  //             //       for (var segment in flightDetails) {
  //             //         flightNoItem.add(segment.flightNo!);
  //             //         flightCodeItem.add(segment.ticketingAirline!.code!);
  //             //       }
  //             //       return item.legs![0].alternativeLegs![0].segments!.last
  //             //                   .arrivalDate ==
  //             //               arrivalDate &&
  //             //           item.legs![0].alternativeLegs![0].segments!.first
  //             //                   .departureDate ==
  //             //               departureDate &&
  //             //           listEquals(flightNo, flightNoItem) &&
  //             //           listEquals(flightCode, flightCodeItem);
  //             //     });

  //             //     if (existingItemIndex == -1) {
  //             //       afterRefreshFlightSearchResultsLeaving.add(result);
  //             //     } else {
  //             //       double existingFareTitle =
  //             //           afterRefreshFlightSearchResultsLeaving[
  //             //                   existingItemIndex]
  //             //               .fares![0]
  //             //               .totalPrice!
  //             //               .totalStrikeAmount
  //             //               .toDouble();

  //             //       String existingGroupId =
  //             //           afterRefreshFlightSearchResultsLeaving[
  //             //                   existingItemIndex]
  //             //               .groupId!;
  //             //       String newGroupId = result.groupId!;

  //             //       if (existingGroupId[0] == newGroupId[0]) {
  //             //         if (fareTitle < existingFareTitle) {
  //             //           afterRefreshFlightSearchResultsLeaving[
  //             //               existingItemIndex] = result;
  //             //         }
  //             //       } else {
  //             //         if (!newGroupId.startsWith('F')) {
  //             //           newGroupId = 'F$newGroupId';
  //             //         }

  //             //         result.groupId = newGroupId;

  //             //         if (fareTitle < existingFareTitle) {
  //             //           afterRefreshFlightSearchResultsLeaving[
  //             //               existingItemIndex] = result;
  //             //         }
  //             //       }
  //             //     }
  //             //   }
  //             // } else {
  //             //   for (int index = 0;
  //             //       index < result.result!.searchResults!.first.results!.length;
  //             //       index++) {
  //             //     var item =
  //             //         result.result!.searchResults!.first.results![index];

  //             //     String groupId =
  //             //         item.groupId == null ? 'sp' : '${item.groupId}';

  //             //     afterRefreshFlightSearchResultsLeaving.add(
  //             //       AirResult(
  //             //         data: item.data,
  //             //         fares: item.fares,
  //             //         groupId: groupId,
  //             //         isCharter: null,
  //             //         legs: item.legs,
  //             //         providerCode: item.providerCode,
  //             //         resultRef: item.resultRef,
  //             //       ),
  //             //     );
  //             //   }
  //             // }
  //           }
  //           clearAll(type: 'sdfs');
  //           saveMainLeavingAndReturnList(1);

  //           emit(SearchFlightSuccess());
  //           return result;
  //         } else {
  //           errorMassage = result.errorMessage;
  //           errorCode = result.errorCode;
  //           emit(SearchFlightFailure(
  //               errorMassage: result.errorMessage,
  //               errorCode: result.errorCode));

  //           return result;
  //         }
  //       } catch (e) {
  //         print(e);
  //         emit(SearchFlightFailure(
  //             errorMassage: '$e', errorCode: 'PARSE_ERROR'));
  //       }
  //     } else {
  //       emit(SearchFlightFailure(
  //           errorMassage: 'Response data is null', errorCode: 'NULL_RESPONSE'));
  //       throw Exception('Uçuşlar yüklenemedi');
  //     }
  //   } catch (error) {
  //     emit(SearchFlightFailure(
  //         errorMassage: error.toString(), errorCode: 'NETWORK_ERROR'));
  //     print('Error ::::: $error');
  //     throw Exception('Failed to load flights');
  //   }
  // }

  Future<dynamic> searchAvailability(
      RequestModel request, BuildContext context) async {
    emit(SearchFlightLoading());
    afterRefreshFlightSearchResultsLeaving = [];
    afterRefreshFlightSearchResultsReturn = [];
    flightSearchResultsMainList;
    flightSearchResultGo = [];
    theFlyInTheTurkey = true;
    String url = '$apiBaseUrl/SearchAvailability';
    final requestJson = jsonEncode(request.toJson());
    print("requestJson:::::$requestJson");

    final response = await _dio.post(url, data: requestJson);
    final responseData = response.data;
    //  print("responseData:::::::${json.encode(responseData)}");

    if (responseData != null) {
      //   print("JSON'u AirSearchResult'a çevirme...");

      final result = Result.fromJson(responseData);

      if (result.errorCode == null) {
        if (result.result!.searchResults != null &&
            result.result!.searchResults!.isNotEmpty) {
          for (var leg in result.result!.searchRequest!.legs!) {
            String departureCountryCode = leg.departurePoint!.countryCode!;
            String arrivalCountryCode = leg.arrivalPoint!.countryCode!;

            if (departureCountryCode != 'TR' || arrivalCountryCode != 'TR') {
              theFlyInTheTurkey = false;
              break;
            }
          }
          flightSearchResultsMainList = [];
          afterRefreshFlightSearchResultsLeaving = [];
          afterRefreshFlightSearchResultsReturn = [];
          flightSearchResultGo = [];

          flightSearchResultsMainList = result.result!.searchResults!;

          if (searchTypeValue == 'tek') {
            for (int index = 0;
                index < result.result!.searchResults!.first.results!.length;
                index++) {
              var item = result.result!.searchResults!.first.results![index];

              //  firstLeg.add(segment);
              afterRefreshFlightSearchResultsLeaving.add(
                AirResult(
                  data: item.data,
                  fares: item.fares,
                  groupId: item.groupId,
                  isCharter: null,
                  legs: item.legs!,
                  providerCode: item.providerCode,
                  resultRef: item.resultRef,
                ),
              );
            }
          } else {
            if (result.result!.searchResults!.length > 2) {
              for (int index = 0;
                  index < result.result!.searchResults!.first.results!.length;
                  index++) {
                var item = result.result!.searchResults!.first.results![index];
                for (var segment in item.legs!.first.alternativeLegs!) {
                  //  firstLeg.add(segment);
                  flightSearchResultGo.add(
                    AirResult(
                      data: item.data,
                      fares: item.fares,
                      groupId: 'pc$index',
                      isCharter: null,
                      legs: [
                        AirLeg(
                          alternativeLegs: [segment],
                          searchLeg: item.legs!.first.searchLeg!,
                        ),
                      ],
                      providerCode: item.providerCode,
                      resultRef: item.resultRef,
                    ),
                  );
                }
              }

              if (result.result!.searchResults![1].results != null &&
                  result.result!.searchResults![1].results!.isNotEmpty) {
                for (int index = 0;
                    index < result.result!.searchResults![1].results!.length;
                    index++) {
                  var item = result.result!.searchResults![1].results![index];

                  String groupId =
                      item.groupId == null ? 'sp' : '${item.groupId}';

                  flightSearchResultGo.add(
                    AirResult(
                      data: item.data,
                      fares: item.fares,
                      groupId: groupId,
                      isCharter: null,
                      legs: item.legs,
                      providerCode: item.providerCode,
                      resultRef: item.resultRef,
                    ),
                  );
                }
              }

              for (var result in flightSearchResultGo) {
                String? arrivalDate = result
                    .legs![0].alternativeLegs![0].segments!.last.arrivalDate;
                String? departureDate = result
                    .legs![0].alternativeLegs![0].segments!.first.departureDate;
                // String? flightNo =
                //     result.legs![0].alternativeLegs![0].segments!.first.flightNo;
                var flightDetails =
                    result.legs![0].alternativeLegs![0].segments!;
                List<String> flightNo = [];
                List<String> flightCode = [];

                for (var segment in flightDetails) {
                  flightNo.add(segment.flightNo!);
                  flightCode.add(segment.ticketingAirline!.code!);
                }

                double? fareTitle =
                    result.fares![0].totalPrice!.totalStrikeAmount.toDouble();

                var existingItemIndex =
                    afterRefreshFlightSearchResultsLeaving.indexWhere((item) {
                  var flightDetails =
                      item.legs![0].alternativeLegs![0].segments!;
                  List<String> flightNoItem = [];
                  List<String> flightCodeItem = [];

                  for (var segment in flightDetails) {
                    flightNoItem.add(segment.flightNo!);
                    flightCodeItem.add(segment.ticketingAirline!.code!);
                  }
                  return item.legs![0].alternativeLegs![0].segments!.last
                              .arrivalDate ==
                          arrivalDate &&
                      item.legs![0].alternativeLegs![0].segments!.first
                              .departureDate ==
                          departureDate &&
                      listEquals(flightNo, flightNoItem) &&
                      listEquals(flightCode, flightCodeItem);
                });

                if (existingItemIndex == -1) {
                  afterRefreshFlightSearchResultsLeaving.add(result);
                } else {
                  double existingFareTitle =
                      afterRefreshFlightSearchResultsLeaving[existingItemIndex]
                          .fares![0]
                          .totalPrice!
                          .totalStrikeAmount
                          .toDouble();

                  String existingGroupId =
                      afterRefreshFlightSearchResultsLeaving[existingItemIndex]
                          .groupId!;
                  String newGroupId = result.groupId!;

                  if (existingGroupId[0] == newGroupId[0]) {
                    if (fareTitle! < existingFareTitle) {
                      afterRefreshFlightSearchResultsLeaving[
                          existingItemIndex] = result;
                    }
                  } else {
                    if (!newGroupId.startsWith('F')) {
                      newGroupId = 'F$newGroupId';
                    }

                    result.groupId = newGroupId;

                    if (fareTitle! < existingFareTitle) {
                      afterRefreshFlightSearchResultsLeaving[
                          existingItemIndex] = result;
                    }
                  }
                }
              }
            } else {
              for (int index = 0;
                  index < result.result!.searchResults!.first.results!.length;
                  index++) {
                var item = result.result!.searchResults!.first.results![index];

                String groupId =
                    item.groupId == null ? 'sp' : '${item.groupId}';

                afterRefreshFlightSearchResultsLeaving.add(
                  AirResult(
                    data: item.data,
                    fares: item.fares,
                    groupId: groupId,
                    isCharter: null,
                    legs: item.legs,
                    providerCode: item.providerCode,
                    resultRef: item.resultRef,
                  ),
                );
              }
            }
          }
          clearAll(type: 'sdfs');
          saveMainLeavingAndReturnList(1);

          emit(SearchFlightSuccess());
          sortPriceLessToHighFunc(context);
          return result;
        } else {
          print('+++++++++++++++++++++++++++++++++++++++++++++++++');
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
            emit(SearchFlightFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          } else {
            emit(SearchFlightFailure(
                errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
          }

          return result;
        }
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
          emit(SearchFlightFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          emit(SearchFlightFailure(
              errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
        }

        return result;
      }
    } else {
      emit(SearchFlightFailure(
          errorMassage: 'Uçuşlar yüklenemedi', errorCode: 'NULL_RESPONSE'));
      throw Exception('Uçuşlar yüklenemedi');
    }
  }

  List<int> selectedIndexes =
      []; // لحفظ المؤشرات لكل قائمة (مثلاً: index من القائمة الأولى والقائمة الثانية)

  void saveIndexForList({required int selectedIndex}) {
    // selectedIndexes = List.generate(listMultiPoint.length, (index) => 0);
    selectedIndexes[currentFareListIndex] = selectedIndex;
    print('selectedIndexes: $selectedIndexes ');
  }

  bool? isResultReturnAndPackage;
  List<List<AirResult>>? flightFaresMultiPointIfIsSeparated = [];
  List<AirResult>? flightFaresMultiPointSelectedForSeparated = [];
  List<AirResult>? flightFaresMultiPointIfIsCombined = [];
  bool? isResultTypeForFareMultiPointCombined = true;

  List<AirResult>? flightFaresLeaving;
  List<AirResult>? flightFaresReturn;
  Future<Result> getBrandedFares(
      AirBrandedFareRequestJson request, BuildContext context) async {
    emit(FlightFaresLoading());
    isResultReturnAndPackage = false;
    flightFaresMultiPointIfIsSeparated = [];
    flightFaresMultiPointIfIsCombined = [];
    saveIndexFareForCombinedPackage = null;
    selectedIndexes = List.generate(listMultiPoint.length, (index) => 0);
    isResultTypeForFareMultiPointCombined = true;
    String url = '$apiBaseUrl/GetBrandedFares';
    final requestJson = jsonEncode(request.toJson());
    print("requestJson for getBrandedFares:::::$requestJson");

    final response = await _dio.post(url, data: requestJson);
    final responseData = response.data;
    print(
        "responseData for getBrandedFares:::::::${json.encode(responseData)}");

    if (responseData != null) {
      ///     print("JSON'u AirSearchResponse'a çevirme...");

      final result = Result.fromJson(responseData);
      mile = [];
      if (result.errorCode == null) {
        if (result.result!.searchResults!.first.resultType ==
            AirResultType.combined) {
          isResultReturnAndPackage = true;
        }
        if (searchTypeValue != 'cok') {
          for (var elementA in result.result!.searchResults!) {
            for (var elementB in elementA.results!) {
              for (var elementC in elementB.legs!) {
                for (var elementD in elementC.alternativeLegs!) {
                  for (var elementE in elementD.segments!) {
                    if (elementE.ticketingAirline != null &&
                        elementE.ticketingAirline!.code != null) {
                      for (var i = 0;
                          i < childQuantity + adultQuantity + babyQuantity;
                          i++) {
                        // Ensure each person has a list of mileage programs
                        if (mile.length <= i) {
                          mile.add([]);
                        }

                        // Check if there is already a mileage entry for the current airlineCode
                        if (!mile[i].any((mileage) =>
                            mileage.airlineCode ==
                            elementE.ticketingAirline!.code!)) {
                          // Add a new MileageProgram for the current person if not found
                          mile[i].add(MileageProgram(
                            airlineCode: elementE.ticketingAirline!.code!,
                            mileageNumber: '',
                          ));
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        } else {
          for (var element in selectAirResultForMultiPointList) {
            for (var elementA in element.legs!) {
              for (var elementB in elementA.alternativeLegs!) {
                for (var elementC in elementB.segments!) {
                  if (elementC.ticketingAirline != null &&
                      elementC.ticketingAirline!.code != null) {
                    for (var i = 0;
                        i < childQuantity + adultQuantity + babyQuantity;
                        i++) {
                      // Ensure each person has a list of mileage programs
                      if (mile.length <= i) {
                        mile.add([]);
                      }

                      // Check if there is already a mileage entry for the current airlineCode
                      if (!mile[i].any((mileage) =>
                          mileage.airlineCode ==
                          elementC.ticketingAirline!.code!)) {
                        // Add a new MileageProgram for the current person if not found
                        mile[i].add(MileageProgram(
                          airlineCode: elementC.ticketingAirline!.code!,
                          mileageNumber: '',
                        ));
                        print('mile[$i] ${mile[i].last.airlineCode}');
                      }
                    }
                  }
                }
              }
            }
          }
        }

        if (result.result != null) {
          if (searchTypeValue == 'tek') {
            flightFaresLeaving = result.result!.searchResults!.first.results;
          } else if (searchTypeValue == 'cok') {
            flightFaresMultiPointIfIsSeparated =
                List.generate(listMultiPoint.length, (index) => []);
            // for (var element in result.result!.searchResults!) {
            //   if (element.resultType == AirResultType.combined) {
            //     isResultTypeForFareMultiPointCombined = true;
            //     flightFaresMultiPointIfIsCombined = element.results;
            //     print('1111111111111111111111111111111');
            //     print(
            //         'flightFaresMultiPointIfIsCombined: ${flightFaresMultiPointIfIsCombined!.length}');
            //   }
            //   if (element.resultType == AirResultType.separated) {
            //     isResultTypeForFareMultiPointCombined = false;

            //     flightFaresMultiPointIfIsSeparated!.add(element.results!);

            //     print('22222222222222222222222222222222222222');
            //     print(
            //         'flightFaresMultiPointIfIsSeparated: ${flightFaresMultiPointIfIsSeparated!.length}');
            //   }
            // }

            for (int i = 0; i < result.result!.searchResults!.length; i++) {
              var element = result.result!.searchResults![i];
              if (element.resultType == AirResultType.combined) {
                isResultTypeForFareMultiPointCombined = true;
                flightFaresMultiPointIfIsCombined = element.results;
                print('1111111111111111111111111111111');
                print(
                    'flightFaresMultiPointIfIsCombined: ${flightFaresMultiPointIfIsCombined!.length}');
              }
              if (element.resultType == AirResultType.separated) {
                isResultTypeForFareMultiPointCombined = false;

                if (element.results != null) {
                  for (var item in element.results!) {
                    for (int j = 0; j < item.fares!.length; j++) {
                      flightFaresMultiPointIfIsSeparated![i].add(
                        AirResult(
                          data: item.data, // الحقل يبقى ثابتًا
                          fares: [
                            item.fares![j]
                          ], // يتم تعيين الفئة الحالية فقط
                          groupId: item.groupId ?? '', // الحقل يبقى ثابتًا
                          isCharter: item.isCharter, // الحقل يبقى ثابتًا
                          legs: item.legs ?? [], // الحقل يبقى ثابتًا
                          providerCode:
                              item.providerCode ?? '', // الحقل يبقى ثابتًا
                          resultRef: item.resultRef ?? '', // الحقل يبقى ثابتًا
                        ),
                      );
                    }
                  }
                }

                print('22222222222222222222222222222222222222');
                print(
                    'flightFaresMultiPointIfIsSeparated: ${flightFaresMultiPointIfIsSeparated!.length}');
              }
            }
          } else {
            flightFaresLeaving = result.result!.searchResults!.first.results;
            flightFaresReturn = result.result!.searchResults!.last.results;
          }

          emit(FlightFaresSuccess());
          return result;
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
          //   print('errorCode: $errorCode');
          if (codeIsHere == true) {
            emit(FlightFaresFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          } else {
            emit(SearchFlightFailure(
                errorMassage: 'Markalı fiyatlar Bulunmadı',
                errorCode: 'NULL_RESPONSE'));
          }

          return result;
        }
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
          emit(FlightFaresFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          emit(FlightFaresFailure(
              errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
        }

        return result;
      }
    } else {
      emit(FlightFaresFailure(
          errorMassage: 'Markalı fiyatlar yüklenemedi',
          errorCode: 'NULL_RESPONSE'));
      throw Exception('Markalı fiyatlar yüklenemedi');
    }
  }

  List<String> fareKeyListForCombinedPackage = [];
  int? saveIndexFareForCombinedPackage;
  void selectListFareIndexForCombinedFunction(
      {required int value, required List<String> listKey}) {
    if (saveIndexFareForCombinedPackage == value) {
      saveIndexFareForCombinedPackage = null;
      fareKeyListForCombinedPackage = [];
    } else {
      saveIndexFareForCombinedPackage = value;
      fareKeyListForCombinedPackage = listKey;
    }

    emit(SelectListIndexForMultiPointState());
  }

  List<List<MileageProgram>> mile = [];
  dynamic validateKeyOneWay;
  dynamic validateKeyReturn;
  List<String> validateKeyList = [];
  Future<Result> getValidate(
      ValidateRequestJson request, BuildContext context) async {
    validateKeyList = [];
    validateKeyOneWay = null;
    validateKeyReturn = null;
    String url =
        '$apiBaseUrl/Validate'; // API'nin doğru URL'sini buraya ekleyin
    final requestJson = jsonEncode(request.toJson());
    print("requestJson for getValidate:::::$requestJson");

    final response = await _dio.post(url, data: requestJson);
    final responseData = response.data;
    print("responseData for getValidate:::::::${json.encode(responseData)}");

    if (responseData != null) {
      print("JSON'u AirSearchResponse'a çevirme...");

      final result = Result.fromJson(responseData);
      if (result.errorCode == null) {
        if (result.result != null) {
          for (var element in result.result!.searchResults!) {
            for (var elementA in element.results!) {
              for (var elementB in elementA.fares!) {
                for (var elementC in elementB.fareAlternativeLegs!) {
                  validateKeyList.add(elementC.key!);
                }
              }
            }
          }
          // validateKeyOneWay = result.result!.searchResults!.first.results!.first
          //     .fares!.first.fareAlternativeLegs!.first.key;
          // validateKeyList.add(validateKeyOneWay);

          // if (searchTypeValue != 'tek') {

          //   if (returnGroupId != null) {
          //     validateKeyReturn = result.result!.searchResults!.last.results!
          //         .first.fares!.first.fareAlternativeLegs!.first.key;
          //   } else {
          //     validateKeyReturn = result.result!.searchResults!.last.results!
          //         .first.fares!.first.fareAlternativeLegs!.last.key;
          //   }
          //   validateKeyList.add(validateKeyReturn);
          // }
          print(validateKeyList);

          emit(FlightValidateSuccess());
          return result;
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
            emit(FlightValidateFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          } else {
            errorMassage = '${result.errorMessage}';
            errorCode = result.errorCode;
            emit(FlightValidateFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          }

          return result;
        }
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
          emit(FlightValidateFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          emit(FlightValidateFailure(
              errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
        }

        return result;
      }
    } else {
      emit(FlightValidateFailure(
          errorMassage: 'Doğrulama işlemi başarısız oldu.',
          errorCode: 'NULL_RESPONSE'));
      throw Exception('Doğrulama işlemi başarısız oldu.');
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

  Future<PaymentVerificationn> bookFlight(
      WrappedBookingRequest request, BuildContext context) async {
    emit(FlightBookLoading());

    print('*******************---------------------');
    String url =
        '$apiBaseUrl/Book'; // API uç noktasını doğru bir şekilde güncelleyin

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
      if (result.errorCode == null) {
        if (result.result != null) {
          bookUrlResult = result.result!.post3DPageUrl;
          is3DPostRequired = result.result!.is3DPostRequired;
          //  print('bookUrlResult: $bookUrlResult');
          //    print('is3DPostRequired: $is3DPostRequired');
          if (paymentType == PaymentType.currentAccount) {
            pnrSystemForResultView = result.result!.booking!.systemPnr;
            lastNameForResultView = paxInfoList.first.pax!.lastName;
          } else {
            pnrSystemForResultView = savedSystemPnrFromUrlForResultView;
            lastNameForResultView = paxInfoList.first.pax!.lastName;
          }

          //   print('pnrSystemForResultView: $pnrSystemForResultView');
          //     print('lastNameForResultView: $lastNameForResultView');
          if (result.result != null) {
            if (result.result!.booking != null) {
              pnrSystemForReservationCard = result.result!.booking!.systemPnr;
            }
          }
          emit(FlightBookSuccess());
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
            emit(FlightBookFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          } else {
            errorMassage = '${result.errorMessage}';
            errorCode = result.errorCode;
            emit(FlightBookFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          }
        }
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
          emit(FlightBookFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          emit(FlightBookFailure(
              errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
        }

        return result;
      }
      return result;
    } else {
      emit(FlightBookFailure(
          errorMassage: 'Flight booking failed',
          errorCode: 'Flight booking failed'));
      throw Exception('Flight booking failed');
    }
  }

// selectAgentCreditCardOrCustomerCreditCardFunction = 0 is customer credit card, 1 is agent credit card
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

  List<PaymentGroup> creditCardOptionsCustomer = [];
  List<PaymentGroup> creditCardOptionsAgent = [];
  List<PaymentGroup> currentAccountOptions = [];
  List<PaymentGroup> preBookingOptions = [];
  List<PaymentGroup> alternativeOptions = [];

  List<PaymentOption>? paymentOptionList = [];
  List<PaymentOption>? paymentOptionListHaveMarkup = [];
  String? paymentId;

  String? bookItemId;
  Future<PaymentResult> getPaymentOptions(
      PaymentOptionRequestJson request, BuildContext context) async {
    emit(FlightPaymentOptionsLoading());
    paymentOptionList = [];
    creditCardOptionsCustomer = [];
    getAllBinCodesListCustomer = [];
    creditCardOptionsAgent = [];
    getAllBinCodesListAgent = [];
    paymentId = null;
    binCodeIsHere = null;
    String url =
        '$apiBaseUrl/GetPaymentOptions'; // API'nin doğru URL'sini buraya ekleyin
    final requestJson = jsonEncode(request.toJson());
    //   print("requestJson for getPaymentOptions:::::$requestJson");

    final response = await _dio.post(url, data: requestJson);
    final responseData = response.data;
    //   print(
    //       "responseData for getPaymentOptions:::::::${json.encode(responseData)}");

    if (responseData != null) {
      //   print("JSON'u Payment'a çevirme...");

      final result = PaymentResult.fromJson(responseData);
      if (result.errorCode == null) {
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
                  currentAccountOptions = paymentOptionList![i].paymentGroups!;
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
                  creditCardOptionsAgent = paymentOptionList![i].paymentGroups!;
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
                  currentAccountOptions = paymentOptionList![i].paymentGroups!;
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

          emit(FlightPaymentOptionsSuccess());
          return result;
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
            emit(FlightPaymentOptionsFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          } else {
            errorMassage = '${result.errorMessage}';
            errorCode = result.errorCode;
            emit(FlightPaymentOptionsFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          }
          return result;
        }
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
          emit(FlightPaymentOptionsFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          emit(FlightPaymentOptionsFailure(
              errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
        }

        return result;
      }
    } else {
      emit(FlightPaymentOptionsFailure(
          errorMassage: 'Ödeme seçeneklerini alma işlemi başarısız oldu.',
          errorCode: 'NULL_DATA'));
      throw Exception('Ödeme seçeneklerini alma işlemi başarısız oldu.');
    }
  }

  DateTimeRange? dateTimeRangeReservation; //value select date for return
  DateTimeRange selectDateTimeRangeReservation = DateTimeRange(
      start: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        00,
        00,
        00,
      ),
      end: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        23,
        59,
        59,
      ));

  late bool isSelectedDateRangeReservationJustOneMonth;
  void dateRangePickerReservation(BuildContext context) {
    isSelectedDateRangeReservationJustOneMonth = false;
    if (dateTimeRangeReservation != null) {
      final int differenceInDays = dateTimeRangeReservation!.end
          .difference(dateTimeRangeReservation!.start)
          .inDays;
      if (differenceInDays > 31) {
        SnackbarUtils.showSnackbar(
            context, S.of(context).YouCanChooseAMaximumOf1Month);
      } else {
        isSelectedDateRangeReservationJustOneMonth = true;
        selectDateTimeRangeReservation = dateTimeRangeReservation!;

        emit(DateRangePickerReservationState());
      }
    }
  }

  List<List<dynamic>> reservationsTypeList = [];
  List<Booking> getReservationsList = [];
  List<Booking> savedGetReservationsList = [];

  Future<BookingResultReservations> getReservations(
      BuildContext context) async {
    dateTimeRangeReservation = null;
    getReservationsList.clear();
    savedGetReservationsList.clear();
    emit(GetReservationsLoading());
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final requestData = {
      "request": {
        "TokenCode": getIt<CacheHelper>().getDataString(key: 'token'),
        "StartDate": "${selectDateTimeRangeReservation.start}",
        "EndDate": "${selectDateTimeRangeReservation.end}",
      }
    };

    final requestJson = jsonEncode(requestData);
    print("requestJsonEncode: $requestJson");

    final response = await _dio.post(
      "$apiBaseUrlGeneral/GetReservations",
      data: requestJson,
      options: Options(
        headers: headers,
      ),
    );

    if (response.data != null) {
      final responseData = response.data;

      final data = BookingResultReservations.fromJson(responseData);
      if (data.errorCode == null) {
        if (data.result != null) {
          // getReservationsList = data.result!;
          // savedGetReservationsList = data.result!;
          for (var item in data.result!) {
            if (item.flightBookingList != null &&
                item.flightBookingList!.isNotEmpty) {
              getReservationsList.add(item);
              savedGetReservationsList.add(item);
            }
          }

          bool containsBookingStatusType(
              List<List<dynamic>> list, dynamic bookingStatusType) {
            for (var sublist in list) {
              if (sublist[0] == bookingStatusType) {
                return true;
              }
            }
            return false;
          }

          for (var item in data.result!) {
            if (!containsBookingStatusType(
                reservationsTypeList, item.bookingStatusType!)) {
              reservationsTypeList.add([item.bookingStatusType!, true]);
            }
          }
          print('11getReservationsList: ${getReservationsList.length}');
          emit(GetReservationsSuccess());
          return data;
        } else {
          List<ErrorsModel> errors = ErrorsModel.getErrorList(context);
          bool codeIsHere = false;
          errorCode = data.errorCode;
          for (var element in errors) {
            if (errorCode == element.code) {
              errorMassage = element.message;
              codeIsHere = true;
              break;
            }
          }
          //  print('errorCode: $errorCode');
          if (codeIsHere == true) {
            emit(GetReservationsFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          } else {
            errorMassage = '${data.errorMessage}';
            errorCode = data.errorCode;
            emit(GetReservationsFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          }

          return data;
        }
      } else {
        List<ErrorsModel> errors = ErrorsModel.getErrorList(context);
        bool codeIsHere = false;
        errorCode = data.errorCode;
        for (var element in errors) {
          if (errorCode == element.code) {
            errorMassage = element.message;
            codeIsHere = true;
            break;
          }
        }
        //    print('errorCode: $errorCode');
        if (codeIsHere == true) {
          emit(GetReservationsFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          emit(GetReservationsFailure(
              errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
        }

        return response.data;
      }
    } else {
      emit(GetReservationsFailure(
          errorCode: 'Reservasyonlar Yüklanılmadı Hata oldu',
          errorMassage: 'Null_Data'));
      return response.data;
    }
  }

  GetBookingModel? getBookingModelDetails;

  Future<dynamic> getBooking(
      CancelReservationJson request, BuildContext context) async {
    emit(GetReservationsLoading());
    getBookingModelDetails = null;
    //   print('*******************---------------------');
    String url =
        '$apiBaseUrl/GetBooking'; // API uç noktasını doğru bir şekilde güncelleyin

    final requestJson = jsonEncode(request.toJson());

    // JSON verisinin uzunluğu
    final jsonLength = requestJson.length;

    // JSON verisinin yarısı
    final halfLength = (jsonLength / 2).round();

    print(
        "requestJson for bookFlight (first half):::::${requestJson.substring(0, halfLength)}");

    print(
        "requestJson for bookFlight (second half):::::${requestJson.substring(halfLength)}");

    final response = await _dio.post(url, data: requestJson);
    final responseData = response.data;

    //  print("responseData for bookFlight:::::::${json.encode(responseData)}");

    if (responseData != null) {
      //  print("JSON'u PaymentVerification'a çevirme...");

      final responseData = response.data;

      final result = GetBookingModel.fromJson(responseData);
      if (result.errorCode == null) {
        if (result.result != null) {
          getBookingModelDetails = result;
          emit(GetReservationsSuccess());
          print('done');
          return result;
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
            emit(GetReservationsFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          } else {
            errorMassage = '${result.errorMessage}';
            errorCode = result.errorCode;
            emit(GetReservationsFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          }

          return result;
        }
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
          emit(GetReservationsFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          emit(GetReservationsFailure(
              errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
        }

        return result;
      }
    } else {
      emit(GetReservationsFailure(
          errorMassage: 'Bilet iptal edilemedi Hata oldu',
          errorCode: 'Bilet iptal edilemedi Hata oldu'));

      throw Exception('Bilet iptal edilemedi Hata oldu');
    }
  }

  String? systemPnrForGetBook;
  String? lastNameForGetBook;

  void clearTextFieldReservation({required int value}) {
    if (value == 0) {
      firstNameController.clear();
      firstNameReservation = '';
    } else if (value == 1) {
      lastNameController.clear();
      lastNameReservation = null;
    } else if (value == 2) {
      systemPNRController.clear();
      systemPNRReservation = null;
    }
    emit(ClearTextFieldReservationState());
  }

  int? saveReservationIndexValue;
  saveReservationIndexFunction({required int index}) {
    saveReservationIndexValue = index;
  }

  Future<dynamic> cancelReservation(
      CancelReservationJson request, BuildContext context) async {
    emit(FlightCancelReservationLoading());
    //   print('*******************---------------------');
    String url =
        '$apiBaseUrl/CancelReservation'; // API uç noktasını doğru bir şekilde güncelleyin

    final requestJson = jsonEncode(request.toJson());

    // JSON verisinin uzunluğu
    final jsonLength = requestJson.length;

    // JSON verisinin yarısı
    final halfLength = (jsonLength / 2).round();

    // İstek verisinin ilk yarısını bas
    // print(
    //     "requestJson for bookFlight (first half):::::${requestJson.substring(0, halfLength)}");
    // İstek verisinin ikinci yarısını bas
    //  print(
    //    "requestJson for bookFlight (second half):::::${requestJson.substring(halfLength)}");

    final response = await _dio.post(url, data: requestJson);
    final responseData = response.data;

    //  print("responseData for bookFlight:::::::${json.encode(responseData)}");

    if (responseData != null) {
      //  print("JSON'u PaymentVerification'a çevirme...");

      final result = Result.fromJson(responseData);
      if (result.errorCode == null) {
        if (result.result != null) {
          emit(FlightCancelReservationSuccess());
          return result;
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
            emit(FlightCancelReservationFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          } else {
            errorMassage = '${result.errorMessage}';
            errorCode = result.errorCode;
            emit(FlightCancelReservationFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          }

          return result;
        }
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
          emit(FlightCancelReservationFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          emit(FlightCancelReservationFailure(
              errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
        }

        return result;
      }
    } else {
      emit(FlightCancelReservationFailure(
          errorMassage: 'Bilet iptal edilemedi Hata oldu',
          errorCode: 'Bilet iptal edilemedi Hata oldu'));

      throw Exception('Bilet iptal edilemedi Hata oldu');
    }
  }

  Future<dynamic> voidTicket(
      CancelReservationJson request, BuildContext context) async {
    emit(FlightCancelReservationLoading());
    getReservationsList = [];
    //   print('*******************---------------------');
    String url =
        '$apiBaseUrl/Void'; // API uç noktasını doğru bir şekilde güncelleyin

    final requestJson = jsonEncode(request.toJson());

    // JSON verisinin uzunluğu
    final jsonLength = requestJson.length;

    // JSON verisinin yarısı
    final halfLength = (jsonLength / 2).round();

    // İstek verisinin ilk yarısını bas
    // print(
    //     "requestJson for bookFlight (first half):::::${requestJson.substring(0, halfLength)}");
    // İstek verisinin ikinci yarısını bas
    //  print(
    //    "requestJson for bookFlight (second half):::::${requestJson.substring(halfLength)}");

    final response = await _dio.post(url, data: requestJson);
    final responseData = response.data;

    //  print("responseData for bookFlight:::::::${json.encode(responseData)}");

    if (responseData != null) {
      //  print("JSON'u PaymentVerification'a çevirme...");

      final result = Result.fromJson(responseData);
      if (result.errorCode == null) {
        if (result.result != null) {
          emit(FlightVoidTicketSuccess());
          return result;
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
            emit(FlightVoidTicketFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          } else {
            errorMassage = '${result.errorMessage}';
            errorCode = result.errorCode;
            emit(FlightVoidTicketFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          }

          return result;
        }
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
          emit(FlightVoidTicketFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          emit(FlightVoidTicketFailure(
              errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
        }

        return result;
      }
    } else {
      emit(FlightVoidTicketFailure(
          errorMassage: 'Bilet iptal edilemedi Hata oldu',
          errorCode: 'Bilet iptal edilemedi Hata oldu'));

      throw Exception('Bilet iptal edilemedi Hata oldu');
    }
  }

  String? rulesForVoucher;
  List<String> extractedTexts = [];
  Future<dynamic> getVoucher(
      GetVoucherJson request, BuildContext context) async {
    extractedTexts = [];
    // emit(FlightCancelReservationLoading());
    //   print('*******************---------------------');
    String url =
        '$apiBaseUrlGeneral/GetVoucher'; // API uç noktasını doğru bir şekilde güncelleyin

    final requestJson = jsonEncode(request.toJson());

    // JSON verisinin uzunluğu
    final jsonLength = requestJson.length;

    // JSON verisinin yarısı
    final halfLength = (jsonLength / 2).round();

    // İstek verisinin ilk yarısını bas
    print(
        "requestJson for bookFlight (first half):::::${requestJson.substring(0, halfLength)}");
    // İstek verisinin ikinci yarısını bas
    print(
        "requestJson for bookFlight (second half):::::${requestJson.substring(halfLength)}");

    final response = await _dio.post(url, data: requestJson);
    final responseData = response.data;

    print("responseData for bookFlight:::::::${json.encode(responseData)}");

    if (responseData != null) {
      //  print("JSON'u PaymentVerification'a çevirme...");

      final result = ResultVoucher.fromJson(responseData);
      if (result.errorCode == null) {
        if (result.result != null) {
          rulesForVoucher = result.result;

          // تحليل HTML
          dom.Document document = htmlParser.parse(rulesForVoucher);

          // استخراج عناصر li
          List<dom.Element> liElements = document.querySelectorAll('ul li');

          // قائمة للاحتفاظ بالنصوص المستخرجة

          // إضافة النصوص المستخرجة إلى القائمة
          for (var li in liElements) {
            extractedTexts.add(li.text.trim());
          }
          print('------------extractedTexts: ${extractedTexts.length}');

          // إرجاع النصوص المستخرجة

          //      emit(FlightCancelReservationSuccess());
          return result;
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
            emit(FlightCancelReservationFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          } else {
            errorMassage = '${result.errorMessage}';
            errorCode = result.errorCode;
            emit(FlightCancelReservationFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          }

          return result;
        }
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
          emit(FlightCancelReservationFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          emit(FlightCancelReservationFailure(
              errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
        }

        return result;
      }
    } else {
      emit(FlightCancelReservationFailure(
          errorMassage: 'Bilet iptal edilemedi Hata oldu',
          errorCode: 'Bilet iptal edilemedi Hata oldu'));

      throw Exception('Bilet iptal edilemedi Hata oldu');
    }
  }

//--------------------helper api functions---------------------
  // List<AirResult>? flightSearchResultsLeaving;
  // List<AirResult>? flightSearchResultsReturn;
//c437c136d34445e9a5ac3b5a0db23371|@696a9cb3-1276-43b7-bb03-174a915be8c4@1e4de2e0-13a3-4962-b8b8-c1cfd9b4be7b@32ad40a3-c2e3-45cd-976d-b1caed7d55af@86b3151f-b70e-4879-b6c5-6766105ddc70
//c437c136d34445e9a5ac3b5a0db23371|@df98f062-a17d-44ae-8968-05a4913045e0@ff957cf9-fce7-4c99-953c-f0ff32a8640e@926da365-fa96-495f-b7c6-89e59088c3d3@7e87062e-4a2d-4361-bd20-9ecf1b08d2f3
  String? keyForLeaving;
  void saveKeyForLeaving({required String key}) {
    keyForLeaving = null;
    keyForLeaving = key;
    print('keyForLeaving: $keyForLeaving');
  }

  int? sendIndexValue;
  int? sendIndexValueReturn;
  void sendIndexFunction({required int index}) {
    sendIndexValue = null;
    sendIndexValue = index;

    emit(SendIndexState());
  }

  void sendReturnIndexFunction({required int index}) {
    sendIndexValueReturn = null;
    sendIndexValueReturn = index;

    emit(SendIndexState());
  }

  int? sendSeatIndexValue;
  int? sendSeatReturnIndexValue;
  void sendSeatIndexFunction({required int index}) {
    sendSeatIndexValue = index;

    emit(SendIndexState());
  }

  void sendSeatReturnIndexFunction({required int index}) {
    sendSeatReturnIndexValue = index;
    emit(SendIndexState());
  }

  // String? keyOneForAllValue;
  // String? keyTwoForAllValue;
  // List<String> keysForAllList = [];
  // void keysForOneFunction({required String key}) {
  //   keyOneForAllValue = null;
  //   keyOneForAllValue = key;
  // }

  // void keysForTwoFunction({required String key}) {
  //   keyTwoForAllValue = null;
  //   keyTwoForAllValue = key;
  // }

  // void keysForAllFunction() {
  //   keysForAllList.clear;
  //   keysForAllList.add(keyOneForAllValue!);
  //   keysForAllList.add(keyTwoForAllValue!);
  // }

  // double totalPrice = 0.0;
  // double leavingFlightCardPrice = 0.0;
  // double returnFlightCardPrice = 0.0;
  // double leavingPackageCardPrice = 0.0;
  // double returnPackageCardPrice = 0.0;
  // void fullPaymentAmountFunction({
  //   double? leavingFlightCardPrice,
  //   double? returnFlightCardPrice,
  //   double? leavingPackageCardPrice,
  //   double? returnPackageCardPrice,
  // }) {
  //   if (leavingFlightCardPrice != null) {
  //     totalPrice += leavingFlightCardPrice;
  //     this.leavingFlightCardPrice = leavingFlightCardPrice;
  //   }
  //   if (returnFlightCardPrice != null) {
  //     totalPrice += returnFlightCardPrice;
  //     this.returnFlightCardPrice = returnFlightCardPrice;
  //   }
  //   if (leavingPackageCardPrice != null) {
  //     totalPrice += leavingPackageCardPrice;
  //   }
  //   if (returnPackageCardPrice != null) {
  //     totalPrice += returnPackageCardPrice;
  //   }

  // double? leavingFlightCardPrice;
  // double? returnFlightCardPrice;
  // double? leavingPackageCardPrice;
  // double? returnPackageCardPrice;

  double? priceValueForFare;
  void priceValueForFareFunction({required double value}) {
    priceValueForFare = value;
  }

  String? leavingGroupId;
  String? returnGroupId;
  // void leavingGroupIdFunction({String? value}) {
  //   leavingGroupId = value;
  // }

  double? totalPrice = 0.0;

  void priceAmountFunction(
      {double? priceOne,
      double? priceTwo,
      String? currencyCodeOne,
      String? currencyCodeTwo,
      required BuildContext context}) {
    if (searchTypeValue == 'tek') {
      totalPrice = BlocProvider.of<CurrencyCodeCubit>(context)
          .convertToAppCurrency(
              itemPrice: priceOne!,
              appCurrencyExchangeRate:
                  BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
              ticketCurrencyCode: currencyCodeOne!);
    } else {
      totalPrice = BlocProvider.of<CurrencyCodeCubit>(context)
              .convertToAppCurrency(
                  itemPrice: priceOne!,
                  appCurrencyExchangeRate:
                      BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
                  ticketCurrencyCode: currencyCodeOne!) +
          BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
              itemPrice: priceTwo!,
              appCurrencyExchangeRate:
                  BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
              ticketCurrencyCode: currencyCodeTwo ?? 'TRY');
    }

    emit(TotalPriceState());
  }

  // List<String> keysForAllList = [];
  // String? keyOneForAllValue;
  // String? keyTwoForAllValue;
  // void getKeysForLeavingAndReturn() {
  //   keysForAllList.clear();
  //   keysForAllList.add(keyOneForAllValue!);
  //   if (searchTypeValue != 'tek') {
  //     keysForAllList.add(keyTwoForAllValue!);
  //   }
  // }

  //   emit(TotalPriceState());
  // }

  // void returnCardPriceFunction({required double value}) {
  //   returnCardPrice = value;
  //   emit(SendIndexState());
  // }

  // void totalPriceFunction() {
  //   totalPrice = leavingCardPrice + returnCardPrice;

  //   emit(TotalPriceState());
  // }

//------------------sort functions---------------------

  // void sortPriceLessToHighFunc() {

  //   if (selectedCardLeaving == null) {
  //     flightSearchResultsLeaving!.sort((a, b) => a
  //         .fares![0].totalPrice!.totalStrikeAmount
  //         .compareTo(b.fares![0].totalPrice!.totalStrikeAmount));
  //   } else {
  //     null;
  //   }

  //   if (selectedCardReturn == null && searchTypeValue != 'tek') {
  //     flightSearchResultsReturn!.sort((a, b) => a
  //         .fares![0].totalPrice!.totalStrikeAmount
  //         .compareTo(b.fares![0].totalPrice!.totalStrikeAmount));
  //   } else {
  //     null;
  //   }

  // }
  void sortPriceLessToHighFunc(BuildContext context, {bool isPackage = false}) {
    //  emit(SearchFlightOneAwayLoading());
    if (selectedCardLeaving == null) {
      if (isPackage == false) {
        afterRefreshFlightSearchResultsLeaving.sort((a, b) {
          double priceA =
              BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
            itemPrice: a.fares![0].totalPrice!.totalStrikeAmount!.toDouble(),
            appCurrencyExchangeRate:
                BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
            ticketCurrencyCode: a.fares![0].totalPrice!.currencyCode!,
          );

          double priceB =
              BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
            itemPrice: b.fares![0].totalPrice!.totalStrikeAmount!.toDouble(),
            appCurrencyExchangeRate:
                BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
            ticketCurrencyCode: b.fares![0].totalPrice!.currencyCode!,
          );

          return priceA.compareTo(priceB);
        });
      }
    } else {
      null;
    }
    if (selectedCardReturn == null && searchTypeValue != 'tek') {
      afterRefreshFlightSearchResultsReturn.sort((a, b) {
        double priceA =
            BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
          itemPrice: a.groupId == 'p'
              ? (a.fares![0].totalPrice!.totalStrikeAmount - priceValue)
                  .toDouble()
              : a.fares![0].totalPrice!.totalStrikeAmount.toDouble(),
          appCurrencyExchangeRate:
              BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
          ticketCurrencyCode: a.fares![0].totalPrice!.currencyCode!,
        );

        double priceB =
            BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
          itemPrice: b.groupId == 'p'
              ? (b.fares![0].totalPrice!.totalStrikeAmount - priceValue)
                  .toDouble()
              : b.fares![0].totalPrice!.totalStrikeAmount.toDouble(),
          appCurrencyExchangeRate:
              BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
          ticketCurrencyCode: b.fares![0].totalPrice!.currencyCode!,
        );

        return priceA.compareTo(priceB);
      });
    } else {
      null;
    }
  }

  void sortPriceHighToLessFunc(BuildContext context) {
    //   emit(SearchFlightOneAwayLoading());
    if (selectedCardLeaving == null) {
      afterRefreshFlightSearchResultsLeaving.sort((a, b) {
        double priceA =
            BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
          itemPrice: a.fares![0].totalPrice!.totalStrikeAmount.toDouble(),
          appCurrencyExchangeRate:
              BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
          ticketCurrencyCode: a.fares![0].totalPrice!.currencyCode!,
        );

        double priceB =
            BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
          itemPrice: b.fares![0].totalPrice!.totalStrikeAmount.toDouble(),
          appCurrencyExchangeRate:
              BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
          ticketCurrencyCode: b.fares![0].totalPrice!.currencyCode!,
        );

        return priceB.compareTo(priceA);
      });
    } else {
      null;
    }

    if (selectedCardReturn == null && searchTypeValue != 'tek') {
      afterRefreshFlightSearchResultsReturn.sort((a, b) {
        double priceA =
            BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
          itemPrice: a.groupId == null
              ? (a.fares![0].totalPrice!.totalStrikeAmount - priceValue)
                  .toDouble()
              : a.fares![0].totalPrice!.totalStrikeAmount.toDouble(),
          appCurrencyExchangeRate:
              BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
          ticketCurrencyCode: a.fares![0].totalPrice!.currencyCode!,
        );

        double priceB =
            BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
          itemPrice: b.groupId == null
              ? (b.fares![0].totalPrice!.totalStrikeAmount - priceValue)
                  .toDouble()
              : b.fares![0].totalPrice!.totalStrikeAmount.toDouble(),
          appCurrencyExchangeRate:
              BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
          ticketCurrencyCode: b.fares![0].totalPrice!.currencyCode!,
        );

        return priceA.compareTo(priceB);
      });
    } else {
      null;
    }
  }

  void sortTripLessToHighFunc() {
    //emit(SearchFlightOneAwayLoading());
    if (selectedCardLeaving == null) {
      afterRefreshFlightSearchResultsLeaving.sort((a, b) {
        String arriveTimeA =
            a.legs![0].alternativeLegs![0].segments!.last.arrivalDate!;
        String departureTimeA =
            a.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeA = DateTime.parse(departureTimeA);
        DateTime dateArriveTimeA = DateTime.parse(arriveTimeA);
        Duration durationA = dateArriveTimeA.difference(dateDepartureTimeA);

        String arriveTimeB =
            b.legs![0].alternativeLegs![0].segments!.last.arrivalDate!;
        String departureTimeB =
            b.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeB = DateTime.parse(departureTimeB);
        DateTime dateArriveTimeB = DateTime.parse(arriveTimeB);
        Duration durationB = dateArriveTimeB.difference(dateDepartureTimeB);

        return durationA.compareTo(durationB);
      });
    } else {
      null;
    }
    if (selectedCardReturn == null && searchTypeValue != 'tek') {
      afterRefreshFlightSearchResultsReturn.sort((a, b) {
        String arriveTimeA =
            a.legs![0].alternativeLegs![0].segments!.last.arrivalDate!;
        String departureTimeA =
            a.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeA = DateTime.parse(departureTimeA);
        DateTime dateArriveTimeA = DateTime.parse(arriveTimeA);
        Duration durationA = dateArriveTimeA.difference(dateDepartureTimeA);

        String arriveTimeB =
            b.legs![0].alternativeLegs![0].segments!.last.arrivalDate!;
        String departureTimeB =
            b.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeB = DateTime.parse(departureTimeB);
        DateTime dateArriveTimeB = DateTime.parse(arriveTimeB);
        Duration durationB = dateArriveTimeB.difference(dateDepartureTimeB);

        return durationA.compareTo(durationB);
      });
    } else {
      null;
    }
  }

  void sortTripHighToLessFunc() {
    // emit(SearchFlightOneAwayLoading());
    if (selectedCardLeaving == null) {
      afterRefreshFlightSearchResultsLeaving.sort((a, b) {
        String arriveTimeA =
            a.legs![0].alternativeLegs![0].segments!.last.arrivalDate!;
        String departureTimeA =
            a.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeA = DateTime.parse(departureTimeA);
        DateTime dateArriveTimeA = DateTime.parse(arriveTimeA);
        Duration durationA = dateArriveTimeA.difference(dateDepartureTimeA);

        String arriveTimeB =
            b.legs![0].alternativeLegs![0].segments!.last.arrivalDate!;
        String departureTimeB =
            b.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeB = DateTime.parse(departureTimeB);
        DateTime dateArriveTimeB = DateTime.parse(arriveTimeB);
        Duration durationB = dateArriveTimeB.difference(dateDepartureTimeB);

        return durationB.compareTo(durationA);
      });
    } else {
      null;
    }
    if (selectedCardReturn == null && searchTypeValue != 'tek') {
      afterRefreshFlightSearchResultsReturn.sort((a, b) {
        String arriveTimeA =
            a.legs![0].alternativeLegs![0].segments!.last.arrivalDate!;
        String departureTimeA =
            a.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeA = DateTime.parse(departureTimeA);
        DateTime dateArriveTimeA = DateTime.parse(arriveTimeA);
        Duration durationA = dateArriveTimeA.difference(dateDepartureTimeA);

        String arriveTimeB =
            b.legs![0].alternativeLegs![0].segments!.last.arrivalDate!;
        String departureTimeB =
            b.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeB = DateTime.parse(departureTimeB);
        DateTime dateArriveTimeB = DateTime.parse(arriveTimeB);
        Duration durationB = dateArriveTimeB.difference(dateDepartureTimeB);

        return durationB.compareTo(durationA);
      });
    } else {
      null;
    }
  }

  void sortTripDepartureTimeHighToLessFunc() {
    //   emit(SearchFlightOneAwayLoading());
    if (selectedCardLeaving == null) {
      afterRefreshFlightSearchResultsLeaving.sort((a, b) {
        String departureTimeA =
            a.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeA = DateTime.parse(departureTimeA);

        String departureTimeB =
            b.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeB = DateTime.parse(departureTimeB);

        return dateDepartureTimeB.compareTo(dateDepartureTimeA);
      });
    } else {
      null;
    }
    if (selectedCardReturn == null && searchTypeValue != 'tek') {
      afterRefreshFlightSearchResultsReturn.sort((a, b) {
        String departureTimeA =
            a.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeA = DateTime.parse(departureTimeA);

        String departureTimeB =
            b.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeB = DateTime.parse(departureTimeB);

        return dateDepartureTimeB.compareTo(dateDepartureTimeA);
      });
    } else {
      null;
    }

    //   emit(SearchFlightOneAwaySuccess());
  }

  void sortTripDepartureTimeLessToHighFunc() {
    // emit(SearchFlightOneAwayLoading());

    if (selectedCardLeaving == null) {
      afterRefreshFlightSearchResultsLeaving.sort((a, b) {
        String departureTimeA =
            a.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeA = DateTime.parse(departureTimeA);

        String departureTimeB =
            b.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeB = DateTime.parse(departureTimeB);

        return dateDepartureTimeA.compareTo(dateDepartureTimeB);
      });
    } else {
      null;
    }

    if (selectedCardReturn == null && searchTypeValue != 'tek') {
      afterRefreshFlightSearchResultsReturn.sort((a, b) {
        String departureTimeA =
            a.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeA = DateTime.parse(departureTimeA);

        String departureTimeB =
            b.legs![0].alternativeLegs![0].segments!.first.departureDate!;
        DateTime dateDepartureTimeB = DateTime.parse(departureTimeB);

        return dateDepartureTimeA.compareTo(dateDepartureTimeB);
      });
    } else {
      null;
    }

    //   emit(SearchFlightOneAwaySuccess());
  }

//---------------------filter functions---------------------------------------
  List<AirResult> originalFlightSearchResultsLeaving = [];
  List<AirResult> originalFlightSearchResultsReturn = [];
  List<AirResult> mainNotChangeLeavingList = [];

  void saveOriginalList() {
    originalFlightSearchResultsLeaving = [];
    originalFlightSearchResultsReturn = [];
    originalFlightSearchResultsLeaving
        .addAll(afterRefreshFlightSearchResultsLeaving);

    if (searchTypeValue != 'tek') {
      originalFlightSearchResultsReturn
          .addAll(afterRefreshFlightSearchResultsReturn);
    }
  }

  void saveMainLeavingAndReturnList(int i) {
    mainNotChangeLeavingList = [];

    if (i > 0) {
      mainNotChangeLeavingList.addAll(afterRefreshFlightSearchResultsLeaving);

      --i;
    } else {
      null;
    }
  }

  List<AirResult>? listFilterPriceLeaving = [];
  List<AirResult>? listFilterPriceReturn = [];

  void filterByPriceRange(BuildContext context) {
    var newList = afterRefreshFlightSearchResultsLeaving.where((flight) {
      double flightPrice =
          BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
        itemPrice: flight.fares![0].totalPrice!.totalStrikeAmount.toDouble(),
        appCurrencyExchangeRate:
            BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
        ticketCurrencyCode: flight.fares![0].totalPrice!.currencyCode!,
      );

      return flightPrice >= lowestPriceInFilter &&
          flightPrice <= highestPriceInFilter;
    }).toList();

    List<AirResult> newListReturn = [];
    if (searchTypeValue != 'tek') {
      newListReturn = mainNotChangeReturnList.where((flight) {
        // التحقق مما إذا كان groupId يساوي null وإنقاص priceValue عند الضرورة
        double flightPrice =
            BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
          itemPrice: flight.groupId == null
              ? (flight.fares![0].totalPrice!.totalStrikeAmount - priceValue)
                  .toDouble()
              : flight.fares![0].totalPrice!.totalStrikeAmount.toDouble(),
          appCurrencyExchangeRate:
              BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
          ticketCurrencyCode: flight.fares![0].totalPrice!.currencyCode!,
        );

        // التحقق من تطابق السعر مع مجال الفلترة
        return flightPrice >= lowestPriceInFilter &&
            flightPrice <= highestPriceInFilter;
      }).toList();
    }

    if (newList.isEmpty) {
    } else {
      if (selectedCardLeaving == null) {
        print('*/////////////////////////////0000000000000000000000/');
        listFilterPriceLeaving = newList;
      } else {
        print(
            '*/////////////////////////////***********************************/');
        null;
      }
      if (selectedCardReturn == null && searchTypeValue != 'tek') {
        listFilterPriceReturn = newListReturn;
      } else {
        null;
      }
    }

    //  emit(SearchFlightOneAwaySuccess());
  }

  bool isAfterOrEqual(TimeOfDay time, TimeOfDay filterTime) {
    return time.hour > filterTime.hour ||
        (time.hour == filterTime.hour && time.minute >= filterTime.minute);
  }

  bool isBeforeOrEqual(TimeOfDay time, TimeOfDay filterTime) {
    return time.hour < filterTime.hour ||
        (time.hour == filterTime.hour && time.minute <= filterTime.minute);
  }

  List<AirResult>? listFilterTimeLeaving = [];
  List<AirResult>? listFilterTimeReturn = [];
  void filterByTimesRange() {
    TimeOfDay firstTimeOfDay = TimeOfDay.fromDateTime(flyingFirstHourInFilter!);
    TimeOfDay secondTimeOfDay =
        TimeOfDay.fromDateTime(flyingSecondHourInFilter!);

    print('Filtering from: $firstTimeOfDay to: $secondTimeOfDay');

    var newList = afterRefreshFlightSearchResultsLeaving.where((flight) {
      TimeOfDay departureTime = TimeOfDay.fromDateTime(DateTime.parse(
          flight.legs![0].alternativeLegs![0].segments!.first.departureDate!));

      print('Flight departure: $departureTime');

      return isAfterOrEqual(departureTime, firstTimeOfDay) &&
          isBeforeOrEqual(departureTime, secondTimeOfDay);
    }).toList();

    if (searchTypeValue != 'tek') {
      var newListReturn = mainNotChangeReturnList.where((flight) {
        TimeOfDay departureTime = TimeOfDay.fromDateTime(DateTime.parse(flight
            .legs![0].alternativeLegs![0].segments!.first.departureDate!));

        print('Flight departure: $departureTime');

        return isAfterOrEqual(departureTime, firstTimeOfDay) &&
            isBeforeOrEqual(departureTime, secondTimeOfDay);
      }).toList();

      listFilterTimeReturn = newListReturn;
    }

    print('Number of flights found: ${newList.length}');

    listFilterTimeLeaving = newList;

    //  emit(SearchFlightOneAwaySuccess());
  }

  List<AirResult> listFilterDurationsLeaving = [];
  List<AirResult> listFilterDurationsReturn = [];

  void filterByDurationsRange() {
    print(
        'Filtered flights count before: ${afterRefreshFlightSearchResultsLeaving.length}');

    listFilterDurationsLeaving.clear(); // تفريغ القائمة قبل البدء بالفحص

    listFilterDurationsReturn.clear();

    if (searchTypeValue == 'tek') {
      for (var element in afterRefreshFlightSearchResultsLeaving) {
        print("Checking element: ${element.groupId}");

        // تتبع ما إذا كانت جميع الأجزاء تحقق الشرط
        bool allSegmentsPass = true;

        for (var leg in element.legs!) {
          for (var altLeg in leg.alternativeLegs!) {
            int totalDurationSum = 0; // متغير لتجميع مدة جميع الأجزاء في altLeg

            for (var segment in altLeg.segments!) {
              int totalDuration =
                  segment.waitingDuration + segment.flightDuration;
              totalDurationSum +=
                  totalDuration; // إضافة مدة الجزء إلى المجموع الكلي

              print(
                  "Segment duration: $totalDuration, Accumulated Duration: $totalDurationSum");
            }

            // تطبيق الشرط بعد جمع المدد لجميع الأجزاء
            print(
                "Total Duration for alternativeLeg: $totalDurationSum, Filter limit: ${flyingDurationFirstInFilter!.inMinutes}");
            if (totalDurationSum > flyingDurationFirstInFilter!.inMinutes) {
              print("FAIL: Flight does not meet filter requirements");
              allSegmentsPass = false;
              break; // الخروج عند أول فشل
            }
          }
          if (!allSegmentsPass) break; // التوقف عند أول فشل
        }

        // إضافة العنصر إذا تحققت الشروط لجميع الأجزاء
        if (allSegmentsPass) {
          listFilterDurationsLeaving.add(element);
          print("PASS: Flight meets filter requirements");
        } else {
          print("FAIL: Flight does not meet filter requirements");
        }
      }
    } else {
      for (var element in mainNotChangeReturnList) {
        print("Checking element: ${element.groupId}");

        // تتبع ما إذا كانت جميع الأجزاء تحقق الشرط
        bool allSegmentsPass = true;

        for (var leg in element.legs!) {
          for (var altLeg in leg.alternativeLegs!) {
            int totalDurationSum = 0; // متغير لتجميع مدة جميع الأجزاء في altLeg

            for (var segment in altLeg.segments!) {
              int totalDuration =
                  segment.waitingDuration + segment.flightDuration;
              totalDurationSum +=
                  totalDuration; // إضافة مدة الجزء إلى المجموع الكلي

              print(
                  "Segment duration: $totalDuration, Accumulated Duration: $totalDurationSum");
            }

            // تطبيق الشرط بعد جمع المدد لجميع الأجزاء
            print(
                "Total Duration for alternativeLeg: $totalDurationSum, Filter limit: ${flyingDurationFirstInFilter!.inMinutes}");
            if (totalDurationSum > flyingDurationFirstInFilter!.inMinutes) {
              print("FAIL: Flight does not meet filter requirements");
              allSegmentsPass = false;
              break; // الخروج عند أول فشل
            }
          }
          if (!allSegmentsPass) break; // التوقف عند أول فشل
        }

        // إضافة العنصر إذا تحققت الشروط لجميع الأجزاء
        if (allSegmentsPass) {
          listFilterDurationsReturn.add(element);
          print("PASS: Flight meets filter requirements");
        } else {
          print("FAIL: Flight does not meet filter requirements");
        }
      }
    }

    print('Filtered flights count after: ${listFilterDurationsReturn.length}');
  }

//---------------------------Airline------------------------------------
  dynamic airlineListLeaving = [];
  dynamic airlineListReturn = [];
  List<String> selectedAirlinListLeaving = [];
  Map<String, bool> selectedAirlineMapLeaving = {};
  List<String> selectedAirlinListReturn = [];
  Map<String, bool> selectedAirlineMapReturn = {};
  List<AirResult>? listFilterAirlineLeaving = [];
  List<AirResult>? listFilterAirlineReturn = [];

  void getAirlineNameAndLogo() {
    print(
        '8888888888888888888888888888888888888888888888888888888888888888888');

    airlineListLeaving = [];
    airlineListReturn = [];

    final Set<String> uniqueAirlinesLeaving = {};
    final Set<String> uniqueAirlinesReturn = {};

    for (int i = 0; i < afterRefreshFlightSearchResultsLeaving.length; i++) {
      for (var segment in afterRefreshFlightSearchResultsLeaving[i]
          .legs![0]
          .alternativeLegs![0]
          .segments!) {
        final airlineName = segment.ticketingAirline?.name;
        final airlineLogo = segment.ticketingAirline?.logo;

        // التحقق من الاسم والشعار وإضافتهما إلى القائمة إذا كان الاسم فريدًا
        if (airlineName != null && uniqueAirlinesLeaving.add(airlineName)) {
          airlineListLeaving.add({'name': airlineName, 'logo': airlineLogo});
        }
      }
    }

    if (searchTypeValue != 'tek') {
      for (int i = 0; i < mainNotChangeReturnList.length; i++) {
        for (var segment in mainNotChangeReturnList[i]
            .legs![0]
            .alternativeLegs![0]
            .segments!) {
          final airlineName = segment.ticketingAirline?.name;
          final airlineLogo = segment.ticketingAirline?.logo;

          // التحقق من الاسم والشعار وإضافتهما إلى القائمة إذا كان الاسم فريدًا
          if (airlineName != null && uniqueAirlinesReturn.add(airlineName)) {
            airlineListReturn.add({'name': airlineName, 'logo': airlineLogo});
          }
        }
      }
      print('airlineListReturn: $airlineListReturn');
    }

    print('airlineListReturn: $airlineListReturn');
    print('airlineListReturn length: ${airlineListReturn.length}');
  }

  void checkboxAirlineNameAndLogo(
      {required String lineName, required bool value}) {
    if (value) {
      if (!selectedAirlinListLeaving.contains(lineName)) {
        selectedAirlinListLeaving.add(lineName);
      }
    } else {
      selectedAirlinListLeaving.remove(lineName);
    }

    selectedAirlineMapLeaving[lineName] = value;
    print('Selected lines: $selectedAirlineMapLeaving');

    if (searchTypeValue != 'tek') {
      if (value) {
        if (!selectedAirlinListReturn.contains(lineName)) {
          selectedAirlinListReturn.add(lineName);
        }
      } else {
        selectedAirlinListReturn.remove(lineName);
      }

      selectedAirlineMapReturn[lineName] = value;
      print('Selected lines: $selectedAirlineMapReturn');
    }
    emit(AirlinesFilterState());
  }

  bool isSelectedAirlineLeaving(String lineName) {
    return selectedAirlineMapLeaving[lineName] ?? false;
  }

  bool isSelectedAirlineReturn(String lineName) {
    return selectedAirlineMapReturn[lineName] ?? false;
  }

  void filterAirlines() {
    // فلترة شركات الطيران المغادرة
    listFilterAirlineLeaving =
        originalFlightSearchResultsLeaving.where((airResult) {
      return airResult.legs![0].alternativeLegs![0].segments!.any((segment) {
        return selectedAirlinListLeaving
            .contains(segment.ticketingAirline!.name);
      });
    }).toList();

    // تحقق من نوع البحث
    if (searchTypeValue != 'tek') {
      // فلترة شركات الطيران للعودة
      listFilterAirlineReturn =
          originalFlightSearchResultsReturn.where((airResult) {
        return airResult.legs![0].alternativeLegs![0].segments!.any((segment) {
          return selectedAirlinListReturn
              .contains(segment.ticketingAirline!.name);
        });
      }).toList();
    }
  }

//---------------------------------------------------------------------------

//---------------------------luggages------------------------------------

  dynamic luggagesListLeaving = [];
  List<String> selectedLuggagesListLeaving = [];
  Map<String, bool> selectedLuggagesMapLeaving = {};
  List<AirResult>? listFilterLuggagesTypesLeaving = [];

  dynamic luggagesListReturn = [];
  List<String> selectedLuggagesListReturn = [];
  Map<String, bool> selectedLuggagesMapReturn = {};
  List<AirResult>? listFilterLuggagesTypesReturn = [];

  void getLuggagesTypes() {
    print('9999999999999999999999999999999999999999999999999999999999');
    luggagesListLeaving = [];
    luggagesListReturn = [];
    final Set<String> uniqueBaggageTypesLeaving = {};
    final Set<String> uniqueBaggageTypesReturn = {};

    for (int i = 0; i < afterRefreshFlightSearchResultsLeaving.length; i++) {
      dynamic baggageAllowances;

      // التحقق من أن القوائم ليست فارغة قبل الوصول إلى first
      if (afterRefreshFlightSearchResultsLeaving[i].fares != null &&
          afterRefreshFlightSearchResultsLeaving[i].fares!.isNotEmpty &&
          afterRefreshFlightSearchResultsLeaving[i]
                  .fares!
                  .first
                  .passengerFares !=
              null &&
          afterRefreshFlightSearchResultsLeaving[i]
              .fares!
              .first
              .passengerFares!
              .isNotEmpty &&
          afterRefreshFlightSearchResultsLeaving[i]
                  .fares!
                  .first
                  .passengerFares!
                  .first
                  .baggageAllowances !=
              null &&
          afterRefreshFlightSearchResultsLeaving[i]
              .fares!
              .first
              .passengerFares!
              .first
              .baggageAllowances!
              .isNotEmpty) {
        baggageAllowances = afterRefreshFlightSearchResultsLeaving[i]
            .fares!
            .first
            .passengerFares!
            .first
            .baggageAllowances!
            .first
            .value;

        if (baggageAllowances != null) {
          uniqueBaggageTypesLeaving.add(baggageAllowances);
        }
      } else {
        print('No baggage allowance data at index: $i');
      }
    }

    luggagesListLeaving =
        uniqueBaggageTypesLeaving.map((type) => {'baggageType': type}).toList();

    luggagesListLeaving.sort((a, b) {
      final String typeA = a['baggageType']!;
      final String typeB = b['baggageType']!;
      return typeA.compareTo(typeB);
    });

    if (searchTypeValue != 'tek') {
      for (int i = 0; i < mainNotChangeReturnList.length; i++) {
        dynamic baggageAllowances;

        // التحقق من أن القوائم ليست فارغة قبل الوصول إلى [0]
        if (mainNotChangeReturnList[i].fares != null &&
            mainNotChangeReturnList[i].fares!.isNotEmpty &&
            mainNotChangeReturnList[i].fares![0].passengerFares != null &&
            mainNotChangeReturnList[i].fares![0].passengerFares!.isNotEmpty &&
            mainNotChangeReturnList[i]
                    .fares![0]
                    .passengerFares![0]
                    .baggageAllowances !=
                null &&
            mainNotChangeReturnList[i]
                .fares![0]
                .passengerFares![0]
                .baggageAllowances!
                .isNotEmpty) {
          baggageAllowances = mainNotChangeReturnList[i]
              .fares![0]
              .passengerFares![0]
              .baggageAllowances![0]
              .value;

          if (baggageAllowances != null) {
            uniqueBaggageTypesReturn.add(baggageAllowances);
          }
        } else {
          print('No baggage allowance data at index: $i');
        }
      }

      luggagesListReturn = uniqueBaggageTypesReturn
          .map((type) => {'baggageType': type})
          .toList();

      luggagesListReturn.sort((a, b) {
        final String typeA = a['baggageType']!;
        final String typeB = b['baggageType']!;
        return typeA.compareTo(typeB);
      });
    }
    print('luggagesListLeaving: $luggagesListLeaving');
    print('luggagesListLeaving length: ${luggagesListLeaving.length}');
    print('luggagesListReturn: $luggagesListReturn');
    print('luggagesListReturn length: ${luggagesListReturn.length}');
  }

  void checkboxLuggagesType(
      {required String baggageName, required bool value}) {
    if (value) {
      if (!selectedLuggagesListLeaving.contains(baggageName)) {
        selectedLuggagesListLeaving.add(baggageName);
      }
    } else {
      selectedLuggagesListLeaving.remove(baggageName);
    }

    selectedLuggagesMapLeaving[baggageName] = value;
    print('Selected lines: $selectedLuggagesMapLeaving');

    if (searchTypeValue != 'tek') {
      if (value) {
        if (!selectedLuggagesListReturn.contains(baggageName)) {
          selectedLuggagesListReturn.add(baggageName);
        }
      } else {
        selectedLuggagesListReturn.remove(baggageName);
      }

      selectedLuggagesMapReturn[baggageName] = value;
      print('Selected lines: $selectedLuggagesMapReturn');
    }
    emit(LuggageFilterState());
  }

  bool isSelectedLuggagesTypesLeaving(String lineName) {
    return selectedLuggagesMapLeaving[lineName] ?? false;
  }

  bool isSelectedLuggagesTypesReturn(String lineName) {
    return selectedLuggagesMapReturn[lineName] ?? false;
  }

  void filterLuggagesTypes() {
    listFilterLuggagesTypesLeaving =
        originalFlightSearchResultsLeaving.where((baggageResult) {
      // التحقق من أن القوائم ليست فارغة قبل الوصول إلى [0]
      if (baggageResult.fares != null &&
          baggageResult.fares!.isNotEmpty &&
          baggageResult.fares![0].passengerFares != null &&
          baggageResult.fares![0].passengerFares!.isNotEmpty &&
          baggageResult.fares![0].passengerFares![0].baggageAllowances !=
              null &&
          baggageResult
              .fares![0].passengerFares![0].baggageAllowances!.isNotEmpty) {
        return selectedLuggagesListLeaving.contains(baggageResult
            .fares![0].passengerFares![0].baggageAllowances![0].value);
      } else {
        return false; // إذا كانت أي قائمة فارغة، استبعد هذا العنصر
      }
    }).toList();

    print('Filtered flightSearchResultsLeaving:  $selectedLuggagesListLeaving');
    for (var baggage in afterRefreshFlightSearchResultsLeaving) {
      // التحقق من أن القوائم ليست فارغة قبل الوصول إلى [0]
      if (baggage.fares != null &&
          baggage.fares!.isNotEmpty &&
          baggage.fares![0].passengerFares != null &&
          baggage.fares![0].passengerFares!.isNotEmpty &&
          baggage.fares![0].passengerFares![0].baggageAllowances != null &&
          baggage.fares![0].passengerFares![0].baggageAllowances!.isNotEmpty) {
        print(
            'Name: ${baggage.fares![0].passengerFares![0].baggageAllowances![0].value}, ');
      } else {
        print('No baggage allowance available for this item');
      }
    }

    if (searchTypeValue != 'tek') {
      listFilterLuggagesTypesReturn =
          originalFlightSearchResultsReturn.where((baggageResult) {
        // التحقق من أن القوائم ليست فارغة قبل الوصول إلى [0]
        if (baggageResult.fares != null &&
            baggageResult.fares!.isNotEmpty &&
            baggageResult.fares![0].passengerFares != null &&
            baggageResult.fares![0].passengerFares!.isNotEmpty &&
            baggageResult.fares![0].passengerFares![0].baggageAllowances !=
                null &&
            baggageResult
                .fares![0].passengerFares![0].baggageAllowances!.isNotEmpty) {
          // تحقق مما إذا كانت الأمتعة المحددة موجودة في القائمة
          return selectedLuggagesListReturn.contains(baggageResult
              .fares![0].passengerFares![0].baggageAllowances![0].value);
        } else {
          return false; // لا شيء لإضافته إذا كانت القوائم فارغة
        }
      }).toList();

      print(
          'Filtered flightSearchResultsLeaving:  $selectedLuggagesListReturn');
      for (var baggage in afterRefreshFlightSearchResultsReturn) {
        if (baggage.fares != null &&
            baggage.fares!.isNotEmpty &&
            baggage.fares![0].passengerFares != null &&
            baggage.fares![0].passengerFares!.isNotEmpty &&
            baggage.fares![0].passengerFares![0].baggageAllowances != null &&
            baggage
                .fares![0].passengerFares![0].baggageAllowances!.isNotEmpty) {
          print(
              'Name: ${baggage.fares![0].passengerFares![0].baggageAllowances![0].value}');
        } else {
          print('No baggage allowance information available');
        }
      }
    }
  }

//---------------------------------------------------------------------------

//---------------------------providers (sagliyaciler)------------------------------------

  dynamic flightProviderListLeaving = [];
  List<String> selectedFlightProviderListLeaving = [];
  Map<String, bool> selectedFlightProviderMapLeaving = {};
  List<AirResult>? listFilterFlightProviderLeaving = [];

  dynamic flightProviderListReturn = [];
  List<String> selectedFlightProviderListReturn = [];
  Map<String, bool> selectedFlightProviderMapReturn = {};
  List<AirResult>? listFilterFlightProviderReturn = [];

  void getFlightProviderNameAndLogo() {
    flightProviderListLeaving = [];
    flightProviderListReturn = [];
    final Set<String> uniqueFlightProviderLeaving = {};
    final Set<String> uniqueFlightProviderReturn = {};

    for (int i = 0; i < afterRefreshFlightSearchResultsLeaving.length; i++) {
      final flightProviderName = afterRefreshFlightSearchResultsLeaving[i]
          .legs![0]
          .alternativeLegs![0]
          .segments![0]
          .operatingAirline!
          .name;

      final flightProviderLogo = afterRefreshFlightSearchResultsLeaving[i]
          .legs![0]
          .alternativeLegs![0]
          .segments![0]
          .operatingAirline!
          .logo;

      if (flightProviderName != null &&
          uniqueFlightProviderLeaving.add(flightProviderName)) {
        flightProviderListLeaving
            .add({'name': flightProviderName, 'logo': flightProviderLogo});
      }
    }
    if (searchTypeValue != 'tek') {
      for (int i = 0; i < mainNotChangeReturnList.length; i++) {
        final flightProviderName = mainNotChangeReturnList[i]
            .legs![0]
            .alternativeLegs![0]
            .segments![0]
            .operatingAirline!
            .name;

        final flightProviderLogo = mainNotChangeReturnList[i]
            .legs![0]
            .alternativeLegs![0]
            .segments![0]
            .operatingAirline!
            .logo;

        if (flightProviderName != null &&
            uniqueFlightProviderReturn.add(flightProviderName)) {
          flightProviderListReturn
              .add({'name': flightProviderName, 'logo': flightProviderLogo});
        }
      }
      print('flightProviderListLeaving: $flightProviderListLeaving');
    }

    print('flightProviderListReturn: $flightProviderListReturn');
    print(
        'flightProviderListReturn length: ${flightProviderListReturn.length}');
  }

  void checkboxFlightProviderNameAndLogo(
      {required String flightProviderName, required bool value}) {
    if (value) {
      if (!selectedFlightProviderListLeaving.contains(flightProviderName)) {
        selectedFlightProviderListLeaving.add(flightProviderName);
      }
    } else {
      selectedFlightProviderListLeaving.remove(flightProviderName);
    }

    selectedFlightProviderMapLeaving[flightProviderName] = value;

    if (searchTypeValue != 'tek') {
      if (value) {
        if (!selectedFlightProviderListReturn.contains(flightProviderName)) {
          selectedFlightProviderListReturn.add(flightProviderName);
        }
      } else {
        selectedFlightProviderListReturn.remove(flightProviderName);
      }

      selectedFlightProviderMapReturn[flightProviderName] = value;
    }
    print('Selected lines: $selectedFlightProviderMapReturn');
    emit(FlightProviderFilterState());
  }

  bool isSelectedFlightProviderLeaving(String flightProviderName) {
    return selectedFlightProviderMapLeaving[flightProviderName] ?? false;
  }

  bool isSelectedFlightProviderReturn(String flightProviderName) {
    return selectedFlightProviderMapReturn[flightProviderName] ?? false;
  }

  void filterFlightProvider() {
    listFilterFlightProviderLeaving =
        originalFlightSearchResultsLeaving.where((flightProviderResult) {
      return selectedFlightProviderListLeaving.contains(flightProviderResult
          .legs![0].alternativeLegs![0].segments![0].operatingAirline!.name);
    }).toList();

    if (searchTypeValue != 'tek') {
      listFilterFlightProviderReturn =
          originalFlightSearchResultsReturn.where((flightProviderResult) {
        return selectedFlightProviderListReturn.contains(flightProviderResult
            .legs![0].alternativeLegs![0].segments![0].operatingAirline!.name);
      }).toList();
    }

    print('Filtered flightSearchResultsLeaving:');
    for (var flightProvider in afterRefreshFlightSearchResultsReturn) {
      print(
          'Name: ${flightProvider.legs![0].alternativeLegs![0].segments![0].operatingAirline!.name}, Logo: ${flightProvider.legs![0].alternativeLegs![0].segments![0].operatingAirline!.logo}');
    }
  }

//---------------------------------------------------------------------------

//---------------------------airport ------------------------------------
  dynamic airportListLeaving = [];
  List<String> selectedAirportListLeaving = [];
  Map<String, bool> selectedAirportMapLeaving = {};
  List<AirResult>? listFilterAirportLeaving = [];

  dynamic airportListReturn = [];
  List<String> selectedAirportListReturn = [];
  Map<String, bool> selectedAirportMapReturn = {};
  List<AirResult>? listFilterAirportReturn = [];

  void getAirportNameAndLogo() {
    airportListLeaving = [];
    airportListReturn = [];
    final Set<String> uniqueAirportLeaving = {};
    final Set<String> uniqueAirportReturn = {};

    for (int i = 0; i < afterRefreshFlightSearchResultsLeaving.length; i++) {
      final segments = afterRefreshFlightSearchResultsLeaving[i]
          .legs![0]
          .alternativeLegs![0]
          .segments!;

      for (var segment in segments) {
        final airportName = segment.arrivalAirport!.cityName;
        final airportCode = segment.arrivalAirport!.code;
        final airportsToRemove = ['$firstCityCode', '$secondCityCode'];
        if (airportName != null && uniqueAirportLeaving.add(airportName)) {
          airportListLeaving.add({'name': airportName, 'code': airportCode});
        }
        airportListLeaving.removeWhere((airport) {
          return airportsToRemove.contains(airport['code']);
        });
        // Do something with airportName
      }
    }

    if (searchTypeValue != 'tek') {
      for (int i = 0; i < mainNotChangeReturnList.length; i++) {
        final segments =
            mainNotChangeReturnList[i].legs![0].alternativeLegs![0].segments!;

        for (var segment in segments) {
          final airportName = segment.arrivalAirport!.cityName;
          final airportCode = segment.arrivalAirport!.code;
          final airportsToRemove = ['$firstCityCode', '$secondCityCode'];
          if (airportName != null && uniqueAirportReturn.add(airportName)) {
            airportListReturn.add({'name': airportName, 'code': airportCode});
          }
          airportListReturn.removeWhere((airport) {
            return airportsToRemove.contains(airport['code']);
          });
          // Do something with airportName
        }
      }
    }

    print('airportListReturn: $airportListReturn');
    print('airportListReturn length: ${airportListReturn.length}');
  }

  void checkboxAirportNameAndLogo(
      {required String portCode, required bool value}) {
    if (value) {
      if (!selectedAirportListLeaving.contains(portCode)) {
        selectedAirportListLeaving.add(portCode);
      }
    } else {
      selectedAirportListLeaving.remove(portCode);
    }

    selectedAirportMapLeaving[portCode] = value;

    if (searchTypeValue != 'tek') {
      if (value) {
        if (!selectedAirportListReturn.contains(portCode)) {
          selectedAirportListReturn.add(portCode);
        }
      } else {
        selectedAirportListReturn.remove(portCode);
      }

      selectedAirportMapReturn[portCode] = value;
    }
    print('Selected lines: $selectedAirportMapReturn');
    emit(AirportsFilterState());
  }

  bool isSelectedAirportLeaving(String portCode) {
    return selectedAirportMapLeaving[portCode] ?? false;
  }

  bool isSelectedAirportReturn(String portCode) {
    return selectedAirportMapReturn[portCode] ?? false;
  }

  void filterAirports() {
    listFilterAirportLeaving =
        originalFlightSearchResultsLeaving.where((airportResult) {
      return selectedAirportListLeaving.contains(airportResult
          .legs![0].alternativeLegs![0].segments![0].arrivalAirport!.code);
    }).toList();

    if (searchTypeValue != 'tek') {
      listFilterAirportReturn =
          originalFlightSearchResultsReturn.where((airportResult) {
        return selectedAirportListReturn.contains(airportResult
            .legs![0].alternativeLegs![0].segments![0].arrivalAirport!.code);
      }).toList();
    }

    print('Filtered listFilterAirportReturn:');
    for (var airline in listFilterAirportReturn!) {
      print(
          'code: ${airline.legs![0].alternativeLegs![0].segments![0].arrivalAirport!.code} ');
    }
  }

  //---------------------------------------------------------------------------

  //---------------------------cabin Type------------------------------------
  dynamic cabinTypeListLeaving = [];
  List<int> selectedCabinTypeListLeaving = [];
  Map<int, bool> selectedCabinTypeMapLeaving = {};
  List<AirResult>? listFilterCabinTypeLeaving = [];

  dynamic cabinTypeListReturn = [];
  List<int> selectedCabinTypeListReturn = [];
  Map<int, bool> selectedCabinTypeMapReturn = {};
  List<AirResult>? listFilterCabinTypeReturn = [];

  void getCabinType() {
    cabinTypeListLeaving = [];
    cabinTypeListReturn = [];

    final Set<int> uniqueCabinTypeLeaving = {};
    final Set<int> uniqueCabinTypeReturn = {};

    for (int i = 0; i < afterRefreshFlightSearchResultsLeaving.length; i++) {
      final cabinTypeName = afterRefreshFlightSearchResultsLeaving[i]
          .fares![0]
          .fareAlternativeLegs![0]
          .fareSegments![0]
          .cabinType;

      if (cabinTypeName != null && uniqueCabinTypeLeaving.add(cabinTypeName)) {
        cabinTypeListLeaving.add({
          'type': cabinTypeName,
        });
      }
    }
    if (searchTypeValue != 'tek') {
      for (int i = 0; i < mainNotChangeReturnList.length; i++) {
        final cabinTypeName = mainNotChangeReturnList[i]
            .fares![0]
            .fareAlternativeLegs![0]
            .fareSegments![0]
            .cabinType;

        if (cabinTypeName != null && uniqueCabinTypeReturn.add(cabinTypeName)) {
          cabinTypeListReturn.add({
            'type': cabinTypeName,
          });
        }
      }
    }

    print('lineListLeaving: $cabinTypeListReturn');
    print('lineListLeaving length: ${cabinTypeListReturn.length}');
  }

  void checkboxCabinType({required int cabinType, required bool value}) {
    if (value) {
      if (!selectedCabinTypeListLeaving.contains(cabinType)) {
        selectedCabinTypeListLeaving.add(cabinType);
      }
    } else {
      selectedCabinTypeListLeaving.remove(cabinType);
    }

    selectedCabinTypeMapLeaving[cabinType] = value;
    print('Selected lines: $selectedCabinTypeMapLeaving');

    if (searchTypeValue != 'tek') {
      if (value) {
        if (!selectedCabinTypeListReturn.contains(cabinType)) {
          selectedCabinTypeListReturn.add(cabinType);
        }
      } else {
        selectedCabinTypeListReturn.remove(cabinType);
      }

      selectedCabinTypeMapReturn[cabinType] = value;
      print('Selected lines: $selectedCabinTypeMapReturn');
    }
    emit(CabinTypeFilterState());
  }

  bool isSelectedCabinTypeLeaving(int cabinType) {
    return selectedCabinTypeMapLeaving[cabinType] ?? false;
  }

  bool isSelectedCabinTypeReturn(int cabinType) {
    return selectedCabinTypeMapReturn[cabinType] ?? false;
  }

  void filterCabinType() {
    listFilterCabinTypeLeaving =
        originalFlightSearchResultsLeaving.where((cabinTypeResult) {
      return selectedCabinTypeListLeaving.contains(cabinTypeResult
          .fares![0].fareAlternativeLegs![0].fareSegments![0].cabinType);
    }).toList();

    if (searchTypeValue != 'tek') {
      listFilterCabinTypeReturn =
          originalFlightSearchResultsReturn.where((cabinTypeResult) {
        return selectedCabinTypeListReturn.contains(cabinTypeResult
            .fares![0].fareAlternativeLegs![0].fareSegments![0].cabinType);
      }).toList();
    }

    print('Filtered flightSearchResultsReturn:');
    for (var airline in afterRefreshFlightSearchResultsReturn) {
      print(
          'type: ${airline..fares![0].fareAlternativeLegs![0].fareSegments![0].cabinType},');
    }
  }

  //---------------------------------------------------------------------------
  void clearAll({required String type}) {
    if (type == 'airline') {
      if (searchTypeForListInFilter == 'tek') {
        selectedAirlineMapLeaving.clear();
        selectedAirlinListLeaving.clear();
        listFilterAirlineLeaving!.clear();
      } else {
        selectedAirlineMapReturn.clear();
        selectedAirlinListReturn.clear();
        listFilterAirlineReturn!.clear();
      }
    } else if (type == 'luggage') {
      if (searchTypeForListInFilter == 'tek') {
        selectedLuggagesMapLeaving.clear();
        listFilterLuggagesTypesLeaving!.clear();
        selectedLuggagesListLeaving.clear();
      } else {
        selectedLuggagesMapReturn.clear();
        listFilterLuggagesTypesReturn!.clear();
        selectedLuggagesListReturn.clear();
      }
    } else if (type == 'flightProvider') {
      if (searchTypeForListInFilter == 'tek') {
        selectedFlightProviderMapLeaving.clear();
        listFilterFlightProviderLeaving!.clear();
        selectedFlightProviderListLeaving.clear();
      } else {
        selectedFlightProviderMapReturn.clear();
        listFilterFlightProviderReturn!.clear();
        selectedFlightProviderListReturn.clear();
      }
    } else if (type == 'price') {
      if (searchTypeForListInFilter == 'tek') {
        listFilterPriceLeaving!.clear();
      } else {
        listFilterPriceReturn!.clear();
      }
      highestPriceInFilter = 0;
      lowestPriceInFilter = 0;
    } else if (type == 'time') {
      if (searchTypeForListInFilter == 'tek') {
        listFilterTimeLeaving!.clear();
      } else {
        listFilterTimeReturn!.clear();
      }
      flyingFirstHourInFilter = null;
      flyingSecondHourInFilter = null;
    } else if (type == 'duration') {
      if (searchTypeForListInFilter == 'tek') {
        listFilterDurationsLeaving.clear();
      } else {
        listFilterDurationsReturn.clear();
      }
      flyingDurationFirstInFilter = null;
    } else if (type == 'port') {
      if (searchTypeForListInFilter == 'tek') {
        selectedAirportMapLeaving.clear();
        selectedAirportListLeaving.clear();
        listFilterAirportLeaving!.clear();
      } else {
        selectedAirportMapReturn.clear();
        selectedAirportListReturn.clear();
        listFilterAirportReturn!.clear();
      }
    } else if (type == 'cabinType') {
      if (searchTypeForListInFilter == 'tek') {
        selectedCabinTypeMapLeaving.clear();
        selectedCabinTypeListLeaving.clear();
        listFilterCabinTypeLeaving!.clear();
      } else {
        selectedCabinTypeMapReturn.clear();
        selectedCabinTypeListReturn.clear();
        listFilterCabinTypeReturn!.clear();
      }
    } else {
      print('0000000000000000000000000000000000555');
      selectedAirlineMapLeaving.updateAll((key, value) => false);
      selectedAirlinListLeaving.clear();
      listFilterAirlineLeaving!.clear();

      selectedLuggagesMapLeaving.updateAll((key, value) => false);
      listFilterLuggagesTypesLeaving!.clear();
      selectedLuggagesListLeaving.clear();

      selectedFlightProviderMapLeaving.updateAll((key, value) => false);
      listFilterFlightProviderLeaving!.clear();
      selectedFlightProviderListLeaving.clear();

      selectedAirportMapLeaving.updateAll((key, value) => false);
      selectedAirportListLeaving.clear();
      listFilterAirportLeaving!.clear();

      selectedCabinTypeMapLeaving.updateAll((key, value) => false);
      selectedCabinTypeListLeaving.clear();
      listFilterCabinTypeLeaving!.clear();

      listFilterPriceLeaving!.clear();
      listFilterTimeLeaving!.clear();

      selectedAirlineMapReturn.updateAll((key, value) => false);
      selectedAirlinListReturn.clear();
      listFilterAirlineReturn!.clear();

      selectedLuggagesMapReturn.updateAll((key, value) => false);
      listFilterLuggagesTypesReturn!.clear();
      selectedLuggagesListReturn.clear();

      selectedFlightProviderMapReturn.updateAll((key, value) => false);
      listFilterFlightProviderReturn!.clear();
      selectedFlightProviderListReturn.clear();

      selectedAirportMapReturn.updateAll((key, value) => false);
      selectedAirportListReturn.clear();
      listFilterAirportReturn!.clear();

      selectedCabinTypeMapReturn.updateAll((key, value) => false);
      selectedCabinTypeListReturn.clear();
      listFilterCabinTypeReturn!.clear();

      listFilterPriceReturn!.clear();
      listFilterTimeReturn!.clear();

      highestPriceInFilter = 0;
      lowestPriceInFilter = 0;
      flyingFirstHourInFilter = null;
      flyingSecondHourInFilter = null;

      listFilterDurationsLeaving.clear();
      listFilterDurationsReturn.clear();
      flyingDurationFirstInFilter = null;
    }

    emit(ClearAllFilterState());
  }

  String searchTypeForListInFilter = 'tek';
  void searchLeavingOrReturnListFunction({required String searchType}) {
    if (searchType == 'tek') {
      searchTypeForListInFilter = 'tek';
    } else if (searchType == 'cok') {
      searchTypeForListInFilter = 'cok';
    } else {
      searchTypeForListInFilter = 'donus';
    }

    print(" searchTypeForListInFilter: $searchTypeForListInFilter");
    emit(SearchLeavingOrReturnListFunction());
  }

  //int i = 1;
  void resultApplyForLeaving(BuildContext context) {
    List<List<AirResult>?> lists = [
      listFilterPriceLeaving,
      listFilterTimeLeaving,
      listFilterDurationsLeaving,
      listFilterAirlineLeaving,
      listFilterLuggagesTypesLeaving,
      listFilterFlightProviderLeaving,
      listFilterAirportLeaving,
      listFilterCabinTypeLeaving,
    ];
    List<AirResult> commonList = [];
    List<List<AirResult>> nonEmptyLists = lists
        .where((list) => list != null && list.isNotEmpty)
        .map((list) => list!)
        .toList();

    if (nonEmptyLists.isNotEmpty) {
      Set<AirResult> referenceSet = nonEmptyLists.first.toSet();

      commonList = nonEmptyLists.skip(1).fold(referenceSet, (prevSet, list) {
        return prevSet.intersection(list.toSet());
      }).toList();

      // commonList = nonEmptyLists.skip(1).fold(nonEmptyLists.first.toSet(),
      //     (prevSet, list) {
      //   return prevSet.intersection(list.toSet());
      // }).toList();
    }
    if (commonList.isEmpty) {
      afterRefreshFlightSearchResultsLeaving = mainNotChangeLeavingList;
      selectedAirlineMapLeaving.updateAll((key, value) => false);
      selectedLuggagesMapLeaving.updateAll((key, value) => false);
      selectedFlightProviderMapLeaving.updateAll((key, value) => false);
      selectedAirportMapLeaving.updateAll((key, value) => false);
      selectedCabinTypeMapLeaving.updateAll((key, value) => false);
      selectedAirlinListLeaving = [];
      listFilterAirlineLeaving = [];
      selectedFlightProviderListLeaving = [];
      listFilterFlightProviderLeaving = [];
      listFilterLuggagesTypesLeaving != [];
      selectedLuggagesListLeaving = [];
      selectedAirportListLeaving = [];
      listFilterAirportLeaving != [];
      selectedCabinTypeListLeaving = [];
      listFilterCabinTypeLeaving != [];
      listFilterPriceLeaving != [];
      listFilterTimeLeaving != [];
      listFilterDurationsLeaving != [];
      flyingDurationFirstInFilter = null;
      highestPriceInFilter = 0;
      lowestPriceInFilter = 0;
      flyingFirstHourInFilter = null;
      flyingSecondHourInFilter = null;
      // SnackbarUtils.showSnackbar(
      //     context,
      //     'filterleme göre uçuş bulunamadı filterleme sıfırlandı...111111111',
      //     2);
      // print('filterleme göre uçuş bulunamadı filterleme sıfırlandı...');
    } else {
      afterRefreshFlightSearchResultsLeaving = commonList;
    }

    bool allListsAreEmpty = lists.every((list) => list == null || list.isEmpty);

    if (allListsAreEmpty) {
      print('------------------------------------------------');

      afterRefreshFlightSearchResultsLeaving = mainNotChangeLeavingList;
      // SnackbarUtils.showSnackbar(
      //     context, '2222222222222222222222222222222222', 2);

      print(mainNotChangeLeavingList.length);
    } else {
      print('Not all lists are empty.');
    }

    emit(ApplyFilterState());
  }

  List<AirResult> mainNotChangeReturnList = [];
  void saveReturnList() {
    mainNotChangeReturnList = [];
    mainNotChangeReturnList = afterRefreshFlightSearchResultsReturn;
    // print('list.length: ${mainNotChangeReturnList.length}');
  }

  void resultApplyForReturn(BuildContext context) {
    print(afterRefreshFlightSearchResultsReturn.length);
    print('--------------------list----------------------');
    print(mainNotChangeReturnList.length);
    List<List<AirResult>?> lists = [
      listFilterPriceReturn,
      listFilterTimeReturn,
      listFilterDurationsReturn,
      listFilterAirlineReturn,
      listFilterLuggagesTypesReturn,
      listFilterFlightProviderReturn,
      listFilterAirportReturn,
      listFilterCabinTypeReturn,
    ];
    List<AirResult> commonList = [];
    List<List<AirResult>> nonEmptyLists = lists
        .where((list) => list != null && list.isNotEmpty)
        .map((list) => list!)
        .toList();

    if (nonEmptyLists.isNotEmpty) {
      Set<AirResult> referenceSet = nonEmptyLists.first.toSet();

      commonList = nonEmptyLists.skip(1).fold(referenceSet, (prevSet, list) {
        return prevSet.intersection(list.toSet());
      }).toList();

      // commonList = nonEmptyLists.skip(1).fold(nonEmptyLists.first.toSet(),
      //     (prevSet, list) {
      //   return prevSet.intersection(list.toSet());
      // }).toList();
    }
    if (commonList.isEmpty) {
      afterRefreshFlightSearchResultsReturn = mainNotChangeReturnList;
      selectedAirlineMapReturn.updateAll((key, value) => false);
      selectedLuggagesMapReturn.updateAll((key, value) => false);
      selectedFlightProviderMapReturn.updateAll((key, value) => false);
      selectedAirportMapReturn.updateAll((key, value) => false);
      selectedCabinTypeMapReturn.updateAll((key, value) => false);
      selectedAirlinListReturn = [];
      listFilterAirlineReturn = [];
      selectedFlightProviderListReturn = [];
      listFilterFlightProviderReturn = [];
      listFilterLuggagesTypesReturn = [];
      selectedLuggagesListReturn = [];
      selectedAirportListReturn = [];
      listFilterAirportReturn = [];
      selectedCabinTypeListReturn = [];
      listFilterCabinTypeReturn = [];
      listFilterPriceReturn = [];
      listFilterTimeReturn = [];
      listFilterDurationsReturn = [];

      flyingDurationFirstInFilter = null;
      highestPriceInFilter = 0;
      lowestPriceInFilter = 0;
      flyingFirstHourInFilter = null;
      flyingSecondHourInFilter = null;
      // SnackbarUtils.showSnackbar(
      //     context,
      //     'filterleme göre uçuş bulunamadı filterleme sıfırlandı...22222222222',
      //     2);
      // print('filterleme göre uçuş bulunamadı filterleme sıfırlandı...');
    } else {
      afterRefreshFlightSearchResultsReturn = commonList;
    }

    bool allListsAreEmpty = lists.every((list) => list == null || list.isEmpty);

    if (allListsAreEmpty) {
      print('------------------------------------------------');
      afterRefreshFlightSearchResultsReturn = mainNotChangeReturnList;

      print(mainNotChangeReturnList.length);
      print(afterRefreshFlightSearchResultsReturn.length);
    } else {}

    emit(ApplyFilterState());
  }

  //-------------------------------Stop-----------------------------------------------

  double? priceValue;
  String? currencyCodeForOneValue;
  void priceValueFunction(
      {required double value, required String currencyCodeForOne}) {
    priceValue = value;
    currencyCodeForOneValue = currencyCodeForOne;
  }

  String? selectedFlightFirstLiter;

  void selectedFlightFirstLiterFunction({required String? value}) {
    selectedFlightFirstLiter = value;
  }

  // Future<void> forTestLast({
  //   required String arrivalDateValue,
  //   required String departureDateValue,
  //   required List<String> flightNoValue,
  //   required List<String> flightCodeValue,
  //   required AirResult result,
  // }) async {
  //   for (var item in flightSearchResultReturnP) {
  //     var flightDetails = item.legs![0].alternativeLegs![0].segments!;
  //     List<String> flightNo = [];
  //     List<String> flightCode = [];

  //     for (var segment in flightDetails) {
  //       flightNo.add(segment.flightNo!);
  //       flightCode.add(segment.ticketingAirline!.code!);
  //     }
  //     bool isDuplicate =
  //         item.legs![0].alternativeLegs![0].segments!.last.arrivalDate ==
  //                 arrivalDateValue &&
  //             item.legs![0].alternativeLegs![0].segments!.first.departureDate ==
  //                 departureDateValue &&
  //             listEquals(flightNo, flightNoValue) &&
  //             listEquals(flightCode, flightCodeValue);

  //     if (isDuplicate) {
  //       for (var segment in item.legs!.last.alternativeLegs!) {
  //         //  firstLeg.add(segment);
  //         afterRefreshFlightSearchResultsReturn.add(
  //           AirResult(
  //             data: item.data,
  //             fares: item.fares,
  //             groupId: item.groupId,
  //             isCharter: item.isCharter,
  //             legs: [
  //               AirLeg(
  //                 alternativeLegs: [segment],
  //                 searchLeg: item.legs!.first.searchLeg!,
  //               ),
  //             ],
  //             providerCode: item.providerCode,
  //             resultRef: item.resultRef,
  //           ),
  //         );
  //       }

  //       print(afterRefreshFlightSearchResultsReturn.length);
  //     }
  //   }
  // }

  Future<void> forTestLast({
    required String arrivalDateValue,
    required String departureDateValue,
    required List<String> flightNoValue,
    required List<String> flightCodeValue,
    required List<String> flightClassCode,
    required AirResult result,
  }) async {
    for (var item in flightSearchResultsMainList!.first.results!) {
      var flightDetails = item.legs![0].alternativeLegs![0].segments!;
      var classCodeDetails =
          result.fares!.first.fareAlternativeLegs!.first.fareSegments;
      List<String> flightNo = [];
      List<String> flightCode = [];

      List<String> classCode = [];

      for (var segment in flightDetails) {
        flightNo.add(segment.flightNo!);
        flightCode.add(segment.ticketingAirline!.code!);
      }
      for (var code in classCodeDetails!) {
        classCode.add(code.classCode!);
      }
      bool isDuplicate =
          item.legs![0].alternativeLegs![0].segments!.last.arrivalDate ==
                  arrivalDateValue &&
              item.legs![0].alternativeLegs![0].segments!.first.departureDate ==
                  departureDateValue &&
              listEquals(flightNo, flightNoValue) &&
              listEquals(flightCode, flightCodeValue) &&
              listEquals(classCode, flightClassCode);

      if (isDuplicate) {
        for (var segment in item.legs!.last.alternativeLegs!) {
          //  firstLeg.add(segment);
          afterRefreshFlightSearchResultsReturn.add(
            AirResult(
              data: item.data,
              fares: item.fares,
              groupId: 'p',
              isCharter: item.isCharter,
              legs: [
                AirLeg(
                  alternativeLegs: [segment],
                  searchLeg: item.legs!.first.searchLeg!,
                ),
              ],
              providerCode: item.providerCode,
              resultRef: item.resultRef,
            ),
          );
        }

        print(afterRefreshFlightSearchResultsReturn.length);
      }
    }
  }

  String? saveAlternativeRefforLeaving;
  String? saveAlternativeRefforReturn;

  saveFunctionForAlternativeRefLeaving({
    required String leaving,
  }) {
    saveAlternativeRefforLeaving = leaving;
  }

  saveFunctionForAlternativeRefReturn({
    required String returning,
  }) {
    saveAlternativeRefforReturn = returning;
  }

  void lastState({
    required String arrivalDateValue,
    required String departureDateValue,
    required List<String> flightNoValue,
    required List<String> flightCodeValue,
    required List<String> flightClassCode,
    required AirResult result,
    required BuildContext context,
  }) {
    afterRefreshFlightSearchResultsReturn = [];
    // print('------------------------------------------------');
    // print('selectedFlightFirstLiter: $selectedFlightFirstLiter');
    // print('result.groupId: ${result.groupId}');
    // print('------------------------------------------------');

    // print('arrivalDateValue: $arrivalDateValue');
    // print('departureDateValue: $departureDateValue');
    // print('flightNoValue: $flightNoValue');
    // print('result.groupId: ${result.groupId}');

    if (selectedFlightFirstLiter != null &&
        selectedFlightFirstLiter!.isNotEmpty) {
      List<AirResult> newResults = [];

      if (selectedFlightFirstLiter! == result.groupId &&
          selectedFlightFirstLiter!.length > 5) {
        print(
            '*************************************************************************************');
        print('Checking item with groupId: ${result.groupId}');
        for (var item in flightSearchResultsMainList!.last.results!) {
          print('Checking item with groupId: ${item.groupId}');

          if (item.groupId?.length != result.groupId?.length) {
            // حذف أول حرف من result.groupId إذا كان الطول مختلفًا
            String modifiedGroupId = result.groupId!.substring(1);

            // مقارنة groupId بعد تعديل result.groupId
            if (item.groupId == modifiedGroupId) {
              print(
                  'Adding item with modified groupId: ${item.groupId} to newResults');
              newResults.add(
                AirResult(
                  data: item.data,
                  fares: item.fares,
                  groupId: item.groupId,
                  isCharter: null,
                  legs: item.legs,
                  providerCode: item.providerCode,
                  resultRef: item.resultRef,
                ),
              );
            }
          } else {
            // إذا كان الطول متساويًا، قم بمقارنة مباشرة
            if (item.groupId == result.groupId) {
              print('Adding item with groupId: ${item.groupId} to newResults');
              newResults.add(
                AirResult(
                  data: item.data,
                  fares: item.fares,
                  groupId: item.groupId,
                  isCharter: null,
                  legs: item.legs,
                  providerCode: item.providerCode,
                  resultRef: item.resultRef,
                ),
              );
            }
          }
        }
        afterRefreshFlightSearchResultsReturn.addAll(newResults);
      } else if (selectedFlightFirstLiter! == 'sp') {
        // print(
        //     'spspspspspspsspspspspsppspspspspspspspspspssppspspspspspsppspspspspspspsppspspspspspspspspspspspspsppspspsps');
        for (var item in flightSearchResultsMainList!.last.results!) {
          print('Checking item with groupId: ${item.groupId}');
          if (item.groupId == null) {
            print('Adding item with groupId: ${item.groupId} to newResults');
            newResults.add(
              AirResult(
                data: item.data,
                fares: item.fares,
                groupId: 's',
                isCharter: null,
                legs: item.legs,
                providerCode: item.providerCode,
                resultRef: item.resultRef,
              ),
            );
          }
        }
        afterRefreshFlightSearchResultsReturn.addAll(newResults);
      } else if (selectedFlightFirstLiter![0] == 'p') {
        print(
            'PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP');
        forTestLast(
          arrivalDateValue: arrivalDateValue,
          departureDateValue: departureDateValue,
          flightNoValue: flightNoValue,
          flightCodeValue: flightCodeValue,
          flightClassCode: flightClassCode,
          result: result,
        );
      } else if (selectedFlightFirstLiter![0] == 'F') {
        print(
            'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');
        for (var item in flightSearchResultsMainList!.last.results!) {
          print('Checking item with groupId: ${item.groupId}');

          afterRefreshFlightSearchResultsReturn.add(
            AirResult(
              data: item.data,
              fares: item.fares,
              groupId: 's${item.groupId}',
              isCharter: null,
              legs: item.legs,
              providerCode: item.providerCode,
              resultRef: item.resultRef,
            ),
          );
        }

        forTestLast(
          arrivalDateValue: arrivalDateValue,
          departureDateValue: departureDateValue,
          flightNoValue: flightNoValue,
          flightCodeValue: flightCodeValue,
          flightClassCode: flightClassCode,
          result: result,
        );
        print('onemli.length: ${afterRefreshFlightSearchResultsReturn.length}');
      }
    }
    sortPriceLessToHighFunc(context, isPackage: true);
  }

  List<Booking> filteredReservations = [];

  bool isReservationFilter = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  TextEditingController systemPNRController = TextEditingController();
  String? firstNameReservation;
  String? lastNameReservation;
  String? systemPNRReservation;
  BookingStatusType? bookingStatusTypeReservation;
  void reservationFilterFunction() {
    filteredReservations = [];

    for (int i = 0; i < getReservationsList.length; i++) {
      final reservationNumber = getReservationsList[i].systemPnr;
      final firstName = getReservationsList[i].contactInfo?.firstName;
      final lastName = getReservationsList[i].contactInfo?.lastName;
      final bookingStatusType = getReservationsList[i].bookingStatusType;

      bool matchesFirstName =
          firstNameReservation == null || firstNameReservation!.isEmpty
              ? true
              : firstName!
                  .toLowerCase()
                  .contains(firstNameReservation!.toLowerCase());

      bool matchesLastName =
          lastNameReservation == null || lastNameReservation!.isEmpty
              ? true
              : lastName!
                  .toLowerCase()
                  .contains(lastNameReservation!.toLowerCase());

      bool matchesSystemPNR =
          systemPNRReservation == null || systemPNRReservation!.isEmpty
              ? true
              : reservationNumber!.startsWith(systemPNRReservation!) ||
                  reservationNumber == systemPNRReservation;

      for (var element in reservationsTypeList) {
        bool isReservationActive =
            element[0] == bookingStatusType && element[1] == true;
        print('element: $element');
        print('isReservationActive: $isReservationActive');
        if (matchesFirstName &&
            matchesLastName &&
            matchesSystemPNR &&
            isReservationActive) {
          filteredReservations.add(getReservationsList[i]);
          isReservationFilter = true;
          print('filteredReservations: ${getReservationsList[i].systemPnr}');
        }
      }
    }

    print('filteredReservations: ${filteredReservations.length}');
    emit(GetReservationsSuccess());
    getReservationsList = [];
    getReservationsList.addAll(filteredReservations);
  }

  void reservationSortFunction({required int value}) {
    if (value == 0) {
      //işlem tarihi
      getReservationsList.sort((a, b) {
        DateTime dateA = DateTime.parse(a.bookingDate!);
        DateTime dateB = DateTime.parse(b.bookingDate!);
        return dateA.compareTo(dateB); // ترتيب تصاعدي
        //dateB.compareTo(dateA);
      });
    } else if (value == 1) {
      //oluşturma tarihi
      getReservationsList.sort((a, b) {
        // التحقق من إذا كانت collectionList هي null أو فارغة
        var collectionListA = a.amount?.collectionList;
        var collectionListB = b.amount?.collectionList;

        // إذا كانت collectionList غير فارغة، نحاول الوصول إلى CreatedAt
        DateTime dateA = (collectionListA != null && collectionListA.isNotEmpty)
            ? DateTime.parse(collectionListA.first["CreatedAt"].toString())
            : DateTime.parse(
                a.bookingDate!); // إذا كانت null، استخدم bookingDate

        DateTime dateB = (collectionListB != null && collectionListB.isNotEmpty)
            ? DateTime.parse(collectionListB.first["CreatedAt"].toString())
            : DateTime.parse(
                b.bookingDate!); // إذا كانت null، استخدم bookingDate

        return dateA.compareTo(dateB); // ترتيب تصاعدي
      });
    } else if (value == 2) {
      //kalkış tarihi
      getReservationsList.sort((a, b) {
        DateTime dateA = DateTime.parse(
            a.flightBookingList!.first.legs!.first.departureDate!);
        DateTime dateB = DateTime.parse(
            b.flightBookingList!.first.legs!.first.departureDate!);
        return dateA.compareTo(dateB); // ترتيب تصاعدي
        //dateB.compareTo(dateA);
      });
    } else if (value == 3) {
      //kalkış tarihi
      getReservationsList.sort((a, b) {
        DateTime? dateA =
            a.expirationDate != null ? DateTime.parse(a.expirationDate!) : null;
        DateTime? dateB =
            b.expirationDate != null ? DateTime.parse(b.expirationDate!) : null;

        // إذا كان أحد التاريخين هو null، نضعه في النهاية
        if (dateA == null && dateB == null) {
          return 0; // إذا كان كلا التاريخين null، يبقيهما في نفس المكان
        } else if (dateA == null) {
          return 1; // إذا كان dateA null، نضعه في النهاية
        } else if (dateB == null) {
          return -1; // إذا كان dateB null، نضعه في النهاية
        } else {
          return dateA.compareTo(dateB); // ترتيب تصاعدي
        }
      });
    }
    emit(GetReservationsSuccess());
  }

  ///---------------------------------------------------
// dynamic selectedReservationsStatusdynamic ;
//   List<String> selectedReservationsStatus = [];
  // Map<BookingStatusType, bool> isChecked = {};
  // List<Booking> filteredList = [];

  // void filterList() {
  //   filteredList = List.from(getReservationsList);
  //   if (isChecked.values.every((element) => element == false)) {
  //     filteredList = List.from(getReservationsList);
  //   } else {
  //     filteredList =
  //         getReservationsList.where((item) => isChecked[item] == true).toList();
  //   }
  // }

  PaymentType? selectedPaymentTypeForReservation;

  void selectPaymentTypeInReservation({required PaymentType value}) {
    selectedPaymentTypeForReservation = value;
    emit(SelectPaymentTypeInReservation());
  }

  // List<PaymentOption>? paymentOptionListForReservation = [];
  // List<PaymentGroup> creditCardOptionsForReservation = [];
  // String? bookItemIdForReservation;
  // Future<PaymentResult> getPaymentOptionsForReservation(
  //     PaymentOptionRequestJson request) async {
  //   emit(FlightPaymentOptionsLoading());

  //   paymentOptionListForReservation = [];
  //   creditCardOptionsForReservation = [];
  //  // getAllBinCodesListForResrevation = [];
  //   bookItemIdForReservation = null;
  //  // binCodeIsHereReservation = null;
  //   String url =
  //       '$apiBaseUrl/GetPaymentOptions'; // API'nin doğru URL'sini buraya ekleyin
  //   final requestJson = jsonEncode(request.toJson());
  //   print("requestJson for getPaymentOptions:::::$requestJson");

  //   try {
  //     final response = await _dio.post(url, data: requestJson);
  //     final responseData = response.data;
  //     print(
  //         "responseData for getPaymentOptions:::::::${json.encode(responseData)}");

  //     if (responseData != null) {
  //       print("JSON'u Payment'a çevirme...");

  //       try {
  //         final result = PaymentResult.fromJson(responseData);

  //         if (result.result != null) {
  //           paymentOptionListForReservation =
  //               result.result!.first.paymentOptions;
  //           for (int i = 0; i < paymentOptionListForReservation!.length; i++) {
  //             if (paymentOptionListForReservation![i].paymentType ==
  //                 PaymentType.customerCreditCard) {
  //               creditCardOptionsForReservation =
  //                   paymentOptionListForReservation![i].paymentGroups!;
  //               bool found = false;

  //               for (var itemList in creditCardOptionsForReservation) {
  //                 for (var element in itemList.paymentGroupItem!) {
  //                   if (element.isDefaultPaymentItem == true) {
  //                     bookItemIdForReservation = element.paymentItemId;
  //                     found = true;
  //                     break;
  //                   }
  //                 }
  //                 if (found) {
  //                   break;
  //                 }
  //               }
  //               for (var itemList in creditCardOptionsForReservation) {
  //                 getAllBinCodesListForResrevation.add(itemList.binCodes!);
  //               }
  //             }
  //           }
  //           emit(FlightPaymentOptionsSuccess());
  //           return result;
  //         } else {
  //           errorMassage = result.errorMessage;
  //           errorCode = result.errorCode;
  //           emit(FlightPaymentOptionsFailure(
  //               errorMassage: errorMassage!, errorCode: errorCode!));
  //           return result;
  //         }
  //       } catch (e) {
  //         emit(FlightPaymentOptionsFailure(
  //             errorMassage: errorMassage!, errorCode: errorCode!));
  //         print(e);
  //         throw Exception(
  //             'Ödeme seçeneklerini işleme sırasında bir hata oluştu.');
  //       }
  //     } else {
  //       emit(FlightPaymentOptionsFailure(
  //           errorMassage: errorMassage!, errorCode: errorCode!));
  //       throw Exception('Ödeme seçeneklerini alma işlemi başarısız oldu.');
  //     }
  //   } catch (error) {
  //     emit(FlightPaymentOptionsFailure(
  //         errorMassage: errorMassage!, errorCode: errorCode!));
  //     print('Error in getPaymentOptions ::::: $error');
  //     throw Exception(
  //         'Ödeme seçeneklerini alma işlemi sırasında bir hata oluştu.');
  //   }
  // }

  // List<List<String>> getAllBinCodesListForResrevation = [];
  // int? binCodeIsHereReservation;
  // void searchInBinCodesForReservation({required String value}) {
  //   emit(SearchInBinCodesLoadingState());
  //   print('value: $value');
  //   print('state1: $state');
  //   // binCodeIsHereReservation = null;

  //   if (value.replaceAll(' ', '').length >= 6) {
  //     String firstSixDigits = value.replaceAll(' ', '').substring(0, 6);
  //     for (int i = 0; i < getAllBinCodesListForResrevation.length; i++) {
  //       if (getAllBinCodesListForResrevation[i].contains(firstSixDigits)) {
  //         binCodeIsHereReservation = i;

  //         print(state);
  //         emit(SearchInBinCodesSuccessState());
  //         print(state);
  //       } else {
  //         //binCodeIsHereReservation = null;
  //       }
  //     }
  //   }
  // }

  void checkboxBookingTypeForReservationAlertDialogWidget(
      {required int index, required bool value}) {
    reservationsTypeList[index].last = value;
    print('reservationsTypeList: $reservationsTypeList');
    emit(CheckboxBookingTypeForReservationAlertDialogWidgetState());
  }

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

  Future<Result> retrieveReservation(RetrieveReservationJson request) async {
    emit(RetrieveReservationAndReservationToTicketLoading());
    String url =
        '$apiBaseUrl/RetrieveReservation'; // API'nin doğru URL'sini buraya ekleyin
    final requestJson = jsonEncode(request.toJson());
    print("requestJson for getValidate:::::$requestJson");

    try {
      final response = await _dio.post(url, data: requestJson);
      final responseData = response.data;
      print("responseData for getValidate:::::::${json.encode(responseData)}");

      if (responseData != null) {
        print("JSON'u AirSearchResponse'a çevirme...");

        try {
          final result = Result.fromJson(responseData);
          if (result.result != null) {
            emit(RetrieveReservationAndReservationToTicketSuccess());
            return result;
          } else {
            errorMassage = result.errorMessage;
            errorCode = result.errorCode;
            emit(RetrieveReservationAndReservationToTicketFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
            return result;
          }
        } catch (e) {
          print(e);
          emit(RetrieveReservationAndReservationToTicketFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
          throw Exception('Doğrulama işleme sırasında bir hata oluştu.');
        }
      } else {
        emit(RetrieveReservationAndReservationToTicketFailure(
            errorMassage: errorMassage!, errorCode: errorCode!));
        throw Exception('Doğrulama işlemi başarısız oldu.');
      }
    } catch (error) {
      print('Error in getValidate ::::: $error');
      emit(RetrieveReservationAndReservationToTicketFailure(
          errorMassage: errorMassage!, errorCode: errorCode!));
      throw Exception('Doğrulama işlemi sırasında bir hata oluştu.');
    }
  }

  String? bookUrlResultReservation;

  bool? is3DPostRequiredReservation;
  Future<PaymentVerificationn> reservationToTicket(
      WrappedBookingRequest request) async {
    emit(RetrieveReservationAndReservationToTicketLoading());
    String url =
        '$apiBaseUrl/ReservationToTicket'; // API'nin doğru URL'sini buraya ekleyin
    final requestJson = jsonEncode(request.toJson());
    print("requestJson for getValidate:::::$requestJson");

    try {
      final response = await _dio.post(url, data: requestJson);
      final responseData = response.data;
      print("responseData :::::::${json.encode(responseData)}");

      if (responseData != null) {
        print("JSON'u AirSearchResponse'a çevirme...");

        try {
          final result = PaymentVerificationn.fromJson(responseData);
          if (result.result != null) {
            bookUrlResultReservation = result.result!.post3DPageUrl;

            is3DPostRequiredReservation = result.result!.is3DPostRequired;

            emit(RetrieveReservationAndReservationToTicketSuccess());
            return result;
          } else {
            errorMassage = result.errorMessage;
            errorCode = result.errorCode;
            emit(RetrieveReservationAndReservationToTicketFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
            return result;
          }
        } catch (e) {
          print(e);
          emit(RetrieveReservationAndReservationToTicketFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
          throw Exception('Doğrulama işleme sırasında bir hata oluştu.');
        }
      } else {
        emit(RetrieveReservationAndReservationToTicketFailure(
            errorMassage: errorMassage!, errorCode: errorCode!));
        throw Exception('Doğrulama işlemi başarısız oldu.');
      }
    } catch (error) {
      print('Error in getValidate ::::: $error');
      emit(RetrieveReservationAndReservationToTicketFailure(
          errorMassage: errorMassage!, errorCode: errorCode!));
      throw Exception('Doğrulama işlemi sırasında bir hata oluştu.');
    }
  }

  Booking? detailsForResultView;

  Future<void> getBookingDetails() async {
    emit(GetDetailsResultViewLoading());
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final requestData = {
      "request": {
        "TokenCode": getIt<CacheHelper>().getDataString(key: 'token'),
        "SystemPnr":
            pnrSystemForResultView ?? savedSystemPnrFromUrlForResultView,
        "LastName": lastNameForResultView,
      }
    };
    final requestJson = jsonEncode(requestData);
    print("requestJsonEncode: $requestJson");

    try {
      final response = await _dio.post(
        "$apiBaseUrl/Void",
        data: requestJson,
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode! >= 400) {
        throw Exception("An error occurred: ${response.data}");
      }

      final responseData = response.data;
      print("responseData: $responseData");

      final data = BookingResult.fromJson(responseData);

      print("Conversion Successful.");

      detailsForResultView = data.result!;

      print("detailsForResultView: ${data.result!.bookingDate ?? ""}");

      emit(GetDetailsResultViewSuccess());
      // Return an instance of GetCountriesResult
    } catch (e) {
      emit(GetDetailsResultViewFailure(
          errorCode: 'data.errorCode', errorMassage: 'data.errorMessage'));
      print('GetReservations Error: $e');
      throw Exception('Failed to get reservations: $e');
    }
  }

  //-----------------------------------multi point---------------------------------

  addOrRemoveDay({required int index, required bool isAddOneDay}) {
    if (isAddOneDay == false) {
      if (index > 0) {
        if (listMultiPoint[index].departureDate !=
            listMultiPoint[index - 1].departureDate) {
          listMultiPoint[currentListIndex].departureDate =
              listMultiPoint[currentListIndex]
                  .departureDate!
                  .subtract(const Duration(days: 1));
        }
      } else {
        print('DAteTime${DateTime.now()}');
        print(
            'departureDate: ${listMultiPoint[currentListIndex].departureDate}');

        // إزالة الوقت من DateTime.now()
        DateTime nowWithoutTime = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day);

        // إزالة الوقت من departureDate
        DateTime departureDateWithoutTime = DateTime(
            listMultiPoint[currentListIndex].departureDate!.year,
            listMultiPoint[currentListIndex].departureDate!.month,
            listMultiPoint[currentListIndex].departureDate!.day);

        // المقارنة بين التواريخ بدون الوقت
        if (!departureDateWithoutTime.isAtSameMomentAs(nowWithoutTime)) {
          listMultiPoint[currentListIndex].departureDate =
              listMultiPoint[currentListIndex]
                  .departureDate!
                  .subtract(const Duration(days: 1));
        }
      }
    } else {
      listMultiPoint[currentListIndex].departureDate =
          listMultiPoint[currentListIndex]
              .departureDate!
              .add(const Duration(days: 1));
    }
  }

  List<MultiPointModel> listMultiPoint = [
    MultiPointModel(
        departureCode: 'Kalkış Nortesi',
        departureCityName: 'Nereden',
        arrivalCode: 'Varış Nortesi',
        arrivalCityName: 'Nereye',
        departureDate: null // استخدم التاريخ الحالي كأمثلة
        ),
    MultiPointModel(
        departureCode: 'Kalkış Nortesi',
        departureCityName: 'Nereden',
        arrivalCode: 'Varış Nortesi',
        arrivalCityName: 'Nereye',
        departureDate: null), // مثال على تاريخ مختلف
  ];

  int? saveIndexForMultiPointSelectLegAndDateValue;
  void saveIndexForMultiPointSelectLegAndDateFunction({required int index}) {
    saveIndexForMultiPointSelectLegAndDateValue = index;
  }

  void toggleTextsForMultiPoint({required int index}) {
    listMultiPoint[index].turns += 1 / 2;
    String cityName;
    String code;
    cityName = listMultiPoint[index].departureCityName;
    code = listMultiPoint[index].departureCode;
    listMultiPoint[index].departureCityName =
        listMultiPoint[index].arrivalCityName;
    listMultiPoint[index].departureCode = listMultiPoint[index].arrivalCode;
    listMultiPoint[index].arrivalCityName = cityName;
    listMultiPoint[index].arrivalCode = code;

    emit(ToggleTextsState());
  }

  DateTime? selectDateTimeMultiPoint;
  void datePickerForMultiPoint({required int index}) {
    listMultiPoint[index].departureDate = selectDateTimeMultiPoint!;
    emit(DateRangePickerState());
  }

  int currentListIndex = 0;
  List<List<bool>> selectListIndexForMultiPointValue = [];
  List<AirResult> selectAirResultForMultiPointList = [];
  void removeCardFromSelectedMultiPointListFunction(
      int index, BuildContext context) {
    totalPriceMultiPoint = totalPriceMultiPoint -
        BlocProvider.of<CurrencyCodeCubit>(context).convertToAppCurrency(
            itemPrice: selectAirResultForMultiPointList
                .last.fares![0].totalPrice!.totalStrikeAmount,
            appCurrencyExchangeRate:
                BlocProvider.of<CurrencyCodeCubit>(context).currencyRate!,
            ticketCurrencyCode: selectAirResultForMultiPointList
                .last.fares![0].totalPrice!.currencyCode!);
    if (index >= 0 && index < selectAirResultForMultiPointList.length) {
      selectAirResultForMultiPointList.removeLast();
      // if (ll == true) {
      //   justList.removeLast();
      // }

      currentListIndex = selectAirResultForMultiPointList.length;
      for (int i = 0;
          i <
              selectListIndexForMultiPointValue[
                      selectAirResultForMultiPointList.length]
                  .length;
          i++) {
        selectListIndexForMultiPointValue[
            selectAirResultForMultiPointList.length][i] = false;
      }
      // print('savedFlightSearchResults: ${savedFlightSearchResults.length}');
      // print(
      //     'savedFlightSearchResults[currentListIndex]: ${savedFlightSearchResults[currentListIndex].length}');
      print('111------currentListIndex: $currentListIndex');
      if (currentListIndex == 0) {
        //    flightSearchResultForMultiPoints[currentListIndex].clear();
        print('savedFlightSearchResults: ${savedFlightSearchResults.length}');
        print(
            'savedFlightSearchResults[currentListIndex]: ${savedFlightSearchResults[0].length}');
        print('888888888888888888888888888888');
        flightSearchResultForMultiPoints[currentListIndex] =
            savedFlightSearchResults[currentListIndex];
      }
      print('222------currentListIndex: $currentListIndex');

      emit(RemoveCardFromSelectedMultiPointListState());
    } else {
      print('Invalid index: $index');
    }
  }

  void removeFareCardFromSelectedMultiPointListFunction(int index,
      {required dynamic price}) {
    print('+++++++++++++++----------------');
    totalPriceMultiPoint = totalPriceMultiPoint - price;
    if (index >= 0 &&
        index < flightFaresMultiPointSelectedForSeparated!.length) {
      flightFaresMultiPointSelectedForSeparated!.removeLast();
      // if (ll == true) {
      //   justList.removeLast();
      // }

      currentFareListIndex = flightFaresMultiPointSelectedForSeparated!.length;
      for (int i = 0;
          i <
              selectListFareIndexForMultiPointValue[
                      flightFaresMultiPointSelectedForSeparated!.length]
                  .length;
          i++) {
        selectListIndexForMultiPointValue[
            flightFaresMultiPointSelectedForSeparated!.length][i] = false;
      }
      // print('savedFlightSearchResults: ${savedFlightSearchResults.length}');
      // print(
      //     'savedFlightSearchResults[currentListIndex]: ${savedFlightSearchResults[currentListIndex].length}');
      // print('111------currentListIndex: $currentFareListIndex');
      // if (currentFareListIndex == 0) {
      //    flightSearchResultForMultiPoints[currentListIndex].clear();
      // print('savedFlightSearchResults: ${savedFlightSearchResults.length}');
      // print(
      //     'savedFlightSearchResults[currentListIndex]: ${savedFlightSearchResults[0].length}');
      // print('888888888888888888888888888888');
      // flightSearchResultForMultiPoints[currentFareListIndex] =
      //     savedFlightSearchResults[currentFareListIndex];
      // }
      // print('222------currentListIndex: $currentFareListIndex');
      totalPriceFareMultiPoint -= price;
      emit(RemoveCardFromSelectedMultiPointListState());
    } else {
      print('Invalid index: $index');
    }
  }

  int? saveIndexForMultiPointValue;
  bool? isSelectedCardValue;
  void saveIndexForMultiPointFunction(
      {required int index, bool? isSelectedCard}) {
    saveIndexForMultiPointValue = null;
    isSelectedCardValue = null;
    isSelectedCardValue = isSelectedCard;
    saveIndexForMultiPointValue = index;
  }

  void selectListIndexForMultiPointFunction(
      {required int index,
      required int howList,
      required bool isSelected,
      required AirResult airResult}) {
    if (selectListIndexForMultiPointValue[howList].contains(true)) {
      for (int i = 0;
          i < selectListIndexForMultiPointValue[howList].length;
          i++) {
        selectListIndexForMultiPointValue[howList][i] = false;
      }
    }

    selectListIndexForMultiPointValue[howList][index] = isSelected;

    currentListIndex = (currentListIndex + 1) % listMultiPoint.length;
    selectAirResultForMultiPointList.add(airResult);
    emit(SelectListIndexForMultiPointState());
  }

  double totalPriceFareMultiPoint = 0.0;
  int currentFareListIndex = 0;
  List<List<bool>> selectListFareIndexForMultiPointValue = [];
  void selectListFareIndexForMultiPointFunction(
      {required int index,
      required int howList,
      required bool isSelected,
      required double price,
      required AirResult airResult}) {
    if (selectListFareIndexForMultiPointValue[howList].contains(true)) {
      for (int i = 0;
          i < selectListFareIndexForMultiPointValue[howList].length;
          i++) {
        selectListFareIndexForMultiPointValue[howList][i] = false;
      }
    }

    selectListFareIndexForMultiPointValue[howList][index] = isSelected;
    currentFareListIndex = (currentFareListIndex + 1) % listMultiPoint.length;
    flightFaresMultiPointSelectedForSeparated!.add(airResult);
    totalPriceFareMultiPoint += price;
    emit(SelectListIndexForMultiPointState());
  }

  List<String> fareKeyListForMultiPoint = [];
  // bool isSelectedFareCombinedForMultiPointValue = false;
  int? saveIndexFareForCombinedMultiPointValue;
  void selectListFareIndexForMultiPointCombinedFunction(
      {required int value, required List<String> listKey}) {
    if (saveIndexFareForCombinedMultiPointValue == value) {
      saveIndexFareForCombinedMultiPointValue = null;
      fareKeyListForMultiPoint = [];
    } else {
      saveIndexFareForCombinedMultiPointValue = value;
      fareKeyListForMultiPoint = listKey;
    }
    print('fareKeyListForMultiPoint: $fareKeyListForMultiPoint');
    print('listkey: $listKey');
    emit(SelectListIndexForMultiPointState());
  }

  void addOrRemovePointToMultiPointList({required bool itIsAdd}) {
    if (itIsAdd) {
      if (listMultiPoint.length < 4) {
        listMultiPoint.add(MultiPointModel(
          departureCode: 'Kalkış Nortesi',
          departureCityName: 'Nereden',
          arrivalCode: 'Varış Nortesi',
          arrivalCityName: 'Nereye',
          departureDate: null,
        ));
      } else {
        print('Cannot add more points. Maximum of 4 reached.');
      }
    } else {
      if (listMultiPoint.length > 2) {
        listMultiPoint.removeLast();
      } else {
        print('Cannot remove points. Minimum of 2 must be maintained.');
      }
    }

    emit(AddPointToMultiPointList());
  }

  double totalPriceMultiPoint = 0.0;

  void calculateTotalPriceMultiPoint({required double price}) {
    totalPriceMultiPoint += price;
  }

  List<AirSearchResult> searchResultsMultiPoint = [];

  List<List<AirResult>> flightSearchResultForMultiPoints = [];
  List<List<AirResult>> savedFlightSearchResults = [];

  List<String> passengerDetails = [];

  bool isHaveListOfResultTypeTwo = false;
  Future<dynamic> searchAvailabilityForMultiPoint(
      RequestModel request, BuildContext context) async {
    emit(SearchFlightLoading());
    flightSearchResultForMultiPoints = [];
    selectAirResultForMultiPointList = [];
    passengerDetails = [];
    currentListIndex = 0;
    totalPriceMultiPoint = 0.0;
    theFlyInTheTurkey = true;
    // justList.clear();
    flightSearchResultForMultiPoints =
        List.generate(listMultiPoint.length, (index) => []);
    isHaveListOfResultTypeTwo = false;
    String url = '$apiBaseUrl/SearchAvailability';
    final requestJson = jsonEncode(request.toJson());
    print("requestJson:::::$requestJson");

    final response = await _dio.post(url, data: requestJson);
    final responseData = response.data;
    print("responseData:::::::${json.encode(responseData)}");

    if (responseData != null) {
      print("JSON'u AirSearchResult'a çevirme...");

      final result = Result.fromJson(responseData);
      searchResultsMultiPoint = result.result!.searchResults!;
      if (result.errorCode == null) {
        if (result.result != null) {
          for (var leg in result.result!.searchRequest!.legs!) {
            String departureCountryCode = leg.departurePoint!.countryCode!;
            String arrivalCountryCode = leg.arrivalPoint!.countryCode!;

            if (departureCountryCode != 'TR' || arrivalCountryCode != 'TR') {
              theFlyInTheTurkey = false;
              break;
            }
          }
          for (var element in result.result!.searchResults!.first.results!.first
              .fares!.first.passengerFares!) {
            passengerDetails.add(element.count.toString());
          }
          print('++++++++++++++++++++++++++++++++++');
          print('isHaveListOfResultTypeTwo: $isHaveListOfResultTypeTwo');

          for (var i = 0; i < searchResultsMultiPoint.length; i++) {
            for (var element in searchResultsMultiPoint[i].results!) {
              var result = element;
              int minLength = min(
                  result.fares!.first.fareAlternativeLegs!.length,
                  result.legs!.length);

              if (searchResultsMultiPoint[i].resultType ==
                  AirResultType.combined) {
                print('yyyyy');
                isHaveListOfResultTypeTwo = true;
                int globalAltLegIndex = 0;
                for (var j = 0; j < minLength; j++) {
                  for (var altLegIndex = 0;
                      altLegIndex < result.legs![j].alternativeLegs!.length;
                      altLegIndex++) {
                    AirResult? newAir = AirResult(
                      data: result.data,
                      fares: [
                        AirFare(
                          fareAlternativeLegs: [
                            result.fares!.first
                                .fareAlternativeLegs![globalAltLegIndex],
                          ],
                          fareRef: result.fares!.first.fareRef,
                          fareRules: result.fares!.first.fareRules,
                          passengerFares: result.fares!.first.passengerFares,
                          title: result.fares!.first.title,
                          totalPrice: result.fares!.first.totalPrice,
                        ),
                      ],
                      groupId: result.groupId ?? 'P$j$altLegIndex',
                      isCharter: result.isCharter,
                      legs: [
                        AirLeg(
                          alternativeLegs: [
                            result.legs![j].alternativeLegs![altLegIndex]
                          ],
                          searchLeg: result.legs![j].searchLeg,
                        ),
                      ],
                      providerCode: result.providerCode,
                      resultRef: result.resultRef,
                    );

                    flightSearchResultForMultiPoints[j].add(newAir);
                    globalAltLegIndex++;
                  }
                }
              } else {
                if (isHaveListOfResultTypeTwo == true) {
                  flightSearchResultForMultiPoints[i - 1].add(
                    AirResult(
                      data: element.data,
                      fares: element.fares,
                      groupId: element.groupId ?? 'S$i',
                      isCharter: element.isCharter,
                      legs: element.legs,
                      providerCode: element.providerCode,
                      resultRef: element.resultRef,
                    ),
                  );
                } else {
                  flightSearchResultForMultiPoints[i].add(
                    AirResult(
                      data: element.data,
                      fares: element.fares,
                      groupId: element.groupId ?? 'S$i',
                      isCharter: element.isCharter,
                      legs: element.legs,
                      providerCode: element.providerCode,
                      resultRef: element.resultRef,
                    ),
                  );
                }
              }
            }
          }
          selectListIndexForMultiPointValue = List.generate(
            listMultiPoint.length,
            (outerIndex) => List.generate(
              flightSearchResultForMultiPoints[outerIndex].length,
              (innerIndex) => false,
            ),
          );
          selectListFareIndexForMultiPointValue = List.generate(
            listMultiPoint.length,
            (outerIndex) => List.generate(
              flightSearchResultForMultiPoints[outerIndex].length,
              (innerIndex) => false,
            ),
          );

          print(
              'flightSearchResultForMultiPoints[index].length: ${flightSearchResultForMultiPoints[0].length}');

          packagingForMultiPointsList();
          for (var element in listMultiPoint) {
            print('element.departureCityName: ${element.departureCityName}');
            print('element.arrivalCityName: ${element.arrivalCityName}');
            print('-----------------------------------------------');
          }
          emit(SearchFlightSuccess());
          sortPriceLessToHighMultiPointFunc();
          return result;
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
            emit(SearchFlightFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          } else {
            errorMassage = '${result.errorMessage}';
            errorCode = result.errorCode;
            emit(SearchFlightFailure(
                errorMassage: errorMassage!, errorCode: errorCode!));
          }

          return result;
        }
      } else {
        print('+++++++++++++++++++++++++++++++++++++++++++++++++');
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
          emit(SearchFlightFailure(
              errorMassage: errorMassage!, errorCode: errorCode!));
        } else {
          emit(SearchFlightFailure(
              errorMassage: 'Uçuş Bulunmadı', errorCode: 'NULL_RESPONSE'));
        }

        return result;
      }
    } else {
      emit(SearchFlightFailure(
          errorMassage: 'Uçuşlar yüklenemedi', errorCode: 'NULL_RESPONSE'));
      throw Exception('Uçuşlar yüklenemedi');
    }
  }

  void packagingForMultiPointsList() {
    List<List<AirResult>> listfor = flightSearchResultForMultiPoints
        .map((list) => List<AirResult>.from(list.cast<AirResult>()))
        .toList();

    for (var i = 0; i < 1; i++) {
      List<AirResult> afterPackagingResults = [];

      for (var result in listfor[i]) {
        int minLength = min(result.fares!.first.fareAlternativeLegs!.length,
            result.legs!.length);

        for (var j = 0; j < minLength; j++) {
          for (var altLegIndex = 0;
              altLegIndex < result.legs![j].alternativeLegs!.length;
              altLegIndex++) {
            String? arrivalDate = result.legs![j].alternativeLegs![altLegIndex]
                .segments!.last.arrivalDate;
            String? departureDate = result.legs![j]
                .alternativeLegs![altLegIndex].segments!.first.departureDate;

            var cabinType = result.fares![0].fareAlternativeLegs![altLegIndex]
                .fareSegments!.first.cabinType;
            var flightDetails =
                result.legs![j].alternativeLegs![altLegIndex].segments!;
            List<String> flightNo = [];

            for (var segment in flightDetails) {
              flightNo.add(segment.flightNo!);
            }

            // listEquals(flightCode, flightCodeItem) &&
            double? fareTitle =
                result.fares![0].totalPrice!.totalStrikeAmount.toDouble();

            var existingItemIndex = afterPackagingResults.indexWhere((item) {
              var flightDetails =
                  item.legs![j].alternativeLegs![altLegIndex].segments!;
              var cabinTypeItem = item
                  .fares![0]
                  .fareAlternativeLegs![altLegIndex]
                  .fareSegments!
                  .first
                  .cabinType;
              List<String> flightNoItem = [];

              for (var segment in flightDetails) {
                flightNoItem.add(segment.flightNo!);
              }

              return item.legs![j].alternativeLegs![altLegIndex].segments!.last
                          .arrivalDate ==
                      arrivalDate &&
                  item.legs![j].alternativeLegs![altLegIndex].segments!.first
                          .departureDate ==
                      departureDate &&
                  cabinType == cabinTypeItem &&
                  listEquals(flightNo, flightNoItem);
            });

            if (existingItemIndex == -1) {
              afterPackagingResults.add(result);
            } else {
              double existingFareTitle =
                  afterPackagingResults[existingItemIndex]
                      .fares![0]
                      .totalPrice!
                      .totalStrikeAmount
                      .toDouble();

              String existingGroupId =
                  afterPackagingResults[existingItemIndex].groupId!;
              String newGroupId = result.groupId!;

              if (existingGroupId[0] == newGroupId[0]) {
                if (fareTitle! < existingFareTitle) {
                  afterPackagingResults[existingItemIndex] = result;
                }
              } else {
                if (!newGroupId.startsWith('F')) {
                  newGroupId = 'F$newGroupId';
                }

                result.groupId = newGroupId;

                if (fareTitle! < existingFareTitle) {
                  afterPackagingResults[existingItemIndex] = result;
                }
              }
            }
          }
        }
      }

      listfor[i] = afterPackagingResults;
    }

    flightSearchResultForMultiPoints = listfor;
    savedFlightSearchResults = List.from(listfor);
  }

  void saveAlternativeRef({required String value}) {
    afaf = value;
    print('-----------------------------------------------');
    print('afaf: $afaf');
    print('-----------------------------------------------');
  }

  String? afaf;
  // List<AirResult> justList = [];
  // List<bool> isAllTrue = [];
  // bool ll = false;
  void selectFirstCardAndUpdateSecondList({
    required String arrivalDateValue,
    required String departureDateValue,
    required List<String> flightNoValue,
    required dynamic flightCabinTypeValue,
    required AirResult result,
  }) {
    if (result.groupId![0] == 'P') {
      flightSearchResultForMultiPoints[currentListIndex].clear();
    }
    if (searchResultsMultiPoint.first.resultType == AirResultType.combined) {
      for (var item in searchResultsMultiPoint.first.results!) {
        int remov = 0;

        if (listMultiPoint.length > 2 &&
            (currentListIndex == 2 || currentListIndex == 3)) {
          print('currentListIndex: $currentListIndex');
          for (var i = 0;
              i < item.legs![currentListIndex].alternativeLegs!.length;
              i++) {
            print('afaf: $afaf');
            print(
                'item.legs![currentListIndex - 1].alternativeLegs![i].alternativeRef: ${item.legs![currentListIndex - 1].alternativeLegs![i].alternativeRef}');

            if (afaf ==
                item.legs![currentListIndex - 1].alternativeLegs![i]
                    .alternativeRef) {
              // print('afaf: $afaf');
              // print(
              //     'item.legs![currentListIndex - 1].alternativeLegs![i].alternativeRef: ${item.legs![currentListIndex - 1].alternativeLegs![i].alternativeRef}');
              print('finded');
              AirResult? newAir = AirResult(
                data: item.data,
                fares: [
                  AirFare(
                    fareAlternativeLegs: [
                      if (flightSearchResultForMultiPoints.length == 4 &&
                          currentListIndex == 2)
                        item.fares!.first.fareAlternativeLegs![
                            item.fares!.first.fareAlternativeLegs!.length -
                                item.legs![currentListIndex].alternativeLegs!
                                    .length +
                                i -
                                1]
                      // else if (flightSearchResultForMultiPoints.length == 4 &&
                      //     currentListIndex == 3)
                      //   item.fares!.first.fareAlternativeLegs![
                      //       item.fares!.first.fareAlternativeLegs!.length -
                      //           item.legs![currentListIndex].alternativeLegs!
                      //               .length +
                      //           i]
                      else
                        item.fares!.first.fareAlternativeLegs![
                            item.fares!.first.fareAlternativeLegs!.length -
                                item.legs![currentListIndex].alternativeLegs!
                                    .length +
                                i],
                    ],
                    fareRef: item.fares!.first.fareRef,
                    fareRules: item.fares!.first.fareRules,
                    passengerFares: item.fares!.first.passengerFares,
                    title: item.fares!.first.title,
                    totalPrice: Price(
                      totalAmount: item.fares!.first.totalPrice!.totalAmount,
                      totalStrikeAmount:
                          item.fares!.first.totalPrice!.totalStrikeAmount -
                              (totalPriceMultiPoint),
                      currencyCode: item.fares!.first.totalPrice!.currencyCode,
                      discountAmount:
                          item.fares!.first.totalPrice!.discountAmount,
                      discounts: item.fares!.first.totalPrice!.discounts,
                      taxAmount: item.fares!.first.totalPrice!.taxAmount,
                      addOn: item.fares!.first.totalPrice!.addOn,
                      agentCommissions:
                          item.fares!.first.totalPrice!.agentCommissions,
                      baseAmount: item.fares!.first.totalPrice!.baseAmount,
                      commission: item.fares!.first.totalPrice!.commission,
                      dailyPrice: item.fares!.first.totalPrice!.dailyPrice,
                      exemptFromCommission:
                          item.fares!.first.totalPrice!.exemptFromCommission,
                      includedExtraAmount:
                          item.fares!.first.totalPrice!.includedExtraAmount,
                      kickBack: item.fares!.first.totalPrice!.kickBack,
                      originalCommission:
                          item.fares!.first.totalPrice!.originalCommission,
                      originalCurrencyCode:
                          item.fares!.first.totalPrice!.originalCurrencyCode,
                      originalCurrencyRate:
                          item.fares!.first.totalPrice!.originalCurrencyRate,
                      packageDifferenceAmount:
                          item.fares!.first.totalPrice!.packageDifferenceAmount,
                      providerCommission:
                          item.fares!.first.totalPrice!.providerCommission,
                      serviceFee: item.fares!.first.totalPrice!.serviceFee,
                      taxList: item.fares!.first.totalPrice!.taxList,
                      vatRate: item.fares!.first.totalPrice!.vatRate,
                    ),
                  ),
                ],
                groupId: item.groupId ?? 'P$i',
                isCharter: item.isCharter,
                legs: [
                  AirLeg(
                    alternativeLegs: [
                      item.legs![currentListIndex].alternativeLegs![i - remov]
                    ],
                    searchLeg: item.legs![currentListIndex].searchLeg,
                  ),
                ],
                providerCode: item.providerCode,
                resultRef: item.resultRef,
              );
              flightSearchResultForMultiPoints[currentListIndex].add(newAir);
            }
          }
        } else {
          print('//////////////////////////////////////////////');
          for (int i = 0;
              i < item.legs![currentListIndex - 1].alternativeLegs!.length;
              i++) {
            var element = item.legs![currentListIndex - 1].alternativeLegs![i];
            bool isDuplicate = element.segments!.last.arrivalDate ==
                    result.legs![0].alternativeLegs![0].segments!.last
                        .arrivalDate &&
                element.segments!.first.departureDate ==
                    result.legs![0].alternativeLegs![0].segments!.first
                        .departureDate &&
                item.fares!.first.fareAlternativeLegs![i + remov].fareSegments!
                        .first.cabinType ==
                    flightCabinTypeValue &&
                listEquals(flightNoValue,
                    element.segments!.map((e) => e.flightNo).toList());

            if (isDuplicate == false) {
              remov++;
            } else {
              print('remov: $remov');
              AirResult? newAir = AirResult(
                data: item.data,
                fares: [
                  AirFare(
                    fareAlternativeLegs: [
                      // التحقق مما إذا كانت قائمة flightSearchResultForMultiPoints تحتوي على 3 عناصر أو أكثر
                      if (flightSearchResultForMultiPoints.length == 3)
                        item.fares!.first.fareAlternativeLegs![
                            item.fares!.first.fareAlternativeLegs!.length -
                                item.legs![currentListIndex].alternativeLegs!
                                    .length +
                                i -
                                1]
                      else if (flightSearchResultForMultiPoints.length == 4 &&
                          currentListIndex == 2)
                        item.fares!.first.fareAlternativeLegs![
                            item.fares!.first.fareAlternativeLegs!.length -
                                item.legs![currentListIndex].alternativeLegs!
                                    .length +
                                i -
                                1]
                      else if (flightSearchResultForMultiPoints.length == 4)
                        item.fares!.first.fareAlternativeLegs![
                            item.fares!.first.fareAlternativeLegs!.length -
                                item.legs![currentListIndex].alternativeLegs!
                                    .length +
                                i -
                                2]
                      else
                        // تنفيذ هذا الكود إذا لم يتحقق الشرط
                        item.fares!.first.fareAlternativeLegs![
                            item.fares!.first.fareAlternativeLegs!.length -
                                item.legs![currentListIndex].alternativeLegs!
                                    .length +
                                i],
                    ],
                    fareRef: item.fares!.first.fareRef,
                    fareRules: item.fares!.first.fareRules,
                    passengerFares: item.fares!.first.passengerFares,
                    title: item.fares!.first.title,
                    totalPrice: Price(
                      totalAmount: item.fares!.first.totalPrice!.totalAmount,
                      totalStrikeAmount:
                          item.fares!.first.totalPrice!.totalStrikeAmount -
                              (selectAirResultForMultiPointList.first.fares!
                                  .first.totalPrice!.totalStrikeAmount),
                      currencyCode: item.fares!.first.totalPrice!.currencyCode,
                      discountAmount:
                          item.fares!.first.totalPrice!.discountAmount,
                      discounts: item.fares!.first.totalPrice!.discounts,
                      taxAmount: item.fares!.first.totalPrice!.taxAmount,
                      addOn: item.fares!.first.totalPrice!.addOn,
                      agentCommissions:
                          item.fares!.first.totalPrice!.agentCommissions,
                      baseAmount: item.fares!.first.totalPrice!.baseAmount,
                      commission: item.fares!.first.totalPrice!.commission,
                      dailyPrice: item.fares!.first.totalPrice!.dailyPrice,
                      exemptFromCommission:
                          item.fares!.first.totalPrice!.exemptFromCommission,
                      includedExtraAmount:
                          item.fares!.first.totalPrice!.includedExtraAmount,
                      kickBack: item.fares!.first.totalPrice!.kickBack,
                      originalCommission:
                          item.fares!.first.totalPrice!.originalCommission,
                      originalCurrencyCode:
                          item.fares!.first.totalPrice!.originalCurrencyCode,
                      originalCurrencyRate:
                          item.fares!.first.totalPrice!.originalCurrencyRate,
                      packageDifferenceAmount:
                          item.fares!.first.totalPrice!.packageDifferenceAmount,
                      providerCommission:
                          item.fares!.first.totalPrice!.providerCommission,
                      serviceFee: item.fares!.first.totalPrice!.serviceFee,
                      taxList: item.fares!.first.totalPrice!.taxList,
                      vatRate: item.fares!.first.totalPrice!.vatRate,
                    ),
                  ),
                ],
                groupId: item.groupId ?? 'P$i',
                isCharter: item.isCharter,
                legs: [
                  AirLeg(
                    alternativeLegs: [
                      item.legs![currentListIndex].alternativeLegs![i - remov]
                    ],
                    searchLeg: item.legs![currentListIndex].searchLeg,
                  ),
                ],
                providerCode: item.providerCode,
                resultRef: item.resultRef,
              );

              flightSearchResultForMultiPoints[currentListIndex].add(newAir);
            }
          }
        }
      }
    }
  }

  String? selectGroupIdFlightForMultiPointValue;

  void selectGroupIdFlightForMultiPointFunction({required String? value}) {
    selectGroupIdFlightForMultiPointValue = value;
    print('selectGroupIdFlightForMultiPointValue $value');
  }

  void createList({
    required String arrivalDateValue,
    required String departureDateValue,
    required List<String> flightNoValue,
    required dynamic flightCabinTypeValue,
    required AirResult result,
    required BuildContext context,
  }) {
    print('----------------------------------------------------------------');
    print('arrivalDateValue: $arrivalDateValue');
    print('departureDateValue: $departureDateValue');
    print('flightNoValue: $flightNoValue');
    print('flightCabinTypeValue: $flightCabinTypeValue');
    print('----------------------------------------------------------------');
    if (selectGroupIdFlightForMultiPointValue != null &&
        selectGroupIdFlightForMultiPointValue!.isNotEmpty) {
      List<AirResult> newResults = [];

      if (selectGroupIdFlightForMultiPointValue! == result.groupId &&
          selectGroupIdFlightForMultiPointValue!.length > 5) {
        print(
            '*************************************************************************************');
        for (var item
            in searchResultsMultiPoint[currentListIndex + 1].results!) {
          if (item.groupId == result.groupId) {
            newResults.add(
              AirResult(
                data: item.data,
                fares: item.fares,
                groupId: item.groupId,
                isCharter: null,
                legs: item.legs,
                providerCode: item.providerCode,
                resultRef: item.resultRef,
              ),
            );
          }
        }
        flightSearchResultForMultiPoints[currentListIndex].clear();
        flightSearchResultForMultiPoints[currentListIndex].addAll(newResults);
      } else if (selectGroupIdFlightForMultiPointValue![0] == 'S') {
        if (currentListIndex == 0 &&
            listMultiPoint.length == selectAirResultForMultiPointList.length) {
        } else {
          print(
              'spspspspspspsspspspspsppspspspspspspspspspssppspspspspspsppspspspspspspsppspspspspspspspspspspspspsppspspsps');
          for (var item
              in searchResultsMultiPoint[currentListIndex + 1].results!) {
            print('Checking item with groupId: ${item.groupId}');
            //   if (item.groupId != null) {
            print('Adding item with groupId: ${item.groupId} to newResults');
            //  if (item.groupId![0] == 'S' || item.groupId![0] == 'F') {
            newResults.add(
              AirResult(
                data: item.data,
                fares: item.fares,
                groupId: 'S',
                isCharter: null,
                legs: item.legs,
                providerCode: item.providerCode,
                resultRef: item.resultRef,
              ),
            );
            //  }
            //  }
          }
          flightSearchResultForMultiPoints[currentListIndex].clear();
          flightSearchResultForMultiPoints[currentListIndex].addAll(newResults);
        }
      } else if (selectGroupIdFlightForMultiPointValue![0] == 'P') {
        print(
            'PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP');
        print('currentListIndex: $currentListIndex');
        print('listMultiPoint.length: ${listMultiPoint.length}');

        if (currentListIndex == 0 &&
            listMultiPoint.length == selectAirResultForMultiPointList.length) {
        } else {
          selectFirstCardAndUpdateSecondList(
            arrivalDateValue: arrivalDateValue,
            departureDateValue: departureDateValue,
            flightNoValue: flightNoValue,
            flightCabinTypeValue: flightCabinTypeValue,
            result: result,
          );
        }
      } else if (selectGroupIdFlightForMultiPointValue![0] == 'F') {
        print(
            'savedFlightSearchResults.length: ${savedFlightSearchResults[currentListIndex].length}');
        print(
            'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF');

        for (var item
            in searchResultsMultiPoint[currentListIndex + 1].results!) {
          //   if (item.groupId![0] == 'S' || item.groupId![0] == 'F') {
          newResults.add(
            AirResult(
              data: item.data,
              fares: item.fares,
              groupId: 'S',
              isCharter: item.isCharter,
              legs: item.legs,
              providerCode: item.providerCode,
              resultRef: item.resultRef,
            ),
          );
        }
        //  }
        flightSearchResultForMultiPoints[currentListIndex].clear();
        flightSearchResultForMultiPoints[currentListIndex].addAll(newResults);
        selectFirstCardAndUpdateSecondList(
          arrivalDateValue: arrivalDateValue,
          departureDateValue: departureDateValue,
          flightNoValue: flightNoValue,
          flightCabinTypeValue: flightCabinTypeValue,
          result: result,
        );
      }
    }
    sortPriceLessToHighMultiPointFunc();
  }

  void sortPriceLessToHighMultiPointFunc() {
    for (int i = 0;
        i < flightSearchResultForMultiPoints[currentListIndex].length;
        i++) {
      flightSearchResultForMultiPoints[currentListIndex].sort((a, b) => a
          .fares![0].totalPrice!.totalStrikeAmount!
          .compareTo(b.fares![0].totalPrice!.totalStrikeAmount!));
    }
  }

  void sortPriceHighToLessMultiPointFunc() {
    for (int i = 0;
        i < flightSearchResultForMultiPoints[currentListIndex].length;
        i++) {
      flightSearchResultForMultiPoints[currentListIndex].sort((a, b) => b
          .fares![0].totalPrice!.totalStrikeAmount!
          .compareTo(a.fares![0].totalPrice!.totalStrikeAmount!));
    }
  }

  void sortTripDepartureTimeLessToHighMultiPointFunc() {
    for (int i = 0;
        i < flightSearchResultForMultiPoints[currentListIndex].length;
        i++) {
      flightSearchResultForMultiPoints[currentListIndex].sort((a, b) => a
          .legs![0].alternativeLegs!.first.segments!.first.departureDate!
          .compareTo(b
              .legs![0].alternativeLegs!.first.segments!.first.departureDate!));
    }
  }

  void sortTripDepartureTimeHighToLessMultiPointFunc() {
    for (int i = 0;
        i < flightSearchResultForMultiPoints[currentListIndex].length;
        i++) {
      flightSearchResultForMultiPoints[currentListIndex].sort((a, b) => b
          .legs![0].alternativeLegs!.first.segments!.first.departureDate!
          .compareTo(a
              .legs![0].alternativeLegs!.first.segments!.first.departureDate!));
    }
  }

  void sortTripLessToHighMultiPointFunc() {
    flightSearchResultForMultiPoints[currentListIndex].sort((a, b) {
      // جمع القيم في segments لـ a
      num totalDurationA = a.legs![0].alternativeLegs!.last.segments!
          .fold<num>(0, (sum, segment) {
        return sum +
            (segment.flightDuration ?? 0) +
            (segment.waitingDuration ?? 0);
      });

      // جمع القيم في segments لـ b
      num totalDurationB = b.legs![0].alternativeLegs!.last.segments!
          .fold<num>(0, (sum, segment) {
        return sum +
            (segment.flightDuration ?? 0) +
            (segment.waitingDuration ?? 0);
      });

      // مقارنة المجموع الكلي لـ a و b بعد تحويلهما إلى int
      return totalDurationA.toInt().compareTo(totalDurationB.toInt());
    });
  }

  void sortTripHighToLessMultiPointFunc() {
    flightSearchResultForMultiPoints[currentListIndex].sort((a, b) {
      // جمع القيم في segments لـ a
      num totalDurationA = a.legs![0].alternativeLegs!.last.segments!
          .fold<num>(0, (sum, segment) {
        return sum +
            (segment.flightDuration ?? 0) +
            (segment.waitingDuration ?? 0);
      });

      // جمع القيم في segments لـ b
      num totalDurationB = b.legs![0].alternativeLegs!.last.segments!
          .fold<num>(0, (sum, segment) {
        return sum +
            (segment.flightDuration ?? 0) +
            (segment.waitingDuration ?? 0);
      });

      // مقارنة المجموع الكلي لـ a و b بعد تحويلهما إلى int
      return totalDurationB.toInt().compareTo(totalDurationA.toInt());
    });
  }

  //--------------------------------filter-------------------------------------------

  dynamic airlineListMultiPoint = [];

  List<String> selectedAirlinListMultiPoint = [];
  Map<String, bool> selectedAirlineMapMultiPoint = {};
  List<AirResult>? listFilterAirlineMultiPoint = [];

  void getAirlineNameAndLogoMultiPoint() {
    airlineListMultiPoint = [];

    final Set<String> uniqueAirlinesMultiPoint = {};

    for (int i = 0;
        i < savedFlightSearchResults[currentListIndex].length;
        i++) {
      for (var segment in savedFlightSearchResults[currentListIndex][i]
          .legs![0]
          .alternativeLegs![0]
          .segments!) {
        final airlineName = segment.ticketingAirline?.name;
        final airlineLogo = segment.ticketingAirline?.logo;

        // التحقق من الاسم والشعار وإضافتهما إلى القائمة إذا كان الاسم فريدًا
        if (airlineName != null && uniqueAirlinesMultiPoint.add(airlineName)) {
          airlineListMultiPoint.add({'name': airlineName, 'logo': airlineLogo});
        }
      }
    }

    print('airlineListMultiPoint: $airlineListMultiPoint');
    print('airlineListMultiPoint length: ${airlineListMultiPoint.length}');
  }

  void checkboxAirlineNameAndLogoMultiPoint(
      {required String lineName, required bool value}) {
    if (value) {
      if (!selectedAirlinListMultiPoint.contains(lineName)) {
        selectedAirlinListMultiPoint.add(lineName);
      }
    } else {
      selectedAirlinListMultiPoint.remove(lineName);
    }

    selectedAirlineMapMultiPoint[lineName] = value;
    emit(AirlinesFilterState());
  }

  bool isSelectedAirlineMultiPoint(String lineName) {
    return selectedAirlineMapMultiPoint[lineName] ?? false;
  }

  void filterAirlinesMultiPoint() {
    // فلترة شركات الطيران المغادرة
    listFilterAirlineMultiPoint =
        flightSearchResultForMultiPoints[currentListIndex].where((airResult) {
      return airResult.legs![0].alternativeLegs![0].segments!.any((segment) {
        return selectedAirlinListMultiPoint
            .contains(segment.ticketingAirline!.name);
      });
    }).toList();
  }

  //---------------------------luggages---------------------------

  dynamic luggagesListMultipoint = [];
  List<String> selectedLuggagesListMultipoint = [];
  Map<String, bool> selectedLuggagesMapMultipoint = {};
  List<AirResult>? listFilterLuggagesTypesMultipoint = [];

  void getLuggagesTypesMultipoint() {
    print('9999999999999999999999999999999999999999999999999999999999');
    luggagesListMultipoint = [];

    final Set<String> uniqueBaggageTypesLeaving = {};

    for (int i = 0;
        i < savedFlightSearchResults[currentListIndex].length;
        i++) {
      dynamic baggageAllowances;

      // التحقق من أن القوائم ليست فارغة قبل الوصول إلى first
      if (savedFlightSearchResults[currentListIndex][i].fares != null &&
          savedFlightSearchResults[currentListIndex][i].fares!.isNotEmpty &&
          savedFlightSearchResults[currentListIndex][i]
                  .fares!
                  .first
                  .passengerFares !=
              null &&
          savedFlightSearchResults[currentListIndex][i]
              .fares!
              .first
              .passengerFares!
              .isNotEmpty &&
          savedFlightSearchResults[currentListIndex][i]
                  .fares!
                  .first
                  .passengerFares!
                  .first
                  .baggageAllowances !=
              null &&
          savedFlightSearchResults[currentListIndex][i]
              .fares!
              .first
              .passengerFares!
              .first
              .baggageAllowances!
              .isNotEmpty) {
        baggageAllowances = savedFlightSearchResults[currentListIndex][i]
            .fares!
            .first
            .passengerFares!
            .first
            .baggageAllowances!
            .first
            .value;

        if (baggageAllowances != null) {
          uniqueBaggageTypesLeaving.add(baggageAllowances);
        }
      } else {
        print('No baggage allowance data at index: $i');
      }
    }

    luggagesListMultipoint =
        uniqueBaggageTypesLeaving.map((type) => {'baggageType': type}).toList();

    luggagesListMultipoint.sort((a, b) {
      final String typeA = a['baggageType']!;
      final String typeB = b['baggageType']!;
      return typeA.compareTo(typeB);
    });

    print('luggagesListMultipoint: $luggagesListMultipoint');
    print('luggagesListMultipoint length: ${luggagesListMultipoint.length}');
  }

  void checkboxLuggagesTypeMultipoint(
      {required String baggageName, required bool value}) {
    if (value) {
      if (!selectedLuggagesListMultipoint.contains(baggageName)) {
        selectedLuggagesListMultipoint.add(baggageName);
      }
    } else {
      selectedLuggagesListMultipoint.remove(baggageName);
    }

    selectedLuggagesMapMultipoint[baggageName] = value;
    print('Selected lines: $selectedLuggagesMapMultipoint');

    emit(LuggageFilterState());
  }

  bool isSelectedLuggagesTypesMultipoint(String lineName) {
    return selectedLuggagesMapMultipoint[lineName] ?? false;
  }

  void filterLuggagesTypesMultipoint() {
    listFilterLuggagesTypesMultipoint =
        flightSearchResultForMultiPoints[currentListIndex]
            .where((baggageResult) {
      // التحقق من أن القوائم ليست فارغة قبل الوصول إلى [0]
      if (baggageResult.fares != null &&
          baggageResult.fares!.isNotEmpty &&
          baggageResult.fares![0].passengerFares != null &&
          baggageResult.fares![0].passengerFares!.isNotEmpty &&
          baggageResult.fares![0].passengerFares![0].baggageAllowances !=
              null &&
          baggageResult
              .fares![0].passengerFares![0].baggageAllowances!.isNotEmpty) {
        return selectedLuggagesListMultipoint.contains(baggageResult
            .fares![0].passengerFares![0].baggageAllowances![0].value);
      } else {
        return false; // إذا كانت أي قائمة فارغة، استبعد هذا العنصر
      }
    }).toList();

    print(
        'Filtered selectedLuggagesListMultipoint:  $selectedLuggagesListMultipoint');
    for (var baggage in flightSearchResultForMultiPoints[currentListIndex]) {
      // التحقق من أن القوائم ليست فارغة قبل الوصول إلى [0]
      if (baggage.fares != null &&
          baggage.fares!.isNotEmpty &&
          baggage.fares![0].passengerFares != null &&
          baggage.fares![0].passengerFares!.isNotEmpty &&
          baggage.fares![0].passengerFares![0].baggageAllowances != null &&
          baggage.fares![0].passengerFares![0].baggageAllowances!.isNotEmpty) {
        print(
            'Name: ${baggage.fares![0].passengerFares![0].baggageAllowances![0].value}, ');
      } else {
        print('No baggage allowance available for this item');
      }
    }
  }

  //----------------------------providers-----------------------------

  dynamic flightProviderListMultiPoint = [];
  List<String> selectedFlightProviderListMultiPoint = [];
  Map<String, bool> selectedFlightProviderMapMultiPoint = {};
  List<AirResult>? listFilterFlightProviderMultiPoint = [];

  void getFlightProviderNameAndLogoMultiPoint() {
    flightProviderListMultiPoint = [];

    final Set<String> uniqueFlightProviderLeaving = {};

    for (int i = 0;
        i < savedFlightSearchResults[currentListIndex].length;
        i++) {
      final flightProviderName = savedFlightSearchResults[currentListIndex][i]
          .legs![0]
          .alternativeLegs![0]
          .segments![0]
          .operatingAirline!
          .name;

      final flightProviderLogo = savedFlightSearchResults[currentListIndex][i]
          .legs![0]
          .alternativeLegs![0]
          .segments![0]
          .operatingAirline!
          .logo;

      if (flightProviderName != null &&
          uniqueFlightProviderLeaving.add(flightProviderName)) {
        flightProviderListMultiPoint
            .add({'name': flightProviderName, 'logo': flightProviderLogo});
      }
    }

    print('flightProviderListReturn: $flightProviderListReturn');
    print(
        'flightProviderListReturn length: ${flightProviderListReturn.length}');
  }

  void checkboxFlightProviderNameAndLogoMultiPoint(
      {required String flightProviderName, required bool value}) {
    if (value) {
      if (!selectedFlightProviderListMultiPoint.contains(flightProviderName)) {
        selectedFlightProviderListMultiPoint.add(flightProviderName);
      }
    } else {
      selectedFlightProviderListMultiPoint.remove(flightProviderName);
    }

    selectedFlightProviderMapMultiPoint[flightProviderName] = value;

    print('Selected lines: $selectedFlightProviderMapReturn');
    emit(FlightProviderFilterState());
  }

  bool isSelectedFlightProviderMultiPoint(String flightProviderName) {
    return selectedFlightProviderMapMultiPoint[flightProviderName] ?? false;
  }

  void filterFlightProviderMultiPoint() {
    listFilterFlightProviderMultiPoint =
        flightSearchResultForMultiPoints[currentListIndex]
            .where((flightProviderResult) {
      return selectedFlightProviderListMultiPoint.contains(flightProviderResult
          .legs![0].alternativeLegs![0].segments![0].operatingAirline!.name);
    }).toList();

    // print('Filtered flightSearchResultsLeaving:');
    // for (var flightProvider in afterRefreshFlightSearchResultsReturn) {
    //   print(
    //       'Name: ${flightProvider.legs![0].alternativeLegs![0].segments![0].operatingAirline!.name}, Logo: ${flightProvider.legs![0].alternativeLegs![0].segments![0].operatingAirline!.logo}');
    // }
  }

  //---------------------------------airports----------------------------------

  dynamic airportListMultiPoint = [];
  List<String> selectedAirportListMultiPoint = [];
  Map<String, bool> selectedAirportMapMultiPoint = {};
  List<AirResult>? listFilterAirportMultiPoint = [];

  void getAirportNameAndLogoMultiPoint() {
    airportListMultiPoint = [];

    final Set<String> uniqueAirportMultiPoint = {};

    for (int i = 0;
        i < savedFlightSearchResults[currentListIndex].length;
        i++) {
      final segments = savedFlightSearchResults[currentListIndex][i]
          .legs![0]
          .alternativeLegs![0]
          .segments!;

      for (var segment in segments) {
        final airportName = segment.arrivalAirport!.cityName;
        final airportCode = segment.arrivalAirport!.code;
        final airportsToRemove = ['$firstCityCode', '$secondCityCode'];
        if (airportName != null && uniqueAirportMultiPoint.add(airportName)) {
          airportListMultiPoint.add({'name': airportName, 'code': airportCode});
        }
        airportListMultiPoint.removeWhere((airport) {
          return airportsToRemove.contains(airport['code']);
        });
        // Do something with airportName
      }
    }

    print('airportListReturn: $airportListReturn');
    print('airportListReturn length: ${airportListReturn.length}');
  }

  void checkboxAirportNameAndLogoMultiPoint(
      {required String portCode, required bool value}) {
    if (value) {
      if (!selectedAirportListMultiPoint.contains(portCode)) {
        selectedAirportListMultiPoint.add(portCode);
      }
    } else {
      selectedAirportListMultiPoint.remove(portCode);
    }

    selectedAirportMapMultiPoint[portCode] = value;

    print('Selected lines: $selectedAirportMapReturn');
    emit(AirportsFilterState());
  }

  bool isSelectedAirportMultiPoint(String portCode) {
    return selectedAirportMapMultiPoint[portCode] ?? false;
  }

  void filterAirportsMultiPoint() {
    listFilterAirportMultiPoint =
        flightSearchResultForMultiPoints[currentListIndex]
            .where((airportResult) {
      return selectedAirportListMultiPoint.contains(airportResult
          .legs![0].alternativeLegs![0].segments![0].arrivalAirport!.code);
    }).toList();

    // print('Filtered listFilterAirportReturn:');
    // for (var airline in listFilterAirportReturn!) {
    //   print(
    //       'code: ${airline.legs![0].alternativeLegs![0].segments![0].arrivalAirport!.code} ');
    // }
  }

  //---------------------------cabin Type------------------------------------
  dynamic cabinTypeListMultiPoint = [];
  List<int> selectedCabinTypeListMultiPoint = [];
  Map<int, bool> selectedCabinTypeMapMultiPoint = {};
  List<AirResult>? listFilterCabinTypeMultiPoint = [];

  void getCabinTypeMultiPoint() {
    cabinTypeListMultiPoint = [];

    final Set<int> uniqueCabinTypeMultiPoint = {};

    for (int i = 0;
        i < savedFlightSearchResults[currentListIndex].length;
        i++) {
      final cabinTypeName = savedFlightSearchResults[currentListIndex][i]
          .fares![0]
          .fareAlternativeLegs![0]
          .fareSegments![0]
          .cabinType;

      if (cabinTypeName != null &&
          uniqueCabinTypeMultiPoint.add(cabinTypeName)) {
        cabinTypeListMultiPoint.add({
          'type': cabinTypeName,
        });
      }
    }

    print('lineListLeaving: $cabinTypeListReturn');
    print('lineListLeaving length: ${cabinTypeListReturn.length}');
  }

  void checkboxCabinTypeMultiPoint(
      {required int cabinType, required bool value}) {
    if (value) {
      if (!selectedCabinTypeListMultiPoint.contains(cabinType)) {
        selectedCabinTypeListMultiPoint.add(cabinType);
      }
    } else {
      selectedCabinTypeListMultiPoint.remove(cabinType);
    }

    selectedCabinTypeMapMultiPoint[cabinType] = value;
    print('Selected lines: $selectedCabinTypeMapMultiPoint');

    emit(CabinTypeFilterState());
  }

  bool isSelectedCabinTypeMultiPoint(int cabinType) {
    return selectedCabinTypeMapMultiPoint[cabinType] ?? false;
  }

  void filterCabinTypeMultiPoint() {
    listFilterCabinTypeMultiPoint =
        flightSearchResultForMultiPoints[currentListIndex]
            .where((cabinTypeResult) {
      return selectedCabinTypeListMultiPoint.contains(cabinTypeResult
          .fares![0].fareAlternativeLegs![0].fareSegments![0].cabinType);
    }).toList();

    // print('Filtered flightSearchResultsReturn:');
    // for (var airline in afterRefreshFlightSearchResultsReturn) {
    //   print(
    //       'type: ${airline..fares![0].fareAlternativeLegs![0].fareSegments![0].cabinType},');
    // }
  }

  void resultApplyForMultiPoint(BuildContext context) {
    List<List<AirResult>?> lists = [
      //listFilterPriceMultiPoint,
      // listFilterTimeLeaving,
      // listFilterDurationsLeaving,
      listFilterAirlineMultiPoint,
      listFilterLuggagesTypesMultipoint,
      listFilterFlightProviderMultiPoint,
      listFilterAirportMultiPoint,
      listFilterCabinTypeMultiPoint,
    ];
    List<AirResult> commonList = [];
    List<List<AirResult>> nonEmptyLists = lists
        .where((list) => list != null && list.isNotEmpty)
        .map((list) => list!)
        .toList();

    if (nonEmptyLists.isNotEmpty) {
      Set<AirResult> referenceSet = nonEmptyLists.first.toSet();

      commonList = nonEmptyLists.skip(1).fold(referenceSet, (prevSet, list) {
        return prevSet.intersection(list.toSet());
      }).toList();

      // commonList = nonEmptyLists.skip(1).fold(nonEmptyLists.first.toSet(),
      //     (prevSet, list) {
      //   return prevSet.intersection(list.toSet());
      // }).toList();
    }
    if (commonList.isEmpty) {
      selectedAirlineMapMultiPoint.updateAll((key, value) => false);
      selectedLuggagesMapMultipoint.updateAll((key, value) => false);
      selectedFlightProviderMapMultiPoint.updateAll((key, value) => false);
      selectedAirportMapMultiPoint.updateAll((key, value) => false);
      selectedCabinTypeMapMultiPoint.updateAll((key, value) => false);
      selectedAirlinListMultiPoint = [];
      listFilterAirlineMultiPoint = [];
      selectedFlightProviderListLeaving = [];
      listFilterFlightProviderLeaving = [];
      listFilterLuggagesTypesMultipoint != [];
      selectedLuggagesListMultipoint = [];
      selectedAirportListMultiPoint = [];
      listFilterAirportMultiPoint != [];
      selectedCabinTypeListMultiPoint = [];
      listFilterCabinTypeMultiPoint != [];
      // listFilterPriceLeaving != [];
      // listFilterTimeLeaving != [];
      // listFilterDurationsLeaving != [];
      // flyingDurationFirstInFilter = null;
      // highestPriceInFilter = 0;
      // lowestPriceInFilter = 0;
      // flyingFirstHourInFilter = null;
      // flyingSecondHourInFilter = null;
      // SnackbarUtils.showSnackbar(
      //     context,
      //     'filterleme göre uçuş bulunamadı filterleme sıfırlandı...111111111',
      //     2);
      // print('filterleme göre uçuş bulunamadı filterleme sıfırlandı...');
    } else {
      flightSearchResultForMultiPoints[currentListIndex] = commonList;
    }

    bool allListsAreEmpty = lists.every((list) => list == null || list.isEmpty);

    if (allListsAreEmpty) {
      print('------------------------------------------------');

      flightSearchResultForMultiPoints[currentListIndex] =
          savedFlightSearchResults[currentListIndex];
      // SnackbarUtils.showSnackbar(
      //     context, '2222222222222222222222222222222222', 2);

      print(mainNotChangeLeavingList.length);
    } else {
      print('Not all lists are empty.');
    }

    emit(ApplyFilterState());
  }

  // List<FlightBookingPax> paxInfoListNew = [];

  // addPaxInfoListNew() {
  //   paxInfoListNew.add(FlightBookingPax(
  //     flightPaxType: ,
  //     pax:
  //   ));

  /*
 Pax pax = Pax(
          firstName: passenger.firstName ?? '',
          lastName: passenger.lastName ?? '',
          nationalityCode: passenger.nationality ?? "",
          passportNumber: passenger.passportNo ?? '',
          passportValidityDate: passenger.validityDate.toString() ?? '',
          dateOfBirth: passenger.birthday.toString() ?? '',
          genderType: passenger.gender == S.of(context).Man
              ? GenderType.male
              : GenderType.female,
          identityNumber: passenger.identityNumber ?? "",
        );


    */
}
