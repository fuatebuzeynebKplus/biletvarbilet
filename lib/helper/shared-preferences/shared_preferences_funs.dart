import 'package:bamobile1/helper/shared-preferences/cache_hekper.dart';
import 'package:bamobile1/helper/shared-preferences/service_locator.dart';

void langFun(String value) {
  getIt<CacheHelper>().saveData(key: 'Lang', value: value);
}

void saveEmail(String value) {
  getIt<CacheHelper>().saveData(key: 'email', value: value);
}

void savePassword(String value) {
  getIt<CacheHelper>().saveData(key: 'password', value: value);
}

void saveFirstName(String value) {
  getIt<CacheHelper>().saveData(key: 'firstName', value: value);
}

void saveLastName(String value) {
  getIt<CacheHelper>().saveData(key: 'lastName', value: value);
}

void savePhone(String value) {
  getIt<CacheHelper>().saveData(key: 'phone', value: value);
}

void saveBirthday(String value) {
  getIt<CacheHelper>().saveData(key: 'birthday', value: value);
}

void saveToken(String value) {
  getIt<CacheHelper>().saveData(key: 'token', value: value);
}

void saveCurrencyCode(String value) {
  getIt<CacheHelper>().saveData(key: 'CurrencyCode', value: value);
}

void saveCurrencyName(String value) {
  getIt<CacheHelper>().saveData(key: 'CurrencyName', value: value);
}

void saveVersionAndroid(String value) {
  getIt<CacheHelper>().saveData(key: 'versionAndroid', value: value);
}

void saveVersionIos(String value) {
  getIt<CacheHelper>().saveData(key: 'versionIos', value: value);
}
