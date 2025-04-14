import 'package:equatable/equatable.dart';
import 'package:store_app/data/model/category_model.dart';

enum SavedItemsStatus { idle, loading, error, success }

class SavedItemsState extends Equatable {
  final List<CategoryModel> savedItems;
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
      {List<CategoryModel>? savedItems, SavedItemsStatus? status}) {
    return SavedItemsState(
      savedItems: savedItems ?? this.savedItems,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [savedItems, status];
}
