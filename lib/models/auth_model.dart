// class SignInModel {
//   final bool errorType;
//   final String errorMassage;

//   final SignInResultModel? result;

//   SignInModel({
//     required this.errorType,
//     required this.errorMassage,
//     this.result,
//   });

//   factory SignInModel.fromJson(Map<String, dynamic> jsonData) {
//     return SignInModel(
//       errorType: jsonData['ErrorType'],
//       errorMassage: jsonData['ErrorMessage'],
//       result: jsonData['Result'] != null
//           ? SignInResultModel.fromJson(jsonData['Result'])
//           : null,
//       // name: jsonData['user'][ApiKey.name],
//       // address: jsonData['user'][ApiKey.location],
//     );
//   }
// }

// class SignInResultModel {
//   final SignInBaseUserModel? data;

//   SignInResultModel({this.data});

//   factory SignInResultModel.fromJson(Map<String, dynamic> jsonData) {
//     return SignInResultModel(
//       data: jsonData['BaseUser'],
//     );
//   }
// }

// class SignInBaseUserModel {}
