// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailModel _$DetailModelFromJson(Map<String, dynamic> json) => _DetailModel(
      id: (json['id'] as num).toInt(),
      reviewsCount: (json['reviewsCount'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String,
      isLiked: json['isLiked'] as bool,
      rating: (json['rating'] as num).toDouble(),
      productImages: (json['productImages'] as List<dynamic>)
          .map((e) => ProductImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$DetailModelToJson(_DetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reviewsCount': instance.reviewsCount,
      'title': instance.title,
      'description': instance.description,
      'isLiked': instance.isLiked,
      'rating': instance.rating,
      'productImages': instance.productImages,
      'price': instance.price,
    };
