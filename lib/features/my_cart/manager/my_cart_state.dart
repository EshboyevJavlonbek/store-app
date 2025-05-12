import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/model/my_cart/cart_model.dart';

part 'my_cart_state.freezed.dart';

enum MyCartStatus { idle, loading, success, error }

@freezed
abstract class MyCartState with _$MyCartState {
  const factory MyCartState({
    required CartModel? cart,
    required MyCartStatus status,
  }) = _MyCartState;

  factory MyCartState.initial() {
    return MyCartState(
      cart: null,
      status: MyCartStatus.idle,
    );
  }
}
