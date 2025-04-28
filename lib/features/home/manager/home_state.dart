import 'package:equatable/equatable.dart';
import 'package:store_app/data/model/category_model.dart';
import 'package:store_app/data/model/product_model.dart';

enum HomeStatus { idle, loading, error, success }

class HomeState extends Equatable {
  final List<ProductModel> products;
  final List<CategoryModel> categories;
  final HomeStatus status;

  const HomeState({
    required this.categories,
    required this.products,
    required this.status,
  });

  factory HomeState.initial() {
    return HomeState(
      categories: [],
      products: [],
      status: HomeStatus.idle,
    );
  }

  HomeState copyWidth({
    HomeStatus? status,
    List<ProductModel>? products,
    List<CategoryModel>? categories,
  }) {
    return HomeState(
      categories: categories ?? this.categories,
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [products, status, categories];
}
