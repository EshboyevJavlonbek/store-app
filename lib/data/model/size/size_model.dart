import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';

part 'size_model.freezed.dart';

part 'size_model.g.dart';

@freezed
abstract class SizeModel with _$SizeModel implements IJsonSerializable {
  const factory SizeModel({
    required int id,
    required String title,
  }) = _SizeModel;

  factory SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);
}
