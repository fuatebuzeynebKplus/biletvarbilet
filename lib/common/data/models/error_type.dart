class ErrorType {
  final int value;
  final String name;
  final String description;

  const ErrorType._(this.value, this.name, this.description);

  static const ErrorType errorNotFound =
      ErrorType._(0, 'ErrorNotFound', 'Error not found');
  static const ErrorType authenticationError =
      ErrorType._(1, 'AuthenticationError', 'Authentication failed');
  static const ErrorType authorizationError =
      ErrorType._(2, 'AuthorizationError', 'Authorization failed');
  static const ErrorType businessRule =
      ErrorType._(3, 'BusinessRule', 'Business rule violation');
  static const ErrorType invalidData =
      ErrorType._(4, 'InvalidData', 'Invalid data entry');
  static const ErrorType networkError =
      ErrorType._(5, 'NetworkError', 'Network is not reachable');
  static const ErrorType systemError =
      ErrorType._(6, 'SystemError', 'System error');
  static const ErrorType unknownError =
      ErrorType._(7, 'UnknownError', 'Unknown error');
}
