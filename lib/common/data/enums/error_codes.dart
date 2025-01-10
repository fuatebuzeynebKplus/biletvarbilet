enum ErrorCode {
  ge0001, // Unauthorised access
  ge0002, // Invalid token code
  ge0003, // Token has been expired
  ge0004, // Invalid username or password
  ge0005, // Invalid email
  ge0006, // Invalid data
  ge0007, // Invalid username
  ge0008, // Invalid first name
  ge0009, // Invalid last name
  ge0010, // Invalid phone number
  ge0011, // Invalid company name
  ge0012, // This email is used
  ge0013, // This username is used
  ge0014, // Insufficient permission
  ge0015, // New password cannot be empty or less than 8 characters
  ge0016, // Data not found
  ge0017, // There should be an agent to save pax information
  ge0018, // Invalid birth date
  ge0019, // Invalid identity or passport number
  ge0020, // Invalid system pnr
  ge0021, // Invalid date
  ge0022, // Date range can be maximum 30 days
  ge0023, // Invalid address
  ge0024, // Invalid subject
  ge0025, // Invalid content
  ge0026, // Invalid departure point
  ge0027, // Invalid arrival point
  ge0028, // Price has been changed
  ge0029, // Agency is not activated
  ge0030, // Invalid IP address
  ge0031, // Invalid contact person
  ge0032, // Invalid invoice information
  ge0033, // Invalid tax number
  ge0034, // Invalid postal code
  ge0035, // Invalid invoice name
  ge0036, // Invalid city
  ge0037, // Reservation failed
  ge0038, // This method is only available for succeed reservations
  ge0039, // Ticket is already cancelled
  ge0040, // Reservation is already cancelled
  ge0041, // Reservation is already expired
  ge0042, // Ticket could not be cancelled
  ge0043, // Reservation could not be cancelled
  ge0044, // Invalid nationality
  ge0045, // Invalid pax information
  ge0046, // Invalid pax type
  ge0047, // Please provide the count of the passenger
  ge0048, // Minimum count of adult should be 1
  ge0049, // Invalid child age(s)
  ge0050, // Invalid result key(s)
  ge0051, // Passenger count is not compatible with related passenger type
  ge0052, // Insufficient quota
  ge0053, // Invalid product type
  ge0054, // Availability not found
  ge0055, // Invalid country
  ge0056, // Reservation updated by user from main account
  ge0057, // Your search result expired
  ge0058, // Canceled failed
  ge0059, // Invalid mileage program number
  ge0060, // Invalid HES code
  ge0061, // HES code is mandatory
  pe0001, // Invalid payment type
  pe0002, // Invalid card information
  pe0003, // 3D secure payment is mandatory
  pe0004, // Return url is mandatory for 3D secure payment
  pe0005, // Return url is mandatory for APS(Alternative Payment Systems)
  pe0006, // Balance is not enough
  pe0007, // Credit card not match payment option
}
