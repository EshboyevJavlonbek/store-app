import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/data/repository/product_repository.dart';
import 'package:store_app/features/saved_items/manager/saved_items_state.dart';

part 'saved_items_events.dart';

class SavedItemsBloc extends Bloc<SavedItemsEvents, SavedItemsState> {
  SavedItemsBloc({required ProductRepository repo})
      : _repo = repo,
        super(SavedItemsState.initial()) {
    on<SavedItemsLoad>(_onLoad);
    on<SaveItem>(_saveItem);
    on<UnSaveItem>(_unSaveItem);
    add(SavedItemsLoad());
  }

  final ProductRepository _repo;

  Future<void> _onLoad(
      SavedItemsLoad event, Emitter<SavedItemsState> emit) async {
    emit(state.copyWith(status: SavedItemsStatus.loading));
    try {
      final savedItems = await _repo.getSavedItems();
      emit(state.copyWith(
          savedItems: savedItems, status: SavedItemsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SavedItemsStatus.error));
    }
  }

  Future<void> _saveItem(SaveItem event, Emitter<SavedItemsState> emit)async{
    await _repo.savedItem(productId: event.productId);
  }

  Future<void> _unSaveItem(UnSaveItem event, Emitter<SavedItemsState> emit)async{
    await _repo.unSavedItem(productId: event.productId);
  }
}
