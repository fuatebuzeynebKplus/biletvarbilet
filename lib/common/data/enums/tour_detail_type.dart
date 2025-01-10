import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'value')
enum TourDetailType {
  program(0, 'Program'),
  media(1, 'Media'),
  region(2, 'Region'),
  alternativeDate(3, 'Alternative Date'),
  extraTour(4, 'Extra Tour'),
  departurePoint(5, 'Departure Point'),
  guideLanguage(6, 'Guide Language'),
  category(7, 'Category'),
  tourMadeLocation(8, 'Tour Made Location'),
  cancellationPolicy(9, 'Cancellation Policy'),
  cost(10, 'Cost'),
  additionalService(11, 'Additional Service');

  final int value;
  final String description;

  const TourDetailType(this.value, this.description);

  String toString() => description;

  static TourDetailType fromString(String name) {
    switch (name) {
      case 'Program':
        return program;
      case 'Media':
        return media;
      case 'Region':
        return region;
      case 'Alternative Date':
        return alternativeDate;
      case 'Extra Tour':
        return extraTour;
      case 'Departure Point':
        return departurePoint;
      case 'Guide Language':
        return guideLanguage;
      case 'Category':
        return category;
      case 'Tour Made Location':
        return tourMadeLocation;
      case 'Cancellation Policy':
        return cancellationPolicy;
      case 'Cost':
        return cost;
      case 'Additional Service':
        return additionalService;
      default:
        throw ArgumentError.value(name, 'name');
    }
  }
}
