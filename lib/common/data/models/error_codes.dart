import 'package:bamobile1/common/data/enums/error_codes.dart';

class ErrorCodes {
  static const Map<ErrorCode, String> descriptions = {
    ErrorCode.ge0001: 'Unauthorised access',
    ErrorCode.ge0002: 'Invalid token code',
    ErrorCode.ge0003: 'Token has been expired',
    ErrorCode.ge0004: 'Invalid username or password',
    ErrorCode.ge0005: 'Invalid email',
    ErrorCode.ge0006: 'Invalid data',
    ErrorCode.ge0007: 'Invalid username',
    ErrorCode.ge0008: 'Invalid first name',
    ErrorCode.ge0009: 'Invalid last name',
    ErrorCode.ge0010: 'Invalid phone number',
    ErrorCode.ge0011: 'Invalid company name',
    ErrorCode.ge0012: 'This email is used',
    ErrorCode.ge0013: 'This username is used',
    ErrorCode.ge0014: 'Insufficient permission',
    ErrorCode.ge0015: 'New password cannot be empty or less than 8 characters',
    ErrorCode.ge0016: 'Data not found',
    ErrorCode.ge0017: 'There should be an agent to save pax information',
    ErrorCode.ge0018: 'Invalid birth date',
    ErrorCode.ge0019: 'Invalid identity or passport number00000000000000000',
    ErrorCode.ge0020: 'Invalid system pnr',
    ErrorCode.ge0021: 'Invalid date',
    ErrorCode.ge0022: 'Date range can be maximum 30 days',
    ErrorCode.ge0023: 'Invalid address',
    ErrorCode.ge0024: 'Invalid subject',
    ErrorCode.ge0025: 'Invalid content',
    ErrorCode.ge0026: 'Invalid departure point',
    ErrorCode.ge0027: 'Invalid arrival point',
    ErrorCode.ge0028: 'Price has been changed',
    ErrorCode.ge0029: 'Agency is not activated',
    ErrorCode.ge0030: 'Invalid IP address',
    ErrorCode.ge0031: 'Invalid contact person',
    ErrorCode.ge0032: 'Invalid invoice information',
    ErrorCode.ge0033: 'Invalid tax number',
    ErrorCode.ge0034: 'Invalid postal code',
    ErrorCode.ge0035: 'Invalid invoice name',
    ErrorCode.ge0036: 'Invalid city',
    ErrorCode.ge0037: 'Reservation failed',
    ErrorCode.ge0038: 'This method is only available for succeed reservations',
    ErrorCode.ge0039: 'Ticket is already cancelled',
    ErrorCode.ge0040: 'Reservation is already cancelled',
    ErrorCode.ge0041: 'Reservation is already expired',
    ErrorCode.ge0042: 'Ticket could not be cancelled',
    ErrorCode.ge0043: 'Reservation could not be cancelled',
    ErrorCode.ge0044: 'Invalid nationality',
    ErrorCode.ge0045: 'Invalid pax information',
    ErrorCode.ge0046: 'Invalid pax type',
    ErrorCode.ge0047: 'Please provide the count of the passenger',
    ErrorCode.ge0048: 'Minimum count of adult should be 1',
    ErrorCode.ge0049: 'Invalid child age(s)',
    ErrorCode.ge0050: 'Invalid result key(s)',
    ErrorCode.ge0051:
        'Passenger count is not compatible with related passenger type',
    ErrorCode.ge0052: 'Insufficient quota',
    ErrorCode.ge0053: 'Invalid product type',
    ErrorCode.ge0054: 'Availability not found',
    ErrorCode.ge0055: 'Invalid country',
    ErrorCode.ge0056: 'Reservation updated by user from main account',
    ErrorCode.ge0057: 'Your search result expired',
    ErrorCode.ge0058: 'Canceled failed',
    ErrorCode.ge0059: 'Invalid mileage program number',
    ErrorCode.ge0060: 'Invalid HES code',
    ErrorCode.ge0061: 'HES code is mandatory',
    ErrorCode.pe0001: 'Invalid payment type',
    ErrorCode.pe0002: 'Invalid card information',
    ErrorCode.pe0003: '3D secure payment is mandatory',
    ErrorCode.pe0004: 'Return url is mandatory for 3D secure payment',
    ErrorCode.pe0005:
        'Return url is mandatory for APS(Alternative Payment Systems)',
    ErrorCode.pe0006: 'Balance is not enough',
    ErrorCode.pe0007: 'Credit card does not match payment option',
  };
}

/*
void main() {
  // Example usage
  ErrorCode errorCode = ErrorCode.ge0001;
  String description = ErrorCodes.descriptions[errorCode];
  print(description); // Output: "Unauthorised access"
}*/
