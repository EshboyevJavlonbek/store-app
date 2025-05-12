import 'package:equatable/equatable.dart';
import 'package:store_app/data/model/product/product_model.dart';

enum SavedItemsStatus { idle, loading, error, success }

class SavedItemsState extends Equatable {
  final List<ProductModel> savedItems;
  final SavedItemsStatus status;

  const SavedItemsState({
    required this.savedItems,
    required this.status,
  });

  factory SavedItemsState.initial() {
    return SavedItemsState(
      savedItems: [],
      status: SavedItemsStatus.idle,
    );
  }

  SavedItemsState copyWith(
      {List<ProductModel>? savedItems, SavedItemsStatus? status}) {
    return SavedItemsState(
      savedItems: savedItems ?? this.savedItems,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [savedItems, status];
}
