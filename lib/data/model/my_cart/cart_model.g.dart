// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartModel _$CartModelFromJson(Map<String, dynamic> json) => _CartModel(
      subTotal: (json['subTotal'] as num).toInt(),
      vat: (json['vat'] as num).toInt(),
      shippingFee: (json['shippingFee'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CartModelToJson(_CartModel instance) =>
    <String, dynamic>{
      'subTotal': instance.subTotal,
      'vat': instance.vat,
      'shippingFee': instance.shippingFee,
      'total': instance.total,
      'items': instance.items,
    };
