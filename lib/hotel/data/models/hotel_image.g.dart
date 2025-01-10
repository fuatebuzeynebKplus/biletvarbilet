// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelImage _$HotelImageFromJson(Map<String, dynamic> json) => HotelImage(
      imageTitle: json['ImageTitle'] as String?,
      imageType: (json['ImageType'] as num?)?.toInt(),
      imageUrl: json['ImageUrl'] as String?,
    );

Map<String, dynamic> _$HotelImageToJson(HotelImage instance) =>
    <String, dynamic>{
      'ImageUrl': instance.imageUrl,
      'ImageType': instance.imageType,
      'ImageTitle': instance.imageTitle,
    };
