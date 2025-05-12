import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/my_cart_repository.dart';
import 'package:store_app/features/my_cart/manager/my_cart_state.dart';

part 'my_cart_events.dart';

class MyCartBloc extends Bloc<MyCartEvents, MyCartState> {
  final MyCartRepository _repo;

  MyCartBloc({required MyCartRepository repo})
      : _repo = repo,
        super(MyCartState.initial()) {
    on<MyCartLoad>(_onLoad);
    add(MyCartLoad());
  }

  Future<void> _onLoad(MyCartLoad event, Emitter<MyCartState> emit) async {
    emit(state.copyWith(status: MyCartStatus.loading));
    try {
      final cart = await _repo.fetchCarts();
      emit(state.copyWith(cart: cart, status: MyCartStatus.success));
    } catch (e) {
      emit(state.copyWith(status: MyCartStatus.error));
    }
  }
}
