import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';
part 'product_image_model.freezed.dart';
part 'product_image_model.g.dart';

@freezed
abstract class ProductImageModel with _$ProductImageModel implements IJsonSerializable{

  const factory ProductImageModel({
    required int id,
    required String image,
  })= _ProductImageModel;

  factory ProductImageModel.fromJson(Map<String, dynamic> json) => _$ProductImageModelFromJson(json);
}