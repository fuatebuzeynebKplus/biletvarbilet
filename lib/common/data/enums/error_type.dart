import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum ErrorType {
  errorNotFound(0, 'Error not found'),
  authenticationError(1, 'Authentication failed'),
  authorizationError(2, 'Authorization failed'),
  businessRule(3, 'Business rule violation'),
  invalidData(4, 'Invalid data entry'),
  networkError(5, 'Network is not reachable'),
  systemError(6, 'System error'),
  unknownError(7, 'Unknown error');

  final int value;
  final String description;

  const ErrorType(this.value, this.description);
 
 @override
  String toString() => description;

  static ErrorType fromString(String name) {
    switch (name) {
      case 'errorNotFound':
        return errorNotFound;
      case 'authenticationError':
        return authenticationError;
      case 'authorizationError':
        return authorizationError;
      case 'businessRule':
        return businessRule;
      case 'invalidData':
        return invalidData;
      case 'networkError':
        return networkError;
      case 'systemError':
        return systemError;
      case 'unknownError':
        return unknownError;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}