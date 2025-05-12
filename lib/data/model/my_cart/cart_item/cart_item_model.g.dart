// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartItemModel _$CartItemModelFromJson(Map<String, dynamic> json) =>
    _CartItemModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      size: json['size'] as String?,
      price: (json['price'] as num).toInt(),
      image: json['image'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CartItemModelToJson(_CartItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'size': instance.size,
      'price': instance.price,
      'image': instance.image,
      'quantity': instance.quantity,
    };
