import 'package:bamobile1/flight/data/models/air_result.dart';
import 'package:bamobile1/flight/data/models/air_search_result.dart';

class ResponseFlightModel extends AirSearchResult {
  List<AirResult> flight;
  List<AirResult> flightGroup;

  ResponseFlightModel({required this.flight, required this.flightGroup});
}
