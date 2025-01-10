import 'package:bamobile1/common/data/models/token.dart';
import 'package:bamobile1/flight/data/models/advanced_options.dart';
import 'package:bamobile1/hotel/data/models/destination.dart';
import 'package:bamobile1/hotel/data/models/hotels.dart';
import 'package:bamobile1/hotel/data/models/room_pax_definition.dart';
import 'package:bamobile1/flight/data/models/markup.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_search_filter.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class HotelSearchFilter {
  List<Destination> destinations;
  List<Hotels> hotel;
  String checkInDate;
  String checkOutDate;
  bool? isAsync;
  bool? isforCms;
  AdvancedOptions? advancedOptions;
  String nationalityCode;
  bool? onRequest;
  List<RoomPaxDefinition> rooms;
  String? searchDate;
  bool? showMultipleRate;
  Token token;

  HotelSearchFilter(
      {required this.destinations,
      required this.hotel,
      required this.checkInDate,
      required this.checkOutDate,
      this.isAsync,
      this.isforCms,
      this.advancedOptions,
      required this.nationalityCode,
      this.onRequest,
      required this.rooms,
      this.searchDate,
      this.showMultipleRate,
      required this.token});

  factory HotelSearchFilter.fromJson(Map<String, dynamic> json) =>
      _$HotelSearchFilterFromJson(json);

  Map<String, dynamic> toJson() => _$HotelSearchFilterToJson(this);
}

class HotelSearchFilterJson {
  HotelSearchFilter request;

  HotelSearchFilterJson({required this.request});

  Map<String, dynamic> toJson() {
    return {
      'filter': request.toJson(),
    };
  }
}
