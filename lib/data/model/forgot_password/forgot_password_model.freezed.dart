// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPasswordModel {
  String get email;
  String get password;
  String get code;

  /// Create a copy of ForgotPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForgotPasswordModelCopyWith<ForgotPasswordModel> get copyWith =>
      _$ForgotPasswordModelCopyWithImpl<ForgotPasswordModel>(
          this as ForgotPasswordModel, _$identity);

  /// Serializes this ForgotPasswordModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForgotPasswordModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, code);

  @override
  String toString() {
    return 'ForgotPasswordModel(email: $email, password: $password, code: $code)';
  }
}

/// @nodoc
abstract mixin class $ForgotPasswordModelCopyWith<$Res> {
  factory $ForgotPasswordModelCopyWith(
          ForgotPasswordModel value, $Res Function(ForgotPasswordModel) _then) =
      _$ForgotPasswordModelCopyWithImpl;
  @useResult
  $Res call({String email, String password, String code});
}

/// @nodoc
class _$ForgotPasswordModelCopyWithImpl<$Res>
    implements $ForgotPasswordModelCopyWith<$Res> {
  _$ForgotPasswordModelCopyWithImpl(this._self, this._then);

  final ForgotPasswordModel _self;
  final $Res Function(ForgotPasswordModel) _then;

  /// Create a copy of ForgotPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? code = null,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ForgotPasswordModel implements ForgotPasswordModel {
  const _ForgotPasswordModel(
      {required this.email, required this.password, required this.code});
  factory _ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordModelFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String code;

  /// Create a copy of ForgotPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForgotPasswordModelCopyWith<_ForgotPasswordModel> get copyWith =>
      __$ForgotPasswordModelCopyWithImpl<_ForgotPasswordModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ForgotPasswordModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgotPasswordModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, code);

  @override
  String toString() {
    return 'ForgotPasswordModel(email: $email, password: $password, code: $code)';
  }
}

/// @nodoc
abstract mixin class _$ForgotPasswordModelCopyWith<$Res>
    implements $ForgotPasswordModelCopyWith<$Res> {
  factory _$ForgotPasswordModelCopyWith(_ForgotPasswordModel value,
          $Res Function(_ForgotPasswordModel) _then) =
      __$ForgotPasswordModelCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String password, String code});
}

/// @nodoc
class __$ForgotPasswordModelCopyWithImpl<$Res>
    implements _$ForgotPasswordModelCopyWith<$Res> {
  __$ForgotPasswordModelCopyWithImpl(this._self, this._then);

  final _ForgotPasswordModel _self;
  final $Res Function(_ForgotPasswordModel) _then;

  /// Create a copy of ForgotPasswordModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? code = null,
  }) {
    return _then(_ForgotPasswordModel(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _self.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
