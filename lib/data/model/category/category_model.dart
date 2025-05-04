import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';
part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel implements IJsonSerializable{

  const factory  CategoryModel({
    required int id,
    required String title,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic>json) => _$CategoryModelFromJson(json);
}
