import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:store_app/data/interfaces/serializable.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel implements IJsonSerializable{

 const factory UserModel({
    required String fullName,
    required String email,
    required String password,
  }) =_UserModel;

 factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
