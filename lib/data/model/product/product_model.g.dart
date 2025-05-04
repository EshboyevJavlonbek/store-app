// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: (json['id'] as num).toInt(),
      image: json['image'] as String,
      title: json['title'] as String,
      price: (json['price'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
      isLiked: json['isLiked'] as bool,
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'price': instance.price,
      'discount': instance.discount,
      'isLiked': instance.isLiked,
    };
