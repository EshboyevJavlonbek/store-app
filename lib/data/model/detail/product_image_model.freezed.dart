// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductImageModel {
  int get id;
  String get image;

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductImageModelCopyWith<ProductImageModel> get copyWith =>
      _$ProductImageModelCopyWithImpl<ProductImageModel>(
          this as ProductImageModel, _$identity);

  /// Serializes this ProductImageModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductImageModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, image);

  @override
  String toString() {
    return 'ProductImageModel(id: $id, image: $image)';
  }
}

/// @nodoc
abstract mixin class $ProductImageModelCopyWith<$Res> {
  factory $ProductImageModelCopyWith(
          ProductImageModel value, $Res Function(ProductImageModel) _then) =
      _$ProductImageModelCopyWithImpl;
  @useResult
  $Res call({int id, String image});
}

/// @nodoc
class _$ProductImageModelCopyWithImpl<$Res>
    implements $ProductImageModelCopyWith<$Res> {
  _$ProductImageModelCopyWithImpl(this._self, this._then);

  final ProductImageModel _self;
  final $Res Function(ProductImageModel) _then;

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? image = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProductImageModel implements ProductImageModel {
  const _ProductImageModel({required this.id, required this.image});
  factory _ProductImageModel.fromJson(Map<String, dynamic> json) =>
      _$ProductImageModelFromJson(json);

  @override
  final int id;
  @override
  final String image;

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductImageModelCopyWith<_ProductImageModel> get copyWith =>
      __$ProductImageModelCopyWithImpl<_ProductImageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProductImageModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductImageModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, image);

  @override
  String toString() {
    return 'ProductImageModel(id: $id, image: $image)';
  }
}

/// @nodoc
abstract mixin class _$ProductImageModelCopyWith<$Res>
    implements $ProductImageModelCopyWith<$Res> {
  factory _$ProductImageModelCopyWith(
          _ProductImageModel value, $Res Function(_ProductImageModel) _then) =
      __$ProductImageModelCopyWithImpl;
  @override
  @useResult
  $Res call({int id, String image});
}

/// @nodoc
class __$ProductImageModelCopyWithImpl<$Res>
    implements _$ProductImageModelCopyWith<$Res> {
  __$ProductImageModelCopyWithImpl(this._self, this._then);

  final _ProductImageModel _self;
  final $Res Function(_ProductImageModel) _then;

  /// Create a copy of ProductImageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? image = null,
  }) {
    return _then(_ProductImageModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
