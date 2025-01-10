import 'package:bamobile1/hotel/data/models/additional_information.dart';
import 'package:bamobile1/hotel/data/models/hotel_availability.dart';
import 'package:bamobile1/hotel/data/models/hotel_search_filter.dart';
import 'package:bamobile1/hotel/data/models/hotels.dart';
import 'package:bamobile1/hotel/data/models/product_contract.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_search_result.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelSearchResult {
  String searchKey;
  String resultDate;
  String resultExpireDate;
  HotelSearchFilter searchFilter;
  List<HotelAvailability> hotels;
  AdditionalInformation? additionalInformation;
  List<ProductContract> contracts;
  bool? isFinished;

  HotelSearchResult(
      {required this.hotels,
      required this.resultDate,
      required this.resultExpireDate,
      required this.searchKey,
      required this.searchFilter,
      this.additionalInformation,
      required this.contracts,
      this.isFinished});

  factory HotelSearchResult.fromJson(Map<String, dynamic> json) =>
      _$HotelSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$HotelSearchResultToJson(this);
}

class HotelSearchResultJson {
  HotelSearchResult request;

  HotelSearchResultJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
