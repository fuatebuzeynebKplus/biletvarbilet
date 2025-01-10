class HotelGuestCardDataModel {
  String? firstName;
  String? lastName;

  String? gender;
  DateTime? birthday;

  bool itIsOk;

  HotelGuestCardDataModel(
      {this.firstName,
      this.lastName,
      this.gender,
      this.birthday,
      this.itIsOk = false});

//print all data    print(flightTicketCubit.cardDataList);
//print first list   print(flightTicketCubit.cardDataList[0]);
//this function helped for print data
  @override
  String toString() {
    return 'GustCArdData:\n'
        'First Name: $firstName\n'
        'Last Name: $lastName\n'
        'Gender: $gender\n'
        'Birthday: $birthday\n'
        'It Is Ok: $itIsOk\n----------------------------------';
  }
}
