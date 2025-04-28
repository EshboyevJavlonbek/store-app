import 'package:equatable/equatable.dart';
import 'package:store_app/data/model/product_model.dart';

enum SearchStatus { idle, loading, success, error }

class SearchState extends Equatable {
  final List<ProductModel> categories;
  final SearchStatus status;

  const SearchState({
    required this.categories,
    required this.status,
  });

  factory SearchState.initial() {
    return SearchState(
      categories: [],
      status: SearchStatus.idle,
    );
  }

  SearchState copyWith({
    List<ProductModel>? categories,
    SearchStatus? status,
  }) {
    return SearchState(
      categories: categories ?? this.categories,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [categories, status];
}
