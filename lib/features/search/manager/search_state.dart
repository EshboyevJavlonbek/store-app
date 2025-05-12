import 'package:equatable/equatable.dart';
import 'package:store_app/data/model/product/product_model.dart';

enum SearchStatus { idle, loading, success, error }

class SearchState extends Equatable {
  final List<ProductModel> products;
  final SearchStatus status;

  const SearchState({
    required this.products,
    required this.status,
  });

  factory SearchState.initial() {
    return SearchState(
      products: [],
      status: SearchStatus.idle,
    );
  }

  SearchState copyWith({
    List<ProductModel>? products,
    SearchStatus? status,
  }) {
    return SearchState(
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [products, status];
}
