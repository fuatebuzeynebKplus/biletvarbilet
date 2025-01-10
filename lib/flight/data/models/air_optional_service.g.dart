// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_optional_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirOptionalService _$AirOptionalServiceFromJson(Map<String, dynamic> json) =>
    AirOptionalService(
      description: json['Description'] as String?,
      optionalServiceRef: json['OptionalServiceRef'] as String?,
      price: json['Price'] == null
          ? null
          : Price.fromJson(json['Price'] as Map<String, dynamic>),
      segmentRef: json['SegmentRef'] as String?,
      selected: json['Selected'] as bool?,
      title: json['Title'] as String?,
    );

Map<String, dynamic> _$AirOptionalServiceToJson(AirOptionalService instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Description', instance.description);
  writeNotNull('OptionalServiceRef', instance.optionalServiceRef);
  writeNotNull('Price', instance.price?.toJson());
  writeNotNull('SegmentRef', instance.segmentRef);
  writeNotNull('Selected', instance.selected);
  writeNotNull('Title', instance.title);
  return val;
}
