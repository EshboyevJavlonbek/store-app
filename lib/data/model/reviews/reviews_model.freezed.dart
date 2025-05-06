// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewsModel {
  DateTime get created;
  String get userFullName;
  int get id;
  String get comment;
  num get rating;

  /// Create a copy of ReviewsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewsModelCopyWith<ReviewsModel> get copyWith =>
      _$ReviewsModelCopyWithImpl<ReviewsModel>(
          this as ReviewsModel, _$identity);

  /// Serializes this ReviewsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewsModel &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.userFullName, userFullName) ||
                other.userFullName == userFullName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, created, userFullName, id, comment, rating);

  @override
  String toString() {
    return 'ReviewsModel(created: $created, userFullName: $userFullName, id: $id, comment: $comment, rating: $rating)';
  }
}

/// @nodoc
abstract mixin class $ReviewsModelCopyWith<$Res> {
  factory $ReviewsModelCopyWith(
          ReviewsModel value, $Res Function(ReviewsModel) _then) =
      _$ReviewsModelCopyWithImpl;
  @useResult
  $Res call(
      {DateTime created,
      String userFullName,
      int id,
      String comment,
      num rating});
}

/// @nodoc
class _$ReviewsModelCopyWithImpl<$Res> implements $ReviewsModelCopyWith<$Res> {
  _$ReviewsModelCopyWithImpl(this._self, this._then);

  final ReviewsModel _self;
  final $Res Function(ReviewsModel) _then;

  /// Create a copy of ReviewsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = null,
    Object? userFullName = null,
    Object? id = null,
    Object? comment = null,
    Object? rating = null,
  }) {
    return _then(_self.copyWith(
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userFullName: null == userFullName
          ? _self.userFullName
          : userFullName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewsModel implements ReviewsModel {
  const _ReviewsModel(
      {required this.created,
      required this.userFullName,
      required this.id,
      required this.comment,
      required this.rating});
  factory _ReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsModelFromJson(json);

  @override
  final DateTime created;
  @override
  final String userFullName;
  @override
  final int id;
  @override
  final String comment;
  @override
  final num rating;

  /// Create a copy of ReviewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewsModelCopyWith<_ReviewsModel> get copyWith =>
      __$ReviewsModelCopyWithImpl<_ReviewsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewsModel &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.userFullName, userFullName) ||
                other.userFullName == userFullName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, created, userFullName, id, comment, rating);

  @override
  String toString() {
    return 'ReviewsModel(created: $created, userFullName: $userFullName, id: $id, comment: $comment, rating: $rating)';
  }
}

/// @nodoc
abstract mixin class _$ReviewsModelCopyWith<$Res>
    implements $ReviewsModelCopyWith<$Res> {
  factory _$ReviewsModelCopyWith(
          _ReviewsModel value, $Res Function(_ReviewsModel) _then) =
      __$ReviewsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {DateTime created,
      String userFullName,
      int id,
      String comment,
      num rating});
}

/// @nodoc
class __$ReviewsModelCopyWithImpl<$Res>
    implements _$ReviewsModelCopyWith<$Res> {
  __$ReviewsModelCopyWithImpl(this._self, this._then);

  final _ReviewsModel _self;
  final $Res Function(_ReviewsModel) _then;

  /// Create a copy of ReviewsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? created = null,
    Object? userFullName = null,
    Object? id = null,
    Object? comment = null,
    Object? rating = null,
  }) {
    return _then(_ReviewsModel(
      created: null == created
          ? _self.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userFullName: null == userFullName
          ? _self.userFullName
          : userFullName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      comment: null == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

// dart format on
