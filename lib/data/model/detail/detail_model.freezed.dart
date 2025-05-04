// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailModel {
  int get id;
  int get reviewsCount;
  String get title;
  String get description;
  bool get isLiked;
  double get rating;
  List<ProductImageModel> get productImages;
  double get price;

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DetailModelCopyWith<DetailModel> get copyWith =>
      _$DetailModelCopyWithImpl<DetailModel>(this as DetailModel, _$identity);

  /// Serializes this DetailModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DetailModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reviewsCount, reviewsCount) ||
                other.reviewsCount == reviewsCount) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other.productImages, productImages) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      reviewsCount,
      title,
      description,
      isLiked,
      rating,
      const DeepCollectionEquality().hash(productImages),
      price);

  @override
  String toString() {
    return 'DetailModel(id: $id, reviewsCount: $reviewsCount, title: $title, description: $description, isLiked: $isLiked, rating: $rating, productImages: $productImages, price: $price)';
  }
}

/// @nodoc
abstract mixin class $DetailModelCopyWith<$Res> {
  factory $DetailModelCopyWith(
          DetailModel value, $Res Function(DetailModel) _then) =
      _$DetailModelCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int reviewsCount,
      String title,
      String description,
      bool isLiked,
      double rating,
      List<ProductImageModel> productImages,
      double price});
}

/// @nodoc
class _$DetailModelCopyWithImpl<$Res> implements $DetailModelCopyWith<$Res> {
  _$DetailModelCopyWithImpl(this._self, this._then);

  final DetailModel _self;
  final $Res Function(DetailModel) _then;

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reviewsCount = null,
    Object? title = null,
    Object? description = null,
    Object? isLiked = null,
    Object? rating = null,
    Object? productImages = null,
    Object? price = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsCount: null == reviewsCount
          ? _self.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      productImages: null == productImages
          ? _self.productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<ProductImageModel>,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DetailModel implements DetailModel {
  const _DetailModel(
      {required this.id,
      required this.reviewsCount,
      required this.title,
      required this.description,
      required this.isLiked,
      required this.rating,
      required final List<ProductImageModel> productImages,
      required this.price})
      : _productImages = productImages;
  factory _DetailModel.fromJson(Map<String, dynamic> json) =>
      _$DetailModelFromJson(json);

  @override
  final int id;
  @override
  final int reviewsCount;
  @override
  final String title;
  @override
  final String description;
  @override
  final bool isLiked;
  @override
  final double rating;
  final List<ProductImageModel> _productImages;
  @override
  List<ProductImageModel> get productImages {
    if (_productImages is EqualUnmodifiableListView) return _productImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productImages);
  }

  @override
  final double price;

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DetailModelCopyWith<_DetailModel> get copyWith =>
      __$DetailModelCopyWithImpl<_DetailModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DetailModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DetailModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reviewsCount, reviewsCount) ||
                other.reviewsCount == reviewsCount) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality()
                .equals(other._productImages, _productImages) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      reviewsCount,
      title,
      description,
      isLiked,
      rating,
      const DeepCollectionEquality().hash(_productImages),
      price);

  @override
  String toString() {
    return 'DetailModel(id: $id, reviewsCount: $reviewsCount, title: $title, description: $description, isLiked: $isLiked, rating: $rating, productImages: $productImages, price: $price)';
  }
}

/// @nodoc
abstract mixin class _$DetailModelCopyWith<$Res>
    implements $DetailModelCopyWith<$Res> {
  factory _$DetailModelCopyWith(
          _DetailModel value, $Res Function(_DetailModel) _then) =
      __$DetailModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int reviewsCount,
      String title,
      String description,
      bool isLiked,
      double rating,
      List<ProductImageModel> productImages,
      double price});
}

/// @nodoc
class __$DetailModelCopyWithImpl<$Res> implements _$DetailModelCopyWith<$Res> {
  __$DetailModelCopyWithImpl(this._self, this._then);

  final _DetailModel _self;
  final $Res Function(_DetailModel) _then;

  /// Create a copy of DetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? reviewsCount = null,
    Object? title = null,
    Object? description = null,
    Object? isLiked = null,
    Object? rating = null,
    Object? productImages = null,
    Object? price = null,
  }) {
    return _then(_DetailModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reviewsCount: null == reviewsCount
          ? _self.reviewsCount
          : reviewsCount // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isLiked: null == isLiked
          ? _self.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      productImages: null == productImages
          ? _self._productImages
          : productImages // ignore: cast_nullable_to_non_nullable
              as List<ProductImageModel>,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
