// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductImageModel _$ProductImageModelFromJson(Map<String, dynamic> json) =>
    _ProductImageModel(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$ProductImageModelToJson(_ProductImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
    };
