import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';

part 'cart_item_model.freezed.dart';

part 'cart_item_model.g.dart';

@freezed
abstract class CartItemModel with _$CartItemModel implements IJsonSerializable {
  const factory CartItemModel({
    required int id,
    required String title,
    required String? size,
    required int price,
    required String image,
    required int quantity,
  }) = _CartItemModel;

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);
}
