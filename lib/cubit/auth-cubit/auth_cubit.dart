import 'dart:convert';

import 'package:bamobile1/common/data/enums/invoice_info_type.dart';
import 'package:bamobile1/common/data/models/login_response.dart';
import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/cubit/currency-code-cubit/currency_code_cubit.dart';
import 'package:bamobile1/cubit/firabase-cubit/firebase_cubit.dart';
import 'package:bamobile1/generated/l10n.dart';
import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';
import 'package:bamobile1/helper/shared-preferences/shared_preferences_funs.dart';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String apiBaseUrlGeneral =
      "https://sandbox.kplus.com.tr/kplus/v0/General.svc/Rest/Json";
  // String apiBaseUrlGeneral =
  //     "https://ws.kplus.com.tr/alsafarigate/v0/General.svc/Rest/Json";
  final Dio _dio = Dio();
  String? token;
  String? email;
  String? password;
  String? phone;
  String? firstName;
  String? lastName;
  DateTime? birthday;
  String? countryPhone = '+90';
  bool obscurePasswordTextValue = true;
  bool? termsAndConditionCheckBoxValue = true;
  bool isPasswordValid = false;

  String? agentFirstName;
  String? agentLastName;
  String? agentEmail;
  String? agentPhone;
  String? agentFax;
  dynamic iataNo;
  double? agentCariBalance;
  String? agentCurrencyCode;
  String? agentUrlImage;
  String? companyName;
  String? companyPhone;
  String? companyAddressCity;
  String? companyAddressCountry;
  String? companyEmail;
  bool? thisUserIsAgent;

  String? invoiceInfoAddress;
  String? invoiceInfoCityCode;
  String? invoiceInfoCompanyName;
  String? invoiceInfoFirstName;
  String? invoiceInfoLastName;
  String? invoiceInfoTitle;
  InvoiceInfoType? invoiceInfoType;

  void updateTermsAndConditionCheckBoxInLoginView({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;

    emit(TermsAndConditionUpdateCheckBoxState());
  }

  void obscurePasswordText() {
    if (obscurePasswordTextValue == true) {
      obscurePasswordTextValue = false;
    } else {
      obscurePasswordTextValue = true;
    }
    emit(ObscurePasswordTextUpdateState());
  }

  Future<Token> createToken({required BuildContext context}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      //"X-Forwarded-For": "8.8.8.8",
      //"X-Real-IP": "8.8.8.8"
    };

    try {
      final response = await _dio.post(
        "$apiBaseUrlGeneral/CreateTokenV2",
        data: json.encode({
          "channelCredential": {
            "ChannelCode": "KplusTest",
            "ChannelPassword": "KplusC*L*L2024!"
            // "ChannelCode": "alsafarimobileapp",
            // "ChannelPassword": "Ni.lKq2d0w4!N!vz"
          }
        }),
        options: Options(
          headers: headers,
        ),
      );

      if (response.statusCode! > 400) {
        throw Exception("An error occurred: ${response.data}");
      }

      if (response.statusCode == 200) {
        final tokenData = Token.fromJson(response.data['Result']);
        //    print('TokenCode:::: ${tokenData.tokenCode}');

        token = tokenData.tokenCode;
        saveToken(token!);
        BlocProvider.of<CurrencyCodeCubit>(context).fetchCurrencyData();
        return tokenData;
      }

      throw Exception('Unexpected response from server');
    } catch (e) {
      // print('Error: $e');
      throw Exception('Failed to create token: $e');
    }
  }

  Future<LoginResponse> login({required BuildContext context}) async {
    emit(SignInLoading());

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    // CacheHelper.saveData(key: 'token', value: Data.tokenCode);

    final loginRequest = {
      "tokenCode": token,
      "email": email,
      "password": password,
    };
    //  print('1111111111111111111111111111111111111111111');
    final loginRequestJson = json.encode(loginRequest);
    //   print('2222222222222222222222222222222222');
    //  print('Login Request: $loginRequestJson');

    try {
      final response = await _dio.post(
        "$apiBaseUrlGeneral/Login",
        data: loginRequestJson,
        options: Options(
          headers: headers,
        ),
      );

      // if (response.statusCode! >= 400) {
      //   throw Exception("An error occurred: ${response.data}");
      // }
      print(response);

      final responseData = response.data;
      //    print('Login Response: $responseData');

      final Data = LoginResponse.fromJson(responseData);

      //     print('Login Response: $Data');

      if (Data.result != null) {
        if (Data.result!.baseUser != null) {
          saveEmail(Data.result!.baseUser!.email!);

          savePassword(Data.result!.baseUser!.password);
          saveFirstName(Data.result!.baseUser!.firstName!);
          saveLastName(Data.result!.baseUser!.lastName!);
          savePhone(Data.result!.baseUser!.phone!);
          saveBirthday(DateFormat('dd.MM.yyyy')
              .format(DateTime.parse(Data.result!.baseUser!.birthDate!)));
        }

        emit(SignInSuccuss());

        return Data;
      } else {
        emit(SignInFailure(errorMassage: Data.errorMessage));
        return Data;
      }

      // Return an instance of LoginResult
    } catch (e) {
      print('************************************');
      //    print('Login Error: $e');
      emit(SignInFailure(errorMassage: e.toString()));
      throw Exception('Failed to login: $e');
    }
  }

  Future<void> customerRegister({required BuildContext context}) async {
    emit(SignUpLoading());

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    // CacheHelper.saveData(key: 'token', value: Data.tokenCode);

    final customerRegisterRequest = {
      "tokenCode": token,
      "customer": {
        "User": {
          "FirstName": firstName,
          "LastName": lastName,
          "Email": email,
          "BirthDate": DateFormat('MM.dd.yyyy').format(birthday!),
          "GenderType": selectBetweenTwoTextValue == S.of(context).Man ? 1 : 0,
          "Phone": "$countryPhone$phone",
          "Password": password
        },
        "InvoiceInfo": {
          "TaxOffice": "test",
          "TaxNumber": "12236585",
          "CityCode": "TR",
          "Address": "dejejkgsddsfhjkkjhhkj"
        }
      }
    };
    //  print('1111111111111111111111111111111111111111111');
    final customerRegisterRequestJson = json.encode(customerRegisterRequest);
    //  print('2222222222222222222222222222222222');
    print('Login Request: $customerRegisterRequestJson');

    try {
      final response = await _dio.post(
        "$apiBaseUrlGeneral/CustomerRegister",
        data: customerRegisterRequestJson,
        options: Options(
          headers: headers,
        ),
      );

      // if (response.statusCode! >= 400) {
      //   throw Exception("An error occurred: ${response.data}");
      // }
      print(response);

      final responseData = response.data;
      //    print('Login Response: $responseData');

      final Data = LoginResponse.fromJson(responseData);

      //     print('Login Response: $Data');

      if (Data.result != null) {
        // saveEmail(email!);
        // savePassword(password!);

        emit(SignUpSuccuss());
        saveEmail(email!);
        savePassword(password!);
        saveFirstName(firstName!);
        saveLastName(lastName!);
        savePhone(phone!);
        saveBirthday(DateFormat('MM.dd.yyyy').format(birthday!));
        //  return Data;
      } else {
        emit(SignUpFailure(errorMassage: Data.errorMessage));
        // return Data;
      }

      // Return an instance of LoginResult
    } catch (e) {
      print('************************************');
      //    print('Login Error: $e');
      emit(SignUpFailure(errorMassage: e.toString()));
      throw Exception('Failed to login: $e');
    }
    // return Data;
  }

  // signIn() async {
  //   try {
  //     emit(SignInLoading());
  //     final response = await api.post(
  //       EndPoints.login,
  //       data: {
  //         ApiKey.tokenCode: "c71d0fe9-50b7-4ee8-ae35-70721b90a6aa",
  //         ApiKey.email: email,
  //         ApiKey.password: password,
  //       },
  //     );

  //     print('==========================================================');
  //     print(response);
  //     loginResponse = LoginResponse.fromJson(response);
  //     print(loginResponse!.errorCode);

  //     emit(SignInSuccuss());
  //   } catch (e) {
  //     print('-------------------------*-*-*');
  //     emit(SignInFailure(errorMassage: e.toString()));
  //   }

  //   // on ServerException catch (e) {
  //   //   emit(SignInFailure(errorMassage: e.errorModel.errorMessage));
  //   // }
  // }

  String? selectBetweenTwoTextValue;

  void selectBetweenTwoTextFunction(
      {required String firstText, required String secondText}) {
    if (selectBetweenTwoTextValue == firstText) {
      selectBetweenTwoTextValue = secondText;
    } else {
      selectBetweenTwoTextValue = firstText;
    }
    emit(AuthInitial());
  }

  bool isShowSelectDate = false;

  void showSelectDate({required bool value}) {
    isShowSelectDate = value;
    emit(AuthInitial());
  }
}
