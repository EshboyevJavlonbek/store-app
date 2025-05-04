import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';

import 'product_image_model.dart';

part 'detail_model.freezed.dart';
part 'detail_model.g.dart';

@freezed
abstract class DetailModel with _$DetailModel implements IJsonSerializable {
  const factory DetailModel({
    required int id,
    required int reviewsCount,
    required String title,
    required String description,
    required bool isLiked,
    required double rating,
    required List<ProductImageModel> productImages,
    required double price,
  }) = _DetailModel;

  factory DetailModel.fromJson(Map<String, dynamic> json) => _$DetailModelFromJson(json);

}


