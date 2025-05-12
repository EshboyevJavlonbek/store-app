// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CartModel {
  int get subTotal;
  int get vat;
  int get shippingFee;
  int get total;
  List<CartItemModel> get items;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CartModelCopyWith<CartModel> get copyWith =>
      _$CartModelCopyWithImpl<CartModel>(this as CartModel, _$identity);

  /// Serializes this CartModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CartModel &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.shippingFee, shippingFee) ||
                other.shippingFee == shippingFee) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subTotal, vat, shippingFee,
      total, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'CartModel(subTotal: $subTotal, vat: $vat, shippingFee: $shippingFee, total: $total, items: $items)';
  }
}

/// @nodoc
abstract mixin class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) _then) =
      _$CartModelCopyWithImpl;
  @useResult
  $Res call(
      {int subTotal,
      int vat,
      int shippingFee,
      int total,
      List<CartItemModel> items});
}

/// @nodoc
class _$CartModelCopyWithImpl<$Res> implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._self, this._then);

  final CartModel _self;
  final $Res Function(CartModel) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subTotal = null,
    Object? vat = null,
    Object? shippingFee = null,
    Object? total = null,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      subTotal: null == subTotal
          ? _self.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      vat: null == vat
          ? _self.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int,
      shippingFee: null == shippingFee
          ? _self.shippingFee
          : shippingFee // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CartModel implements CartModel {
  const _CartModel(
      {required this.subTotal,
      required this.vat,
      required this.shippingFee,
      required this.total,
      required final List<CartItemModel> items})
      : _items = items;
  factory _CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  @override
  final int subTotal;
  @override
  final int vat;
  @override
  final int shippingFee;
  @override
  final int total;
  final List<CartItemModel> _items;
  @override
  List<CartItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CartModelCopyWith<_CartModel> get copyWith =>
      __$CartModelCopyWithImpl<_CartModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CartModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CartModel &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.shippingFee, shippingFee) ||
                other.shippingFee == shippingFee) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subTotal, vat, shippingFee,
      total, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'CartModel(subTotal: $subTotal, vat: $vat, shippingFee: $shippingFee, total: $total, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$CartModelCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$CartModelCopyWith(
          _CartModel value, $Res Function(_CartModel) _then) =
      __$CartModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int subTotal,
      int vat,
      int shippingFee,
      int total,
      List<CartItemModel> items});
}

/// @nodoc
class __$CartModelCopyWithImpl<$Res> implements _$CartModelCopyWith<$Res> {
  __$CartModelCopyWithImpl(this._self, this._then);

  final _CartModel _self;
  final $Res Function(_CartModel) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subTotal = null,
    Object? vat = null,
    Object? shippingFee = null,
    Object? total = null,
    Object? items = null,
  }) {
    return _then(_CartModel(
      subTotal: null == subTotal
          ? _self.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      vat: null == vat
          ? _self.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as int,
      shippingFee: null == shippingFee
          ? _self.shippingFee
          : shippingFee // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItemModel>,
    ));
  }
}

// dart format on
