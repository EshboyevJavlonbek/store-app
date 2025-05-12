import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';

part 'forgot_password_model.freezed.dart';
part 'forgot_password_model.g.dart';

@freezed
abstract class ForgotPasswordModel with _$ForgotPasswordModel implements IJsonSerializable{

  const factory ForgotPasswordModel({
    required String email,
    required String password,
    required String code,
  }) = _ForgotPasswordModel;
  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => _$ForgotPasswordModelFromJson(json);
}
