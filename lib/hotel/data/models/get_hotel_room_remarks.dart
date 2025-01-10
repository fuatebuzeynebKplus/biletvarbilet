import 'package:json_annotation/json_annotation.dart';

part 'get_hotel_room_remarks.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class GetHotelRoomRemarks {
  String? errorCode;
  String? errorMessage;
  int? errorType;
  bool? hasError;
  List<String>? result;
  int? resultCount;
  String? userFriendlyErrorMessage;

  GetHotelRoomRemarks(
      {this.errorCode,
      this.errorMessage,
      this.errorType,
      this.hasError,
      this.result,
      this.resultCount,
      this.userFriendlyErrorMessage});

  factory GetHotelRoomRemarks.fromJson(Map<String, dynamic> json) =>
      _$GetHotelRoomRemarksFromJson(json);

  Map<String, dynamic> toJson() => _$GetHotelRoomRemarksToJson(this);
}

class GetHotelRoomRemarksJson {
  GetHotelRoomRemarks request;

  GetHotelRoomRemarksJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
