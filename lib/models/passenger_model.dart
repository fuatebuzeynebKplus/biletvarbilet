import 'package:bamobile1/flight/data/models/mileage_program.dart';

class PassengerCardData {
  String? firstName;
  String? lastName;
  String? nationality;
  DateTime? birthday;
  String? passportNo;
  DateTime? validityDate;
  String? identityNumber;
  List<MileageProgram>? mileMM = [];
  String? phoneNo;
  String? email;
  String? countryPhone;
  String? gender;
  bool itIsOk;

  PassengerCardData(
      {this.firstName,
      this.lastName,
      this.nationality,
      this.birthday,
      this.passportNo,
      this.validityDate,
      this.mileMM,
      this.phoneNo,
      this.email,
      this.countryPhone,
      this.identityNumber,
      this.gender,
      this.itIsOk = false});

//print all data    print(flightTicketCubit.cardDataList);
//print first list   print(flightTicketCubit.cardDataList[0]);
//this function helped for print data
  @override
  String toString() {
    return 'PassengerCardData:\n'
        'First Name: $firstName\n'
        'Last Name: $lastName\n'
        'Nationality: $nationality\n'
        'Birthday: $birthday\n'
        'Passport No: $passportNo\n'
        'Validity Date: $validityDate\n'
        'TK FFN: $mileMM\n'
        'Phone No: $phoneNo\n'
        'Email: $email\n'
        'identityNumber: $identityNumber\n'
        'Country Phone: $countryPhone\n'
        'Gender: $gender\n'
        'It Is Ok: $itIsOk\n----------------------------------';
  }
}
