import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';
import 'package:store_app/data/model/my_cart/cart_item/cart_item_model.dart';

part 'cart_model.freezed.dart';

part 'cart_model.g.dart';

@freezed
abstract class CartModel with _$CartModel implements IJsonSerializable {
  const factory CartModel({
    required int subTotal,
    required int vat,
    required int shippingFee,
    required int total,
    required List<CartItemModel> items,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) => _$CartModelFromJson(json);
}
