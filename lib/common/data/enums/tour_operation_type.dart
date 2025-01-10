import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum TourOperationType {
  dailyTour(0, 'Daily Tour'),
  accomodatedTour(1, 'Accomodated Tour'),
  tailorMade(2, 'Tailor Made'),
  cruise(3, 'Cruise'),
  organization(4, 'Organization');

  final int value;
  final String description;

  const TourOperationType(this.value, this.description);

  String toString() => description;

  static TourOperationType fromString(String name) {
    switch (name) {
      case 'Daily Tour':
        return dailyTour;
      case 'Accomodated Tour':
        return accomodatedTour;
      case 'Tailor Made':
        return tailorMade;
      case 'Cruie':
        return cruise;
      case 'Organization':
        return organization;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
