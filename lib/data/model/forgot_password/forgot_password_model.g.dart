// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForgotPasswordModel _$ForgotPasswordModelFromJson(Map<String, dynamic> json) =>
    _ForgotPasswordModel(
      email: json['email'] as String,
      password: json['password'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$ForgotPasswordModelToJson(
        _ForgotPasswordModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'code': instance.code,
    };
