import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/hotel/data/models/destination.dart';
import 'package:bamobile1/hotel/data/models/hotel_search_filter.dart';
import 'package:bamobile1/hotel/data/models/hotels.dart';
import 'package:bamobile1/hotel/data/models/room_pax_definition.dart';
import 'package:bamobile1/flight/data/models/advanced_options.dart';
import 'package:bamobile1/flight/data/models/markup.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_hotel.g.dart';

@JsonSerializable(
    explicitToJson: true, fieldRename: FieldRename.pascal, includeIfNull: false)
class SearchHotel {
  List<Destination> destinationId;
  List<Hotels>? hotelCode;
  AdvancedOptions? hotel;
  List<HotelSearchFilter>? hotelSearchFilter;
  String? checkInDate;
  String? checkOutDate;
  String? nationalityCode;
  List<RoomPaxDefinition>? rooms;
  String? showMultipleRate;
  Token? token;
  Markup? markup;

  SearchHotel(
      {required this.destinationId,
      this.hotelCode,
      this.hotel,
      this.hotelSearchFilter,
      this.checkInDate,
      this.checkOutDate,
      this.nationalityCode,
      this.rooms,
      this.showMultipleRate,
      this.token,
      this.markup});

  factory SearchHotel.fromJson(Map<String, dynamic> json) =>
      _$SearchHotelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchHotelToJson(this);
}

class SearchHotelJson {
  SearchHotel request;

  SearchHotelJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'request': request.toJson(),
    };
  }
}
