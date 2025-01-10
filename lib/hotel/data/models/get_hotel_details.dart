import 'package:bamobile1/common/data/models/payment_verification_result.dart';
import 'package:bamobile1/hotel/data/models/additional_tab.dart';
import 'package:bamobile1/hotel/data/models/hotel_distance.dart';
import 'package:bamobile1/hotel/data/models/hotel_facility.dart';
import 'package:bamobile1/hotel/data/models/hotel_image.dart';
import 'package:bamobile1/hotel/data/models/product_category.dart';
import 'package:bamobile1/hotel/data/models/seo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_hotel_details.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class GetHotelDetails {
  String? hotelCode;
  String? hotelName;
  String? address;
  int? star;
  GeoLocation? geoLocation;
  String? summaryText;
  List<HotelImage>? hotelImages;
  List<HotelFacility>? hotelFacilities;
  List<HotelDistance>? hotelDistance;
  Seo? seoInformation;
  List<ProductCategory>? hotelCategories;
  List<AdditionalTab>? additionalTabs;
  String? searchingWords;
  int? rating;

  GetHotelDetails(
      {this.additionalTabs,
      this.address,
      this.geoLocation,
      this.hotelCategories,
      this.hotelCode,
      this.hotelDistance,
      this.hotelFacilities,
      this.hotelImages,
      this.hotelName,
      this.rating,
      this.searchingWords,
      this.seoInformation,
      this.star,
      this.summaryText});

  factory GetHotelDetails.fromJson(Map<String, dynamic> json) =>
      _$GetHotelDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$GetHotelDetailsToJson(this);
}

class GetHotelDetailsJson {
  GetHotelDetails request;

  GetHotelDetailsJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
