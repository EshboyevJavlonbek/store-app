import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';
part'reviews_model.freezed.dart';
part 'reviews_model.g.dart';

@freezed
abstract class ReviewsModel with _$ReviewsModel implements IJsonSerializable{
  const factory ReviewsModel({
    required DateTime created,
    required String userFullName,
    required int id,
    required String comment,
    required num rating,
  }) = _ReviewsModel;

  factory ReviewsModel.fromJson(Map<String, dynamic> json) => _$ReviewsModelFromJson(json);
}
