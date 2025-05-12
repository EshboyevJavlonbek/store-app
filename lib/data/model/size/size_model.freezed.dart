// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'size_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SizeModel {
  int get id;
  String get title;

  /// Create a copy of SizeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SizeModelCopyWith<SizeModel> get copyWith =>
      _$SizeModelCopyWithImpl<SizeModel>(this as SizeModel, _$identity);

  /// Serializes this SizeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SizeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @override
  String toString() {
    return 'SizeModel(id: $id, title: $title)';
  }
}

/// @nodoc
abstract mixin class $SizeModelCopyWith<$Res> {
  factory $SizeModelCopyWith(SizeModel value, $Res Function(SizeModel) _then) =
      _$SizeModelCopyWithImpl;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$SizeModelCopyWithImpl<$Res> implements $SizeModelCopyWith<$Res> {
  _$SizeModelCopyWithImpl(this._self, this._then);

  final SizeModel _self;
  final $Res Function(SizeModel) _then;

  /// Create a copy of SizeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SizeModel implements SizeModel {
  const _SizeModel({required this.id, required this.title});
  factory _SizeModel.fromJson(Map<String, dynamic> json) =>
      _$SizeModelFromJson(json);

  @override
  final int id;
  @override
  final String title;

  /// Create a copy of SizeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SizeModelCopyWith<_SizeModel> get copyWith =>
      __$SizeModelCopyWithImpl<_SizeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SizeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SizeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @override
  String toString() {
    return 'SizeModel(id: $id, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$SizeModelCopyWith<$Res>
    implements $SizeModelCopyWith<$Res> {
  factory _$SizeModelCopyWith(
          _SizeModel value, $Res Function(_SizeModel) _then) =
      __$SizeModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$SizeModelCopyWithImpl<$Res> implements _$SizeModelCopyWith<$Res> {
  __$SizeModelCopyWithImpl(this._self, this._then);

  final _SizeModel _self;
  final $Res Function(_SizeModel) _then;

  /// Create a copy of SizeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_SizeModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
